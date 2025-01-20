@interface IMDiMessageIDSDelegate
+ (BOOL)isDefaultPairedDevice:(id)a3 withAccount:(id)a4;
+ (id)commandHandlerRegistry;
+ (void)addLockdownCommandHandlersToRegistry:(id)a3;
+ (void)addStandardCommandHandlersToRegistry:(id)a3;
- (BOOL)_containsHandlesForTrustedData:(id)a3;
- (BOOL)blockCommandForTrustedData:(id)a3;
- (BOOL)runningInAutomation;
- (IDSService)bizChatService;
- (IDSService)idsService;
- (IMDAccountController)accountController;
- (IMDAttachmentStore)attachmentStore;
- (IMDChatRegistry)chatRegistry;
- (IMDMessageFromStorageController)messageFromStorageController;
- (IMDMessageStore)messageStore;
- (IMDRecentsController)recentsController;
- (IMDiMessageIDSDelegate)init;
- (IMDiMessageIDSDelegate)initWithiMessageService:(id)a3 bizChatService:(id)a4 incomingMessageHandler:(id)a5 messageStore:(id)a6 chatRegistry:(id)a7 accountController:(id)a8 storageController:(id)a9 recentsController:(id)a10 attachmentStore:(id)a11;
- (IMDiMessageIncomingMessageHandler)handler;
- (id)broadcaster;
- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)setRunningInAutomation:(BOOL)a3;
@end

@implementation IMDiMessageIDSDelegate

- (IMDiMessageIDSDelegate)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v20 = [(id)objc_opt_class() commandHandlerRegistry];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  v4 = [v20 allKeys];
  v5 = [v3 setWithArray:v4];

  id v6 = objc_alloc(MEMORY[0x1E4F6AB90]);
  v19 = (void *)[v6 initWithService:*MEMORY[0x1E4F6AA78] commands:v5 manuallyAckMessages:1];
  id v7 = objc_alloc(MEMORY[0x1E4F6AB90]);
  v8 = (void *)[v7 initWithService:*MEMORY[0x1E4F6AA80] commands:v5 manuallyAckMessages:1];
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v5;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "supports commands: %@", buf, 0xCu);
    }
  }
  v10 = objc_alloc_init(IMDiMessageIncomingMessageHandler);
  v11 = +[IMDMessageStore sharedInstance];
  v12 = +[IMDChatRegistry sharedInstance];
  v13 = +[IMDAccountController sharedInstance];
  v14 = +[IMDMessageFromStorageController iMessageStorageController];
  v15 = +[IMDRecentsController sharedInstance];
  v16 = +[IMDAttachmentStore sharedInstance];
  v17 = [(IMDiMessageIDSDelegate *)self initWithiMessageService:v19 bizChatService:v8 incomingMessageHandler:v10 messageStore:v11 chatRegistry:v12 accountController:v13 storageController:v14 recentsController:v15 attachmentStore:v16];

  return v17;
}

- (IMDiMessageIDSDelegate)initWithiMessageService:(id)a3 bizChatService:(id)a4 incomingMessageHandler:(id)a5 messageStore:(id)a6 chatRegistry:(id)a7 accountController:(id)a8 storageController:(id)a9 recentsController:(id)a10 attachmentStore:(id)a11
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v26 = a4;
  id v27 = a5;
  id v28 = a6;
  id v29 = a7;
  id v30 = a8;
  id v31 = a9;
  id v32 = a10;
  id v33 = a11;
  v34.receiver = self;
  v34.super_class = (Class)IMDiMessageIDSDelegate;
  v18 = [(IMDiMessageIDSDelegate *)&v34 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_idsService, a3);
    [(IDSService *)v19->_idsService addDelegate:v19 queue:MEMORY[0x1E4F14428]];
    objc_storeStrong((id *)&v19->_bizChatService, a4);
    [(IDSService *)v19->_bizChatService addDelegate:v19 queue:MEMORY[0x1E4F14428]];

    objc_storeStrong((id *)&v19->_handler, a5);
    objc_storeStrong((id *)&v19->_messageStore, a6);
    objc_storeStrong((id *)&v19->_accountController, a8);
    objc_storeStrong((id *)&v19->_messageFromStorageController, a9);
    objc_storeStrong((id *)&v19->_recentsController, a10);
    objc_storeStrong((id *)&v19->_chatRegistry, a7);
    objc_storeStrong((id *)&v19->_attachmentStore, a11);
    v20 = [(id)objc_opt_class() commandHandlerRegistry];
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        idsService = v19->_idsService;
        uint64_t v23 = [v20 allKeys];
        *(_DWORD *)buf = 138412546;
        v36 = idsService;
        __int16 v37 = 2112;
        v38 = v23;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "IDS Delegate Loaded service: %@ handling commands %@", buf, 0x16u);
      }
    }
  }
  return v19;
}

