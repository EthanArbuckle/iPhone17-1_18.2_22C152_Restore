@interface CKPluginExtensionStateObserver
+ (id)_sharedInstanceIfInitialized;
+ (id)sharedInstance;
- (BOOL)iTunesStoreDialogPresented;
- (BOOL)passKitUIPresented;
- (BOOL)stickerDragActiveInCurrentProcess;
- (CKPluginExtensionStateObserver)init;
- (id)description;
- (void)_iTunesStoreDialogDidDismiss;
- (void)_iTunesStoreDialogWillDisplay;
- (void)_passKitUIDismissed;
- (void)_passKitUIPresented;
- (void)_stickerDragEnded:(id)a3;
- (void)_stickerDragStarted:(id)a3;
- (void)dealloc;
- (void)prepareForResume;
- (void)setITunesStoreDialogPresented:(BOOL)a3;
- (void)setPassKitUIPresented:(BOOL)a3;
- (void)setStickerDragActiveInCurrentProcess:(BOOL)a3;
@end

@implementation CKPluginExtensionStateObserver

- (void)_iTunesStoreDialogWillDisplay
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      v5 = "-[CKPluginExtensionStateObserver _iTunesStoreDialogWillDisplay]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "%s _iTunesStoreDialogWillDisplay", (uint8_t *)&v4, 0xCu);
    }
  }
  [(CKPluginExtensionStateObserver *)self setITunesStoreDialogPresented:1];
}

+ (id)_sharedInstanceIfInitialized
{
  return (id)sSharedInstance;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_10 != -1) {
    dispatch_once(&sharedInstance_onceToken_10, &__block_literal_global_47);
  }
  v2 = (void *)sSharedInstance;

  return v2;
}

void __48__CKPluginExtensionStateObserver_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(CKPluginExtensionStateObserver);
  v1 = (void *)sSharedInstance;
  sSharedInstance = (uint64_t)v0;
}

- (CKPluginExtensionStateObserver)init
{
  v13.receiver = self;
  v13.super_class = (Class)CKPluginExtensionStateObserver;
  v2 = [(CKPluginExtensionStateObserver *)&v13 init];
  v3 = v2;
  if (v2)
  {
    v2->_passKitUIPresented = 0;
    v2->_iTunesStoreDialogPresented = 0;
    _PassKitApiInit();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v3, (CFNotificationCallback)_PassKitUIPresentedCallBack, (CFStringRef)kPKDarwinNotificationEventInAppPresented, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v5, v3, (CFNotificationCallback)_PassKitUIDismissedCallBack, (CFStringRef)kPKDarwinNotificationEventInAppDismissed, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v6, v3, (CFNotificationCallback)_TouchIDUIPresentedCallBack, @"com.apple.LocalAuthentication.ui.presented", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v7 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v7, v3, (CFNotificationCallback)_TouchIDUIDismissedCallBack, @"com.apple.LocalAuthentication.ui.dismissed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    _ITunesStoreAPIInit();
    v8 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v8, v3, (CFNotificationCallback)_iTunesStoreDialogWillDisplayCallBack, (CFStringRef)kITunesDaemonWillDisplayDialog, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v9 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v9, v3, (CFNotificationCallback)_iTunesStoreDialogDidDismissCallBack, (CFStringRef)kITunesDaemonDidDismissDialog, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v3 selector:sel__stickerDragStarted_ name:@"CKPluginExtensionStateObserverStickerDragStarted" object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v3 selector:sel__stickerDragEnded_ name:@"CKPluginExtensionStateObserverStickerDragEnded" object:0];
  }
  return v3;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = @"YES";
  if (self->_passKitUIPresented) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  if (!self->_iTunesStoreDialogPresented) {
    v5 = @"NO";
  }
  return (id)[v3 stringWithFormat:@"<%@ _passKitUIPresented %@, iTunesStoreDialogPresented %@>", v4, v6, v5];
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)kPKDarwinNotificationEventInAppPresented, 0);
  uint64_t v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, (CFNotificationName)kITunesDaemonWillDisplayDialog, 0);
  v5.receiver = self;
  v5.super_class = (Class)CKPluginExtensionStateObserver;
  [(CKPluginExtensionStateObserver *)&v5 dealloc];
}

- (void)_iTunesStoreDialogDidDismiss
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      objc_super v5 = "-[CKPluginExtensionStateObserver _iTunesStoreDialogDidDismiss]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "%s _iTunesStoreDialogDidDismiss", (uint8_t *)&v4, 0xCu);
    }
  }
  [(CKPluginExtensionStateObserver *)self setITunesStoreDialogPresented:0];
}

- (void)_passKitUIPresented
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      objc_super v5 = "-[CKPluginExtensionStateObserver _passKitUIPresented]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "%s _passKitUIPresented", (uint8_t *)&v4, 0xCu);
    }
  }
  [(CKPluginExtensionStateObserver *)self setPassKitUIPresented:1];
}

- (void)_passKitUIDismissed
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 136315138;
      uint64_t v6 = "-[CKPluginExtensionStateObserver _passKitUIDismissed]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "%s _passKitUIDismissed", (uint8_t *)&v5, 0xCu);
    }
  }
  [(CKPluginExtensionStateObserver *)self setPassKitUIPresented:0];
  int v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"CKPluginExtensionStateObserverPassKitUIDismissed" object:0];
}

- (void)_stickerDragStarted:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CKPluginExtensionStateObserver _stickerDragStarted:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s _stickerDragStarted", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKPluginExtensionStateObserver *)self setStickerDragActiveInCurrentProcess:1];
}

- (void)_stickerDragEnded:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315138;
      uint64_t v7 = "-[CKPluginExtensionStateObserver _stickerDragEnded:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "%s _stickerDragEnded", (uint8_t *)&v6, 0xCu);
    }
  }
  [(CKPluginExtensionStateObserver *)self setStickerDragActiveInCurrentProcess:0];
}

- (void)prepareForResume
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      int v5 = "-[CKPluginExtensionStateObserver prepareForResume]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
    }
  }
  [(CKPluginExtensionStateObserver *)self _passKitUIDismissed];
  [(CKPluginExtensionStateObserver *)self _iTunesStoreDialogDidDismiss];
}

- (BOOL)passKitUIPresented
{
  return self->_passKitUIPresented;
}

- (void)setPassKitUIPresented:(BOOL)a3
{
  self->_passKitUIPresented = a3;
}

- (BOOL)stickerDragActiveInCurrentProcess
{
  return self->_stickerDragActiveInCurrentProcess;
}

- (void)setStickerDragActiveInCurrentProcess:(BOOL)a3
{
  self->_stickerDragActiveInCurrentProcess = a3;
}

- (BOOL)iTunesStoreDialogPresented
{
  return self->_iTunesStoreDialogPresented;
}

- (void)setITunesStoreDialogPresented:(BOOL)a3
{
  self->_iTunesStoreDialogPresented = a3;
}

@end