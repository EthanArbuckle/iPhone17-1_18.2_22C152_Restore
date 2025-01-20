@interface IMDOneTimeCodeManager
+ (id)sharedInstance;
- (BOOL)autoDeletionPreference;
- (IMDOneTimeCodeManager)init;
- (IMDOneTimeCodeManager)initWithBroadcaster:(id)a3 otcUtilities:(id)a4;
- (IMDaemonListenerProtocol)broadcaster;
- (IMDaemonListenerProtocol)broadcasterOverride;
- (IMOneTimeCodeUtilities)otcUtilities;
- (IMSyncedSettingsManaging)syncedSettingsManager;
- (NSArray)validCodes;
- (NSTimer)codeInvalidationTimer;
- (id)_localizedStringForKey:(id)a3;
- (id)_urlForPasswordsIcon;
- (void)_setNewCodeAndPrepareInvalidationTimer:(id)a3;
- (void)_updateLastMessageTimeStampForChat:(id)a3;
- (void)broadcastCodeStatusToClients;
- (void)consumeCodeWithGuid:(id)a3;
- (void)consumeCodeWithGuid:(id)a3 codeExpired:(BOOL)a4;
- (void)dealloc;
- (void)moveOneTimeCodeToRecentlyDeleted:(id)a3;
- (void)onboardDeleteVerificationCodesIfNeededWithCompletionHandler:(id)a3;
- (void)onboardDeleteVerificationCodesIfNeededWithMessage:(id)a3 completionHandler:(id)a4;
- (void)setAutoDeletionPreference:(BOOL)a3;
- (void)setBroadcaster:(id)a3;
- (void)setBroadcasterOverride:(id)a3;
- (void)setCodeInvalidationTimer:(id)a3;
- (void)setOtcUtilities:(id)a3;
- (void)setSyncedSettingsManager:(id)a3;
- (void)setValidCodes:(id)a3;
- (void)startTrackingCode:(id)a3;
@end

@implementation IMDOneTimeCodeManager

+ (id)sharedInstance
{
  if (qword_1EBE2B808 != -1) {
    dispatch_once(&qword_1EBE2B808, &unk_1F33906E0);
  }
  return (id)qword_1EBE2B930;
}

- (IMDOneTimeCodeManager)initWithBroadcaster:(id)a3 otcUtilities:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)IMDOneTimeCodeManager;
  v6 = [(IMDOneTimeCodeManager *)&v13 init];
  v7 = v6;
  if (v6)
  {
    [(IMDOneTimeCodeManager *)v6 setValidCodes:MEMORY[0x1E4F1CBF0]];
    [(IMDOneTimeCodeManager *)v7 setOtcUtilities:a4];
    [(IMDOneTimeCodeManager *)v7 setBroadcasterOverride:a3];
    v7->_syncedSettingsManager = (IMSyncedSettingsManaging *)objc_alloc_init(IMDSyncedSettingsServiceManager);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFTypeRef v9 = CFRetain(v7);
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v9, (CFNotificationCallback)sub_1D96B0200, @"EDOneTimeCodeOnboardingAlertUserSelectedEnableNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v10 = CFNotificationCenterGetDarwinNotifyCenter();
    CFTypeRef v11 = CFRetain(v7);
    CFNotificationCenterAddObserver(v10, v11, (CFNotificationCallback)sub_1D96B024C, @"EDOneTimeCodeOnboardingAlertUserSelectedDisableNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  return v7;
}

- (IMDOneTimeCodeManager)init
{
  return (IMDOneTimeCodeManager *)MEMORY[0x1F4181798](self, sel_initWithBroadcaster_otcUtilities_);
}

- (void)dealloc
{
  [(NSTimer *)[(IMDOneTimeCodeManager *)self codeInvalidationTimer] invalidate];
  [(IMDOneTimeCodeManager *)self setCodeInvalidationTimer:0];
  [(IMDOneTimeCodeManager *)self setValidCodes:0];
  [(IMDOneTimeCodeManager *)self setBroadcaster:0];
  [(IMDOneTimeCodeManager *)self setBroadcasterOverride:0];
  [(IMDOneTimeCodeManager *)self setOtcUtilities:0];
  [(IMDOneTimeCodeManager *)self setSyncedSettingsManager:0];
  v3.receiver = self;
  v3.super_class = (Class)IMDOneTimeCodeManager;
  [(IMDOneTimeCodeManager *)&v3 dealloc];
}

- (void)startTrackingCode:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v5 = [(IMOneTimeCodeUtilities *)[(IMDOneTimeCodeManager *)self otcUtilities] isValidOneTimeCode:a3];
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6DED0]];
        int v11 = 138412290;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Asked to track a new OTC with guid %@", (uint8_t *)&v11, 0xCu);
      }
    }
    [(IMDOneTimeCodeManager *)self _setNewCodeAndPrepareInvalidationTimer:a3];
    [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6DED8]];
    [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6DEE0]];
    IMGreenTeaReceived2FACode();
    [(IMDOneTimeCodeManager *)self broadcastCodeStatusToClients];
  }
  else if (v6)
  {
    CFTypeRef v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6DED0]];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Asked to track a OTC but code appears to be invalid %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (void)broadcastCodeStatusToClients
{
  if (IMOSLoggingEnabled())
  {
    objc_super v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Send out OTC to all interested clients.", v4, 2u);
    }
  }
  [(IMDaemonListenerProtocol *)[(IMDOneTimeCodeManager *)self broadcaster] oneTimeCodesDidChange:[(IMDOneTimeCodeManager *)self validCodes]];
}