- (id)broadcaster
{
  v2 = +[IMDBroadcastController sharedProvider];
  v3 = [v2 broadcasterForChatListeners];

  return v3;
}

+ (BOOL)isDefaultPairedDevice:(id)a3 withAccount:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [a4 idsAccount];
  id v7 = [v6 devices];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v12, "isDefaultPairedDevice", (void)v16))
        {
          v13 = [v12 pushToken];
          char v14 = [v13 isEqualToData:v5];

          if (v14)
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v9;
}

+ (id)commandHandlerRegistry
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D974EA24;
  block[3] = &unk_1E6B72BE8;
  block[4] = a1;
  if (qword_1EBE2BE38 != -1) {
    dispatch_once(&qword_1EBE2BE38, block);
  }
  v2 = [(id)qword_1EBE2BE40 handlers];

  return v2;
}

+ (void)addStandardCommandHandlersToRegistry:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "FTCommandIDDeliveryReceipt";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C5970;
    _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F3391100 forCommand:&unk_1F33C5970];
  id v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isTranscriptSharingEnabled];

  if (v6)
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v20 = 136315394;
      uint64_t v21 = "FTCommandIDChatSessionClose";
      __int16 v22 = 2112;
      uint64_t v23 = &unk_1F33C5988;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
    }

    [v3 setStandardHandler:&unk_1F3391120 forCommand:&unk_1F33C5988];
  }
  id v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "FTCommandIDReadReceipt";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C59A0;
    _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F3391140 forCommand:&unk_1F33C59A0];
  uint64_t v9 = IMLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "FTCommandIDMarkAsUnreadMessage";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C59B8;
    _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F3391160 forCommand:&unk_1F33C59B8];
  uint64_t v10 = IMLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "FTCommandIDPlayedReceipt";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C59D0;
    _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F3391180 forCommand:&unk_1F33C59D0];
  v11 = IMLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "FTCommandIDDeliveredQuietly";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C59E8;
    _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F33911A0 forCommand:&unk_1F33C59E8];
  v12 = IMLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "FTCommandIDNotifyRecipient";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C5A00;
    _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F33911C0 forCommand:&unk_1F33C5A00];
  v13 = IMLogHandleForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "FTCommandIDTextMessage";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C5A18;
    _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F33911E0 forCommand:&unk_1F33C5A18];
  char v14 = IMLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "FTCommandIDSyndicationAction";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C5A30;
    _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F3391200 forCommand:&unk_1F33C5A30];
  v15 = IMLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "FTCommandIDEditMessage";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C5A48;
    _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F3391220 forCommand:&unk_1F33C5A48];
  long long v16 = IMLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "FTCommandIDRecoverJunkMessage";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C5A60;
    _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F3391240 forCommand:&unk_1F33C5A60];
  long long v17 = IMLogHandleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "IDSCommandIDStickerRepositionMessage";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C5A78;
    _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F3391260 forCommand:&unk_1F33C5A78];
  long long v18 = IMLogHandleForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "134";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C5A90;
    _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F3391280 forCommand:&unk_1F33C5A90];
  long long v19 = IMLogHandleForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    int v20 = 136315394;
    uint64_t v21 = "135";
    __int16 v22 = 2112;
    uint64_t v23 = &unk_1F33C5AA8;
    _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Adding Handler for command: %s (%@)", (uint8_t *)&v20, 0x16u);
  }

  [v3 setStandardHandler:&unk_1F33912A0 forCommand:&unk_1F33C5AA8];
}

