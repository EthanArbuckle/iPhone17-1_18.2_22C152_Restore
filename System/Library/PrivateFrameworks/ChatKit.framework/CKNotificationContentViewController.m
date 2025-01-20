@interface CKNotificationContentViewController
+ (void)connectIfNeeded;
+ (void)initialize;
- (BOOL)_canShowWhileLocked;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canUpdateContentExtensionSize;
- (CKNotificationChatController)chatController;
- (CKNotificationContentViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (IMTimingCollection)launchTokeyboardBringUpTC;
- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3;
- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3;
- (UNNotification)notification;
- (void)_displayNameUpdatedNotification:(id)a3;
- (void)_keyboardDidShow:(id)a3;
- (void)chatController:(id)a3 didSendCompositionInConversation:(id)a4;
- (void)chatController:(id)a3 willSendComposition:(id)a4 inConversation:(id)a5;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)didReceiveNotification:(id)a3;
- (void)grabFocus;
- (void)notificationChatControllerRequestDismissNotificationContentExtension:(id)a3;
- (void)setCanUpdateContentExtensionSize:(BOOL)a3;
- (void)setChatController:(id)a3;
- (void)setLaunchTokeyboardBringUpTC:(id)a3;
- (void)setNotification:(id)a3;
- (void)setupChatControllerForConversation:(id)a3;
- (void)transcriptBackgroundTapped:(id)a3;
- (void)updateContentExtensionSize;
- (void)updateNotificationTitleFromConversation:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CKNotificationContentViewController

+ (void)initialize
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "Intializing notification view controller", v4, 2u);
    }
  }
  v3 = dispatch_get_global_queue(2, 0);
  dispatch_async(v3, &__block_literal_global_271);

  dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_37);
}

uint64_t __49__CKNotificationContentViewController_initialize__block_invoke()
{
  uint64_t result = IMSharedHelperIsOlderDevice();
  if ((result & 1) == 0) {
    return (uint64_t)(id)[MEMORY[0x1E4F6BC18] sharedInstance];
  }
  return result;
}

uint64_t __49__CKNotificationContentViewController_initialize__block_invoke_2()
{
  +[CKNotificationChatController initialize];

  return +[CKMessageEntryView initialize];
}

+ (void)connectIfNeeded
{
  if (connectIfNeeded_token != -1) {
    dispatch_once(&connectIfNeeded_token, &__block_literal_global_41);
  }
}

void __54__CKNotificationContentViewController_connectIfNeeded__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v0 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v0 startTimingForKey:@"longlook-imagent-connection"];
  v1 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v1 addListenerID:@"MessagesNotificationExtension" capabilities:CKListenerPaginatedChatRegistryCapabilities()];

  v2 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v2 blockUntilConnected];

  v3 = [MEMORY[0x1E4F6BC98] sharedInstance];
  [v3 _setBlocksConnectionAtResume:1];

  v4 = +[CKUIBehavior sharedBehaviors];
  [v4 setHUDStyle:2];

  [v0 stopTimingForKey:@"longlook-imagent-connection"];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Initialized IMAgent connection from long look notification: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (CKNotificationContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)CKNotificationContentViewController;
  v4 = [(CKNotificationContentViewController *)&v12 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(CKNotificationContentViewController *)v4 setCanUpdateContentExtensionSize:1];
    [(id)objc_opt_class() connectIfNeeded];
    int v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v5 selector:sel__displayNameUpdatedNotification_ name:*MEMORY[0x1E4F6B898] object:0];
    dispatch_time_t v7 = dispatch_time(0, 0);
    dispatch_after(v7, MEMORY[0x1E4F14428], &__block_literal_global_55);
    uint64_t v8 = [MEMORY[0x1E4F6C360] sharedInstance];
    int v9 = [v8 isInternalInstall];

    if (v9)
    {
      [v6 addObserver:v5 selector:sel__keyboardDidShow_ name:*MEMORY[0x1E4F43AC8] object:0];
      id v10 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
      [v10 startTimingForKey:@"longlook-launch-to-keyboard"];
      [(CKNotificationContentViewController *)v5 setLaunchTokeyboardBringUpTC:v10];
    }
  }
  return v5;
}

void __62__CKNotificationContentViewController_initWithNibName_bundle___block_invoke()
{
  id v0 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v0 _forceSuspended];

  id v1 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v1 _forceResumed];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CKNotificationContentViewController;
  [(CKNotificationContentViewController *)&v4 dealloc];
}

- (void)_displayNameUpdatedNotification:(id)a3
{
  id v5 = [a3 object];
  objc_super v4 = [[CKConversation alloc] initWithChat:v5];
  if (v4) {
    [(CKNotificationContentViewController *)self updateNotificationTitleFromConversation:v4];
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)CKNotificationContentViewController;
  [(CKNotificationContentViewController *)&v2 didReceiveMemoryWarning];
}

