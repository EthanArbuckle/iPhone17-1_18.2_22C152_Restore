@interface IMMessageNotificationController
+ (id)sharedInstance;
- (BOOL)_deviceIsAudioAccessory:(id)a3;
- (BOOL)_isCurrentDeviceAudioAccessory;
- (BOOL)audioAccessoryDeviceWithTokenURIExists:(id)a3;
- (IDSService)messageNotificationControllerIDSService;
- (IMMessageNotificationController)init;
- (id)_copyIDForDevice:(id)a3;
- (id)_copyIDSIdentifierOrDefault:(id)a3;
- (void)_executeCommandFromMessageRequest:(id)a3;
- (void)_playTone;
- (void)_sendNotificationMessageRequest:(id)a3 toTokenURI:(id)a4;
- (void)dealloc;
- (void)sendNotificationMessageToTokenURI:(id)a3 withCommmand:(int64_t)a4;
- (void)sendNotificationMessageToUniqueID:(id)a3 withCommmand:(int64_t)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setMessageNotificationControllerIDSService:(id)a3;
@end

@implementation IMMessageNotificationController

+ (id)sharedInstance
{
  if (qword_1EB4A6720 != -1) {
    dispatch_once(&qword_1EB4A6720, &unk_1EF2BF8A0);
  }
  return (id)qword_1EB4A6688;
}

- (IMMessageNotificationController)init
{
  v7.receiver = self;
  v7.super_class = (Class)IMMessageNotificationController;
  v2 = [(IMMessageNotificationController *)&v7 init];
  if (v2)
  {
    v3 = (IDSService *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.messagenotification"];
    v2->_messageNotificationControllerIDSService = v3;
    [(IDSService *)v3 addDelegate:v2 queue:MEMORY[0x1E4F14428]];
  }
  if (IMOSLoggingEnabled())
  {
    v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "Instantiated IMMessageNotificationController", v6, 2u);
    }
  }
  return v2;
}

- (void)dealloc
{
  [self->_messageNotificationControllerIDSService removeDelegate:self];

  v3.receiver = self;
  v3.super_class = (Class)IMMessageNotificationController;
  [(IMMessageNotificationController *)&v3 dealloc];
}

- (BOOL)_isCurrentDeviceAudioAccessory
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F61740], "sharedInstance"), "deviceType");
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = @"NO";
      if (v2 == 7) {
        v4 = @"YES";
      }
      int v6 = 134218242;
      uint64_t v7 = v2;
      __int16 v8 = 2112;
      v9 = v4;
      _os_log_impl(&dword_1A0772000, v3, OS_LOG_TYPE_INFO, "Current device has deviceType %ld, isAudioAccessory %@", (uint8_t *)&v6, 0x16u);
    }
  }
  return v2 == 7;
}

- (BOOL)_deviceIsAudioAccessory:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = objc_msgSend((id)objc_msgSend(a3, "modelIdentifier"), "containsString:", @"AudioAccessory");
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [a3 uniqueID];
      uint64_t v7 = @"NO";
      if (v4) {
        uint64_t v7 = @"YES";
      }
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Device with unique id %@ is audio accessory %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return v4;
}

- (id)_copyIDForDevice:(id)a3
{
  return (id)MEMORY[0x1F4122BD0](a3, a2);
}

- (BOOL)audioAccessoryDeviceWithTokenURIExists:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v5 = (void *)[[(IMMessageNotificationController *)self messageNotificationControllerIDSService] devices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v10 = [(IMMessageNotificationController *)self _copyIDForDevice:v9];
        if ([v10 isEqualToString:a3])
        {
          BOOL v11 = [(IMMessageNotificationController *)self _deviceIsAudioAccessory:v9];

          if (v11)
          {
            BOOL v12 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v6);
  }
  BOOL v12 = 0;
LABEL_13:
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = @"NO";
      if (v12) {
        v14 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v21 = a3;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Found IDS Audio Accessory device with token URI %@ ? %@", buf, 0x16u);
    }
  }
  return v12;
}

