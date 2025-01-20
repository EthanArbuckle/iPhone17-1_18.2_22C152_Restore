@interface _UNNotificationContentExtensionHostContainerViewController
+ (BOOL)isMediaSafetyNetEnabled;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowManualDismiss;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canResignFirstResponder;
- (BOOL)extensionWantsToReceiveActionResponses;
- (BOOL)isDefaultContentHidden;
- (BOOL)isDefaultTitleOverridden;
- (BOOL)isUserInteractionEnabled;
- (BOOL)resignFirstResponder;
- (BOOL)restoreInputViews;
- (BOOL)screenCaptureProhibited;
- (BOOL)shouldPlayMediaAfterPresented;
- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4;
- (NSArray)actions;
- (NSExtension)extension;
- (NSMutableArray)queuedNotifications;
- (NSString)extensionIdentifier;
- (NSString)notificationRequestIdentifier;
- (UIView)blockingView;
- (_UIRemoteViewController)extensionViewController;
- (_UNMediaPlayPauseButton)mediaPlayPauseButton;
- (_UNNotificationContentExtensionHostContainerViewController)initWithExtension:(id)a3 notification:(id)a4 actions:(id)a5;
- (_UNNotificationContentExtensionHostContainerViewControllerDelegate)delegate;
- (_UNNotificationContentExtensionHostContext)extensionHostContext;
- (double)_contentHeightForWidth:(double)a3;
- (double)contentSizeRatio;
- (id)cancelTouchesForCurrentEventInExtension;
- (uint64_t)_teardownExtension;
- (void)_addExtensionViewFromViewController:(id)a3;
- (void)_flushQueuedRequests;
- (void)_loadExtensionViewController;
- (void)_mediaPlayPauseButtonTapped:(id)a3;
- (void)_pauseMediaIfPresented;
- (void)_playMediaIfPresented;
- (void)_setupExtensionViewController:(id)a3;
- (void)_setupMediaButton;
- (void)_teardownExtension;
- (void)dealloc;
- (void)didReceiveNotification:(id)a3;
- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4;
- (void)notificationExtension:(id)a3 didUpdateNotificationActions:(id)a4;
- (void)notificationExtension:(id)a3 didUpdateTitle:(id)a4;
- (void)notificationExtensionMediaPlayingDidPause:(id)a3;
- (void)notificationExtensionMediaPlayingDidStart:(id)a3;
- (void)notificationExtensionRequestsDefaultAction:(id)a3;
- (void)notificationExtensionRequestsDismiss:(id)a3;
- (void)pauseMedia;
- (void)playMedia;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)preserveInputViews;
- (void)setActions:(id)a3;
- (void)setAllowManualDismiss:(BOOL)a3;
- (void)setBlockingView:(id)a3;
- (void)setContentSizeRatio:(double)a3;
- (void)setDefaultContentHidden:(BOOL)a3;
- (void)setDefaultTitleOverridden:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setExtension:(id)a3;
- (void)setExtensionHostContext:(id)a3;
- (void)setExtensionViewController:(id)a3;
- (void)setMediaPlayPauseButton:(id)a3;
- (void)setNotificationRequestIdentifier:(id)a3;
- (void)setQueuedNotifications:(id)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setShouldPlayMediaAfterPresented:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation _UNNotificationContentExtensionHostContainerViewController

