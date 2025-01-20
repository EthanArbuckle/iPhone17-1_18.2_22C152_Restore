@interface _MSRemoteBalloonViewController
- (BOOL)isReadyToDisplay;
- (BOOL)loadedRemoteView;
- (BOOL)needsSizeMatchBeforeSnapshotSwap;
- (BOOL)providesExplicitSizeSnapshot;
- (NSCopying)requestUUID;
- (_MSRemoteBalloonViewController)initWithExtension:(id)a3 identifier:(id)a4;
- (_MSRemoteBalloonViewController)initWithPlugin:(id)a3 identifier:(id)a4;
- (_MSRemoteBalloonViewControllerDelegate)delegate;
- (id)extensionContext;
- (id)remoteProxy;
- (void)_sendResignActiveMessage;
- (void)becomeActiveWithConversationState:(id)a3;
- (void)dealloc;
- (void)handleRemoteInterruption;
- (void)loadRemoteView;
- (void)loadView;
- (void)purgeRemoteViewController;
- (void)setDelegate:(id)a3;
- (void)setNeedsSizeMatchBeforeSnapshotSwap:(BOOL)a3;
- (void)setProvidesExplicitSizeSnapshot:(BOOL)a3;
- (void)setReadyToDisplay:(BOOL)a3;
- (void)setRemoteViewController:(id)a3;
- (void)unloadRemoteView;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _MSRemoteBalloonViewController

- (_MSRemoteBalloonViewController)initWithExtension:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_MSRemoteBalloonViewController;
  v9 = [(_MSRemoteBalloonViewController *)&v13 init];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    identifier = v9->_identifier;
    v9->_identifier = v10;

    objc_storeStrong((id *)&v9->_extension, a3);
  }

  return v9;
}

- (_MSRemoteBalloonViewController)initWithPlugin:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_MSRemoteBalloonViewController;
  v9 = [(_MSRemoteBalloonViewController *)&v13 init];
  if (v9)
  {
    v10 = (NSString *)[v8 copy];
    identifier = v9->_identifier;
    v9->_identifier = v10;

    objc_storeStrong((id *)&v9->_plugin, a3);
  }

  return v9;
}

- (BOOL)isReadyToDisplay
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    remoteViewController = self->_remoteViewController;
    return [(UIViewController *)remoteViewController isReadyToDisplay];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = self->_remoteViewController;
      return [(UIViewController *)v5 isReadyForDisplay];
    }
    else
    {
      return 1;
    }
  }
}

- (BOOL)providesExplicitSizeSnapshot
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  remoteViewController = self->_remoteViewController;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 1;
    }
    remoteViewController = self->_remoteViewController;
  }

  return [(UIViewController *)remoteViewController providesExplicitSizeSnapshot];
}

- (void)setProvidesExplicitSizeSnapshot:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    remoteViewController = self->_remoteViewController;
    [(UIViewController *)remoteViewController setProvidesExplicitSizeSnapshot:v3];
  }
}

- (BOOL)needsSizeMatchBeforeSnapshotSwap
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  remoteViewController = self->_remoteViewController;
  if ((isKindOfClass & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return 1;
    }
    remoteViewController = self->_remoteViewController;
  }

  return [(UIViewController *)remoteViewController needsSizeMatchBeforeSnapshotSwap];
}

- (void)setNeedsSizeMatchBeforeSnapshotSwap:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    remoteViewController = self->_remoteViewController;
    [(UIViewController *)remoteViewController setNeedsSizeMatchBeforeSnapshotSwap:v3];
  }
}

- (void)setReadyToDisplay:(BOOL)a3
{
  BOOL v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    remoteViewController = self->_remoteViewController;
    [(UIViewController *)remoteViewController setReadyToDisplay:v3];
  }
}

- (void)handleRemoteInterruption
{
  extension = self->_extension;
  v4 = [(_MSRemoteBalloonViewController *)self requestUUID];
  [(NSExtension *)extension cancelExtensionRequestWithIdentifier:v4];

  [(_MSRemoteBalloonViewController *)self setRemoteViewController:0];
  v5 = [(_MSRemoteBalloonViewController *)self delegate];
  id v8 = [v5 remoteBalloonViewControllerContextIdentifier:self];

  v6 = +[_MSRemoteBalloonViewControllerManager viewControllerKeyForMessageIdentifier:self->_identifier contextIdentifier:v8];
  id v7 = +[_MSRemoteBalloonViewControllerManager sharedInstance];
  [v7 removeViewControllerWithIdentifier:v6];
}