- (BOOL)canBecomeFirstResponder
{
  objc_super v2 = [(CKNotificationContentViewController *)self chatController];
  char v3 = [v2 shouldDisplayTextEntry];

  return v3;
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CKNotificationContentViewController;
  [(CKNotificationContentViewController *)&v2 viewDidLoad];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateContentExtensionSize
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(CKNotificationContentViewController *)self canUpdateContentExtensionSize])
  {
    char v3 = [(CKNotificationContentViewController *)self chatController];
    objc_super v4 = [v3 collectionView];
    objc_msgSend(v4, "__ck_contentSize");
    double v6 = v5;
    double v8 = v7;

    int v9 = [(CKNotificationContentViewController *)self view];
    [v9 frame];
    double v11 = v10;

    if (v8 > v11) {
      -[CKNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
    }
    if (IMOSLoggingEnabled())
    {
      objc_super v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        [(CKNotificationContentViewController *)self preferredContentSize];
        v13 = NSStringFromSize(v17);
        int v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "updated content extension size: %@", (uint8_t *)&v14, 0xCu);
      }
    }
  }
}

- (void)updateNotificationTitleFromConversation:(id)a3
{
  id v9 = a3;
  objc_super v4 = [v9 displayName];

  if (v4)
  {
    uint64_t v5 = [v9 displayName];
  }
  else
  {
    double v6 = [v9 name];

    double v7 = v9;
    if (!v6) {
      goto LABEL_6;
    }
    uint64_t v5 = [v9 name];
  }
  double v8 = (void *)v5;
  [(CKNotificationContentViewController *)self setTitle:v5];

  double v7 = v9;
LABEL_6:
}

- (void)_keyboardDidShow:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKNotificationContentViewController *)self launchTokeyboardBringUpTC];

  if (v5)
  {
    double v6 = [(CKNotificationContentViewController *)self launchTokeyboardBringUpTC];
    [v6 stopTimingForKey:@"longlook-launch-to-keyboard"];

    if (IMOSLoggingEnabled())
    {
      double v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        double v8 = [(CKNotificationContentViewController *)self launchTokeyboardBringUpTC];
        int v10 = 138412290;
        double v11 = v8;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "From launch to keyboard bring up %@", (uint8_t *)&v10, 0xCu);
      }
    }
    [(CKNotificationContentViewController *)self setLaunchTokeyboardBringUpTC:0];
    id v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:self name:*MEMORY[0x1E4F43AC8] object:0];
  }
}

- (void)didReceiveNotification:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CKNotificationContentViewController *)self setNotification:v4];
  if ([MEMORY[0x1E4F44680] supportsContentExtensions])
  {
    uint64_t v5 = [(CKNotificationContentViewController *)self chatController];

    if (!v5)
    {
      double v6 = [v4 request];
      double v7 = [v6 content];
      double v8 = [v7 threadIdentifier];

      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          uint64_t v16 = v8;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Creating chat controller for identifier: %@", (uint8_t *)&v15, 0xCu);
        }
      }
      int v10 = [MEMORY[0x1E4F6BC40] sharedRegistry];
      double v11 = [v10 existingChatWithChatIdentifier:v8];

      uint64_t v12 = [[CKConversation alloc] initWithChat:v11];
      [(CKNotificationContentViewController *)self updateNotificationTitleFromConversation:v12];
      [v11 setNumberOfMessagesToKeepLoaded:0];
      [v11 clear];
      if (CKIsScreenLocked())
      {
        [(CKConversation *)v12 setLoadedMessageCount:5 loadImmediately:0];
        v13 = [v4 request];
        int v14 = [v13 identifier];
        [(CKConversation *)v12 loadAllUnreadMessagesUpToMessageGUID:v14];
      }
      else
      {
        [(CKConversation *)v12 setLoadedMessageCount:5];
      }
      [(CKNotificationContentViewController *)self setupChatControllerForConversation:v12];
    }
    [(CKNotificationContentViewController *)self grabFocus];
  }
}