- (_UNNotificationContentExtensionHostContainerViewController)initWithExtension:(id)a3 notification:(id)a4 actions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  v12 = [(_UNNotificationContentExtensionHostContainerViewController *)&v29 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_extension, a3);
    v14 = [v10 request];
    uint64_t v15 = [v14 identifier];
    notificationRequestIdentifier = v13->_notificationRequestIdentifier;
    v13->_notificationRequestIdentifier = (NSString *)v15;

    v17 = [v10 request];
    v18 = [v17 content];
    v13->_screenCaptureProhibited = [v18 screenCaptureProhibited];

    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v10, 0);
    queuedNotifications = v13->_queuedNotifications;
    v13->_queuedNotifications = (NSMutableArray *)v19;

    objc_storeStrong((id *)&v13->_actions, a5);
    objc_msgSend(v9, "un_effectiveContentSizeRatio");
    v13->_contentSizeRatio = v21;
    v13->_defaultContentHidden = objc_msgSend(v9, "un_isDefaultContentHidden");
    v13->_defaultTitleOverridden = objc_msgSend(v9, "un_isDefaultTitleOverridden");
    char v22 = objc_msgSend(v9, "un_isUserInteractionEnabled");
    v13->_userInteractionEnabled = v22;
    if ((v22 & 1) == 0)
    {
      v23 = [_UNBlockTouchesView alloc];
      uint64_t v24 = -[_UNBlockTouchesView initWithFrame:](v23, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      blockingView = v13->_blockingView;
      v13->_blockingView = (UIView *)v24;

      [(UIView *)v13->_blockingView setAutoresizingMask:18];
      v26 = v13->_blockingView;
      v27 = [MEMORY[0x263F1C550] clearColor];
      [(UIView *)v26 setBackgroundColor:v27];
    }
  }

  return v13;
}

+ (BOOL)isMediaSafetyNetEnabled
{
  if (isMediaSafetyNetEnabled_onceToken != -1) {
    dispatch_once(&isMediaSafetyNetEnabled_onceToken, &__block_literal_global_1);
  }
  return isMediaSafetyNetEnabled_enabled;
}

- (void)dealloc
{
  [(_UNNotificationContentExtensionHostContainerViewController *)self _teardownExtension];
  v3.receiver = self;
  v3.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  [(_UNNotificationContentExtensionHostContainerViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  [(_UNNotificationContentExtensionHostContainerViewController *)&v7 viewDidLoad];
  objc_super v3 = [(_UNNotificationContentExtensionHostContainerViewController *)self blockingView];
  if (v3)
  {
    v4 = [(_UNNotificationContentExtensionHostContainerViewController *)self view];
    [v4 bounds];
    objc_msgSend(v3, "setFrame:");

    v5 = [(_UNNotificationContentExtensionHostContainerViewController *)self view];
    [v5 addSubview:v3];
  }
  if (self->_defaultTitleOverridden) {
    [(_UNNotificationContentExtensionHostContainerViewController *)self setTitle:0];
  }
  v6 = [(_UNNotificationContentExtensionHostContainerViewController *)self view];
  objc_msgSend(v6, "nc_setScreenCaptureProhibited:", self->_screenCaptureProhibited);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostContainerViewController viewWillAppear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  [(_UNNotificationContentExtensionHostContainerViewController *)&v6 viewWillAppear:v3];
  [(_UNNotificationContentExtensionHostContainerViewController *)self _loadExtensionViewController];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostContainerViewController viewDidAppear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  [(_UNNotificationContentExtensionHostContainerViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostContainerViewController viewWillDisappear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  [(_UNNotificationContentExtensionHostContainerViewController *)&v6 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostContainerViewController viewDidDisappear:]";
    _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  [(_UNNotificationContentExtensionHostContainerViewController *)&v6 viewDidDisappear:v3];
}

- (void)setTitle:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  [(_UNNotificationContentExtensionHostContainerViewController *)&v5 setTitle:a3];
  v4 = [(_UNNotificationContentExtensionHostContainerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 extensionViewControllerDidUpdateTitle:self];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  [(_UNNotificationContentExtensionHostContainerViewController *)&v12 preferredContentSizeDidChangeForChildContentContainer:v4];
  [(_UNNotificationContentExtensionHostContainerViewController *)self preferredContentSize];
  double v6 = v5;
  double v8 = v7;
  [v4 preferredContentSize];
  if (v6 != v10 || v8 != v9)
  {
    [v4 preferredContentSize];
    -[_UNNotificationContentExtensionHostContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double width = a4.width;
  double v6 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionViewController];
  [v6 preferredContentSize];
  double v8 = v7;
  double v10 = v9;

  if (v8 == *MEMORY[0x263F001B0] && v10 == *(double *)(MEMORY[0x263F001B0] + 8))
  {
    [(_UNNotificationContentExtensionHostContainerViewController *)self _contentHeightForWidth:width];
    double v10 = v12;
  }
  double v13 = width;
  double v14 = v10;
  result.height = v14;
  result.double width = v13;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  BOOL v3 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionViewController];
  if ([v3 canBecomeFirstResponder])
  {
    id v4 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
    char v5 = [v4 wantsToBecomeFirstResponder];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionViewController];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (BOOL)canResignFirstResponder
{
  v2 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionViewController];
  char v3 = [v2 canResignFirstResponder];

  return v3;
}

- (BOOL)resignFirstResponder
{
  v2 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionViewController];
  char v3 = [v2 resignFirstResponder];

  return v3;
}

- (void)didReceiveNotification:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  char v5 = [(_UNNotificationContentExtensionHostContainerViewController *)v4 queuedNotifications];
  [v5 addObject:v7];

  double v6 = [(_UNNotificationContentExtensionHostContainerViewController *)v4 extensionHostContext];

  if (v6) {
    [(_UNNotificationContentExtensionHostContainerViewController *)v4 _flushQueuedRequests];
  }
  objc_sync_exit(v4);
}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  double v8 = (void *)UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    v16 = [v6 actionIdentifier];
    double v9 = [v6 notification];
    double v10 = [v9 request];
    id v11 = [v10 identifier];
    double v12 = objc_msgSend(v11, "un_logDigest");
    double v13 = [(_UNNotificationContentExtensionHostContainerViewController *)self extension];
    double v14 = [v13 identifier];
    *(_DWORD *)buf = 138543874;
    uint64_t v19 = v16;
    __int16 v20 = 2114;
    double v21 = v12;
    __int16 v22 = 2114;
    v23 = v14;
    _os_log_impl(&dword_222224000, log, OS_LOG_TYPE_DEFAULT, "Sending action %{public}@ for notification %{public}@ to extension %{public}@", buf, 0x20u);
  }
  uint64_t v15 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
  [v15 didReceiveNotificationResponse:v6 completionHandler:v7];
}