+ (void)addLockdownCommandHandlersToRegistry:(id)a3
{
  id v3 = a3;
  [v3 setLockdownHandler:&unk_1F33912C0 forCommand:&unk_1F33C5A18];
  [v3 setPassThroughLockdownHandlerForCommand:&unk_1F33C5970];
  [v3 setPassThroughLockdownHandlerForCommand:&unk_1F33C59A0];
}

- (BOOL)_containsHandlesForTrustedData:(id)a3
{
  id v3 = [a3 fromIdentifier];
  v4 = [v3 _stripFZIDPrefix];

  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@ || %K == %@", *MEMORY[0x1E4F6D4B0], v4, *MEMORY[0x1E4F6D4C8], v4];
  int v6 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  id v7 = [v6 handleRecordsFilteredByPredicate:v5];

  LOBYTE(v6) = [v7 count] != 0;
  return (char)v6;
}

- (BOOL)blockCommandForTrustedData:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isFromMe]) {
    goto LABEL_2;
  }
  LOBYTE(v5) = 0;
  unint64_t v6 = [v4 command] - 102;
  if (v6 > 0x14) {
    goto LABEL_6;
  }
  if (((1 << v6) & 0x110C09) != 0)
  {
    BOOL v5 = ![(IMDiMessageIDSDelegate *)self _containsHandlesForTrustedData:v4];
    goto LABEL_6;
  }
  if (((1 << v6) & 0x24200) == 0) {
    goto LABEL_6;
  }
  if ([v4 isFromMe])
  {
LABEL_2:
    LOBYTE(v5) = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Received message that should only be from me (trustedData: %@)", (uint8_t *)&v9, 0xCu);
      }
    }
    LOBYTE(v5) = 1;
  }
LABEL_6:

  return v5;
}

- (void)service:(id)a3 account:(id)a4 incomingTopLevelMessage:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  v94 = (IMDiMessageIDSDelegate *)a3;
  v89 = (IMDiMessageIDSDelegate *)a4;
  v92 = (IMDAccountController *)a5;
  id v90 = a6;
  id v91 = a7;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v88 = _os_activity_create(&dword_1D967A000, "com.apple.messages.iMessageReceivedPush", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v88, &state);
  uint64_t v107 = 0;
  v108 = &v107;
  uint64_t v109 = 0x3032000000;
  v110 = sub_1D974F940;
  v111 = sub_1D974F950;
  id v112 = 0;
  id v112 = (id)[objc_alloc(MEMORY[0x1E4F6C3B0]) initWithIdentifier:@"IncomingPipelineMessagePowerAssertion" timeout:10.0];
  v96 = [[IMDiMessageIDSTrustedData alloc] initWithTopLevelMessage:v92 fromPushID:v90 messageContext:v91];
  v93 = [(IMDAccountController *)v92 objectForKey:*MEMORY[0x1E4F6B040]];
  v12 = [v93 objectForKey:@"U"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    char v14 = (void *)MEMORY[0x1E4F1C9B8];
    v15 = [v93 objectForKey:@"U"];
    uint64_t v16 = [v14 _IDSDataFromBase64String:v15];
LABEL_5:
    long long v17 = (void *)v16;
    char v18 = isKindOfClass ^ 1;
    goto LABEL_7;
  }
  v15 = [v93 objectForKey:@"U"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v93 objectForKey:@"U"];
    goto LABEL_5;
  }
  char v18 = 0;
  long long v17 = 0;
