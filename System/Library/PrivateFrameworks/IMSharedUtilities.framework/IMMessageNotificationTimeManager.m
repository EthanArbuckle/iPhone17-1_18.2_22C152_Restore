@interface IMMessageNotificationTimeManager
+ (id)sharedInstance;
- (BOOL)_isToneToggleSwitchOn;
- (BOOL)_shouldSendNotificationForChatIdentifier:(id)a3;
- (IMMessageNotificationTimeManager)init;
- (NSMutableDictionary)chatsStartTimeDictionary;
- (NSString)latestIDSTokenURI;
- (int64_t)_getTimeWindowOverride;
- (int64_t)_getToneTimeWindow;
- (void)acquireAssertionToUnsuspendProcess;
- (void)dealloc;
- (void)sendNotificationMessageIfNeededForIncomingMessageFromChatIdentifier:(id)a3;
- (void)setChatsStartTimeDictionary:(id)a3;
- (void)setDate:(id)a3 forChatIdentifier:(id)a4;
- (void)setLatestIDSTokenURI:(id)a3;
- (void)setLatestNotificationIDSTokenURI:(id)a3;
- (void)tearDownSessionForChatIdentifier:(id)a3;
@end

@implementation IMMessageNotificationTimeManager

+ (id)sharedInstance
{
  if (qword_1EB4A6748 != -1) {
    dispatch_once(&qword_1EB4A6748, &unk_1EF2BFA80);
  }
  return (id)qword_1EB4A66B0;
}

- (IMMessageNotificationTimeManager)init
{
  v4.receiver = self;
  v4.super_class = (Class)IMMessageNotificationTimeManager;
  v2 = [(IMMessageNotificationTimeManager *)&v4 init];
  if (v2) {
    v2->_chatsStartTimeDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)IMMessageNotificationTimeManager;
  [(IMMessageNotificationTimeManager *)&v3 dealloc];
}

- (void)tearDownSessionForChatIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)[(IMMessageNotificationTimeManager *)self chatsStartTimeDictionary] count]&& [(NSMutableDictionary *)[(IMMessageNotificationTimeManager *)self chatsStartTimeDictionary] objectForKey:a3])
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = 138412290;
        id v7 = a3;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Tearing down session for chatIdentifier %@", (uint8_t *)&v6, 0xCu);
      }
    }
    [(NSMutableDictionary *)[(IMMessageNotificationTimeManager *)self chatsStartTimeDictionary] removeObjectForKey:a3];
  }
}