- (void)preserveInputViews
{
  char v3 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
  int v4 = [v3 wantsToBecomeFirstResponder];

  if (v4)
  {
    id v5 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
    [v5 preserveInputViews];
  }
}

- (BOOL)restoreInputViews
{
  char v3 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
  int v4 = [v3 wantsToBecomeFirstResponder];

  if (v4)
  {
    id v5 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
    [v5 restoreInputViews];
  }
  return v4;
}

- (BOOL)extensionWantsToReceiveActionResponses
{
  v2 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
  char v3 = [v2 wantsToReceiveActionResponses];

  return v3;
}

- (NSString)extensionIdentifier
{
  v2 = [(_UNNotificationContentExtensionHostContainerViewController *)self extension];
  char v3 = [v2 identifier];

  return (NSString *)v3;
}

- (void)playMedia
{
  char v3 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];

  if (v3)
  {
    [(_UNNotificationContentExtensionHostContainerViewController *)self _playMediaIfPresented];
  }
  else
  {
    [(_UNNotificationContentExtensionHostContainerViewController *)self setShouldPlayMediaAfterPresented:1];
  }
}

- (void)pauseMedia
{
  char v3 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];

  if (v3)
  {
    [(_UNNotificationContentExtensionHostContainerViewController *)self _pauseMediaIfPresented];
  }
  else
  {
    [(_UNNotificationContentExtensionHostContainerViewController *)self setShouldPlayMediaAfterPresented:0];
  }
}

- (id)cancelTouchesForCurrentEventInExtension
{
  return [(_UIRemoteViewController *)self->_extensionViewController _cancelTouchesForCurrentEventInHostedContent];
}