- (void)purgeRemoteViewController
{
  BOOL v3 = [(_MSRemoteBalloonViewController *)self delegate];
  id v6 = [v3 remoteBalloonViewControllerContextIdentifier:self];

  v4 = +[_MSRemoteBalloonViewControllerManager viewControllerKeyForMessageIdentifier:self->_identifier contextIdentifier:v6];
  v5 = +[_MSRemoteBalloonViewControllerManager sharedInstance];
  [v5 removeViewControllerWithIdentifier:v4];
}

- (void)becomeActiveWithConversationState:(id)a3
{
  objc_storeStrong((id *)&self->_conversationState, a3);
  id v5 = a3;
  id v7 = objc_alloc_init((Class)_MSPresentationState);
  [v7 setPresentationStyle:2];
  id v6 = [(_MSRemoteBalloonViewController *)self remoteProxy];
  [v6 _becomeActiveWithConversationState:v5 presentationState:v7];
}

- (id)extensionContext
{
  extension = self->_extension;
  remoteViewController = self->_remoteViewController;
  if (extension)
  {
    v4 = remoteViewController;
    id v5 = [(UIViewController *)v4 requestUUID];
    id v6 = [(NSExtension *)extension _extensionContextForUUID:v5];
  }
  else
  {
    id v5 = [(UIViewController *)remoteViewController appContext];
    id v6 = [v5 hostContext];
  }

  return v6;
}

- (id)remoteProxy
{
  extension = self->_extension;
  remoteViewController = self->_remoteViewController;
  if (extension)
  {
    v4 = remoteViewController;
    id v5 = [(UIViewController *)v4 requestUUID];
    id v6 = [(NSExtension *)extension _extensionContextForUUID:v5];

    id v7 = [v6 _auxiliaryConnection];
    id v8 = [v7 remoteObjectProxy];
  }
  else
  {
    id v8 = [(UIViewController *)remoteViewController appContext];
  }

  return v8;
}

- (void)dealloc
{
  BOOL v3 = ms_defaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v6 = "-[_MSRemoteBalloonViewController dealloc]";
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [(_MSRemoteBalloonViewController *)self unloadRemoteView];
  v4.receiver = self;
  v4.super_class = (Class)_MSRemoteBalloonViewController;
  [(_MSRemoteBalloonViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)_MSRemoteBalloonViewController;
  [(_MSRemoteBalloonViewController *)&v4 viewDidLoad];
  BOOL v3 = [(_MSRemoteBalloonViewController *)self view];
  [v3 setUserInteractionEnabled:1];
}

- (void)loadView
{
  BOOL v3 = objc_alloc_init(_MSBlurCapableView);
  [(_MSRemoteBalloonViewController *)self setView:v3];
}

- (void)loadRemoteView
{
  if (self->_extension)
  {
    id location = 0;
    objc_initWeak(&location, self);
    BOOL v3 = +[NSString stringWithFormat:@"%p", self];
    objc_super v4 = self->_identifier;
    v22 = self->_extension;
    id v5 = objc_alloc_init((Class)NSExtensionItem);
    uint64_t v30 = _MSExtensionItemWantsLiveViewKey;
    id v6 = +[NSNumber numberWithBool:1];
    v31 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    [v5 setUserInfo:v7];

    id v8 = +[_MSRemoteBalloonViewControllerManager sharedInstance];
    extension = self->_extension;
    identifier = self->_identifier;
    v11 = [(_MSRemoteBalloonViewController *)self delegate];
    v12 = [v11 remoteBalloonViewControllerContextIdentifier:self];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1AAB0;
    v24[3] = &unk_3D2E0;
    objc_copyWeak(&v28, &location);
    id v13 = v3;
    id v25 = v13;
    v14 = v4;
    v26 = v14;
    v15 = v22;
    v27 = v15;
    [v8 getRemoteViewControllerForExtension:extension messageIdentifier:identifier contextIdentifier:v12 item:v5 connectionHandler:v24];

    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  else if (!self->_remoteViewController)
  {
    v16 = [(IMBalloonAppExtension *)self->_plugin appBundle];
    id v23 = objc_alloc_init((Class)[v16 principalClass]);

    v17 = (_MSMessageComposeExtensionImplProtocol *)[objc_alloc((Class)_MSMessageAppBundleContext) initWithViewController:v23 wantsLiveView:1];
    id v18 = [objc_alloc((Class)_MSMessageAppContext) initWithAppContext:v17];
    [v23 setAppContext:v18];

    appContext = self->_appContext;
    self->_appContext = v17;
    v20 = v17;

    id v21 = [objc_alloc((Class)_MSMessageAppBundleHostContext) initWithAppContext:0];
    [(_MSMessageComposeExtensionImplProtocol *)v20 setHostContext:v21];

    [(_MSRemoteBalloonViewController *)self setRemoteViewController:v23];
  }
}

- (void)unloadRemoteView
{
  if (self->_remoteViewController)
  {
    BOOL v3 = ms_defaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      remoteViewController = self->_remoteViewController;
      identifier = self->_identifier;
      int v8 = 134218498;
      v9 = self;
      __int16 v10 = 2048;
      v11 = remoteViewController;
      __int16 v12 = 2112;
      id v13 = identifier;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "LiveBubble. %p Unloading remote view: %p messageGUID: %@", (uint8_t *)&v8, 0x20u);
    }

    [(_MSRemoteBalloonViewController *)self _sendResignActiveMessage];
    extension = self->_extension;
    id v7 = [(_MSRemoteBalloonViewController *)self requestUUID];
    [(NSExtension *)extension cancelExtensionRequestWithIdentifier:v7];

    [(_MSRemoteBalloonViewController *)self setRemoteViewController:0];
  }
}

