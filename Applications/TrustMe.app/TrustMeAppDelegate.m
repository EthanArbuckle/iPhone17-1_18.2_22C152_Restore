@interface TrustMeAppDelegate
- (TrustMeRotatingViewController)currentRemoteAlertController;
- (id)trustControllerToBePresentedByRemoteAlertViewController;
- (void)_clearTimer;
- (void)_dismissRemoteAlertController;
- (void)_killTimerFired;
- (void)_presentNextQueuedMessage;
- (void)_presentRemoteAlertWithInfo:(id)a3 replyContext:(id)a4;
- (void)_queueMessage:(id)a3 withReplyContext:(id)a4;
- (void)_scheduleTimer;
- (void)_sendResponse:(int)a3;
- (void)_sheetControllerDidFinishDismissing;
- (void)_startCenter;
- (void)_trustInfoMessageReceived:(id)a3 userInfo:(id)a4 auditToken:(id *)a5;
- (void)application:(id)a3 didFinishLaunchingSuspendedWithOptions:(id)a4;
- (void)applicationWillTerminate:(id)a3;
- (void)dealloc;
- (void)homeButtonWasPressed;
- (void)remoteAlertHandleDidDeactivate:(id)a3;
- (void)setCurrentRemoteAlertController:(id)a3;
- (void)trustCertificateViewController:(id)a3 finishedWithReturnCode:(int)a4;
@end

@implementation TrustMeAppDelegate

- (void)dealloc
{
  v5 = self;
  SEL v4 = a2;
  v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v5];

  [(CPDistributedMessagingCenter *)v5->_center unregisterForMessageName:0];
  [(NSTimer *)v5->_killTimer invalidate];
  v3.receiver = v5;
  v3.super_class = (Class)TrustMeAppDelegate;
  [(TrustMeAppDelegate *)&v3 dealloc];
}

- (void)_scheduleTimer
{
  v2 = +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_killTimerFired", 0, 0, 5.0, a2);
  killTimer = self->_killTimer;
  self->_killTimer = v2;
}

- (void)_clearTimer
{
}

- (void)_killTimerFired
{
  v7 = self;
  location[1] = (id)a2;
  location[0] = *((id *)&_CertUILogObjects + 2);
  char v5 = 16;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
  {
    log = location[0];
    os_log_type_t type = v5;
    sub_100003E84(v4);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Kill timer fired", v4, 2u);
  }
  objc_storeStrong(location, 0);
  [(TrustMeAppDelegate *)v7 _clearTimer];
  exit(0);
}

- (void)_sendResponse:(int)a3
{
  v11 = self;
  SEL v10 = a2;
  unsigned int v9 = a3;
  id v4 = objc_alloc((Class)NSDictionary);
  id v5 = +[NSNumber numberWithInt:v9];
  id v7 = 0;
  id v3 = [v4 initWithObjectsAndKeys:kCertUITrustResponseKey, 0];
  location = &v8;
  id v8 = v3;

  [(CPDistributedMessagingCenter *)v11->_center sendDelayedReply:v11->_replyContext dictionary:v8];
  objc_storeStrong(location, v7);
}