LABEL_7:
  JWUUIDPushObjectToString();
  v95 = (IMDiMessageIDSDelegate *)objc_claimAutoreleasedReturnValue();
  if (v18) {

  }
  if (isKindOfClass) {
  if (IMOSLoggingEnabled())
  }
  {
    long long v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = [(IMDiMessageIDSDelegate *)v89 uniqueID];
      uint64_t v21 = [(IMDiMessageIDSTrustedData *)v96 command];
      *(_DWORD *)buf = 134219522;
      v115 = self;
      __int16 v116 = 2048;
      v117 = v92;
      __int16 v118 = 2112;
      v119 = v94;
      __int16 v120 = 2112;
      v121 = v20;
      __int16 v122 = 2112;
      id v123 = v90;
      __int16 v124 = 2048;
      uint64_t v125 = v21;
      __int16 v126 = 2112;
      v127 = v95;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "<IMDiMessageIDSDelegate %p> Received incoming iMessage %p for service %@ account %@ fromID: %@ command: %ld, guid: %@", buf, 0x48u);
    }
  }
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = sub_1D9758B8C(v22, v93, @"mc");
  int v24 = [v23 BOOLValue];

  if (v24)
  {
    id v25 = +[IMMessagesToTrack sharedInstance];
    [v25 addMessagesID:v95];
  }
  if ([(IMDiMessageIDSDelegate *)v95 length])
  {
    id v26 = [NSString stringWithFormat:@"%ld-%@.data", -[IMDiMessageIDSTrustedData command](v96, "command"), v95];
    [MEMORY[0x1E4F6E7E0] writeMessagePayloadToDisk:v92 fileName:v26];
  }
  if (![(IMDiMessageIDSTrustedData *)v96 command]
    || !+[IMBlastdoor _commandReadyForBlastdoor:[(IMDiMessageIDSTrustedData *)v96 command]])
  {
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v115 = (IMDiMessageIDSDelegate *)v96;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Rejecting BlastDoor processing for trustedData %@", buf, 0xCu);
      }
      goto LABEL_26;
    }
LABEL_27:
    [(IMDiMessageIDSDelegate *)v94 sendAckForMessageWithContext:v91];
    id v29 = (void *)v108[5];
    v108[5] = 0;
    goto LABEL_65;
  }
  id v27 = [(IMDiMessageIDSDelegate *)self bizChatService];
  if (v27 == v94)
  {
    BOOL v30 = [(IMDiMessageIDSTrustedData *)v96 command] == 100;

    if (!v30) {
      goto LABEL_43;
    }
    if (IMOSLoggingEnabled())
    {
      id v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v115 = v95;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Passing biz chat through legacy path (guid: %@)", buf, 0xCu);
      }
    }
    if ([MEMORY[0x1E4F6E730] supportsBusinessChat])
    {
      accountController = self->_accountController;
      id v33 = [(IMDiMessageIDSDelegate *)v89 uniqueID];
      objc_super v34 = [(IMDAccountController *)accountController accountForIDSAccountUniqueID:v33];

      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v35 = [v34 session];
        v36 = [v34 idsAccount];
        __int16 v37 = [(IMDiMessageIDSDelegate *)v35 _pushHandlerForIDSAccount:v36];

        if (v37 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          if (IMOSLoggingEnabled())
          {
            v38 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              v115 = v35;
              __int16 v116 = 2112;
              v117 = v37;
              _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "Found service session for biz chat, passing along (%@), push handler (%@)", buf, 0x16u);
            }
          }
          v84 = [(IMDAccountController *)v92 objectForKey:*MEMORY[0x1E4F6B020]];
          v83 = [(IMDAccountController *)v92 objectForKey:*MEMORY[0x1E4F6B038]];
          uint64_t v39 = objc_opt_class();
          v82 = sub_1D9758B8C(v39, v93, @"tP");
          uint64_t v40 = objc_opt_class();
          v81 = sub_1D9758B8C(v40, v93, @"sP");
          v86 = [v93 objectForKey:@"t"];
          objc_opt_class();
          char v87 = objc_opt_isKindOfClass();
          if (v87)
          {
            v41 = (void *)MEMORY[0x1E4F1C9B8];
            v85 = [v93 objectForKey:@"t"];
            v80 = [v41 _IDSDataFromBase64String:v85];
          }
          else
          {
            v85 = [v93 objectForKey:@"t"];
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              char v65 = 0;
              v80 = 0;
              goto LABEL_79;
            }
            v80 = [v93 objectForKey:@"t"];
          }
          char v65 = v87 ^ 1;