- (void)notificationExtension:(id)a3 didUpdateTitle:(id)a4
{
  id v7 = a4;
  if ([(_UNNotificationContentExtensionHostContainerViewController *)self isDefaultTitleOverridden])
  {
    if ([v7 length])
    {
      id v5 = [(_UNNotificationContentExtensionHostContainerViewController *)self title];
      char v6 = [v7 isEqual:v5];

      if ((v6 & 1) == 0) {
        [(_UNNotificationContentExtensionHostContainerViewController *)self setTitle:v7];
      }
    }
  }
}

- (void)notificationExtension:(id)a3 didUpdateNotificationActions:(id)a4
{
  id v8 = a4;
  id v5 = [(_UNNotificationContentExtensionHostContainerViewController *)self actions];
  char v6 = [v5 isEqualToArray:v8];

  if ((v6 & 1) == 0)
  {
    [(_UNNotificationContentExtensionHostContainerViewController *)self setActions:v8];
    id v7 = [(_UNNotificationContentExtensionHostContainerViewController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v7 extensionViewControllerDidUpdateActions:self];
    }
  }

  MEMORY[0x270F9A790]();
}

- (void)notificationExtensionMediaPlayingDidStart:(id)a3
{
  int v4 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
  [v4 updateMediaPlayPauseButton];

  id v5 = [(_UNNotificationContentExtensionHostContainerViewController *)self mediaPlayPauseButton];
  [v5 setSelected:1];
}

- (void)notificationExtensionMediaPlayingDidPause:(id)a3
{
  int v4 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
  [v4 updateMediaPlayPauseButton];

  id v5 = [(_UNNotificationContentExtensionHostContainerViewController *)self mediaPlayPauseButton];
  [v5 setSelected:0];
}

- (void)notificationExtensionRequestsDefaultAction:(id)a3
{
  id v4 = [(_UNNotificationContentExtensionHostContainerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 extensionViewControllerRequestsDefaultAction:self];
  }
}

- (void)notificationExtensionRequestsDismiss:(id)a3
{
  id v4 = [(_UNNotificationContentExtensionHostContainerViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 extensionViewControllerRequestsDismiss:self];
  }
}

- (void)_playMediaIfPresented
{
  id v2 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
  [v2 mediaPlay];
}

- (void)_pauseMediaIfPresented
{
  id v2 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
  [v2 mediaPause];
}

- (void)_flushQueuedRequests
{
  *(_DWORD *)buf = 138543618;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_222224000, log, OS_LOG_TYPE_FAULT, "Received unexpected notification for section %{public}@ while displaying notification for extension %{public}@", buf, 0x16u);
}

- (void)_setupMediaButton
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_222224000, log, OS_LOG_TYPE_ERROR, "Got an invalid type for the media button", v1, 2u);
}

- (void)_mediaPlayPauseButtonTapped:(id)a3
{
  id v7 = a3;
  int v4 = [v7 isSelected];
  id v5 = [(_UNNotificationContentExtensionHostContainerViewController *)self extensionHostContext];
  char v6 = v5;
  if (v4) {
    [v5 mediaPause];
  }
  else {
    [v5 mediaPlay];
  }

  objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
}

