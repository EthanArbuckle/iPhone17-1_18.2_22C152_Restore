@interface SSSViewControllerManager
- (BOOL)shouldAnimateDragCancel;
- (SSSDittoRootViewController)rootViewController;
- (SSSViewControllerManager)init;
- (void)_actuallyMoveFromRemoteViewControllerToRemoteAlertViewController;
- (void)_cleanupForDeadAlertHandle;
- (void)_moveDittoRootViewControllerFromViewController:(id)a3 toViewController:(id)a4;
- (void)_observeRemoteAlertViewControllerNotification:(id)a3;
- (void)_observeRemoteViewControllerNotification:(id)a3;
- (void)_prepareRootViewControllerIfNecessary;
- (void)dealloc;
- (void)dismissScreenshots;
- (void)dittoRemoteAlertViewControllerViewWillAppear:(id)a3;
- (void)moveFromRemoteAlertViewControllerToRemoteViewController;
- (void)moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:(id)a3;
- (void)preheatWithPresentationMode:(unint64_t)a3;
- (void)receiveEnvironmentDescription:(id)a3 completion:(id)a4;
- (void)registerRemoteAlertViewController:(id)a3;
- (void)registerRemoteViewController:(id)a3;
- (void)remoteAlertHandleProvider:(id)a3 didInvalidateWithError:(id)a4;
- (void)remoteAlertHandleProviderDidDeactivate:(id)a3;
- (void)screenshotsDismissed;
- (void)unregisterRemoteAlertViewController:(id)a3;
- (void)unregisterRemoteViewController:(id)a3;
@end

@implementation SSSViewControllerManager

- (SSSViewControllerManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)SSSViewControllerManager;
  v2 = [(SSSViewControllerManager *)&v13 init];
  uint64_t v3 = +[NSMutableSet set];
  receivedSessionIdentifiers = v2->_receivedSessionIdentifiers;
  v2->_receivedSessionIdentifiers = (NSMutableSet *)v3;

  uint64_t v5 = +[NSMutableArray array];
  pendingScreenshotRecordsForRootViewController = v2->_pendingScreenshotRecordsForRootViewController;
  v2->_pendingScreenshotRecordsForRootViewController = (NSMutableArray *)v5;

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 addObserver:v2 selector:"_observeRemoteViewControllerNotification:" name:@"SSSDittoRemoteViewControllerIsReadyForViewControllerManagerNotificationName" object:0];

  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:v2 selector:"_observeRemoteAlertViewControllerNotification:" name:@"SSSDittoRemoteAlertViewControllerIsReadyForViewControllerManagerNotificationName" object:0];

  v9 = (SSRemoteAlertHandleProvider *)objc_alloc_init((Class)SSRemoteAlertHandleProvider);
  remoteAlertHandleProvider = v2->_remoteAlertHandleProvider;
  v2->_remoteAlertHandleProvider = v9;

  [(SSRemoteAlertHandleProvider *)v2->_remoteAlertHandleProvider setDelegate:v2];
  [(SSSViewControllerManager *)v2 _prepareRootViewControllerIfNecessary];
  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:v2 selector:"_screenshotManagerHasNoScreenshotsBeingTracked:" name:@"SSSScreenshotManagerStoppedTrackingScreenshots" object:0];

  return v2;
}

- (void)dealloc
{
  uint64_t v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SSSViewControllerManager;
  [(SSSViewControllerManager *)&v4 dealloc];
}

- (void)_prepareRootViewControllerIfNecessary
{
  if (!self->_rootViewController)
  {
    uint64_t v3 = objc_alloc_init(SSSDittoRootViewController);
    rootViewController = self->_rootViewController;
    self->_rootViewController = v3;

    uint64_t v5 = self->_rootViewController;
    [(SSSDittoRootViewController *)v5 setViewControllerManager:self];
  }
}

- (void)preheatWithPresentationMode:(unint64_t)a3
{
}

- (SSSDittoRootViewController)rootViewController
{
  return self->_rootViewController;
}