- (void)_presentRemoteAlertWithInfo:(id)a3 replyContext:(id)a4
{
  v35 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v33 = 0;
  objc_storeStrong(&v33, a4);
  id v32 = _CertUILogObjects[2];
  char v31 = 1;
  if (os_log_type_enabled((os_log_t)v32, OS_LOG_TYPE_INFO))
  {
    log = v32;
    os_log_type_t type = v31;
    sub_100003E84(v30);
    _os_log_impl((void *)&_mh_execute_header, log, type, "Presenting remote alert", v30, 2u);
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong((id *)&v35->_replyContext, v33);
  id v29 = [location[0] objectForKey:kCertUITrustTitleKey];
  id v28 = [location[0] objectForKey:kCertUITrustIssuerKey];
  id v27 = [location[0] objectForKey:kCertUITrustPurposeKey];
  id v26 = [location[0] objectForKey:kCertUITrustExpirationKey];
  id v12 = [location[0] objectForKey:kCertUITrustIsRootCertificateKey];
  unsigned __int8 v13 = [v12 BOOLValue];

  char v25 = v13 & 1;
  id v24 = [location[0] objectForKey:kCertUITrustPropertiesKey];
  id v14 = +[MCProfileConnection sharedConnection];
  BOOL v15 = [v14 effectiveBoolValueForSetting:MCFeatureUntrustedTLSPromptAllowed] != 2;

  char v23 = v15;
  id v22 = [location[0] objectForKey:kCertUITrustAllowCertificateTrustKey];
  if (v22)
  {
    unsigned __int8 v11 = 0;
    if (v23) {
      unsigned __int8 v11 = [v22 BOOLValue];
    }
    char v23 = v11 & 1;
  }
  id v4 = objc_alloc((Class)TrustCertificateViewController);
  id v21 = [v4 initWithTrustCertificateDelegate:v35 allowTrust:v23 & 1];
  LODWORD(v7) = 2;
  [v21 setCertificateInfo:v29 issuer:v28 purpose:v27 expiration:v26 isRoot:v25 & 1 properties:v24 action:v7];
  objc_storeStrong((id *)&v35->_trustController, v21);
  id v8 = objc_alloc((Class)SBSRemoteAlertDefinition);
  SEL v10 = +[NSBundle mainBundle];
  unsigned int v9 = [(NSBundle *)v10 bundleIdentifier];
  id v20 = [v8 initWithServiceName:viewControllerClassName:];

  id v5 = (SBSRemoteAlertHandle *)+[SBSRemoteAlertHandle newHandleWithDefinition:configurationContext:](SBSRemoteAlertHandle, "newHandleWithDefinition:configurationContext:", v20);
  alertHandle = v35->_alertHandle;
  v35->_alertHandle = v5;

  [(SBSRemoteAlertHandle *)v35->_alertHandle addObserver:v35];
  id v19 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  [v19 setReason:@"CertificateTrustApp"];
  [(SBSRemoteAlertHandle *)v35->_alertHandle activateWithContext:v19];
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(&v26, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(location, 0);
}

- (void)_dismissRemoteAlertController
{
  if (self->_trustController)
  {
    self->_remoteAlertControllerIsDismissing = 1;
    v2 = [(TrustMeAppDelegate *)self currentRemoteAlertController];
    [(TrustMeRotatingViewController *)v2 dismissSheetAndDismissAlert];

    objc_storeStrong((id *)&self->_trustController, 0);
  }
}

- (void)_sheetControllerDidFinishDismissing
{
  if (self->_remoteAlertControllerIsDismissing)
  {
    self->_remoteAlertControllerIsDismissing = 0;
    if ([(NSMutableArray *)self->_queuedMessages count]) {
      [(TrustMeAppDelegate *)self _presentNextQueuedMessage];
    }
    else {
      [(TrustMeAppDelegate *)self _scheduleTimer];
    }
  }
}

- (void)trustCertificateViewController:(id)a3 finishedWithReturnCode:(int)a4
{
  uint64_t v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unsigned int v5 = 0;
  if (a4 == 1) {
    unsigned int v5 = 2;
  }
  [(TrustMeAppDelegate *)v7 _sendResponse:v5];
  objc_storeStrong((id *)&v7->_replyContext, 0);
  [(TrustMeAppDelegate *)v7 _dismissRemoteAlertController];
  objc_storeStrong(location, 0);
}

- (void)_presentNextQueuedMessage
{
  id v4 = self;
  v3[1] = (id)a2;
  v3[0] = -[NSMutableArray objectAtIndex:](self->_queuedMessages, "objectAtIndex:");
  [(NSMutableArray *)v4->_queuedMessages removeObjectAtIndex:0];
  id v2 = [(NSMutableArray *)v4->_queuedReplyContexts objectAtIndex:0];
  [(NSMutableArray *)v4->_queuedReplyContexts removeObjectAtIndex:0];
  [(TrustMeAppDelegate *)v4 _presentRemoteAlertWithInfo:v3[0] replyContext:v2];
  objc_storeStrong(&v2, 0);
  objc_storeStrong(v3, 0);
}

- (void)_queueMessage:(id)a3 withReplyContext:(id)a4
{
  unsigned __int8 v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = 0;
  objc_storeStrong(&v9, a4);
  if (!v11->_queuedMessages)
  {
    id v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedMessages = v11->_queuedMessages;
    v11->_queuedMessages = v4;
  }
  if (v11->_queuedReplyContexts)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    queuedReplyContexts = v11->_queuedReplyContexts;
    v11->_queuedReplyContexts = v6;
  }
  [(NSMutableArray *)v11->_queuedMessages addObject:location[0]];
  [(NSMutableArray *)v11->_queuedReplyContexts addObject:v9];
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_trustInfoMessageReceived:(id)a3 userInfo:(id)a4 auditToken:(id *)a5
{
  BOOL v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  v12[1] = a5;
  v12[0] = _CertUILogObjects[2];
  os_log_type_t v11 = OS_LOG_TYPE_INFO;
  if (os_log_type_enabled((os_log_t)v12[0], OS_LOG_TYPE_INFO))
  {
    sub_100004A38((uint64_t)v17, (uint64_t)location[0]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v12[0], v11, "Got message %@", v17, 0xCu);
  }
  objc_storeStrong(v12, 0);
  if ([location[0] isEqualToString:kCertUIPresentTrustInfoMessage])
  {
    [(TrustMeAppDelegate *)v15 _clearTimer];
    id v7 = [(CPDistributedMessagingCenter *)v15->_center delayReply];
    if (v15->_trustController) {
      [(TrustMeAppDelegate *)v15 _queueMessage:v13 withReplyContext:v7];
    }
    else {
      [(TrustMeAppDelegate *)v15 _presentRemoteAlertWithInfo:v13 replyContext:v7];
    }
    objc_storeStrong(&v7, 0);
    int v8 = 0;
  }
  else
  {
    os_log_t oslog = (os_log_t)_CertUILogObjects[2];
    os_log_type_t v9 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      sub_100004A38((uint64_t)v16, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Ignoring message %@", v16, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v8 = 1;
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)_startCenter
{
  id v2 = (CPDistributedMessagingCenter *)+[CPDistributedMessagingCenter centerNamed:kCertUIMessagingCenterActualName];
  center = self->_center;
  self->_center = v2;

  [(CPDistributedMessagingCenter *)self->_center registerForMessageName:kCertUIPresentTrustInfoMessage target:self selector:"_trustInfoMessageReceived:userInfo:auditToken:"];
  [(CPDistributedMessagingCenter *)self->_center runServerOnCurrentThread];
}

- (void)remoteAlertHandleDidDeactivate:(id)a3
{
  unsigned int v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)_CertUILogObjects[2];
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100004C3C((uint64_t)v6, v5->_trustController != 0);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Alert deactivated while there was a trust controller already :%{BOOL}d", v6, 8u);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v5->_trustController) {
    exit(0);
  }
  objc_storeStrong(location, 0);
}

- (void)homeButtonWasPressed
{
}

- (id)trustControllerToBePresentedByRemoteAlertViewController
{
  return self->_trustController;
}

- (void)applicationWillTerminate:(id)a3
{
  id v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPDistributedMessagingCenter *)v4->_center unregisterForMessageName:0];
  objc_storeStrong((id *)&v4->_center, 0);
  [(TrustMeAppDelegate *)v4 _dismissRemoteAlertController];
  objc_storeStrong(location, 0);
}

- (void)application:(id)a3 didFinishLaunchingSuspendedWithOptions:(id)a4
{
  int v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v5 addObserver:v8 selector:"_sheetControllerDidFinishDismissing" name:kCertificateViewControllerDismissedNotification object:0];

  [(TrustMeAppDelegate *)v8 _startCenter];
  [(TrustMeAppDelegate *)v8 _scheduleTimer];
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
}

- (TrustMeRotatingViewController)currentRemoteAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentRemoteAlertController);

  return (TrustMeRotatingViewController *)WeakRetained;
}

- (void)setCurrentRemoteAlertController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end