- (void)_setupExtensionViewController:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 parentViewController];
  int v6 = [(_UNNotificationContentExtensionHostContainerViewController *)self isViewLoaded];
  if (v4 && v6 && v5 != self)
  {
    id v7 = (void *)UNLogExtensionsHost;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
    {
      notificationRequestIdentifier = self->_notificationRequestIdentifier;
      double v9 = v7;
      double v10 = [(NSString *)notificationRequestIdentifier un_logDigest];
      int v14 = 138543362;
      uint64_t v15 = v10;
      _os_log_impl(&dword_222224000, v9, OS_LOG_TYPE_DEFAULT, "Setting up extension view controller for notification %{public}@", (uint8_t *)&v14, 0xCu);
    }
    [v4 setServiceViewShouldShareTouchesWithHost:1];
    [v4 preferredContentSize];
    if (v12 != *MEMORY[0x263F001B0] || v11 != *(double *)(MEMORY[0x263F001B0] + 8)) {
      -[_UNNotificationContentExtensionHostContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    }
    if (v5)
    {
      [v4 willMoveToParentViewController:0];
      [v4 removeFromParentViewController];
    }
    [v4 setInheritsSecurity:1];
    [(_UNNotificationContentExtensionHostContainerViewController *)self addChildViewController:v4];
    if (([(_UNNotificationContentExtensionHostContainerViewController *)self _appearState] == 1
       || [(_UNNotificationContentExtensionHostContainerViewController *)self _appearState] == 2)
      && [v4 _appearState] != 1
      && [v4 _appearState] != 2)
    {
      [v4 beginAppearanceTransition:1 animated:0];
      [(_UNNotificationContentExtensionHostContainerViewController *)self _addExtensionViewFromViewController:v4];
      [v4 didMoveToParentViewController:self];
      if ([v4 _appearState] == 1) {
        [v4 endAppearanceTransition];
      }
    }
    else
    {
      [(_UNNotificationContentExtensionHostContainerViewController *)self _addExtensionViewFromViewController:v4];
      [v4 didMoveToParentViewController:self];
    }
    [(_UNNotificationContentExtensionHostContainerViewController *)self _flushQueuedRequests];
    if ([(_UNNotificationContentExtensionHostContainerViewController *)self shouldPlayMediaAfterPresented])
    {
      [(_UNNotificationContentExtensionHostContainerViewController *)self _playMediaIfPresented];
    }
  }
}

- (void)_teardownExtension
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 1000);
  char v3 = a2;
  id v4 = [v2 identifier];
  int v5 = 138412290;
  int v6 = v4;
  _os_log_error_impl(&dword_222224000, v3, OS_LOG_TYPE_ERROR, "Killing the process of a remote view controller that failed to load, %@", (uint8_t *)&v5, 0xCu);
}

- (void)_addExtensionViewFromViewController:(id)a3
{
  id v4 = [a3 view];
  [v4 setAutoresizingMask:18];
  int v5 = [(_UNNotificationContentExtensionHostContainerViewController *)self view];
  [v5 bounds];
  objc_msgSend(v4, "setFrame:");

  int v6 = [(_UNNotificationContentExtensionHostContainerViewController *)self view];
  [v6 addSubview:v4];

  uint64_t v7 = [(_UNNotificationContentExtensionHostContainerViewController *)self blockingView];

  if (v7)
  {
    id v8 = [(_UNNotificationContentExtensionHostContainerViewController *)self view];
    double v9 = [(_UNNotificationContentExtensionHostContainerViewController *)self blockingView];
    [v8 insertSubview:v4 belowSubview:v9];
  }
  [v4 setAlpha:0.0];
  double v10 = (void *)MEMORY[0x263F1CB60];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __98___UNNotificationContentExtensionHostContainerViewController__addExtensionViewFromViewController___block_invoke;
  v12[3] = &unk_2646035C0;
  id v13 = v4;
  id v11 = v4;
  [v10 animateWithDuration:4 delay:v12 options:0 animations:0.25 completion:0.0];
}