- (void)setDate:(id)a3 forChatIdentifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([a4 length])
  {
    id v7 = [[IMMessageNotificationTimer alloc] initWithDate:a3];
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412546;
        id v11 = v7;
        __int16 v12 = 2112;
        id v13 = a4;
        _os_log_impl(&dword_1A0772000, v8, OS_LOG_TYPE_INFO, "Setting current notification object %@ for chatIdentifier %@", (uint8_t *)&v10, 0x16u);
      }
    }
    [(NSMutableDictionary *)[(IMMessageNotificationTimeManager *)self chatsStartTimeDictionary] setObject:v7 forKey:a4];
  }
  else if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = a4;
      _os_log_impl(&dword_1A0772000, v9, OS_LOG_TYPE_INFO, "Passed in chatIdentifier is not valid %@", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (BOOL)_isToneToggleSwitchOn
{
  return 1;
}

- (int64_t)_getTimeWindowOverride
{
  return IMGetCachedDomainIntForKeyWithDefaultValue();
}

- (int64_t)_getToneTimeWindow
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int64_t v2 = [(IMMessageNotificationTimeManager *)self _getTimeWindowOverride];
  if (v2 == -1) {
    return 180;
  }
  int64_t v3 = v2;
  if (!objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall")) {
    return 180;
  }
  if (IMOSLoggingEnabled())
  {
    objc_super v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      uint64_t v7 = [NSNumber numberWithInteger:v3];
      _os_log_impl(&dword_1A0772000, v4, OS_LOG_TYPE_INFO, "On internal install, overriding default time window to be %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return v3;
}

- (BOOL)_shouldSendNotificationForChatIdentifier:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v5 = (void *)[(NSMutableDictionary *)[(IMMessageNotificationTimeManager *)self chatsStartTimeDictionary] objectForKey:a3];
  int v6 = IMOSLoggingEnabled();
  if (!v5)
  {
    if (!v6) {
      return 0;
    }
    v21 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    int v36 = 138412290;
    uint64_t v37 = (uint64_t)a3;
    v22 = "Could not find a notification object for chatIdentifier %@, should not send notification";
    v23 = v21;
    uint32_t v24 = 12;
    goto LABEL_32;
  }
  if (v6)
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v36 = 138412546;
      uint64_t v37 = [v5 date];
      __int16 v38 = 2112;
      uint64_t v39 = [v5 numberDingsLeft];
      _os_log_impl(&dword_1A0772000, v7, OS_LOG_TYPE_INFO, "Looking at notification object with previousDate %@, numberDingsLeft %@", (uint8_t *)&v36, 0x16u);
    }
  }
  BOOL v8 = [(IMMessageNotificationTimeManager *)self _isToneToggleSwitchOn];
  uint64_t v9 = [(IMMessageNotificationTimeManager *)self _getToneTimeWindow];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "timeIntervalSinceDate:", objc_msgSend(v5, "date"));
  double v11 = v10;
  double v12 = (double)v9;
  BOOL v13 = v10 >= (double)v9;
  int v14 = [v5 areDingsRemaining];
  if (!v8 || v13 || ((v14 ^ 1) & 1) != 0)
  {
    char v25 = v11 >= v12 || !v8;
    int v26 = IMOSLoggingEnabled();
    if (v25)
    {
      if (v11 >= v12)
      {
        if (v26)
        {
          v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            uint64_t v28 = [NSNumber numberWithDouble:v11];
            uint64_t v29 = [NSNumber numberWithInteger:v9];
            int v36 = 138412546;
            uint64_t v37 = v28;
            __int16 v38 = 2112;
            uint64_t v39 = v29;
            _os_log_impl(&dword_1A0772000, v27, OS_LOG_TYPE_INFO, "Time interval since then %@ is < than timeWindow %@, should send is NO, removing from dicitonary", (uint8_t *)&v36, 0x16u);
          }
        }
        [(IMMessageNotificationTimeManager *)self tearDownSessionForChatIdentifier:a3];
        return 0;
      }
      if (!v26) {
        return 0;
      }
      v30 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      uint64_t v33 = [NSNumber numberWithDouble:v11];
      uint64_t v34 = [NSNumber numberWithInteger:v9];
      int v36 = 138412546;
      uint64_t v37 = v33;
      __int16 v38 = 2112;
      uint64_t v39 = v34;
      v22 = "Time interval since then %@ is NOT < than timeWindow %@, but tone toggle is off so should send is NO, but no"
            "t removing from dictionary";
    }
    else
    {
      if (!v26) {
        return 0;
      }
      v30 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO)) {
        return 0;
      }
      uint64_t v31 = [NSNumber numberWithDouble:v11];
      uint64_t v32 = [NSNumber numberWithInteger:v9];
      int v36 = 138412546;
      uint64_t v37 = v31;
      __int16 v38 = 2112;
      uint64_t v39 = v32;
      v22 = "Time interval since then %@ is NOT < than timeWindow %@, tone toggle is on but no dings left so should send "
            "is NO, but not removing from dictionary";
    }
    v23 = v30;
    uint32_t v24 = 22;
LABEL_32:
    _os_log_impl(&dword_1A0772000, v23, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v36, v24);
    return 0;
  }
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [NSNumber numberWithDouble:v11];
      uint64_t v17 = [NSNumber numberWithInteger:v9];
      int v36 = 138412546;
      uint64_t v37 = v16;
      __int16 v38 = 2112;
      uint64_t v39 = v17;
      _os_log_impl(&dword_1A0772000, v15, OS_LOG_TYPE_INFO, "Time interval since then %@ is NOT < than timeWindow %@, tone toggle is on so should send is YES, but not removing from dictionary", (uint8_t *)&v36, 0x16u);
    }
  }
  [v5 reduceNumberDingsLeft];
  if (!IMOSLoggingEnabled()) {
    return 1;
  }
  v18 = OSLogHandleForIMFoundationCategory();
  BOOL v19 = 1;
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    uint64_t v20 = [v5 numberDingsLeft];
    int v36 = 138412546;
    uint64_t v37 = (uint64_t)a3;
    __int16 v38 = 2112;
    uint64_t v39 = v20;
    _os_log_impl(&dword_1A0772000, v18, OS_LOG_TYPE_INFO, "Num dings left after sending ding tone for chatIdentifier %@ is %@", (uint8_t *)&v36, 0x16u);
  }
  return v19;
}