- (id)_copyIDSIdentifierOrDefault:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)-[IDSService devices](-[IMMessageNotificationController messageNotificationControllerIDSService](self, "messageNotificationControllerIDSService"), "devices"), "count"))
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_29;
    }
    v14 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v15 = "Service did not have any devices, could not send notification message";
    goto LABEL_28;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v5 = (void *)[[(IMMessageNotificationController *)self messageNotificationControllerIDSService] devices];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (!v6) {
    goto LABEL_36;
  }
  id v8 = 0;
  uint64_t v9 = *(void *)v22;
  *(void *)&long long v7 = 138412546;
  long long v20 = v7;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v5);
      }
      BOOL v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
      if (objc_msgSend((id)objc_msgSend(v11, "uniqueID", v20), "isEqualToString:", a3)
        && [(IMMessageNotificationController *)self _deviceIsAudioAccessory:v11])
      {

        id v8 = [(IMMessageNotificationController *)self _copyIDForDevice:v11];
        if (IMOSLoggingEnabled())
        {
          long long v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v17 = [v11 uniqueID];
            *(_DWORD *)buf = v20;
            uint64_t v26 = v17;
            __int16 v27 = 2112;
            id v28 = v8;
            _os_log_impl(&dword_1A0772000, v16, OS_LOG_TYPE_INFO, "Found specified uniqueID %@ formatted to %@", buf, 0x16u);
          }
        }
        goto LABEL_24;
      }
      if (!v8)
      {
        if ([(IMMessageNotificationController *)self _deviceIsAudioAccessory:v11])
        {
          id v8 = [(IMMessageNotificationController *)self _copyIDForDevice:v11];
          if (IMOSLoggingEnabled())
          {
            BOOL v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              uint64_t v13 = [v11 uniqueID];
              *(_DWORD *)buf = v20;
              uint64_t v26 = v13;
              __int16 v27 = 2112;
              id v28 = v8;
              _os_log_impl(&dword_1A0772000, v12, OS_LOG_TYPE_INFO, "Found first default audio accessory uniqueID %@ formatted to %@", buf, 0x16u);
            }
          }
        }
        else
        {
          id v8 = 0;
        }
      }
    }
    uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_24:
  if (!v8)
  {
LABEL_36:
    if (!IMOSLoggingEnabled()) {
      goto LABEL_29;
    }
    v14 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
      goto LABEL_29;
    }
    *(_WORD *)buf = 0;
    v15 = "Could not find audio accessory on service.";
LABEL_28:
    _os_log_impl(&dword_1A0772000, v14, OS_LOG_TYPE_INFO, v15, buf, 2u);
LABEL_29:
    id v8 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    long long v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v26 = (uint64_t)a3;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "From specified audio accessory unique id %@, returning %@", buf, 0x16u);
    }
  }
  return v8;
}

- (void)_playTone
{
  qword_1E94FF818 = MEMORY[0x1A6227910](@"TLToneManager", @"ToneLibrary");
  qword_1E94FF820 = MEMORY[0x1A6227910](@"TLAlertConfiguration", @"ToneLibrary");
  uint64_t v2 = MEMORY[0x1A6227910](@"TLAlert", @"ToneLibrary");
  qword_1E94FF828 = v2;
  uint64_t v3 = qword_1E94FF818;
  uint64_t v4 = qword_1E94FF820;
  int v5 = IMOSLoggingEnabled();
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6 || v2 == 0)
  {
    if (v5)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Failed to weak link ToneLibrary classes, not playing messages alert tone", buf, 2u);
      }
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Weak linked ToneLibrary classes, playing messages alert tone", buf, 2u);
      }
    }
    uint64_t v10 = objc_msgSend((id)objc_msgSend((id)qword_1E94FF818, "sharedToneManager"), "currentToneIdentifierForAlertType:", 2);
    BOOL v11 = (void *)[objc_alloc((Class)qword_1E94FF820) initWithType:2];
    [v11 setToneIdentifier:v10];
    BOOL v12 = (void *)[(id)qword_1E94FF828 alertWithConfiguration:v11];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1A08310A4;
    v13[3] = &unk_1E5A13398;
    v13[4] = v11;
    [v12 playWithCompletionHandler:v13];
  }
}