- (void)consumeCodeWithGuid:(id)a3
{
}

- (void)consumeCodeWithGuid:(id)a3 codeExpired:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v15 = a3;
      __int16 v16 = 1024;
      LODWORD(v17) = v4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Consuming code for message guid: %@, expried: %{BOOL}d", buf, 0x12u);
    }
  }
  id v8 = [(NSArray *)[(IMDOneTimeCodeManager *)self validCodes] firstObject];
  CFTypeRef v9 = (void *)[v8 objectForKeyedSubscript:*MEMORY[0x1E4F6DED0]];
  if ([v9 length] && objc_msgSend(v9, "isEqualToString:", a3))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = a3;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Clearing code for GUID: %@", buf, 0xCu);
      }
    }
    [(IMDOneTimeCodeManager *)self _setNewCodeAndPrepareInvalidationTimer:0];
    if (!v4)
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1D96B087C;
      v13[3] = &unk_1E6B733A8;
      v13[4] = self;
      v13[5] = a3;
      [(IMDOneTimeCodeManager *)self onboardDeleteVerificationCodesIfNeededWithCompletionHandler:v13];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](-[IMDOneTimeCodeManager validCodes](self, "validCodes"), "count"));
      *(_DWORD *)buf = 138412546;
      id v15 = a3;
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Asked to consume code for guid %@, but unable, current code count: %@", buf, 0x16u);
    }
  }
  [(IMDOneTimeCodeManager *)self broadcastCodeStatusToClients];
}

- (void)setAutoDeletionPreference:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Delete Verification Codes | Setting deletion preference to: %{BOOL}d", (uint8_t *)v7, 8u);
    }
  }
  int v6 = [(IMDOneTimeCodeManager *)self syncedSettingsManager];
  -[IMSyncedSettingsManaging setSettingValue:forKey:](v6, "setSettingValue:forKey:", [NSNumber numberWithBool:v3], 2);
}

- (BOOL)autoDeletionPreference
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = objc_msgSend((id)-[IMSyncedSettingsManaging settingValueForKey:](-[IMDOneTimeCodeManager syncedSettingsManager](self, "syncedSettingsManager"), "settingValueForKey:", 2), "BOOLValue");
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5[0] = 67109120;
      v5[1] = v2;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Delete Verification Codes | Reading deletion preference as: %{BOOL}d", (uint8_t *)v5, 8u);
    }
  }
  return v2;
}

- (id)_localizedStringForKey:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = IMDaemonCoreBundle();
  uint64_t v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), "localeIdentifier");
  uint64_t v6 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v7 = [v4 localizations];
  v20[0] = v5;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(v6, "preferredLocalizationsFromArray:forPreferences:", v7, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v20, 1)), "firstObject");
  uint64_t v9 = v8;
  if (v8) {
    uint64_t v10 = v8;
  }
  else {
    uint64_t v10 = v5;
  }
  int v11 = (void *)[v4 localizedStringForKey:a3 value:0 table:@"DaemonCoreLocalizable" localization:v10];
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412802;
      uint64_t v15 = v5;
      __int16 v16 = 2112;
      uint64_t v17 = v9;
      __int16 v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Attempting to localize string for localeID: %@, preferredLocalization: %@, message: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  return v11;
}