- (void)setLatestNotificationIDSTokenURI:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([+[IMMessageNotificationController sharedInstance] audioAccessoryDeviceWithTokenURIExists:a3])
  {
    [(IMMessageNotificationTimeManager *)self setLatestIDSTokenURI:a3];
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        latestIDSTokenURI = self->_latestIDSTokenURI;
        int v7 = 138412290;
        BOOL v8 = latestIDSTokenURI;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Set latetsIDSTokenURI to %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)sendNotificationMessageIfNeededForIncomingMessageFromChatIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(NSString *)self->_latestIDSTokenURI length]
    && [(IMMessageNotificationTimeManager *)self _shouldSendNotificationForChatIdentifier:a3])
  {
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        latestIDSTokenURI = self->_latestIDSTokenURI;
        int v7 = 138412290;
        BOOL v8 = latestIDSTokenURI;
        _os_log_impl(&dword_1A0772000, v5, OS_LOG_TYPE_INFO, "Sending incoming message notification to IDS token URI %@", (uint8_t *)&v7, 0xCu);
      }
    }
    [+[IMMessageNotificationController sharedInstance] sendNotificationMessageToTokenURI:self->_latestIDSTokenURI withCommmand:0];
  }
}

- (void)acquireAssertionToUnsuspendProcess
{
  v20[1] = *MEMORY[0x1E4F143B8];
  uint64_t v17 = 0;
  uint64_t v2 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:@"com.apple.MobileSMS"];
  int64_t v3 = (void *)[MEMORY[0x1E4F963E8] handleForPredicate:v2 error:&v17];
  if ([v3 pid])
  {
    uint64_t v4 = [v3 pid];
    id v5 = objc_alloc(MEMORY[0x1E4F96318]);
    uint64_t v6 = [MEMORY[0x1E4F96478] targetWithPid:v4];
    v20[0] = [MEMORY[0x1E4F96358] attributeWithDomain:@"com.apple.MobileSMS" name:@"IncomingMessage"];
    int v7 = objc_msgSend(v5, "initWithExplanation:target:attributes:", @"incoming message assertion for MobileSMS", v6, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 1));
    LOBYTE(v6) = [v7 acquireWithError:&v17];
    int v8 = IMOSLoggingEnabled();
    if (v6)
    {
      if (!v8) {
        goto LABEL_13;
      }
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      *(_WORD *)buf = 0;
      double v10 = "Acquired unsuspend assertion";
      double v11 = v9;
      uint32_t v12 = 2;
    }
    else
    {
      if (!v8) {
        goto LABEL_13;
      }
      int v14 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v17;
      double v10 = "Failed to acquire unsuspend assertion %@";
      double v11 = v14;
      uint32_t v12 = 12;
    }
    _os_log_impl(&dword_1A0772000, v11, OS_LOG_TYPE_INFO, v10, buf, v12);
LABEL_13:
    dispatch_time_t v15 = dispatch_time(0, 3000000000);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1A084DDE4;
    v16[3] = &unk_1E5A10B08;
    v16[4] = v7;
    dispatch_after(v15, MEMORY[0x1E4F14428], v16);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A0772000, v13, OS_LOG_TYPE_INFO, "Failed to get pid of MobileSMS", buf, 2u);
    }
  }
}

- (NSMutableDictionary)chatsStartTimeDictionary
{
  return self->_chatsStartTimeDictionary;
}

- (void)setChatsStartTimeDictionary:(id)a3
{
}

- (NSString)latestIDSTokenURI
{
  return self->_latestIDSTokenURI;
}

- (void)setLatestIDSTokenURI:(id)a3
{
}

@end