- (void)_executeCommandFromMessageRequest:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"c"), "integerValue");
  BOOL v5 = [(IMMessageNotificationController *)self _isCurrentDeviceAudioAccessory];
  if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = [NSNumber numberWithInteger:v4];
      id v8 = @"NO";
      if (v5) {
        id v8 = @"YES";
      }
      int v12 = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_1A0772000, v6, OS_LOG_TYPE_INFO, "Looking at command to execute %@, isAudioAccessory %@", (uint8_t *)&v12, 0x16u);
    }
  }
  if (v5)
  {
    int v9 = IMOSLoggingEnabled();
    if (v4)
    {
      if (v9)
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1A0772000, v10, OS_LOG_TYPE_INFO, "Got unrecognized command, not doing anything", (uint8_t *)&v12, 2u);
        }
      }
    }
    else
    {
      if (v9)
      {
        BOOL v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "Got IMMessageNotificationControllerCommandIncomingMessage command, calling playTone method", (uint8_t *)&v12, 2u);
        }
      }
      [(IMMessageNotificationController *)self _playTone];
    }
  }
}

- (void)service:(id)a3 account:(id)a4 incomingMessage:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v27 = 138413314;
      *(void *)id v28 = a3;
      *(_WORD *)&v28[8] = 2112;
      *(void *)&v28[10] = a4;
      *(_WORD *)&v28[18] = 2112;
      *(void *)&v28[20] = a5;
      *(_WORD *)&v28[28] = 2112;
      *(void *)&v28[30] = a6;
      *(_WORD *)&v28[38] = 2112;
      *(void *)&v28[40] = a7;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "service %@, account %@, incomingMessage %@ fromID %@ context %@", (uint8_t *)&v27, 0x34u);
    }
  }
  int v14 = +[IMIDSUtilities verifyFromID:a6 comesFromAccount:a4];
  int v15 = IMOSLoggingEnabled();
  if (v14)
  {
    if (v15)
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        uint64_t v17 = [a4 vettedAliases];
        uint64_t v18 = [a4 devices];
        int v27 = 67110402;
        *(_DWORD *)id v28 = v14;
        *(_WORD *)&v28[4] = 2112;
        *(void *)&v28[6] = a4;
        *(_WORD *)&v28[14] = 2112;
        *(void *)&v28[16] = a6;
        *(_WORD *)&v28[24] = 2112;
        *(void *)&v28[26] = a7;
        *(_WORD *)&v28[34] = 2112;
        *(void *)&v28[36] = v17;
        *(_WORD *)&v28[44] = 2112;
        *(void *)&v28[46] = v18;
        long long v19 = "Incoming message is not from ourself. Dropping! (matchStatus: 0x%X account %@ fromID %@ context %@ vettedA"
              "liases %@ devices %@)";
        long long v20 = v16;
        uint32_t v21 = 58;
LABEL_19:
        _os_log_impl(&dword_1A0772000, v20, OS_LOG_TYPE_INFO, v19, (uint8_t *)&v27, v21);
      }
    }
  }
  else
  {
    if (v15)
    {
      long long v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1A0772000, v22, OS_LOG_TYPE_INFO, "Incoming message verified as coming from ourself. Processing!", (uint8_t *)&v27, 2u);
      }
    }
    BOOL v23 = [(IMMessageNotificationController *)self _isCurrentDeviceAudioAccessory];
    int v24 = IMOSLoggingEnabled();
    if (v23)
    {
      if (v24)
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          LOWORD(v27) = 0;
          _os_log_impl(&dword_1A0772000, v25, OS_LOG_TYPE_INFO, "Current device is an audio accessory, executing command action", (uint8_t *)&v27, 2u);
        }
      }
      [(IMMessageNotificationController *)self _executeCommandFromMessageRequest:a5];
    }
    else if (v24)
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        long long v19 = "Current device is not an audio accessory, not executing command actions";
        long long v20 = v26;
        uint32_t v21 = 2;
        goto LABEL_19;
      }
    }
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v7 = a6;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = @"NO";
      int v13 = 138413058;
      id v14 = a3;
      __int16 v15 = 2112;
      if (v7) {
        int v12 = @"YES";
      }
      id v16 = a4;
      __int16 v17 = 2112;
      id v18 = a5;
      __int16 v19 = 2112;
      long long v20 = v12;
      _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, "message sent with service %@, account %@, and identifier %@ with success %@", (uint8_t *)&v13, 0x2Au);
    }
  }
}