- (void)receiveEnvironmentDescription:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SSSViewControllerManager *)self _prepareRootViewControllerIfNecessary];
  v8 = [v6 loggableDescription];
  v9 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v17 = 138412290;
    v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Service received environment description %@", (uint8_t *)&v17, 0xCu);
  }

  v10 = [v6 sessionIdentifier];
  if (([(NSMutableSet *)self->_receivedSessionIdentifiers containsObject:v10] & 1) == 0)
  {
    [(NSMutableSet *)self->_receivedSessionIdentifiers addObject:v10];
    if (([v6 skipShutterSound] & 1) == 0) {
      +[SSScreenCapturer playScreenshotSound];
    }
  }
  v11 = +[SSSScreenshotManager sharedScreenshotManager];
  v12 = [v11 createScreenshotWithEnvironmentDescription:v6];

  if ([v12 saveLocation] == (id)3)
  {
    [v12 insertIntoQuickNoteWithCompletion:v7];
  }
  else
  {
    objc_super v13 = [(SSSDittoRootViewController *)self->_rootViewController hostingViewController];

    if (v13)
    {
      [(SSSDittoRootViewController *)self->_rootViewController screenshotReceived:v12 completion:v7];
    }
    else
    {
      v14 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        v18 = v8;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "No hosting view controller to deliver environment description, waiting for remote view controller to deliver %@", (uint8_t *)&v17, 0xCu);
      }

      v15 = [[SSSPendingScreenshotRecord alloc] initWithScreenshot:v12 deliveryCompletionBlock:v7];
      [(NSMutableArray *)self->_pendingScreenshotRecordsForRootViewController addObject:v15];
      if (self->_remoteViewController)
      {
        v16 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_10005F574(v16);
        }

        exit(0);
      }
    }
  }
}

- (void)_observeRemoteViewControllerNotification:(id)a3
{
  id v4 = [a3 object];
  [(SSSViewControllerManager *)self registerRemoteViewController:v4];
}

- (void)_observeRemoteAlertViewControllerNotification:(id)a3
{
  id v4 = [a3 object];
  [(SSSViewControllerManager *)self registerRemoteAlertViewController:v4];
}

- (void)_cleanupForDeadAlertHandle
{
}

- (void)remoteAlertHandleProviderDidDeactivate:(id)a3
{
  id v6 = a3;
  id v4 = [(SSSDittoRootViewController *)self->_rootViewController hostingViewController];
  remoteAlertViewController = self->_remoteAlertViewController;

  if (v4 == remoteAlertViewController) {
    [(SSSViewControllerManager *)self dismissScreenshots];
  }
  [v6 invalidate];
}

- (void)remoteAlertHandleProvider:(id)a3 didInvalidateWithError:(id)a4
{
}

- (void)registerRemoteViewController:(id)a3
{
  uint64_t v5 = (SSSDittoRemoteViewController *)a3;
  id v6 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    remoteViewController = self->_remoteViewController;
    *(_DWORD *)buf = 138412546;
    v22 = remoteViewController;
    __int16 v23 = 2112;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Registered new remote view controller old: %@ new: %@", buf, 0x16u);
  }

  if (self->_remoteViewController != v5)
  {
    objc_storeStrong((id *)&self->_remoteViewController, a3);
    [(SSSDittoRemoteViewController *)self->_remoteViewController setViewControllerManager:self];
    [(SSSViewControllerManager *)self _moveDittoRootViewControllerFromViewController:0 toViewController:v5];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = self->_pendingScreenshotRecordsForRootViewController;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_super v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v14 = [v13 screenshot];
          v15 = [v13 deliveryCompletionBlock];
          [(SSSDittoRootViewController *)self->_rootViewController screenshotReceived:v14 completion:v15];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    [(NSMutableArray *)self->_pendingScreenshotRecordsForRootViewController removeAllObjects];
  }
}

- (void)unregisterRemoteViewController:(id)a3
{
  id v4 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unregistered remote view controller", v6, 2u);
  }

  [(SSRemoteAlertHandleProvider *)self->_remoteAlertHandleProvider invalidate];
  [(SSSDittoRemoteViewController *)self->_remoteViewController setViewControllerManager:0];
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;
}

- (void)registerRemoteAlertViewController:(id)a3
{
  id v4 = (SSSDittoRemoteAlertViewController *)a3;
  uint64_t v5 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Registered new remote alert view controller", v8, 2u);
  }

  remoteAlertViewController = self->_remoteAlertViewController;
  self->_remoteAlertViewController = v4;
  id v7 = v4;

  [(SSSDittoRemoteAlertViewController *)self->_remoteAlertViewController setViewControllerManager:self];
  [(SSSDittoRemoteAlertViewController *)self->_remoteAlertViewController setDittoRemoteAlertDelegate:self];
}

- (void)unregisterRemoteAlertViewController:(id)a3
{
  id v4 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Unregistered remote alert view controller", v6, 2u);
  }

  [(SSSDittoRemoteAlertViewController *)self->_remoteAlertViewController setViewControllerManager:0];
  [(SSSDittoRemoteAlertViewController *)self->_remoteAlertViewController setDittoRemoteAlertDelegate:0];
  remoteAlertViewController = self->_remoteAlertViewController;
  self->_remoteAlertViewController = 0;
}

