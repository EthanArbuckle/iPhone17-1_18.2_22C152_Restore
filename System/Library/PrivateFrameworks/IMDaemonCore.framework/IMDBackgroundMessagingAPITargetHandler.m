@interface IMDBackgroundMessagingAPITargetHandler
- (BOOL)_shouldThrottleMessageToRecipient:(id)a3;
- (IMDBackgroundMessagingAPITargetHandler)initWithXPCConnection:(id)a3 targetQueue:(id)a4 delegate:(id)a5;
- (IMDBackgroundMessagingAPITargetHandlerDelegate)delegate;
- (id)_formattedPhoneNumberForNumber:(id)a3;
- (void)_clearConnection;
- (void)_sendMessageText:(id)a3 toHandle:(id)a4 onService:(id)a5 completion:(id)a6;
- (void)checkAuthorizationStatusForRecipients:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleSMSSendResult:(id)a3 sent:(BOOL)a4;
- (void)postNotificationForRecipientHandle:(id)a3;
- (void)requestBackgroundMessagingAuthorizationForRecipients:(id)a3 completion:(id)a4;
- (void)sendBackgroundMessage:(id)a3 toRecipient:(id)a4 completion:(id)a5;
- (void)setDelegate:(id)a3;
@end

@implementation IMDBackgroundMessagingAPITargetHandler

- (IMDBackgroundMessagingAPITargetHandler)initWithXPCConnection:(id)a3 targetQueue:(id)a4 delegate:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v57 = a4;
  id v10 = a5;
  v73.receiver = self;
  v73.super_class = (Class)IMDBackgroundMessagingAPITargetHandler;
  v11 = [(IMDBackgroundMessagingAPITargetHandler *)&v73 init];
  [(IMDBackgroundMessagingAPITargetHandler *)v11 setDelegate:v10];
  objc_storeStrong((id *)&v11->_connection, a3);
  objc_storeStrong((id *)&v11->_queue, a4);
  uint64_t v12 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.MobileSMS"];
  notificationCenter = v11->_notificationCenter;
  v11->_notificationCenter = (UNUserNotificationCenter *)v12;

  v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  trackedMessages = v11->_trackedMessages;
  v11->_trackedMessages = v14;

  v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  trackedRecipientHandles = v11->_trackedRecipientHandles;
  v11->_trackedRecipientHandles = v16;

  v18 = IMDaemonBackgroundMessagingProtocolXPCInterface();
  [v9 setExportedInterface:v18];

  [v9 setExportedObject:v11];
  v11->_int clientPid = [v9 processIdentifier];
  v70[0] = MEMORY[0x1E4F143A8];
  v70[1] = 3221225472;
  v70[2] = sub_1D975C7C8;
  v70[3] = &unk_1E6B73218;
  v19 = v11;
  v71 = v19;
  id v20 = v10;
  id v72 = v20;
  [v9 setInvalidationHandler:v70];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = sub_1D975C8B8;
  v67[3] = &unk_1E6B73218;
  v21 = v19;
  v68 = v21;
  id v56 = v20;
  id v69 = v56;
  [v9 setInterruptionHandler:v67];
  [v9 resume];
  v22 = [MEMORY[0x1E4F96478] targetWithPid:v11->_clientPid];
  v23 = [MEMORY[0x1E4F96430] predicateMatching:v22];
  id v66 = 0;
  v58 = [MEMORY[0x1E4F963E8] handleForPredicate:v23 error:&v66];
  id v24 = v66;
  if (v24)
  {
    id v25 = v24;
    if (IMOSLoggingEnabled())
    {
      v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int clientPid = v11->_clientPid;
        *(_DWORD *)buf = 67109120;
        int v75 = clientPid;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "IMDBackgroundMessagingAPITargetHandler failed to find process handle for %d", buf, 8u);
      }
    }
  }
  else
  {
    v28 = [v58 bundle];
    uint64_t v29 = [v28 identifier];
    clientBundleID = v21->_clientBundleID;
    v21->_clientBundleID = (NSString *)v29;

    id v31 = objc_alloc(MEMORY[0x1E4F223C8]);
    v32 = v21->_clientBundleID;
    id v65 = 0;
    v33 = (void *)[v31 initWithBundleIdentifier:v32 allowPlaceholder:0 error:&v65];
    id v25 = v65;
    uint64_t v34 = [v33 localizedShortName];
    clientAppName = v21->_clientAppName;
    v21->_clientAppName = (NSString *)v34;

    v36 = [v33 infoDictionary];
    uint64_t v37 = [v36 objectForKey:@"NSCriticalMessagingUsageDescription" ofClass:objc_opt_class()];
    v38 = (void *)v37;
    if (v37) {
      v39 = (__CFString *)v37;
    }
    else {
      v39 = @"This app wants to send critical text messages.";
    }
    objc_storeStrong((id *)&v21->_appDescription, v39);
  }
  v40 = [MEMORY[0x1E4F96448] descriptor];
  [v40 setValues:1];
  [v40 setEndowmentNamespaces:&unk_1F33C6000];
  dispatch_group_t v41 = dispatch_group_create();
  processMonitorWaitingForInitialStateGroup = v21->_processMonitorWaitingForInitialStateGroup;
  v21->_processMonitorWaitingForInitialStateGroup = (OS_dispatch_group *)v41;

  dispatch_group_enter((dispatch_group_t)v21->_processMonitorWaitingForInitialStateGroup);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D975C9A0;
  aBlock[3] = &unk_1E6B75D00;
  v43 = v21;
  v64 = v43;
  v44 = _Block_copy(aBlock);
  v45 = (void *)MEMORY[0x1E4F96418];
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = sub_1D975CB00;
  v59[3] = &unk_1E6B75D28;
  id v60 = v23;
  id v61 = v40;
  v62 = v44;
  id v46 = v44;
  id v47 = v40;
  id v48 = v23;
  uint64_t v49 = [v45 monitorWithConfiguration:v59];
  processMonitor = v43->_processMonitor;
  v43->_processMonitor = (RBSProcessMonitor *)v49;

  uint64_t v51 = +[IMDBackgroundMessagingAPIMessageRegistry sharedRegistry];
  messageRegistry = v43->_messageRegistry;
  v43->_messageRegistry = (IMDBackgroundMessagingAPIMessageRegistry *)v51;

  v53 = v62;
  v54 = v43;

  return v54;
}