- (void)_sendResignActiveMessage
{
  BOOL v3 = ms_traceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_25DB4(v3);
  }

  objc_super v4 = [(_MSRemoteBalloonViewController *)self remoteProxy];
  [v4 _resignActive];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_MSRemoteBalloonViewController;
  [(_MSRemoteBalloonViewController *)&v6 viewWillAppear:a3];
  if (!self->_remoteViewController)
  {
    [(_MSRemoteBalloonViewController *)self loadRemoteView];
    objc_super v4 = ms_defaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      identifier = self->_identifier;
      *(_DWORD *)buf = 134218242;
      int v8 = self;
      __int16 v9 = 2112;
      __int16 v10 = identifier;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "LiveBubble. %p Loading remote view for messageGUID: %@", buf, 0x16u);
    }
  }
}

- (BOOL)loadedRemoteView
{
  return self->_remoteViewController != 0;
}

- (NSCopying)requestUUID
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v3 = [(UIViewController *)self->_remoteViewController requestUUID];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSCopying *)v3;
}

- (void)setRemoteViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  p_remoteViewController = &self->_remoteViewController;
  remoteViewController = self->_remoteViewController;
  if (remoteViewController != v5)
  {
    if (remoteViewController)
    {
      int v8 = [(UIViewController *)remoteViewController parentViewController];

      if (v8 == self)
      {
        [(UIViewController *)*p_remoteViewController willMoveToParentViewController:0];
        __int16 v9 = [(UIViewController *)*p_remoteViewController view];
        [v9 removeFromSuperview];

        [(UIViewController *)*p_remoteViewController removeFromParentViewController];
      }
    }
    __int16 v10 = ms_defaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = *p_remoteViewController;
      identifier = self->_identifier;
      int v19 = 134218754;
      v20 = self;
      __int16 v21 = 2048;
      v22 = v5;
      __int16 v23 = 2048;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = identifier;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "LiveBubble. %p Setting new remoteViewController: %p, old: %p, messageGUID: %@", (uint8_t *)&v19, 0x2Au);
    }

    objc_storeStrong((id *)&self->_remoteViewController, a3);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = *p_remoteViewController;
      [(UIViewController *)v13 setServiceViewShouldShareTouchesWithHost:1];
      [(UIViewController *)v13 setIntent:1];
    }
    if (*p_remoteViewController)
    {
      v14 = [(_MSRemoteBalloonViewController *)self delegate];
      [v14 remoteBalloonViewControllerWillLoad:self];

      [(_MSRemoteBalloonViewController *)self addChildViewController:*p_remoteViewController];
      v15 = [(UIViewController *)*p_remoteViewController view];
      [v15 setUserInteractionEnabled:1];
      v16 = [(_MSRemoteBalloonViewController *)self view];
      [v16 bounds];
      objc_msgSend(v15, "setFrame:");

      [v15 setAutoresizingMask:18];
      v17 = [(_MSRemoteBalloonViewController *)self view];
      [v17 addSubview:v15];

      [(UIViewController *)*p_remoteViewController didMoveToParentViewController:self];
      id v18 = [(_MSRemoteBalloonViewController *)self delegate];
      [v18 remoteBalloonViewControllerDidLoad:self];
    }
  }
}

- (_MSRemoteBalloonViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (_MSRemoteBalloonViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_conversationState, 0);
  objc_storeStrong((id *)&self->_appContext, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_plugin, 0);

  objc_storeStrong((id *)&self->_extension, 0);
}

@end