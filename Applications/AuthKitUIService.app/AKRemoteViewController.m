@interface AKRemoteViewController
- (NSXPCConnection)lookupConnection;
- (id)remoteObjectInterface;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_invalidateLookupConnection;
- (void)_main_dismissAndExit;
- (void)dealloc;
- (void)dismissAndExit;
- (void)endUIService;
- (void)handleButtonActions:(id)a3;
- (void)setLookupConnection:(id)a3;
- (void)setUpHostProxy;
- (void)setUpLookupConnection:(id)a3;
- (void)setupRemoteProxy;
@end

@implementation AKRemoteViewController

- (void)dealloc
{
  [(AKRemoteViewController *)self _invalidateLookupConnection];
  v3.receiver = self;
  v3.super_class = (Class)AKRemoteViewController;
  [(AKRemoteViewController *)&v3 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = +[UIDevice currentDevice];
  id v3 = [v2 userInterfaceIdiom];

  if (v3 == (id)1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (void)setUpHostProxy
{
  v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10000642C(v2);
  }
}

- (void)setUpLookupConnection:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100006470(v5);
  }

  v6 = objc_opt_new();
  [v6 _setEndpoint:v4];

  id v7 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v6];
  v8 = [(AKRemoteViewController *)self remoteObjectInterface];
  [v7 setRemoteObjectInterface:v8];

  [v7 resume];
  [(AKRemoteViewController *)self setLookupConnection:v7];
  [(AKRemoteViewController *)self setUpHostProxy];
}

- (id)remoteObjectInterface
{
  return +[AKAuthorizationPresenterHostInterface XPCInterface];
}

- (void)setupRemoteProxy
{
  id v2 = [(AKRemoteViewController *)self _remoteViewControllerProxy];
  [v2 setShouldDisableFadeInAnimation:1];
  [v2 setAllowsMenuButtonDismissal:1];
  [v2 setAllowsSiri:0];
  [v2 setAllowsAlertStacking:1];
  [v2 setDesiredHardwareButtonEvents:17];
  [v2 setSwipeDismissalStyle:0];
  [v2 setDismissalAnimationStyle:1];
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        unint64_t v10 = (unint64_t)[v9 events] & 0x10;
        if (v10 & 0xFFFFFFFFFFFFFFFELL | (unint64_t)[v9 events] & 1
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          [(AKRemoteViewController *)self handleCancellation:v4];
        }
        [v9 sendResponseWithUnHandledEvents:[v9 events] ^ v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_invalidateLookupConnection
{
  [(NSXPCConnection *)self->_lookupConnection invalidate];
  lookupConnection = self->_lookupConnection;
  self->_lookupConnection = 0;
}

- (void)dismissAndExit
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003424;
  block[3] = &unk_10000C398;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)endUIService
{
  id v2 = [(AKRemoteViewController *)self _remoteViewControllerProxy];
  [v2 invalidate];
}

- (void)_main_dismissAndExit
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  [(AKRemoteViewController *)self dismissViewControllerAnimated:0 completion:0];

  [(AKRemoteViewController *)self endUIService];
}

- (NSXPCConnection)lookupConnection
{
  return self->_lookupConnection;
}

- (void)setLookupConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end