LABEL_79:
          uint64_t v66 = objc_opt_class();
          v79 = sub_1D9758B8C(v66, v93, @"e");
          uint64_t v67 = objc_opt_class();
          v78 = sub_1D9758B8C(v67, v93, @"Dc");
          uint64_t v68 = objc_opt_class();
          v69 = sub_1D9758B8C(v68, v93, @"Dc");
          uint64_t v70 = objc_opt_class();
          v71 = sub_1D9758B8C(v70, v93, @"H");
          v72 = [(IMDAccountController *)v92 objectForKey:@"mid"];
          uint64_t v73 = objc_opt_class();
          v74 = sub_1D9758B8C(v73, v93, @"mc");
          char v75 = [v74 BOOLValue];
          BYTE1(v77) = [(IMDAccountController *)v92 BOOLValueForKey:@"stu" withDefault:1];
          LOBYTE(v77) = v75;
          LOBYTE(v76) = 0;
          -[IMDiMessageIDSDelegate handler:incomingMessage:originalEncryptionType:messageID:toIdentifier:fromIdentifier:fromToken:timeStamp:fromIDSID:incomingEngroup:needsDeliveryReceipt:deliveryContext:storageContext:messageContext:isBeingReplayed:mergeID:wantsCheckpointing:isSnapTrustedUser:](v35, "handler:incomingMessage:originalEncryptionType:messageID:toIdentifier:fromIdentifier:fromToken:timeStamp:fromIDSID:incomingEngroup:needsDeliveryReceipt:deliveryContext:storageContext:messageContext:isBeingReplayed:mergeID:wantsCheckpointing:isSnapTrustedUser:", v37, v84, v83, v95, v82, v81, v80, v79, v90, 0, v78, v69, v71, v91, v76,
            v72,
            v77);

          if (v65) {
          if (v87)
          }

LABEL_84:
          goto LABEL_27;
        }
      }
      else
      {
        __int16 v37 = 0;
        v35 = 0;
      }
      if (IMOSLoggingEnabled())
      {
        v64 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          v115 = v35;
          __int16 v116 = 2112;
          v117 = v37;
          __int16 v118 = 2112;
          v119 = v95;
          _os_log_impl(&dword_1D967A000, v64, OS_LOG_TYPE_INFO, "Failed to process incoming biz chat message because we couldn't find a session (%@) or push handler (%@) (guid: %@)", buf, 0x20u);
        }
      }
      goto LABEL_84;
    }
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v115 = v95;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Drop incoming business chat message because it is not supported. (guid: %@)", buf, 0xCu);
      }
LABEL_26:

      goto LABEL_27;
    }
    goto LABEL_27;
  }