- (void)_moveDittoRootViewControllerFromViewController:(id)a3 toViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SSSViewControllerManager *)self _prepareRootViewControllerIfNecessary];
  if (v7)
  {
    [v6 cleanupRootViewController];
    [v7 becomeParentOfDittoRootViewController:self->_rootViewController];
  }
  else
  {
    v8 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Moving to a nil view controller", v9, 2u);
    }

    [v6 stopBeingParentOfDittoRootViewController:self->_rootViewController];
    [v6 cleanupRootViewController];
  }
  [(SSSDittoRootViewController *)self->_rootViewController setHostingViewController:v7];
}

- (void)_actuallyMoveFromRemoteViewControllerToRemoteAlertViewController
{
  uint64_t v3 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Moving from remote view controller to remote alert view controller", v4, 2u);
  }

  [(SSSViewControllerManager *)self _moveDittoRootViewControllerFromViewController:self->_remoteViewController toViewController:self->_remoteAlertViewController];
  [(SSSDittoRemoteViewController *)self->_remoteViewController setWillSoonUnparentChildDittoRootViewController:0];
}

- (void)moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:(id)a3
{
  id v4 = [a3 copy];
  id changeBlockForWhenAlertWillAppear = self->_changeBlockForWhenAlertWillAppear;
  self->_id changeBlockForWhenAlertWillAppear = v4;

  [(SSSDittoRemoteViewController *)self->_remoteViewController setWillSoonUnparentChildDittoRootViewController:1];
  remoteAlertHandleProvider = self->_remoteAlertHandleProvider;

  [(SSRemoteAlertHandleProvider *)remoteAlertHandleProvider activate];
}

- (void)moveFromRemoteAlertViewControllerToRemoteViewController
{
  uint64_t v3 = os_log_create("com.apple.screenshotservices", "ViewControllerManager");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Moving from remote alert view controller to remote view controller", v4, 2u);
  }

  [(SSSViewControllerManager *)self _moveDittoRootViewControllerFromViewController:self->_remoteAlertViewController toViewController:self->_remoteViewController];
  [(SSRemoteAlertHandleProvider *)self->_remoteAlertHandleProvider invalidate];
  [(SSRemoteAlertHandleProvider *)self->_remoteAlertHandleProvider prepare];
}

- (void)dismissScreenshots
{
  uint64_t v3 = os_log_create("com.apple.screenshotservices", "XPC");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Service asked to dismiss screenshots from the host", buf, 2u);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002D764;
  v4[3] = &unk_100099A20;
  v4[4] = self;
  +[UIView performWithoutAnimation:v4];
  [(SSRemoteAlertHandleProvider *)self->_remoteAlertHandleProvider invalidate];
}

- (void)screenshotsDismissed
{
  uint64_t v3 = [(SSSDittoRootViewController *)self->_rootViewController hostingViewController];
  [(SSSViewControllerManager *)self _moveDittoRootViewControllerFromViewController:v3 toViewController:0];

  rootViewController = self->_rootViewController;
  self->_rootViewController = 0;

  [(SSSDittoRemoteViewController *)self->_remoteViewController informHostThatScreenshotsHaveDismissed];
  [(SSRemoteAlertHandleProvider *)self->_remoteAlertHandleProvider invalidate];

  [(SSSViewControllerManager *)self unregisterRemoteViewController:0];
}

- (BOOL)shouldAnimateDragCancel
{
  return [(SSSDittoRootViewController *)self->_rootViewController shouldAnimateDragCancel];
}

- (void)dittoRemoteAlertViewControllerViewWillAppear:(id)a3
{
  if (self->_changeBlockForWhenAlertWillAppear)
  {
    [(SSSViewControllerManager *)self _actuallyMoveFromRemoteViewControllerToRemoteAlertViewController];
    (*((void (**)(void))self->_changeBlockForWhenAlertWillAppear + 2))();
    id changeBlockForWhenAlertWillAppear = self->_changeBlockForWhenAlertWillAppear;
    self->_id changeBlockForWhenAlertWillAppear = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAlertViewController, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong(&self->_changeBlockForWhenAlertWillAppear, 0);
  objc_storeStrong((id *)&self->_remoteAlertHandleProvider, 0);
  objc_storeStrong((id *)&self->_pendingScreenshotRecordsForRootViewController, 0);
  objc_storeStrong((id *)&self->_receivedSessionIdentifiers, 0);

  objc_storeStrong((id *)&self->_rootViewController, 0);
}

@end