- (void)onboardDeleteVerificationCodesIfNeededWithCompletionHandler:(id)a3
{
  [(IMDOneTimeCodeManager *)self _localizedStringForKey:@"OTP_CLEANUP_ALERT_MESSAGE"];

  MEMORY[0x1F4181798](self, sel_onboardDeleteVerificationCodesIfNeededWithMessage_completionHandler_);
}

- (void)onboardDeleteVerificationCodesIfNeededWithMessage:(id)a3 completionHandler:(id)a4
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc(MEMORY[0x1E4F1CB18]);
  id v20 = (id)[v7 initWithSuiteName:*MEMORY[0x1E4F6DEC8]];
  if ([v20 integerForKey:*MEMORY[0x1E4F6DEC0]])
  {
    if (a4) {
      (*((void (**)(id, uint64_t))a4 + 2))(a4, 2);
    }
  }
  else
  {
    id v8 = [(IMDOneTimeCodeManager *)self _localizedStringForKey:@"OTP_CLEANUP_ALERT_TITLE"];
    id v9 = [(IMDOneTimeCodeManager *)self _localizedStringForKey:@"OTP_CLEANUP_ALERT_CONFIRM"];
    id v10 = [(IMDOneTimeCodeManager *)self _localizedStringForKey:@"OTP_CLEANUP_ALERT_CANCEL"];
    uint64_t v11 = *MEMORY[0x1E4F6C2E8];
    v26[0] = *MEMORY[0x1E4F6C308];
    v26[1] = v11;
    v27[0] = v8;
    v27[1] = a3;
    uint64_t v12 = *MEMORY[0x1E4F6C2F0];
    v26[2] = *MEMORY[0x1E4F6C2D8];
    v26[3] = v12;
    v27[2] = v9;
    v27[3] = v10;
    uint64_t v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v27, v26, 4), "mutableCopy");
    id v14 = [(IMDOneTimeCodeManager *)self _urlForPasswordsIcon];
    if (v14) {
      [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x1E4F6C2E0]];
    }
    uint64_t v15 = objc_msgSend(MEMORY[0x1E4F6C410], "userNotificationWithIdentifier:timeout:alertLevel:displayFlags:displayInformation:", objc_msgSend(NSString, "stringGUID", v14), 3, 32, v13, 0.0);

    int v16 = IMOSLoggingEnabled();
    if (v15)
    {
      if (v16)
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v23 = v8;
          __int16 v24 = 2112;
          id v25 = a3;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Delete Verification Codes | Presenting Delete Verification Codes notification with title: \"%@\" message: \"%@\"", buf, 0x16u);
        }
      }
      [v15 setUsesNotificationCenter:0];
      [v15 setRepresentedApplicationBundle:*MEMORY[0x1E4F6C440]];
      __int16 v18 = (void *)[MEMORY[0x1E4F6C418] sharedInstance];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = sub_1D96B127C;
      v21[3] = &unk_1E6B733D0;
      v21[4] = v20;
      v21[5] = a4;
      [v18 addUserNotification:v15 listener:0 completionHandler:v21];
    }
    else
    {
      if (v16)
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Delete Verification Codes | Not able to make notification to onboard delete-verfication-codes", buf, 2u);
        }
      }
    }
  }
}

- (id)_urlForPasswordsIcon
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Delete Verification Codes | Began generating passwordsIcon", (uint8_t *)&v14, 2u);
    }
  }
  BOOL v3 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:@"com.apple.Passwords-Settings.extension"];
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F6F258]), "initWithSize:scale:", 200.0, 200.0, 1.0);
  [v4 setShape:0];
  uint64_t v5 = (void *)[v3 imageForDescriptor:v4];
  if ([v5 placeholder])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14) = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Delete Verification Codes | Preparing Image", (uint8_t *)&v14, 2u);
      }
    }
    uint64_t v5 = (void *)[v3 prepareImageForDescriptor:v4];
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      uint64_t v15 = v5;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Delete Verification Codes | Using image: %@", (uint8_t *)&v14, 0xCu);
    }
  }

  id v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:", NSTemporaryDirectory()), "URLByAppendingPathComponent:", @"otpOnboardingIcon.tiff");
  id v9 = v8;
  if (v8) {
    CFURLRef v10 = (const __CFURL *)CFRetain(v8);
  }
  else {
    CFURLRef v10 = 0;
  }
  uint64_t v11 = CGImageDestinationCreateWithURL(v10, (CFStringRef)*MEMORY[0x1E4F226E8], 1uLL, 0);
  CGImageDestinationAddImage(v11, (CGImageRef)[v5 CGImage], 0);
  CGImageDestinationFinalize(v11);
  CFRelease(v10);
  CFRelease(v11);
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Delete Verification Codes | End generating passwordsIcon", (uint8_t *)&v14, 2u);
    }
  }
  return v9;
}