- (void)setupChatControllerForConversation:(id)a3
{
  id v15 = a3;
  [(CKNotificationContentViewController *)self chatController];
  if (objc_claimAutoreleasedReturnValue()) {
    -[CKNotificationContentViewController setupChatControllerForConversation:]();
  }
  id v4 = [CKNotificationChatController alloc];
  uint64_t v5 = [(CKNotificationContentViewController *)self traitCollection];
  double v6 = [(CKNotificationChatController *)v4 initWithConversation:v15 entryViewTraitCollection:v5];

  [(CKCoreChatController *)v6 setDelegate:self];
  double v7 = [MEMORY[0x1E4F43058] keyWindow];
  double v8 = [v7 windowScene];
  char v9 = [v8 _enhancedWindowingEnabled];

  if ((v9 & 1) == 0) {
    [(CKScrollViewController *)v6 beginHoldingScrollGeometryUpdatesForReason:@"NotificationChatControllerFixedLayout"];
  }
  int v10 = [(CKNotificationChatController *)v6 view];
  double v11 = [(CKNotificationContentViewController *)self view];
  [v11 frame];
  objc_msgSend(v10, "setFrame:");

  uint64_t v12 = [(CKNotificationContentViewController *)self extensionContext];
  [(CKNotificationChatController *)v6 setUrlOpenContext:v12];

  [(CKNotificationContentViewController *)self addChildViewController:v6];
  v13 = [(CKNotificationContentViewController *)self view];
  int v14 = [(CKNotificationChatController *)v6 view];
  [v13 addSubview:v14];

  [(CKNotificationChatController *)v6 didMoveToParentViewController:self];
  [(CKNotificationContentViewController *)self setChatController:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CKNotificationContentViewController;
  [(CKNotificationContentViewController *)&v5 viewWillAppear:a3];
  if (IMOSLoggingEnabled())
  {
    char v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "CKNotificationContentViewController viewWillAppear", v4, 2u);
    }
  }
  +[CKApplicationState setMainWindowForegroundActive:1];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKNotificationContentViewController;
  [(CKNotificationContentViewController *)&v8 viewDidAppear:a3];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "CKNotificationContentViewController didAppear", v7, 2u);
    }
  }
  objc_super v5 = [(CKNotificationContentViewController *)self chatController];

  if (v5) {
    [(CKNotificationContentViewController *)self updateContentExtensionSize];
  }
  double v6 = +[CKImageAnimationTimer sharedTimer];
  [v6 setShouldStopWhenBackgrounded:0];

  [(CKNotificationContentViewController *)self grabFocus];
}

- (void)grabFocus
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  char v3 = [(CKNotificationContentViewController *)self chatController];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v4 startTimingForKey:@"longlook-becomeFirstResponder"];
    objc_super v5 = [(CKNotificationContentViewController *)self chatController];
    double v6 = [v5 entryView];
    [v6 setHidden:0];

    double v7 = [(CKNotificationContentViewController *)self chatController];
    [v7 becomeFirstResponder];

    [v4 stopTimingForKey:@"longlook-becomeFirstResponder"];
    if (IMOSLoggingEnabled())
    {
      objc_super v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Called becomeFirstResponder in long look notification %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKNotificationContentViewController;
  [(CKNotificationContentViewController *)&v8 viewWillDisappear:a3];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "CKNotificationContentViewController willDisappear", buf, 2u);
    }
  }
  objc_super v5 = +[CKImageAnimationTimer sharedTimer];
  [v5 setShouldStopWhenBackgrounded:1];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __57__CKNotificationContentViewController_viewWillDisappear___block_invoke;
  v6[3] = &unk_1E5620C40;
  v6[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v6 animations:0.25];
}

void __57__CKNotificationContentViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) chatController];
  id v1 = [v2 entryView];
  [v1 setHidden:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CKNotificationContentViewController;
  [(CKNotificationContentViewController *)&v3 viewDidDisappear:a3];
  +[CKApplicationState setMainWindowForegroundActive:0];
}

- (void)chatController:(id)a3 willSendComposition:(id)a4 inConversation:(id)a5
{
}

- (void)chatController:(id)a3 didSendCompositionInConversation:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__CKNotificationContentViewController_chatController_didSendCompositionInConversation___block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __87__CKNotificationContentViewController_chatController_didSendCompositionInConversation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setCanUpdateContentExtensionSize:1];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateContentExtensionSize];
}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  double v3 = *MEMORY[0x1E4F437F8];
  double v4 = *(double *)(MEMORY[0x1E4F437F8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F437F8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)transcriptBackgroundTapped:(id)a3
{
  id v3 = [(CKNotificationContentViewController *)self extensionContext];
  [v3 performNotificationDefaultAction];
}

- (void)notificationChatControllerRequestDismissNotificationContentExtension:(id)a3
{
  id v3 = [(CKNotificationContentViewController *)self extensionContext];
  [v3 dismissNotificationContentExtension];
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
}

- (CKNotificationChatController)chatController
{
  return self->_chatController;
}

- (void)setChatController:(id)a3
{
}

- (IMTimingCollection)launchTokeyboardBringUpTC
{
  return self->_launchTokeyboardBringUpTC;
}

- (void)setLaunchTokeyboardBringUpTC:(id)a3
{
}

- (BOOL)canUpdateContentExtensionSize
{
  return self->_canUpdateContentExtensionSize;
}

- (void)setCanUpdateContentExtensionSize:(BOOL)a3
{
  self->_canUpdateContentExtensionSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchTokeyboardBringUpTC, 0);
  objc_storeStrong((id *)&self->_chatController, 0);

  objc_storeStrong((id *)&self->_notification, 0);
}

- (void)setupChatControllerForConversation:.cold.1()
{
  __assert_rtn("-[CKNotificationContentViewController setupChatControllerForConversation:]", "CKNotificationContentViewController.m", 213, "self.chatController == nil");
}

@end