- (void)dealloc
{
  [(IMDBackgroundMessagingAPITargetHandler *)self _clearConnection];
  [(RBSProcessMonitor *)self->_processMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)IMDBackgroundMessagingAPITargetHandler;
  [(IMDBackgroundMessagingAPITargetHandler *)&v3 dealloc];
}

- (void)_clearConnection
{
  [(NSXPCConnection *)self->_connection invalidate];
  connection = self->_connection;
  self->_connection = 0;
}

- (id)_formattedPhoneNumberForNumber:(id)a3
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA20] currentLocale];
  v5 = [v4 objectForKey:*MEMORY[0x1E4F1C400]];
  v6 = [v5 lowercaseString];

  uint64_t v7 = CFPhoneNumberCreate();
  if (v7)
  {
    v8 = (const void *)v7;
    uint64_t String = CFPhoneNumberCreateString();
    if (String)
    {
      id v10 = (void *)String;
      CFRelease(v8);
LABEL_5:
      id v11 = [NSString stringWithFormat:@"+%@", v10];

      goto LABEL_7;
    }
    id v10 = (void *)CFPhoneNumberCreateString();
    CFRelease(v8);
    if (v10) {
      goto LABEL_5;
    }
  }
  id v11 = v3;
LABEL_7:

  return v11;
}

- (void)requestBackgroundMessagingAuthorizationForRecipients:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D975CE3C;
  block[3] = &unk_1E6B73A60;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)checkAuthorizationStatusForRecipients:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D975D538;
  block[3] = &unk_1E6B73A60;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

- (void)sendBackgroundMessage:(id)a3 toRecipient:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_group_wait((dispatch_group_t)self->_processMonitorWaitingForInitialStateGroup, 1uLL);
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D975D874;
  v15[3] = &unk_1E6B731A0;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