- (void)moveOneTimeCodeToRecentlyDeleted:(id)a3
{
  v30[1] = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Delete Verification Codes | Attempting to move message with OTP code (guid: %@) to recently deleted.", buf, 0xCu);
    }
  }
  if (a3)
  {
    uint64_t v6 = [MEMORY[0x1E4F1C9C8] date];
    v30[0] = a3;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    id v8 = [+[IMDMessageStore sharedInstance] chatForMessageGUID:a3];
    id v9 = v8;
    if (v8)
    {
      uint64_t v29 = [v8 guid];
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v29 count:1];
    }
    else
    {
      uint64_t v10 = MEMORY[0x1E4F1CBF0];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v26 = v9;
        __int16 v27 = 2112;
        id v28 = a3;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Found chat: %@ for codeMessageGUID: %@", buf, 0x16u);
      }
    }
    if (v9)
    {
      v23[0] = @"message";
      v23[1] = @"isPermanentDelete";
      v24[0] = v7;
      v24[1] = MEMORY[0x1E4F1CC28];
      v23[2] = @"recoverableDeleteDate";
      v24[2] = v6;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:3];
      uint64_t v13 = (void *)[v9 serviceName];
      int v14 = (void *)MEMORY[0x1E4F6E1A0];
      int v15 = [v13 isEqualToString:*MEMORY[0x1E4F6E1A0]];
      uint64_t v16 = (void *)MEMORY[0x1E4F6E1B0];
      if (v15) {
        uint64_t v16 = v14;
      }
      objc_msgSend(-[IMDAccountController anySessionForServiceName:](+[IMDAccountController sharedInstance](IMDAccountController, "sharedInstance"), "anySessionForServiceName:", *v16), "sendDeleteCommand:forChatGUID:", v12, objc_msgSend(v9, "guid"));
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = a3;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Delete Verification Codes | Could not derive chat from codeMessageGUID: %@", buf, 0xCu);
      }
    }
    [+[IMDMessageStore sharedInstance] retractPostedNotificationsForMessageGUIDs:v7];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6E7C8], "sharedInstance"), "deleteInteractionsWithMessageGUIDs:", v7);
    [+[IMDChatRegistry sharedInstance] moveMessagesWithGUIDsToRecentlyDeleted:v7 deleteDate:v6];
    [+[IMDMessageStore sharedInstance] updateStamp];
    [(IMDOneTimeCodeManager *)self _updateLastMessageTimeStampForChat:v9];
    objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForChatListeners](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForChatListeners"), "historicalMessageGUIDsDeleted:chatGUIDs:queryID:", v7, v10, 0);
    if (IMOSLoggingEnabled())
    {
      __int16 v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = a3;
        v19 = "Delete Verification Codes | Finished moving message with OTP code (guid: %@) to recently deleted.";
        id v20 = v18;
        uint32_t v21 = 12;
LABEL_24:
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      v19 = "Delete Verification Codes | codeMessageGUID is nil. Early returning.";
      id v20 = v22;
      uint32_t v21 = 2;
      goto LABEL_24;
    }
  }
}