- (void)sendNotificationMessageToUniqueID:(id)a3 withCommmand:(int64_t)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v18 = @"c";
  v19[0] = [NSNumber numberWithInteger:a4];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v8 = [(IMMessageNotificationController *)self _copyIDSIdentifierOrDefault:a3];
  if (IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138413058;
      uint64_t v11 = [NSNumber numberWithInteger:a4];
      __int16 v12 = 2112;
      id v13 = a3;
      __int16 v14 = 2112;
      id v15 = v8;
      __int16 v16 = 2112;
      uint64_t v17 = v7;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Request to send command %@ to uniqueID %@ tokenURI %@ so constructed requestDicitonary to send to IDS: %@", (uint8_t *)&v10, 0x2Au);
    }
  }
  [(IMMessageNotificationController *)self _sendNotificationMessageRequest:v7 toTokenURI:v8];
}

- (void)sendNotificationMessageToTokenURI:(id)a3 withCommmand:(int64_t)a4
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v15 = @"c";
  v16[0] = [NSNumber numberWithInteger:a4];
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412802;
      uint64_t v10 = [NSNumber numberWithInteger:a4];
      __int16 v11 = 2112;
      id v12 = a3;
      __int16 v13 = 2112;
      uint64_t v14 = v7;
      _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Request to send command %@ to tokenURI %@ so constructed requestDicitonary to send to IDS: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  [(IMMessageNotificationController *)self _sendNotificationMessageRequest:v7 toTokenURI:a3];
}

- (void)_sendNotificationMessageRequest:(id)a3 toTokenURI:(id)a4
{
  v29[1] = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v21 = (uint64_t)a3;
      __int16 v22 = 2112;
      id v23 = a4;
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Trying to send request %@ to tokenURI %@", buf, 0x16u);
    }
  }
  if ([a4 length])
  {
    id v18 = 0;
    uint64_t v19 = 0;
    uint64_t v8 = [MEMORY[0x1E4F1CAD0] setWithObject:a4];
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = v8;
        __int16 v22 = 2112;
        id v23 = a3;
        _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Sending notification message to local account (toDests %@) (request %@)", buf, 0x16u);
      }
    }
    uint64_t v10 = [(IMMessageNotificationController *)self messageNotificationControllerIDSService];
    uint64_t v28 = *MEMORY[0x1E4F6A9A0];
    v29[0] = MEMORY[0x1E4F1CC38];
    int v11 = -[IDSService sendMessage:toDestinations:priority:options:identifier:error:](v10, "sendMessage:toDestinations:priority:options:identifier:error:", a3, v8, 300, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1], &v19, &v18);
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        __int16 v13 = @"NO";
        if (v11) {
          __int16 v13 = @"YES";
        }
        *(_DWORD *)buf = 138413058;
        uint64_t v21 = v19;
        __int16 v22 = 2112;
        id v23 = v18;
        __int16 v24 = 2112;
        id v25 = a3;
        __int16 v26 = 2112;
        int v27 = v13;
        uint64_t v14 = "Sent notification message to local account (identifier %@)  (error %@)  (request %@) success: %@";
        id v15 = v12;
        uint32_t v16 = 42;
        goto LABEL_16;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      uint64_t v14 = "Could not send message because could not find valid identifier";
      id v15 = v17;
      uint32_t v16 = 2;
LABEL_16:
      _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);
    }
  }
}

- (IDSService)messageNotificationControllerIDSService
{
  return self->_messageNotificationControllerIDSService;
}

- (void)setMessageNotificationControllerIDSService:(id)a3
{
}

@end