- (BOOL)_shouldThrottleMessageToRecipient:(id)a3
{
  messageRegistry = self->_messageRegistry;
  clientBundleID = self->_clientBundleID;
  v5 = [a3 phoneNumber];
  id v6 = [(IMDBackgroundMessagingAPIMessageRegistry *)messageRegistry dateLastMessageSentFromAppWithBundleID:clientBundleID recipientHandle:v5];

  if (v6)
  {
    [v6 timeIntervalSinceNow];
    BOOL v8 = v7 >= -30.0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)_sendMessageText:(id)a3 toHandle:(id)a4 onService:(id)a5 completion:(id)a6
{
  v54[3] = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v10 = a4;
  id v11 = a5;
  id aBlock = a6;
  id v12 = objc_alloc_init(MEMORY[0x1E4F6E850]);
  [v12 setHandle:v10];
  [v12 setService:v11];
  id v13 = [NSString stringGUID];
  [v12 setGuid:v13];

  id v14 = [MEMORY[0x1E4F1C9C8] date];
  [v12 setTime:v14];

  [v12 setShouldNotifyOnSend:1];
  [v12 setFlags:5];
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F6EA90]) initWithContent:&stru_1F3398578];
  [v15 appendString:v46];
  id v16 = [v15 body];
  [v12 setBody:v16];

  id v17 = [v15 body];
  v18 = [v17 string];
  [v12 setPlainBody:v18];

  [v12 setCriticalMessagingAppName:self->_clientAppName];
  id v19 = +[IMDAccountController sharedInstance];
  id v20 = [v19 anySessionForServiceName:v11];

  if (v20)
  {
    v21 = +[IMDChatRegistry sharedInstance];
    v22 = [v20 account];
    v23 = [v21 existingChatForID:v10 account:v22];

    if (!v23)
    {
      uint64_t v24 = *MEMORY[0x1E4F6C5C8];
      v53[0] = *MEMORY[0x1E4F6C458];
      v53[1] = v24;
      v54[0] = &unk_1F33C5B08;
      v54[1] = v10;
      v53[2] = *MEMORY[0x1E4F6C648];
      v54[2] = v10;
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:3];
      v52 = v45;
      v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
      [v20 didJoinChat:v10 style:45 displayName:0 groupID:0 originalGroupID:0 handleInfo:v44 category:0 spamExtensionName:0];
      id v25 = +[IMDChatRegistry sharedInstance];
      v26 = [v20 account];
      v23 = [v25 existingChatWithIdentifier:v10 account:v26];

      [v23 updateIsFiltered:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v27 = v20;
        v28 = [v23 chatIdentifier];
        v43 = [v27 _callerIDForChatWithChatIdentifier:v28 chatStyle:45 foundChat:v23];

        if (IMOSLoggingEnabled())
        {
          uint64_t v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            v30 = [v23 guid];
            *(_DWORD *)buf = 138412546;
            uint64_t v49 = v43;
            __int16 v50 = 2112;
            uint64_t v51 = v30;
            _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Updating lastAddressedHandle %@ for chat %@", buf, 0x16u);
          }
        }
        [v23 updateLastAddressedHandle:v43];
      }
    }
    if (aBlock)
    {
      trackedMessages = self->_trackedMessages;
      v32 = _Block_copy(aBlock);
      v33 = [v12 guid];
      [(NSMutableDictionary *)trackedMessages setObject:v32 forKey:v33];
    }
    trackedRecipientHandles = self->_trackedRecipientHandles;
    v35 = [v12 guid];
    [(NSMutableDictionary *)trackedRecipientHandles setObject:v10 forKey:v35];

    v36 = [v23 chatIdentifier];
    objc_msgSend(v20, "sendMessage:toChat:style:", v12, v36, -[NSObject style](v23, "style"));
  }
  else
  {
    v23 = IMLogHandleForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      sub_1D9901BB8((uint64_t)v11, v23, v37, v38, v39, v40, v41, v42);
    }
  }
}

- (void)handleSMSSendResult:(id)a3 sent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(NSMutableDictionary *)self->_trackedMessages objectForKeyedSubscript:v6];
  if (v7)
  {
    if (v4)
    {
      BOOL v8 = [(NSMutableDictionary *)self->_trackedRecipientHandles objectForKey:v6];
      id v9 = [(IMDBackgroundMessagingAPITargetHandler *)self _formattedPhoneNumberForNumber:v8];
      [(IMDBackgroundMessagingAPITargetHandler *)self postNotificationForRecipientHandle:v9];
      v7[2](v7, 0);
    }
    else
    {
      id v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1D9901C24();
      }

      BOOL v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MSCriticalMessagingErrorDomain" code:4 userInfo:0];
      ((void (**)(void, void *))v7)[2](v7, v8);
    }

    [(NSMutableDictionary *)self->_trackedMessages removeObjectForKey:v6];
    [(NSMutableDictionary *)self->_trackedRecipientHandles removeObjectForKey:v6];
  }
}

- (void)postNotificationForRecipientHandle:(id)a3
{
  BOOL v4 = (objc_class *)MEMORY[0x1E4F445B0];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  double v7 = NSString;
  BOOL v8 = IMSharedUtilitiesFrameworkBundle();
  id v9 = [v8 localizedStringForKey:@"CMAPI_MESSAGE_SEND" value:&stru_1F3398578 table:@"IMSharedUtilities"];
  id v10 = objc_msgSend(v7, "localizedStringWithFormat:", v9, self->_clientAppName, v5);

  [v6 setBody:v10];
  id v11 = (void *)MEMORY[0x1E4F44628];
  id v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];
  id v14 = [v11 requestWithIdentifier:v13 content:v6 trigger:0];

  notificationCenter = self->_notificationCenter;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1D975E414;
  v17[3] = &unk_1E6B75D50;
  id v18 = v14;
  id v16 = v14;
  [(UNUserNotificationCenter *)notificationCenter addNotificationRequest:v16 withCompletionHandler:v17];
}

- (IMDBackgroundMessagingAPITargetHandlerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_trackedRecipientHandles, 0);
  objc_storeStrong((id *)&self->_trackedMessages, 0);
  objc_storeStrong((id *)&self->_messageRegistry, 0);
  objc_storeStrong((id *)&self->_processMonitorWaitingForInitialStateGroup, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_appDescription, 0);
  objc_storeStrong((id *)&self->_clientAppName, 0);
  objc_storeStrong((id *)&self->_clientBundleID, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end