LABEL_43:
  if (IMOSLoggingEnabled())
  {
    v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v115 = v95;
      _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "BlastDoor processing GUID (%@)", buf, 0xCu);
    }
  }
  if ([(IMDiMessageIDSTrustedData *)v96 command] == 100) {
    im_sendMessageCheckpointIfNecessary();
  }
  v43 = self->_accountController;
  v44 = [(IMDiMessageIDSDelegate *)v89 uniqueID];
  id v29 = [(IMDAccountController *)v43 accountForIDSAccountUniqueID:v44];

  if (!v29)
  {
    if (IMOSLoggingEnabled())
    {
      v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        v46 = self->_accountController;
        *(_DWORD *)buf = 138412546;
        v115 = v89;
        __int16 v116 = 2112;
        v117 = v46;
        _os_log_impl(&dword_1D967A000, v45, OS_LOG_TYPE_INFO, "<Warning> Couldn't find IMDAccount for IDSAccount (%@) using accountController: %@", buf, 0x16u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v48 = [(IMDAccountController *)self->_accountController accounts];
        *(_DWORD *)buf = 138412290;
        v115 = v48;
        _os_log_impl(&dword_1D967A000, v47, OS_LOG_TYPE_INFO, "  AllAccounts: %@", buf, 0xCu);
      }
    }
  }
  v49 = [IMDiMessagePipelineResources alloc];
  v50 = [(IMDiMessageIDSDelegate *)self messageStore];
  v51 = [(IMDiMessageIDSDelegate *)self messageFromStorageController];
  v52 = [(IMDiMessageIDSDelegate *)self broadcaster];
  v53 = [(IMDiMessageIDSDelegate *)self recentsController];
  v54 = [(IMDiMessageIDSDelegate *)self chatRegistry];
  v55 = [(IMDiMessageIDSDelegate *)self attachmentStore];
  v56 = [(IMDiMessagePipelineResources *)v49 initWithIMDAccount:v29 service:v94 messageStore:v50 storageController:v51 broadcaster:v52 recentsController:v53 chatRegistry:v54 attachmentStore:v55];

  if ([(IMDiMessageIDSTrustedData *)v96 isFromMe])
  {
    uint64_t v57 = 1;
  }
  else
  {
    v58 = [(IMDiMessagePipelineResources *)v56 chatRegistry];
    v59 = [(IMDiMessageIDSTrustedData *)v96 fromIdentifier];
    uint64_t v57 = [v58 hasKnownSenderChatWithChatIdentifier:v59];
  }
  v60 = (void *)MEMORY[0x1E4F6E950];
  v61 = [(IMDiMessageIDSDelegate *)v94 serviceIdentifier];
  v62 = [v60 contextWithKnownSender:v57 serviceName:v61];

  if ([(IMDiMessageIDSDelegate *)self blockCommandForTrustedData:v96])
  {
    [(IMDiMessageIDSDelegate *)v94 sendAckForMessageWithContext:v91];
    v63 = (IMDiMessageIDSTrustedData *)v108[5];
    v108[5] = 0;
  }
  else
  {
    v97[0] = MEMORY[0x1E4F143A8];
    v97[1] = 3221225472;
    v97[2] = sub_1D9758C48;
    v97[3] = &unk_1E6B75C60;
    v98 = v96;
    v99 = v94;
    char v106 = v24;
    v100 = v95;
    v101 = self;
    v102 = v56;
    id v103 = v91;
    v105 = &v107;
    v104 = v92;
    +[IMBlastdoor sendDictionary:v104 senderContext:v62 withCompletionBlock:v97];

    v63 = v98;
  }

LABEL_65:
  _Block_object_dispose(&v107, 8);

  os_activity_scope_leave(&state);
}

- (IDSService)idsService
{
  return (IDSService *)objc_getProperty(self, a2, 16, 1);
}

- (IDSService)bizChatService
{
  return (IDSService *)objc_getProperty(self, a2, 24, 1);
}

- (IMDiMessageIncomingMessageHandler)handler
{
  return (IMDiMessageIncomingMessageHandler *)objc_getProperty(self, a2, 32, 1);
}

- (IMDMessageStore)messageStore
{
  return (IMDMessageStore *)objc_getProperty(self, a2, 40, 1);
}

- (IMDAccountController)accountController
{
  return (IMDAccountController *)objc_getProperty(self, a2, 48, 1);
}

- (IMDMessageFromStorageController)messageFromStorageController
{
  return (IMDMessageFromStorageController *)objc_getProperty(self, a2, 56, 1);
}

- (IMDChatRegistry)chatRegistry
{
  return (IMDChatRegistry *)objc_getProperty(self, a2, 64, 1);
}

- (IMDRecentsController)recentsController
{
  return (IMDRecentsController *)objc_getProperty(self, a2, 72, 1);
}

- (IMDAttachmentStore)attachmentStore
{
  return (IMDAttachmentStore *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)runningInAutomation
{
  return self->_runningInAutomation;
}

- (void)setRunningInAutomation:(BOOL)a3
{
  self->_runningInAutomation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentStore, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_storeStrong((id *)&self->_chatRegistry, 0);
  objc_storeStrong((id *)&self->_messageFromStorageController, 0);
  objc_storeStrong((id *)&self->_accountController, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_handler, 0);
  objc_storeStrong((id *)&self->_bizChatService, 0);

  objc_storeStrong((id *)&self->_idsService, 0);
}

@end