- (void)_loadExtensionViewController
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  char v3 = self->_notificationRequestIdentifier;
  id v4 = [(NSString *)v3 un_logDigest];
  if (self->_extensionViewController)
  {
    int v5 = UNLogExtensionsHost;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
    {
      extensionViewController = self->_extensionViewController;
      *(_DWORD *)buf = 138543618;
      v27 = v4;
      __int16 v28 = 2114;
      objc_super v29 = extensionViewController;
      _os_log_impl(&dword_222224000, v5, OS_LOG_TYPE_DEFAULT, "Already have extension view controller for notification request %{public}@: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = [(_UNNotificationContentExtensionHostContainerViewController *)self actions];
    if ([v7 count])
    {
      id v8 = [MEMORY[0x263F08910] archivedDataWithRootObject:v7 requiringSecureCoding:1 error:0];
    }
    else
    {
      id v8 = 0;
    }
    double v9 = [MEMORY[0x263EFF9A0] dictionary];
    objc_msgSend(v9, "bs_setSafeObject:forKey:", v8, @"actions");
    id v10 = objc_alloc_init(MEMORY[0x263F08810]);
    [v10 setUserInfo:v9];
    id v11 = [MEMORY[0x263EFF910] date];
    double v12 = [(_UNNotificationContentExtensionHostContainerViewController *)self extension];
    objc_initWeak(&location, self);
    id v13 = (id)UNLogExtensionsHost;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [v12 identifier];
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      __int16 v28 = 2114;
      objc_super v29 = v4;
      _os_log_impl(&dword_222224000, v13, OS_LOG_TYPE_DEFAULT, "Loading host view controller from extension %{public}@ for notification request %{public}@", buf, 0x16u);
    }
    id v25 = v10;
    uint64_t v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __90___UNNotificationContentExtensionHostContainerViewController__loadExtensionViewController__block_invoke;
    v18[3] = &unk_2646035E8;
    objc_copyWeak(&v23, &location);
    id v16 = v12;
    id v19 = v16;
    __int16 v20 = v4;
    id v17 = v11;
    id v21 = v17;
    __int16 v22 = v3;
    [v16 instantiateViewControllerWithInputItems:v15 connectionHandler:v18];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }
}

- (double)_contentHeightForWidth:(double)a3
{
  return self->_contentSizeRatio * a3;
}

- (_UNNotificationContentExtensionHostContainerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_UNNotificationContentExtensionHostContainerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
}

- (BOOL)isDefaultContentHidden
{
  return self->_defaultContentHidden;
}

- (void)setDefaultContentHidden:(BOOL)a3
{
  self->_defaultContentHidden = a3;
}

- (BOOL)isDefaultTitleOverridden
{
  return self->_defaultTitleOverridden;
}

- (void)setDefaultTitleOverridden:(BOOL)a3
{
  self->_defaultTitleOverridden = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
}

- (double)contentSizeRatio
{
  return self->_contentSizeRatio;
}

- (void)setContentSizeRatio:(double)a3
{
  self->_contentSizeRatio = a3;
}

- (NSString)notificationRequestIdentifier
{
  return self->_notificationRequestIdentifier;
}

- (void)setNotificationRequestIdentifier:(id)a3
{
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  self->_screenCaptureProhibited = a3;
}

- (_UIRemoteViewController)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
}

- (_UNNotificationContentExtensionHostContext)extensionHostContext
{
  return self->_extensionHostContext;
}

- (void)setExtensionHostContext:(id)a3
{
}

- (UIView)blockingView
{
  return self->_blockingView;
}

- (void)setBlockingView:(id)a3
{
}

- (_UNMediaPlayPauseButton)mediaPlayPauseButton
{
  return self->_mediaPlayPauseButton;
}

- (void)setMediaPlayPauseButton:(id)a3
{
}

- (BOOL)allowManualDismiss
{
  return self->_allowManualDismiss;
}

- (void)setAllowManualDismiss:(BOOL)a3
{
  self->_allowManualDismiss = a3;
}

- (NSMutableArray)queuedNotifications
{
  return self->_queuedNotifications;
}

- (void)setQueuedNotifications:(id)a3
{
}

- (BOOL)shouldPlayMediaAfterPresented
{
  return self->_shouldPlayMediaAfterPresented;
}

- (void)setShouldPlayMediaAfterPresented:(BOOL)a3
{
  self->_shouldPlayMediaAfterPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedNotifications, 0);
  objc_storeStrong((id *)&self->_mediaPlayPauseButton, 0);
  objc_storeStrong((id *)&self->_blockingView, 0);
  objc_storeStrong((id *)&self->_extensionHostContext, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_notificationRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_actions, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (uint64_t)_teardownExtension
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[_UNNotificationContentExtensionHostContainerViewController _teardownExtension](v0);
}

@end