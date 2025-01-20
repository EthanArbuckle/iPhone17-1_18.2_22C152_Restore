@interface IMDaemonChatSendMessageRequestHandler
- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5;
- (void)cancelScheduledMessageWithGUID:(id)a3;
- (void)cancelScheduledMessageWithGUID:(id)a3 destination:(id)a4;
- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5;
- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8;
- (void)joinChatID:(id)a3 handleInfo:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 joinProperties:(id)a10 account:(id)a11;
- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10;
- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9;
- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendJunkReportMessage:(id)a3 account:(id)a4;
- (void)sendLazuliSpamReport:(id)a3 isBot:(BOOL)a4 spamType:(unint64_t)a5 account:(id)a6;
- (void)sendMappingPacket:(id)a3 toHandle:(id)a4 account:(id)a5;
- (void)sendMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6;
@end

@implementation IMDaemonChatSendMessageRequestHandler

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  unsigned int v25 = a7;
  id v26 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  v16 = +[IMDAccountController sharedAccountController];
  v17 = [v16 sessionForAccount:v15];

  if (v17) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  v19 = +[IMDAccountController sharedAccountController];
  v20 = +[IMDAccountController sharedAccountController];
  v21 = [v20 accountForAccountID:v15];
  v22 = [v21 service];
  v23 = [v22 internalName];
  v17 = [v19 anySessionForServiceName:v23];

  if (v17)
  {
LABEL_7:
    [v17 invitePersonInfo:v26 withMessage:v12 toChatID:v13 identifier:v14 style:v25];
  }
  else if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v23 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  id v14 = +[IMDAccountController sharedAccountController];
  id v15 = [v14 sessionForAccount:v13];

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  v17 = +[IMDAccountController sharedAccountController];
  v18 = +[IMDAccountController sharedAccountController];
  v19 = [v18 accountForAccountID:v13];
  v20 = [v19 service];
  v21 = [v20 internalName];
  id v15 = [v17 anySessionForServiceName:v21];

  if (v15)
  {
LABEL_7:
    [v15 sendGroupPhotoUpdate:v10 toChatID:v11 identifier:v12 style:v23 account:v13];
  }
  else if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5
{
  id v31 = a3;
  id v32 = a4;
  id v33 = a5;
  v7 = +[IMDServiceController sharedController];
  v8 = [v7 serviceWithName:IMServiceNameiMessage];

  v9 = +[IMDAccountController sharedInstance];
  id v10 = [v9 accountsForService:v8];

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v35;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v35 != v13) {
        objc_enumerationMutation(v11);
      }
      id v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
      if ([v15 isActive]) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v11 countByEnumeratingWithState:&v34 objects:v40 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v16 = v15;

    if (!v16) {
      goto LABEL_18;
    }
    v17 = +[IMDAccountController sharedAccountController];
    v18 = [v16 accountID];
    v19 = [v17 sessionForAccount:v18];

    if (v19) {
      goto LABEL_17;
    }
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = [v16 accountID];
        *(_DWORD *)buf = 138412290;
        v39 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
      }
    }
    v22 = +[IMDAccountController sharedAccountController];
    unsigned int v23 = +[IMDAccountController sharedAccountController];
    v24 = [v16 accountID];
    id v25 = [v23 accountForAccountID:v24];
    id v26 = [v25 service];
    v27 = [v26 internalName];
    v19 = [v22 anySessionForServiceName:v27];

    if (v19)
    {
LABEL_17:
      [v19 _requestGroupPhotoResendForChatGUID:v31 fromIdentifier:v32 toIdentifier:v33];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          v30 = [v16 accountID];
          *(_DWORD *)buf = 138412290;
          v39 = v30;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
LABEL_9:

LABEL_18:
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Couldn't find an account to send _requestGroupPhotoResendForChatGUID message.", buf, 2u);
      }
    }
  }
}

- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v23 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = +[IMDAccountController sharedAccountController];
  id v15 = [v14 sessionForAccount:v13];

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  v17 = +[IMDAccountController sharedAccountController];
  v18 = +[IMDAccountController sharedAccountController];
  v19 = [v18 accountForAccountID:v13];
  v20 = [v19 service];
  v21 = [v20 internalName];
  id v15 = [v17 anySessionForServiceName:v21];

  if (v15)
  {
LABEL_7:
    [v15 retryGroupPhotoUpload:v10 toChatID:v11 identifier:v12 style:v23 account:v13 isPhotoRefresh:0];
  }
  else if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v23 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = +[IMDAccountController sharedAccountController];
  id v15 = [v14 sessionForAccount:v13];

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  v17 = +[IMDAccountController sharedAccountController];
  v18 = +[IMDAccountController sharedAccountController];
  v19 = [v18 accountForAccountID:v13];
  v20 = [v19 service];
  v21 = [v20 internalName];
  id v15 = [v17 anySessionForServiceName:v21];

  if (v15)
  {
LABEL_7:
    [v15 removePersonInfo:v10 chatID:v11 identifier:v12 style:v23];
  }
  else if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v13;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)joinChatID:(id)a3 handleInfo:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 joinProperties:(id)a10 account:(id)a11
{
  unsigned int v28 = a6;
  id v29 = a3;
  id v30 = a4;
  id v31 = a5;
  id v32 = a7;
  id v15 = a8;
  id v16 = a9;
  id v17 = a10;
  id v18 = a11;
  v19 = +[IMDAccountController sharedAccountController];
  v20 = [v19 sessionForAccount:v18];

  if (v20) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v18;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  v22 = +[IMDAccountController sharedAccountController];
  unsigned int v23 = +[IMDAccountController sharedAccountController];
  v24 = [v23 accountForAccountID:v18];
  id v25 = [v24 service];
  id v26 = [v25 internalName];
  v20 = [v22 anySessionForServiceName:v26];

  if (v20)
  {
LABEL_7:
    [v20 joinChatID:v29 handleInfo:v30 identifier:v31 style:v28 groupID:v32 lastAddressedHandle:v15 lastAddressedSIMID:v16 joinProperties:v17];
  }
  else if (IMOSLoggingEnabled())
  {
    v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v18;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)sendMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  unsigned int v24 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = +[IMDAccountController sharedAccountController];
  id v15 = [v14 sessionForAccount:v13];

  if (v15) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  id v17 = +[IMDAccountController sharedAccountController];
  id v18 = +[IMDAccountController sharedAccountController];
  v19 = [v18 accountForAccountID:v13];
  v20 = [v19 service];
  v21 = [v20 internalName];
  id v15 = [v17 anySessionForServiceName:v21];

  if (v15)
  {
LABEL_7:
    v22 = +[IMDCKSyncController sharedInstance];
    [v22 recordMetricIsCloudKitEnabled];

    [v15 sendMessage:v10 toChatID:v11 identifier:v12 style:v24];
  }
  else if (IMOSLoggingEnabled())
  {
    unsigned int v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)sendJunkReportMessage:(id)a3 account:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = +[IMDAccountController sharedAccountController];
  v8 = [v7 sessionForAccount:v6];

  if (v8) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v10 = +[IMDAccountController sharedAccountController];
  id v11 = +[IMDAccountController sharedAccountController];
  id v12 = [v11 accountForAccountID:v6];
  id v13 = [v12 service];
  uint64_t v14 = [v13 internalName];
  v8 = [v10 anySessionForServiceName:v14];

  if (v8)
  {
LABEL_7:
    [v8 sendJunkReportMessage:v5];
  }
  else if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)sendLazuliSpamReport:(id)a3 isBot:(BOOL)a4 spamType:(unint64_t)a5 account:(id)a6
{
  BOOL v8 = a4;
  id v9 = a3;
  id v10 = a6;
  id v11 = +[IMDAccountController sharedAccountController];
  id v12 = [v11 sessionForAccount:v10];

  if (v12) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  uint64_t v14 = +[IMDAccountController sharedAccountController];
  id v15 = +[IMDAccountController sharedAccountController];
  int v16 = [v15 accountForAccountID:v10];
  id v17 = [v16 service];
  id v18 = [v17 internalName];
  id v12 = [v14 anySessionForServiceName:v18];

  if (v12)
  {
LABEL_7:
    [v12 sendLazuliSpamReport:v9 isBot:v8 spamType:a5];
  }
  else if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      id v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v20, 0xCu);
    }
  }
}

- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10
{
  unsigned int v28 = a8;
  id v29 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a9;
  id v15 = a10;
  if (IMOSLoggingEnabled())
  {
    int v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Received sendEditedMessage request", buf, 2u);
    }
  }
  id v17 = +[IMDAccountController sharedAccountController];
  id v18 = [v17 sessionForAccount:v14];

  if (v18) {
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  int v20 = +[IMDAccountController sharedAccountController];
  id v21 = +[IMDAccountController sharedAccountController];
  v22 = [v21 accountForAccountID:v14];
  unsigned int v23 = [v22 service];
  unsigned int v24 = [v23 internalName];
  id v18 = [v20 anySessionForServiceName:v24];

  if (v18)
  {
LABEL_11:
    [v18 sendEditedMessage:v29 previousMessage:v12 partIndex:a5 editType:a6 toChatIdentifier:v13 style:v28 account:v14 backwardCompatabilityText:v15];
  }
  else if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Received sendRepositionStickerMessage request", (uint8_t *)&v22, 2u);
    }
  }
  id v13 = +[IMDAccountController sharedAccountController];
  id v14 = [v13 sessionForAccount:v11];

  if (v14) {
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  int v16 = +[IMDAccountController sharedAccountController];
  id v17 = +[IMDAccountController sharedAccountController];
  id v18 = [v17 accountForAccountID:v11];
  v19 = [v18 service];
  int v20 = [v19 internalName];
  id v14 = [v16 anySessionForServiceName:v20];

  if (v14)
  {
LABEL_11:
    [v14 sendRepositionStickerMessage:v9 chatIdentifier:v10 accountID:v11 style:v6];
  }
  else if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v11;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)sendMappingPacket:(id)a3 toHandle:(id)a4 account:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Forwarding mapping packet", v12, 2u);
    }
  }
  id v11 = +[IMDLocationSharingController sharedInstance];
  [v11 _forwardMappingPacket:v7 toID:v8 account:v9];
}

- (void)cancelScheduledMessageWithGUID:(id)a3
{
  id v3 = a3;
  v4 = +[IMDServiceController sharedController];
  id v5 = [v4 serviceWithName:IMServiceNameiMessage];

  uint64_t v6 = +[IMDAccountController sharedInstance];
  id v7 = [v6 accountsForService:v5];

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v32;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v32 != v10) {
        objc_enumerationMutation(v8);
      }
      id v12 = *(void **)(*((void *)&v31 + 1) + 8 * v11);
      if ([v12 isActive]) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v8 countByEnumeratingWithState:&v31 objects:v39 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v12;

    if (!v13) {
      goto LABEL_18;
    }
    id v14 = +[IMDAccountController sharedAccountController];
    id v15 = [v13 accountID];
    int v16 = [v14 sessionForAccount:v15];

    if (v16) {
      goto LABEL_17;
    }
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = [v13 accountID];
        *(_DWORD *)buf = 138412290;
        v38 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
      }
    }
    id v30 = +[IMDAccountController sharedAccountController];
    v19 = +[IMDAccountController sharedAccountController];
    int v20 = [v13 accountID];
    id v21 = [v19 accountForAccountID:v20];
    int v22 = [v21 service];
    id v23 = [v22 internalName];
    int v16 = [v30 anySessionForServiceName:v23];

    if (v16)
    {
LABEL_17:
      [v16 cancelScheduledMessageWithGUID:v3];
    }
    else if (IMOSLoggingEnabled())
    {
      unsigned int v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = [v13 accountID];
        *(_DWORD *)buf = 138412290;
        v38 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
      }
    }
  }
  else
  {
LABEL_9:

LABEL_18:
    unsigned int v24 = +[IMDMessageStore sharedInstance];
    id v13 = [v24 messageWithGUID:v3];

    if (!v13 || [v13 scheduleType] != (id)2)
    {
      NSErrorUserInfoKey v35 = NSLocalizedDescriptionKey;
      CFStringRef v36 = @"Failed to find an active iMessage account while trying to cancel scheduled for a given messageGUID";
      id v25 = +[NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
      id v26 = +[NSError errorWithDomain:IMSafetyMonitorErrorDomain code:1 userInfo:v25];

      v27 = +[IMSafetyMonitorCoordinator sharedCoordinator];
      [v27 informOfCancelledScheduledMessageSendWithMessageGUID:v3 sentSuccessfully:0 error:v26];
    }
  }
}

- (void)cancelScheduledMessageWithGUID:(id)a3 destination:(id)a4
{
  id v6 = a3;
  id v7 = +[NSSet setWithObject:a4];
  [(IMDaemonChatSendMessageRequestHandler *)self cancelScheduledMessageWithGUID:v6 destinations:v7 cancelType:0];
}

- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5
{
  id v6 = a3;
  id v35 = a4;
  id v7 = +[IMDServiceController sharedController];
  id v8 = [v7 serviceWithName:IMServiceNameiMessage];

  id v9 = +[IMDAccountController sharedInstance];
  uint64_t v10 = [v9 accountsForService:v8];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v37;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v37 != v13) {
        objc_enumerationMutation(v11);
      }
      id v15 = *(void **)(*((void *)&v36 + 1) + 8 * v14);
      if ([v15 isActive]) {
        break;
      }
      if (v12 == (id)++v14)
      {
        id v12 = [v11 countByEnumeratingWithState:&v36 objects:v44 count:16];
        if (v12) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v16 = v15;

    if (!v16) {
      goto LABEL_18;
    }
    id v17 = +[IMDAccountController sharedAccountController];
    id v18 = [v16 accountID];
    v19 = [v17 sessionForAccount:v18];

    if (v19) {
      goto LABEL_17;
    }
    if (IMOSLoggingEnabled())
    {
      int v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = [v16 accountID];
        *(_DWORD *)buf = 138412290;
        v43 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
      }
    }
    long long v33 = +[IMDAccountController sharedAccountController];
    int v22 = +[IMDAccountController sharedAccountController];
    id v23 = [v16 accountID];
    unsigned int v24 = [v22 accountForAccountID:v23];
    id v25 = [v24 service];
    id v26 = [v25 internalName];
    v19 = [v33 anySessionForServiceName:v26];

    if (v19)
    {
LABEL_17:
      [v19 cancelScheduledMessageWithGUID:v6 destinations:v35 cancelType:a5];
    }
    else if (IMOSLoggingEnabled())
    {
      long long v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        long long v32 = [v16 accountID];
        *(_DWORD *)buf = 138412290;
        v43 = v32;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
      }
    }
  }
  else
  {
LABEL_9:

LABEL_18:
    v27 = +[IMDMessageStore sharedInstance];
    id v16 = [v27 messageWithGUID:v6];

    if (!v16 || [v16 scheduleType] != (id)2)
    {
      NSErrorUserInfoKey v40 = NSLocalizedDescriptionKey;
      CFStringRef v41 = @"Failed to find an active iMessage account while trying to cancel scheduled for a given messageGUID";
      unsigned int v28 = +[NSDictionary dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      id v29 = +[NSError errorWithDomain:IMSafetyMonitorErrorDomain code:1 userInfo:v28];

      id v30 = +[IMSafetyMonitorCoordinator sharedCoordinator];
      [v30 informOfCancelledScheduledMessageSendWithMessageGUID:v6 sentSuccessfully:0 error:v29];
    }
  }
}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9
{
  unsigned int v27 = a8;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  id v14 = a9;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Received sendEditedScheduledMessage request", buf, 2u);
    }
  }
  id v16 = +[IMDAccountController sharedAccountController];
  id v17 = [v16 sessionForAccount:v14];

  if (v17) {
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  v19 = +[IMDAccountController sharedAccountController];
  int v20 = +[IMDAccountController sharedAccountController];
  id v21 = [v20 accountForAccountID:v14];
  int v22 = [v21 service];
  id v23 = [v22 internalName];
  id v17 = [v19 anySessionForServiceName:v23];

  if (v17)
  {
LABEL_11:
    [v17 sendEditedScheduledMessage:v11 previousMessage:v12 partIndex:a5 editType:a6 toChatIdentifier:v13 style:v27 account:v14];
  }
  else if (IMOSLoggingEnabled())
  {
    unsigned int v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  unsigned int v26 = a7;
  id v27 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Received sendEditedScheduledMessage:retractingPartIndexes: request", buf, 2u);
    }
  }
  id v17 = +[IMDAccountController sharedAccountController];
  id v18 = [v17 sessionForAccount:v15];

  if (v18) {
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "FIND_SESSION: No session found for account, attempting to find ANYTHING for the service: %@", buf, 0xCu);
    }
  }
  int v20 = +[IMDAccountController sharedAccountController];
  id v21 = +[IMDAccountController sharedAccountController];
  int v22 = [v21 accountForAccountID:v15];
  id v23 = [v22 service];
  unsigned int v24 = [v23 internalName];
  id v18 = [v20 anySessionForServiceName:v24];

  if (v18)
  {
LABEL_11:
    [v18 sendEditedScheduledMessage:v27 previousMessage:v12 retractingPartIndexes:v13 toChatIdentifier:v14 style:v26 account:v15];
  }
  else if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v15;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "FIND_SESSION: No session ever found for account: %@", buf, 0xCu);
    }
  }
}

@end