- (void)_updateLastMessageTimeStampForChat:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_msgSend(a3, "setLastMessage:", -[IMDMessageStore lastMessageForChatWithRowID:](+[IMDMessageStore sharedInstance](IMDMessageStore, "sharedInstance"), "lastMessageForChatWithRowID:", objc_msgSend(a3, "rowID")));
  if ([a3 lastMessage])
  {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastMessage"), "time"), "timeIntervalSinceReferenceDate");
    uint64_t v5 = (uint64_t)v4;
  }
  else
  {
    uint64_t v5 = 0;
  }
  [a3 setLastMessageTimeStampOnLoad:v5];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6E778], "sharedFeatureFlags"), "isAVLessSharePlayEnabled"))
  {
    id v6 = [+[IMDMessageStore sharedInstance] lastTUConversationItemForChat:a3];
    if (!v6)
    {
      id v9 = a3;
      uint64_t v8 = 0;
      goto LABEL_9;
    }
    uint64_t v7 = v6;
    if ([v6 time])
    {
      uint64_t v8 = [v7 time];
      id v9 = a3;
LABEL_9:
      [v9 setLastTUConversationCreatedDate:v8];
      goto LABEL_10;
    }
    uint64_t v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1D98FE180((uint64_t)v7, v13);
    }
  }
LABEL_10:
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = [a3 guid];
      uint64_t v12 = NSNumber;
      objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "lastMessage"), "time"), "timeIntervalSinceReferenceDate");
      int v14 = 138413058;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      uint64_t v17 = objc_msgSend(v12, "numberWithDouble:");
      __int16 v18 = 2112;
      uint64_t v19 = [a3 lastTUConversationCreatedDate];
      __int16 v20 = 2112;
      uint64_t v21 = [a3 lastScheduledMessageCreatedDate];
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Verification Code | IMChat: %@, updating last message timestamp on load: %@ lastTUConversationCreatedDate: %@ lastScheduledMessageCreatedDate: %@", (uint8_t *)&v14, 0x2Au);
    }
  }
  objc_msgSend((id)-[IMDBroadcasterProviding broadcasterForChatListeners](+[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider"), "broadcasterForChatListeners"), "chat:lastMessageTimeStampOnLoadUpdated:", objc_msgSend(a3, "guid"), (double)objc_msgSend(a3, "lastMessageTimeStampOnLoad"));
}

- (IMDaemonListenerProtocol)broadcaster
{
  if ([(IMDOneTimeCodeManager *)self broadcasterOverride])
  {
    return [(IMDOneTimeCodeManager *)self broadcasterOverride];
  }
  else
  {
    double v4 = +[IMDBroadcastController sharedProvider];
    return (IMDaemonListenerProtocol *)[(IMDBroadcasterProviding *)v4 broadcasterForAllListeners];
  }
}

- (IMOneTimeCodeUtilities)otcUtilities
{
  result = self->_otcUtilities;
  if (!result)
  {
    result = (IMOneTimeCodeUtilities *)objc_alloc_init(MEMORY[0x1E4F6E8D8]);
    self->_otcUtilities = result;
  }
  return result;
}

- (void)_setNewCodeAndPrepareInvalidationTimer:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  [(NSTimer *)[(IMDOneTimeCodeManager *)self codeInvalidationTimer] invalidate];
  if (a3)
  {
    v8[0] = a3;
    -[IMDOneTimeCodeManager setValidCodes:](self, "setValidCodes:", [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1]);
    uint64_t v5 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6DED0]];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    _DWORD v7[2] = sub_1D96B1E5C;
    v7[3] = &unk_1E6B733F8;
    v7[4] = v5;
    v7[5] = self;
    -[IMDOneTimeCodeManager setCodeInvalidationTimer:](self, "setCodeInvalidationTimer:", [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v7 block:(double)qword_1EA8C64C0]);
  }
  else
  {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
    [(IMDOneTimeCodeManager *)self setValidCodes:v6];
  }
}

- (NSArray)validCodes
{
  return self->_validCodes;
}

- (void)setValidCodes:(id)a3
{
}

- (NSTimer)codeInvalidationTimer
{
  return self->_codeInvalidationTimer;
}

- (void)setCodeInvalidationTimer:(id)a3
{
}

- (void)setBroadcaster:(id)a3
{
}

- (IMDaemonListenerProtocol)broadcasterOverride
{
  return self->_broadcasterOverride;
}

- (void)setBroadcasterOverride:(id)a3
{
}

- (void)setOtcUtilities:(id)a3
{
}

- (IMSyncedSettingsManaging)syncedSettingsManager
{
  return self->_syncedSettingsManager;
}

- (void)setSyncedSettingsManager:(id)a3
{
}

@end