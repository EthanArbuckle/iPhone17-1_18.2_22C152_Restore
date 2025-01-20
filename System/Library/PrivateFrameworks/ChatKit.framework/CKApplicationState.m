@interface CKApplicationState
+ (BOOL)_isUIExtension;
+ (BOOL)isApplicationActive;
+ (BOOL)isBackground;
+ (BOOL)isResizing;
+ (BOOL)isWindowForegroundActive:(id)a3;
+ (void)setMainWindowForegroundActive:(BOOL)a3;
@end

@implementation CKApplicationState

+ (BOOL)isResizing
{
  return 0;
}

+ (void)setMainWindowForegroundActive:(BOOL)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (_isForegroundActive != a3)
  {
    BOOL v3 = a3;
    _isForegroundActive = a3;
    if (!a3 && !CKIsRunningInMacCatalyst())
    {
      v4 = +[CKBalloonPluginManager sharedInstance];
      [v4 invalidateAllActivePlugins];

      v5 = +[CKBalloonPluginManager sharedInstance];
      [v5 forceKillRemoteExtensionsWithDelay:0];
    }
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = @"NO";
        if (v3) {
          v7 = @"YES";
        }
        int v8 = 138412290;
        v9 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "isMainWindowForegroundActive: %@", (uint8_t *)&v8, 0xCu);
      }
    }
  }
}

+ (BOOL)isApplicationActive
{
  if ([a1 _isUIExtension]) {
    return _isForegroundActive != 0;
  }
  BOOL v3 = [MEMORY[0x1E4F42738] sharedApplication];
  BOOL v2 = [v3 applicationState] == 0;

  return v2;
}

+ (BOOL)isBackground
{
  if ([a1 _isUIExtension]) {
    return _isForegroundActive == 0;
  }
  BOOL v3 = [MEMORY[0x1E4F42738] sharedApplication];
  BOOL v2 = [v3 applicationState] == 2;

  return v2;
}

+ (BOOL)isWindowForegroundActive:(id)a3
{
  id v3 = a3;
  v4 = [v3 windowScene];

  if (v4)
  {
    v5 = [v3 windowScene];
    LOBYTE(v4) = [v5 activationState] == 0;
  }
  return (char)v4;
}

+ (BOOL)_isUIExtension
{
  return CKIsRunningInMessagesViewService()
      || CKIsRunningInMessagesNotificationExtension()
      || CKIsRunningInMessagesTranscriptExtension() != 0;
}

@end