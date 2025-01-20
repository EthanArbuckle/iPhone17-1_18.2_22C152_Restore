@interface RPControlCenterModule
- (BOOL)expandsGridSizeClassesForAccessibility;
- (RPControlCenterClient)client;
- (RPControlCenterMenuModuleViewController)currentContentViewController;
- (RPControlCenterModule)init;
- (RPControlCenterModuleBackgroundViewController)currentBackgroundViewController;
- (id)backgroundViewControllerForContext:(id)a3;
- (id)contentViewControllerForContext:(id)a3;
- (void)dealloc;
- (void)setClient:(id)a3;
- (void)setContentModuleContext:(id)a3;
- (void)setCurrentBackgroundViewController:(id)a3;
- (void)setCurrentContentViewController:(id)a3;
@end

@implementation RPControlCenterModule

- (RPControlCenterModule)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPControlCenterModule;
  v2 = [(RPControlCenterModule *)&v6 init];
  if (v2)
  {
    if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446722;
      v8 = "-[RPControlCenterModule init]";
      __int16 v9 = 1024;
      int v10 = 21;
      __int16 v11 = 2048;
      v12 = v2;
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d  %p", buf, 0x1Cu);
    }
    uint64_t v3 = +[RPControlCenterClient sharedInstance];
    client = v2->_client;
    v2->_client = (RPControlCenterClient *)v3;

    [(RPControlCenterClient *)v2->_client setPreferredExtension:0];
  }
  return v2;
}

- (id)contentViewControllerForContext:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446978;
    v8 = "-[RPControlCenterModule contentViewControllerForContext:]";
    __int16 v9 = 1024;
    int v10 = 29;
    __int16 v11 = 2048;
    v12 = self;
    __int16 v13 = 2048;
    id v14 = [v4 environment];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p, presentationContext: %ld", (uint8_t *)&v7, 0x26u);
  }
  v5 = -[RPControlCenterMenuModuleViewController initWithClient:forBroadcastPicker:]([RPControlCenterMenuModuleViewController alloc], "initWithClient:forBroadcastPicker:", self->_client, [v4 environment] == (char *)&dword_0 + 2);
  objc_storeStrong((id *)&self->_currentContentViewController, v5);
  [(RPControlCenterMenuModuleViewController *)self->_currentContentViewController setContentModuleContext:self->_contentModuleContext];

  return v5;
}

- (id)backgroundViewControllerForContext:(id)a3
{
  id v4 = a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136446978;
    __int16 v13 = "-[RPControlCenterModule backgroundViewControllerForContext:]";
    __int16 v14 = 1024;
    int v15 = 47;
    __int16 v16 = 2048;
    v17 = self;
    __int16 v18 = 2048;
    v19 = (RPControlCenterModuleBackgroundViewController *)[v4 environment];
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p, presentationContext: %ld", (uint8_t *)&v12, 0x26u);
  }
  v5 = [[RPControlCenterModuleBackgroundViewController alloc] initWithClient:self->_client];
  [(RPControlCenterModuleBackgroundViewController *)v5 setShowsMicrophoneButton:1];
  [(RPControlCenterModuleBackgroundViewController *)v5 setContentViewController:self->_currentContentViewController];
  if ([v4 environment] == (char *)&dword_0 + 2)
  {
    [(RPControlCenterModuleBackgroundViewController *)v5 setShowsMicrophoneButton:[(RPControlCenterClient *)self->_client shouldShowMicButton]];
    objc_super v6 = [(RPControlCenterModuleBackgroundViewController *)self->_currentBackgroundViewController contentViewController];
    int v7 = v6;
    if (self->_currentBackgroundViewController
      && [(RPControlCenterModule *)v6 isBroadcastPicker])
    {
      if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        currentBackgroundViewController = self->_currentBackgroundViewController;
        int v12 = 136446978;
        __int16 v13 = "-[RPControlCenterModule backgroundViewControllerForContext:]";
        __int16 v14 = 1024;
        int v15 = 61;
        __int16 v16 = 2048;
        v17 = v7;
        __int16 v18 = 2048;
        v19 = currentBackgroundViewController;
        _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d removing view controllers: %p %p", (uint8_t *)&v12, 0x26u);
      }
      [(RPControlCenterClient *)self->_client removeDelegate:v7];
      [(RPControlCenterClient *)self->_client removeDelegate:self->_currentBackgroundViewController];
      __int16 v9 = +[NSNotificationCenter defaultCenter];
      [v9 removeObserver:v7];

      int v10 = +[NSNotificationCenter defaultCenter];
      [v10 removeObserver:self->_currentBackgroundViewController];
    }
  }
  objc_storeStrong((id *)&self->_currentBackgroundViewController, v5);

  return v5;
}

- (void)setContentModuleContext:(id)a3
{
  id v4 = (CCUIContentModuleContext *)a3;
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136446722;
    int v7 = "-[RPControlCenterModule setContentModuleContext:]";
    __int16 v8 = 1024;
    int v9 = 76;
    __int16 v10 = 2048;
    __int16 v11 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", (uint8_t *)&v6, 0x1Cu);
  }
  contentModuleContext = self->_contentModuleContext;
  self->_contentModuleContext = v4;
}

- (BOOL)expandsGridSizeClassesForAccessibility
{
  return 1;
}

- (void)dealloc
{
  if (__RPLogLevel <= 1u && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    int v7 = "-[RPControlCenterModule dealloc]";
    __int16 v8 = 1024;
    int v9 = 85;
    __int16 v10 = 2048;
    __int16 v11 = self;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d  %p", buf, 0x1Cu);
  }
  client = self->_client;
  self->_client = 0;

  contentModuleContext = self->_contentModuleContext;
  self->_contentModuleContext = 0;

  v5.receiver = self;
  v5.super_class = (Class)RPControlCenterModule;
  [(RPControlCenterModule *)&v5 dealloc];
}

- (RPControlCenterClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (RPControlCenterMenuModuleViewController)currentContentViewController
{
  return self->_currentContentViewController;
}

- (void)setCurrentContentViewController:(id)a3
{
}

- (RPControlCenterModuleBackgroundViewController)currentBackgroundViewController
{
  return self->_currentBackgroundViewController;
}

- (void)setCurrentBackgroundViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentBackgroundViewController, 0);
  objc_storeStrong((id *)&self->_currentContentViewController, 0);
  objc_storeStrong((id *)&self->_client, 0);

  objc_storeStrong((id *)&self->_contentModuleContext, 0);
}

@end