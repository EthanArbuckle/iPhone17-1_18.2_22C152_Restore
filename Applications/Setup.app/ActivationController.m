@interface ActivationController
+ (id)cloudConfigSkipKey;
+ (unint64_t)applicableDispositions;
- (ActivationController)init;
- (BOOL)cdmaSelectionActivation;
- (BOOL)controllerNeedsToRun;
- (BOOL)isEphemeral;
- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5;
- (BOOL)shouldSuppressExtendedInitializationActivityIndicator;
- (BYAnalyticsManager)analyticsManager;
- (BuddyActivationState)activationState;
- (BuddyMiscState)miscState;
- (BuddyNetworkProvider)networkProvider;
- (BuddySystemTimeUpdateManager)systemTimeUpdateManager;
- (MCProfileConnection)managedConfiguration;
- (NSString)contentType;
- (NSURL)activationURL;
- (NSURL)agreeURL;
- (NSURL)disagreeURL;
- (void)_activate;
- (void)_activateIfNecessary;
- (void)_activateWithPasscode:(id)a3 fromObjectModel:(id)a4;
- (void)_addAnalyticsEventWithSuccess:(BOOL)a3;
- (void)_attemptDismiss;
- (void)_checkActivationFailIfNotActivated:(BOOL)a3;
- (void)_checkActivationFailIfNotActivated:(BOOL)a3 isActivated:(BOOL)a4;
- (void)_checkBasebandStatusBeforeActivation;
- (void)_cleanup;
- (void)_clearDisplayTimer;
- (void)_clearTicketAcceptedTimer;
- (void)_clearWaitingForBasebandTimer;
- (void)_dismissRemoteUI;
- (void)_displayTimerTimeout;
- (void)_enterState:(int)a3;
- (void)_getSRPInitNonceRequestOptionsCompletion:(id)a3;
- (void)_handleActivationData:(id)a3 responseHeaders:(id)a4 baseURL:(id)a5;
- (void)_handleEscrowResponse:(id)a3;
- (void)_handleFailureWithError:(id)a3;
- (void)_handlePlanAddition:(id)a3;
- (void)_releaseOTAAssertion;
- (void)_removeViewControllersIncludingSelf:(BOOL)a3;
- (void)_restorePasteboard;
- (void)_sanitizeSystemTime;
- (void)_setHandlerForPasscode;
- (void)_startActivation;
- (void)_startActivationLockExpirationTimerForPage:(id)a3;
- (void)_stashPasteboard;
- (void)_stopActivationLockExpirationTimer;
- (void)_systemTimeUpdated;
- (void)_ticketAcceptedDidTimeout;
- (void)_tryActivateWithOptions:(id)a3 requestMutator:(id)a4;
- (void)_userAgreedToTCs:(BOOL)a3;
- (void)_waitingForBasebandTimeout;
- (void)_writeAcknowledgment;
- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4;
- (void)agreeToRemoteUIDialog;
- (void)back:(id)a3;
- (void)dealloc;
- (void)didBecomeActive:(id)a3;
- (void)didResignActive:(id)a3;
- (void)disagreeToRemoteUIDialog;
- (void)loadView;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)restart;
- (void)setActivationState:(id)a3;
- (void)setActivationURL:(id)a3;
- (void)setAgreeURL:(id)a3;
- (void)setAnalyticsManager:(id)a3;
- (void)setContentType:(id)a3;
- (void)setDisagreeURL:(id)a3;
- (void)setManagedConfiguration:(id)a3;
- (void)setMiscState:(id)a3;
- (void)setNetworkProvider:(id)a3;
- (void)setSystemTimeUpdateManager:(id)a3;
- (void)startOver;
- (void)startRequest:(id)a3 completion:(id)a4;
- (void)startSpinningWithIdentifier:(id)a3;
- (void)stopSpinningForIdentifier:(id)a3;
- (void)tryAgainOnRemoteUIDialog;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation ActivationController

- (BOOL)controllerNeedsToRun
{
  v10 = self;
  location[1] = (id)a2;
  id v2 = +[BYPreferencesController buddyPreferencesInternal];
  unsigned __int8 v3 = [v2 BOOLForKey:@"networkAlwaysSupportActivation"];

  if (v3)
  {
    char v11 = 1;
  }
  else
  {
    location[0] = +[BuddyActivationConfiguration currentConfiguration];
    char v8 = [location[0] isActivated] & 1;
    char v6 = 0;
    unsigned __int8 v4 = 0;
    if (!v8)
    {
      v7 = [(ActivationController *)v10 miscState];
      char v6 = 1;
      unsigned __int8 v4 = [(BuddyMiscState *)v7 userSelectedTetheredActivation];
    }
    if (v6) {

    }
    if (v4) {
      char v11 = 0;
    }
    else {
      char v11 = (v8 ^ 1) & 1;
    }
    objc_storeStrong(location, 0);
  }
  return v11 & 1;
}

+ (id)cloudConfigSkipKey
{
  return 0;
}

+ (unint64_t)applicableDispositions
{
  return 14;
}

- (void)_releaseOTAAssertion
{
  v7 = self;
  oslog[1] = (os_log_t)a2;
  if (self->_otaAssertion)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v2 = oslog[0];
      os_log_type_t v3 = v5;
      sub_10004B24C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: releasing OTA assertion", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    CFRelease(v7->_otaAssertion);
    v7->_otaAssertion = 0;
  }
}

- (void)restart
{
  self->_state = 0;
  id v2 = [(ActivationController *)self navigationController];
  id v3 = [v2 popToViewController:self animated:1];
}

- (void)_removeViewControllersIncludingSelf:(BOOL)a3
{
  v9 = self;
  SEL v8 = a2;
  BOOL v7 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  if (v7) {
    [v6 addObject:v9];
  }
  id v3 = v6;
  id v4 = [(RemoteUIController *)v9->_remoteUIController displayedPages];
  [v3 addObjectsFromArray:v4];

  id v5 = [(ActivationController *)v9 delegate];
  [v5 removeViewControllersOnNextPush:v6];

  objc_storeStrong((id *)&v9->_remoteUIController, 0);
  objc_storeStrong(&v6, 0);
}

- (void)_attemptDismiss
{
  v12 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    if (v12->_displayTimerElapsed) {
      CFStringRef v2 = @"YASE";
    }
    else {
      CFStringRef v2 = @"NERP";
    }
    sub_10006E000((uint64_t)buf, v12->_state, (uint64_t)v2);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], v10, "Buddy Activate: Attempt dismiss. State = %i, _displayTimerElapsed = %@", buf, 0x12u);
  }
  objc_storeStrong((id *)oslog, 0);
  if (v12->_displayTimerElapsed)
  {
    if (v12->_state != 3 || v12->_activationControllerDismissed)
    {
      if (v12->_state == 5)
      {
        [(ActivationController *)v12 _addAnalyticsEventWithSuccess:0];
        id v4 = [(ActivationController *)v12 navigationController];
        id location = [v4 viewControllers];

        if ([location containsObject:v12])
        {
          id v5 = [BuddyActivationError alloc];
          id v6 = [(BuddyActivationError *)v5 initWithConnectionFailure:v12->_connectionFailed cellular:v12->_connectionOTA];
          BOOL v7 = [(ActivationController *)v12 activationState];
          [(BuddyActivationState *)v7 setError:v6];

          [(ActivationController *)v12 _removeViewControllersIncludingSelf:0];
          [(ActivationController *)v12 _releaseOTAAssertion];
          id v8 = [(ActivationController *)v12 delegate];
          [v8 flowItemDone:v12];
        }
        objc_storeStrong(&location, 0);
      }
    }
    else
    {
      [(ActivationController *)v12 _stopActivationLockExpirationTimer];
      [(ActivationController *)v12 _clearDisplayTimer];
      [(ActivationController *)v12 _clearTicketAcceptedTimer];
      [(ActivationController *)v12 _releaseOTAAssertion];
      [(ActivationController *)v12 _writeAcknowledgment];
      [(ActivationController *)v12 _addAnalyticsEventWithSuccess:1];
      [(ActivationController *)v12 _removeViewControllersIncludingSelf:1];
      [(ActivationController *)v12 _restorePasteboard];
      id v3 = [(ActivationController *)v12 delegate];
      [v3 flowItemDone:v12];

      v12->_activationControllerDismissed = 1;
    }
  }
}

- (void)_enterState:(int)a3
{
  v47 = self;
  SEL v46 = a2;
  int v45 = a3;
  self->_state = a3;
  switch(v45)
  {
    case 0:
      id location = (id)_BYLoggingFacility();
      os_log_type_t v43 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
      {
        id v3 = location;
        os_log_type_t v4 = v43;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Buddy Activate: Enter state Idle", buf, 2u);
      }
      objc_storeStrong(&location, 0);
      break;
    case 1:
      id v41 = (id)_BYLoggingFacility();
      os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v41, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = v41;
        os_log_type_t v6 = v40;
        sub_10004B24C(v39);
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Buddy Activate: Enter state Activating", v39, 2u);
      }
      objc_storeStrong(&v41, 0);
      break;
    case 2:
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v7 = oslog;
        os_log_type_t v8 = v37;
        sub_10004B24C(v36);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Buddy Activate: Enter state TryActivate", v36, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      break;
    case 3:
      os_log_t v35 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v34 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        v9 = v35;
        os_log_type_t v10 = v34;
        sub_10004B24C(v33);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Buddy Activate: Enter state Activated", v33, 2u);
      }
      objc_storeStrong((id *)&v35, 0);
      break;
    case 4:
      os_log_t v32 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        char v11 = v32;
        os_log_type_t v12 = v31;
        sub_10004B24C(v30);
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Buddy Activate: Enter state NotSilentPreActivation", v30, 2u);
      }
      objc_storeStrong((id *)&v32, 0);
      break;
    case 5:
      os_log_t v29 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        v13 = v29;
        os_log_type_t v14 = v28;
        sub_10004B24C(v27);
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Buddy Activate: Enter state Failure", v27, 2u);
      }
      objc_storeStrong((id *)&v29, 0);
      break;
    case 6:
      os_log_t v26 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v26;
        os_log_type_t v16 = v25;
        sub_10004B24C(v24);
        _os_log_impl((void *)&_mh_execute_header, v15, v16, "Buddy Activate: Enter state WaitingForSystemTimeUpdate", v24, 2u);
      }
      objc_storeStrong((id *)&v26, 0);
      break;
    case 7:
      os_log_t v23 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v17 = v23;
        os_log_type_t v18 = v22;
        sub_10004B24C(v21);
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "Buddy Activate: Enter state WaitingForBaseband", (uint8_t *)v21, 2u);
      }
      objc_storeStrong((id *)&v23, 0);
      break;
    default:
      break;
  }
  if (v45 == 1 || v45 == 7 || v45 == 6 || v45 == 2 || !v47->_displayTimerElapsed)
  {
    v19 = +[UIApplication sharedApplication];
    [(UIApplication *)v19 setIdleTimerDisabled:1];
  }
  else
  {
    v20 = +[UIApplication sharedApplication];
    [(UIApplication *)v20 setIdleTimerDisabled:0];
  }
  [(ActivationController *)v47 _attemptDismiss];
}

- (BOOL)shouldSuppressExtendedInitializationActivityIndicator
{
  id v2 = [(ActivationController *)self navigationController];
  id v3 = (ActivationController *)[v2 topViewController];
  BOOL v4 = v3 == self;

  return v4;
}

- (ActivationController)init
{
  SEL v23 = a2;
  id v3 = +[NSBundle mainBundle];
  id v4 = +[UIDevice modelSpecificLocalizedStringKeyForKey:@"ACTIVATION_TIME"];
  id v5 = [(NSBundle *)v3 localizedStringForKey:v4 value:&stru_1002B4E18 table:@"Localizable"];
  id location = 0;
  v22.receiver = self;
  v22.super_class = (Class)ActivationController;
  os_log_type_t v6 = [(ActivationController *)&v22 initWithSpinnerText:v5];
  id location = v6;
  objc_storeStrong(&location, v6);

  if (v6)
  {
    +[UINavigationBar _setUseCustomBackButtonAction:1];
    id v7 = [location navigationItem];
    [v7 setTitle:&stru_1002B4E18];

    id v8 = objc_alloc((Class)UIBarButtonItem);
    v9 = +[NSBundle mainBundle];
    os_log_type_t v10 = [(NSBundle *)v9 localizedStringForKey:@"BACK" value:&stru_1002B4E18 table:@"Localizable"];
    id v11 = [v8 initWithTitle:v10 style:0 target:location action:"back:"];
    id v12 = [location navigationItem];
    [v12 setBackBarButtonItem:v11];

    uint64_t v13 = objc_opt_new();
    os_log_type_t v14 = (void *)*((void *)location + 3);
    *((void *)location + 3) = v13;

    id v15 = +[BuddyActivationConfiguration currentConfiguration];
    [v15 addDelegate:location];

    os_log_type_t v16 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v16 addObserver:location selector:"didBecomeActive:" name:UIApplicationDidBecomeActiveNotification object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [(NSNotificationCenter *)v17 addObserver:location selector:"didResignActive:" name:UIApplicationWillResignActiveNotification object:0];

    id v18 = objc_alloc_init((Class)SecureBackup);
    v19 = (void *)*((void *)location + 6);
    *((void *)location + 6) = v18;
  }
  v20 = (ActivationController *)location;
  objc_storeStrong(&location, 0);
  return v20;
}

- (void)dealloc
{
  os_log_type_t v6 = self;
  SEL v5 = a2;
  CFNotificationCenterRef center = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(center, v6);
  id v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v6];

  [(ActivationController *)v6 _cleanup];
  [(RemoteUIController *)v6->_remoteUIController setDelegate:0];
  [(ActivationController *)v6 _clearDisplayTimer];
  [(ActivationController *)v6 _clearWaitingForBasebandTimer];
  v3.receiver = v6;
  v3.super_class = (Class)ActivationController;
  [(ActivationController *)&v3 dealloc];
}

- (void)loadView
{
  id v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)ActivationController;
  [(ActivationController *)&v5 loadView];
  [(ActivationController *)v7 setActivityIndicatorHidden:1];
  id v2 = +[OBPrivacyLinkController linkWithBundleIdentifier:BYPrivacyActivationIdentifier];
  [(ActivationController *)v7 setPrivacyLinkController:v2];

  id v3 = [(ActivationController *)v7 privacyLinkController];
  id v4 = [v3 view];
  [v4 setUserInteractionEnabled:0];
}

- (void)back:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v9 = [(ActivationController *)v11 navigationController];
  id v3 = [v9 topViewController];
  objc_opt_class();
  char v7 = 0;
  char v4 = 0;
  if (objc_opt_isKindOfClass())
  {
    id v8 = [(ActivationController *)v11 delegate];
    char v7 = 1;
    char v4 = objc_opt_respondsToSelector();
  }
  if (v7) {

  }
  if (v4)
  {
    id v5 = [(ActivationController *)v11 delegate];
    [v5 presentWiFiPaneForFlowItem:v11];
  }
  else
  {
    id v6 = [v9 popViewControllerAnimated:1];
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (void)_addAnalyticsEventWithSuccess:(BOOL)a3
{
  id v3 = [(ActivationController *)self analyticsManager];
  v13[0] = @"cellular";
  char v4 = +[NSNumber numberWithBool:self->_connectionOTA];
  v14[0] = v4;
  v13[1] = @"duration";
  [(NSDate *)self->_startedActivationDate timeIntervalSinceNow];
  id v6 = +[NSNumber numberWithDouble:-v5];
  v14[1] = v6;
  v13[2] = @"hasPresentedUI";
  char v7 = +[NSNumber numberWithBool:self->_hasPresentedRemoteUI];
  v14[2] = v7;
  v13[3] = @"bootstrap";
  id v8 = +[NSNumber numberWithBool:self->_usingBootstrap];
  v14[3] = v8;
  v13[4] = @"success";
  id v9 = +[NSNumber numberWithBool:a3];
  v14[4] = v9;
  os_log_type_t v10 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:5];
  [(BYAnalyticsManager *)v3 addEvent:@"com.apple.setupassistant.ios.activation" withPayload:v10 persist:1];
}

- (void)_clearDisplayTimer
{
  char v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  char v5 = 2;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEBUG))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_debug_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Clear Display Timer", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(NSTimer *)v7->_displayTimer invalidate];
  objc_storeStrong((id *)&v7->_displayTimer, 0);
}

- (void)_checkActivationFailIfNotActivated:(BOOL)a3
{
  uint64_t v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  os_log_type_t v3 = dispatch_get_global_queue(0, 0);
  char v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  char v7 = sub_1000B6B90;
  id v8 = &unk_1002B1130;
  id v9 = v13;
  BOOL v10 = v11;
  dispatch_async(v3, &v4);

  objc_storeStrong((id *)&v9, 0);
}

- (void)_checkActivationFailIfNotActivated:(BOOL)a3 isActivated:(BOOL)a4
{
  BOOL v10 = self;
  SEL v9 = a2;
  BOOL v8 = a3;
  BOOL v7 = a4;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004F3FC((uint64_t)buf, v10->_state, v7);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: Check Activation! State = %d Activated = %d", buf, 0xEu);
  }
  objc_storeStrong((id *)&oslog, 0);
  if (v7)
  {
    [(ActivationController *)v10 _clearTicketAcceptedTimer];
    if (v10->_state == 2)
    {
      [(ActivationController *)v10 _enterState:3];
    }
    else
    {
      id v4 = [(ActivationController *)v10 delegate];
      unsigned __int8 v5 = [v4 isFlowItemOnTop:v10];

      if (v5) {
        [(ActivationController *)v10 _enterState:3];
      }
    }
  }
  else if (v8)
  {
    [(ActivationController *)v10 _clearTicketAcceptedTimer];
    [(ActivationController *)v10 _enterState:5];
  }
}

- (void)startOver
{
  BOOL v7 = self;
  location[1] = (id)a2;
  [(ActivationController *)self _cleanup];
  v7->_state = 0;
  location[0] = [(ActivationController *)v7 navigationController];
  id v2 = [location[0] viewControllers];
  char v4 = 0;
  BOOL v3 = 0;
  if ([v2 count] == (id)1)
  {
    unsigned __int8 v5 = (ActivationController *)[location[0] topViewController];
    char v4 = 1;
    BOOL v3 = v5 == v7;
  }
  if (v4) {

  }
  if (v3) {
    [(ActivationController *)v7 _activateIfNecessary];
  }
  objc_storeStrong(location, 0);
}

- (void)_clearTicketAcceptedTimer
{
  BOOL v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Clear ticket accepted timer", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(NSTimer *)v7->_ticketAcceptedTimer invalidate];
  objc_storeStrong((id *)&v7->_ticketAcceptedTimer, 0);
}

- (void)_ticketAcceptedDidTimeout
{
  BOOL v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Ticket accepted timer timed out", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(ActivationController *)v7 _clearTicketAcceptedTimer];
  [(ActivationController *)v7 _checkActivationFailIfNotActivated:1];
}

- (void)_activateIfNecessary
{
  id v18 = self;
  location[1] = (id)a2;
  self->_displayTimerElapsed = 0;
  [(ActivationController *)v18 _clearDisplayTimer];
  if (+[BuddyActivationBasebandDeadController controllerNeedsToRun])
  {
    location[0] = objc_alloc_init(BuddyActivationBasebandDeadController);
    id v2 = [(ActivationController *)v18 navigationController];
    [v2 pushViewController:location[0] animated:1];

    objc_storeStrong(location, 0);
  }
  else
  {
    id v16 = (id)_BYLoggingFacility();
    char v15 = 2;
    if (os_log_type_enabled((os_log_t)v16, OS_LOG_TYPE_DEBUG))
    {
      os_log_type_t v3 = v16;
      os_log_type_t v4 = v15;
      sub_10004B24C(buf);
      _os_log_debug_impl((void *)&_mh_execute_header, v3, v4, "Buddy Activate: Set Display Timer", buf, 2u);
    }
    objc_storeStrong(&v16, 0);
    os_log_type_t v5 = +[NSTimer scheduledTimerWithTimeInterval:v18 target:"_displayTimerTimeout" selector:0 userInfo:0 repeats:1.0];
    displayTimer = v18->_displayTimer;
    v18->_displayTimer = v5;

    if (v18->_state != 1 && v18->_state != 2 && v18->_state != 6 && v18->_state != 7)
    {
      BOOL v7 = dispatch_get_global_queue(0, 0);
      block = _NSConcreteStackBlock;
      int v9 = -1073741824;
      int v10 = 0;
      BOOL v11 = sub_1000B7398;
      SEL v12 = &unk_1002B0D20;
      uint64_t v13 = v18;
      dispatch_async(v7, &block);

      objc_storeStrong((id *)&v13, 0);
    }
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  int v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)ActivationController;
  [(ActivationController *)&v3 viewWillAppear:a3];
  v6->_activationControllerDismissed = 0;
  if (([(ActivationController *)v6 isMovingToParentViewController] & 1) == 0) {
    [(ActivationController *)v6 _stopActivationLockExpirationTimer];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  int v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)ActivationController;
  [(ActivationController *)&v3 viewDidAppear:a3];
  if ((v4
     || ([(ActivationController *)v6 isMovingToParentViewController] & 1) != 0)
    && !v6->_appIsSuspended)
  {
    [(ActivationController *)v6 _activateIfNecessary];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  SEL v12 = self;
  SEL v11 = a2;
  BOOL v10 = a3;
  if ([(ActivationController *)self isMovingFromParentViewController])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v3 = oslog;
      os_log_type_t v4 = v8;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "ActivationController Pop.", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(ActivationController *)v12 _clearWaitingForBasebandTimer];
    [(ActivationController *)v12 _clearDisplayTimer];
    [(ActivationController *)v12 _cleanup];
    [(ActivationController *)v12 _releaseOTAAssertion];
    [(ActivationController *)v12 _enterState:0];
    objc_storeStrong((id *)&v12->_engine, 0);
  }
  SEL v5 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v5 removeObserver:v12 name:@"BuddySystemTimeUpdateFinishedNotification" object:0];

  v6.receiver = v12;
  v6.super_class = (Class)ActivationController;
  [(ActivationController *)&v6 viewWillDisappear:v10];
}

- (void)didResignActive:(id)a3
{
  os_log_type_t v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v4->_appIsSuspended = 1;
  objc_storeStrong(location, 0);
}

- (void)didBecomeActive:(id)a3
{
  int v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9->_appIsSuspended = 0;
  char v6 = 0;
  char v4 = 0;
  BOOL v3 = 0;
  if (!v9->_activationControllerDismissed)
  {
    id v7 = [(ActivationController *)v9 navigationController];
    char v6 = 1;
    SEL v5 = (ActivationController *)[v7 topViewController];
    char v4 = 1;
    BOOL v3 = v5 == v9;
  }
  if (v4) {

  }
  if (v6) {
  if (v3)
  }
    [(ActivationController *)v9 _activateIfNecessary];
  objc_storeStrong(location, 0);
}

- (void)_displayTimerTimeout
{
  id v7 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    id v2 = oslog[0];
    os_log_type_t v3 = v5;
    sub_10004B24C(v4);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Buddy Activate: Display Timer Fired", (uint8_t *)v4, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(ActivationController *)v7 _clearDisplayTimer];
  v7->_displayTimerElapsed = 1;
  [(ActivationController *)v7 _enterState:v7->_state];
}

- (void)_cleanup
{
}

- (void)startSpinningWithIdentifier:(id)a3
{
  BOOL v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = [(ActivationController *)v10 navigationController];
  char v4 = (UIViewController *)[v3 topViewController];
  spinningViewController = v10->_spinningViewController;
  v10->_spinningViewController = v4;

  if (v10->_spinningViewController)
  {
    char v6 = [(UIViewController *)v10->_spinningViewController view];
    id v7 = [(UIView *)v6 window];
    [(UIWindow *)v7 setUserInteractionEnabled:0];

    +[BFFViewControllerSpinnerManager startAnimatingSpinnerFor:v10->_spinningViewController identifier:location[0]];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
      _os_log_fault_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_FAULT, "ActivationController: startSpinning has no viewController for %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)stopSpinningForIdentifier:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v7->_spinningViewController)
  {
    id v3 = [(UIViewController *)v7->_spinningViewController view];
    char v4 = [(UIView *)v3 window];
    [(UIWindow *)v4 setUserInteractionEnabled:1];

    +[BFFViewControllerSpinnerManager stopAnimatingSpinnerFor:location[0]];
    objc_storeStrong((id *)&v7->_spinningViewController, 0);
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "ActivationController: Unmatched stopSpinning for %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)startRequest:(id)a3 completion:(id)a4
{
  id v31 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v29 = 0;
  objc_storeStrong(&v29, a4);
  char v27 = 0;
  char v25 = 0;
  unsigned __int8 v5 = 0;
  if (os_variant_allows_internal_security_policies())
  {
    id v28 = [location[0] URL];
    char v27 = 1;
    id v26 = [v28 absoluteString];
    char v25 = 1;
    unsigned __int8 v5 = [v26 hasSuffix:@"/deviceActivation"];
  }
  if (v25) {

  }
  if (v27) {
  if (v5)
  }
  {
    char v6 = +[NSUserDefaults standardUserDefaults];
    id v24 = [(NSUserDefaults *)v6 dictionaryForKey:@"CustomActivationHeaders"];

    memset(__b, 0, sizeof(__b));
    id v7 = v24;
    id v8 = [v7 countByEnumeratingWithState:__b objects:v32 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v8; ++i)
        {
          if (*(void *)__b[2] != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v23 = *(void *)(__b[1] + 8 * i);
          id v11 = location[0];
          id v12 = [v24 objectForKeyedSubscript:v23];
          [v11 setValue:v12 forHTTPHeaderField:v23];
        }
        id v8 = [v7 countByEnumeratingWithState:__b objects:v32 count:16];
      }
      while (v8);
    }

    objc_storeStrong(&v24, 0);
  }
  uint64_t v13 = (void *)*((void *)v31 + 1);
  id v14 = location[0];
  char v15 = _NSConcreteStackBlock;
  int v16 = -1073741824;
  int v17 = 0;
  id v18 = sub_1000B80B8;
  v19 = &unk_1002B2440;
  id v20 = v31;
  id v21 = v29;
  [v13 makeRequest:v14 completion:&v15];
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleActivationData:(id)a3 responseHeaders:(id)a4 baseURL:(id)a5
{
  v79 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v77 = 0;
  objc_storeStrong(&v77, a4);
  id v76 = 0;
  objc_storeStrong(&v76, a5);
  *(void *)&v75[1] = [v77 objectForKeyedSubscript:@"Content-Type"];
  v75[0] = 0;
  id v7 = objc_alloc((Class)NSString);
  id v74 = [v7 initWithData:location[0] encoding:4];
  if (*(void *)&v75[1])
  {
    v75[0] = [*(id *)&v75[1] containsString:@"application/x-buddyml"] & 1;
  }
  else
  {
    id v72 = [v74 rangeOfString:@"<xmlui"];
    uint64_t v73 = v8;
    *(void *)v75 = v72 != (id)0x7FFFFFFFFFFFFFFFLL;
  }
  id v71 = (id)_BYLoggingFacility();
  os_log_type_t v70 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v71, OS_LOG_TYPE_DEFAULT))
  {
    sub_1000B8CA8((uint64_t)buf, v79->_state, (uint64_t)[location[0] length], *(uint64_t *)&v75[1]);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v71, v70, "Buddy Activate: connectionDidFinishLoading state = %d response size = %ld, contentType = %@\n", buf, 0x1Cu);
  }
  objc_storeStrong(&v71, 0);
  uint64_t v9 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v10 = [(NSUserDefaults *)v9 BOOLForKey:@"LogFullActivationResponse"];

  if (v10)
  {
    id v69 = (id)_BYLoggingFacility();
    os_log_type_t v68 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v69, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)v81, (uint64_t)v74);
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)v69, v68, "Buddy Activate: Got Response: %@\n", v81, 0xCu);
    }
    objc_storeStrong(&v69, 0);
  }
  if (v75[0])
  {
    v79->_nonSilentActivation = 1;
    id v67 = (id)_BYLoggingFacility();
    os_log_type_t v66 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v67, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = v67;
      os_log_type_t v12 = v66;
      sub_10004B24C(v65);
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "Buddy Activate: Render xmlui\n", v65, 2u);
    }
    objc_storeStrong(&v67, 0);
    [(ActivationController *)v79 _enterState:4];
    [(RUIPage *)v79->_loadingPage setLoading:0];
    objc_storeStrong((id *)&v79->_loadingPage, 0);
    if (!v79->_remoteUIController)
    {
      uint64_t v13 = (RemoteUIController *)objc_alloc_init((Class)RemoteUIController);
      remoteUIController = v79->_remoteUIController;
      v79->_remoteUIController = v13;

      char v15 = v79->_remoteUIController;
      id v16 = [(ActivationController *)v79 navigationController];
      [(RemoteUIController *)v15 setNavigationController:v16];

      -[RemoteUIController setDelegate:](v79->_remoteUIController, "setDelegate:");
      int v17 = v79->_remoteUIController;
      id v18 = +[RUIStyle setupAssistantStyle];
      [(RemoteUIController *)v17 setStyle:v18];

      objc_initWeak(&from, v79);
      v19 = v79->_remoteUIController;
      v58 = _NSConcreteStackBlock;
      int v59 = -1073741824;
      int v60 = 0;
      v61 = sub_1000B8CD4;
      v62 = &unk_1002B2468;
      objc_copyWeak(&v63, &from);
      [(RemoteUIController *)v19 setHandlerForElementName:@"agree" handler:&v58];
      id v20 = v79->_remoteUIController;
      v52 = _NSConcreteStackBlock;
      int v53 = -1073741824;
      int v54 = 0;
      v55 = sub_1000B8D80;
      v56 = &unk_1002B2468;
      objc_copyWeak(&v57, &from);
      [(RemoteUIController *)v20 setHandlerForElementName:@"disagree" handler:&v52];
      id v21 = v79->_remoteUIController;
      SEL v46 = _NSConcreteStackBlock;
      int v47 = -1073741824;
      int v48 = 0;
      v49 = sub_1000B8E2C;
      v50 = &unk_1002B2468;
      objc_copyWeak(&v51, &from);
      [(RemoteUIController *)v21 setHandlerForElementName:@"tryAgain" handler:&v46];
      [(ActivationController *)v79 _setHandlerForPasscode];
      objc_destroyWeak(&v51);
      objc_destroyWeak(&v57);
      objc_destroyWeak(&v63);
      objc_destroyWeak(&from);
    }
    objc_super v22 = v79->_remoteUIController;
    uint64_t v23 = [(BuddyActivationEngine *)v79->_engine sessionConfiguration];
    [(RemoteUIController *)v22 setSessionConfiguration:v23];

    [(RemoteUIController *)v79->_remoteUIController loadData:location[0] baseURL:v76];
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10005A060(v80, v79->_state);
      _os_log_impl((void *)&_mh_execute_header, oslog, v44, "Buddy Activate: Non xmlui response! State = %d\n", v80, 8u);
    }
    objc_storeStrong((id *)&oslog, 0);
    if (v79->_state == 1 || v79->_state == 4)
    {
      [(ActivationController *)v79 _enterState:2];
      if (!v77)
      {
        os_log_t v43 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          id v24 = v43;
          os_log_type_t v25 = v42;
          sub_10004B24C(v41);
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "No headers in activation response!", v41, 2u);
        }
        objc_storeStrong((id *)&v43, 0);
      }
      id v26 = dispatch_get_global_queue(25, 0);
      block = _NSConcreteStackBlock;
      int v33 = -1073741824;
      int v34 = 0;
      os_log_t v35 = sub_1000B8ED8;
      v36 = &unk_1002B1480;
      id v37 = v77;
      id v38 = location[0];
      v39 = v79;
      id v40 = v74;
      dispatch_async(v26, &block);

      objc_storeStrong(&v40, 0);
      objc_storeStrong((id *)&v39, 0);
      objc_storeStrong(&v38, 0);
      objc_storeStrong(&v37, 0);
    }
    else
    {
      os_log_t v31 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        char v27 = v31;
        os_log_type_t v28 = v30;
        sub_10004B24C(v29);
        _os_log_impl((void *)&_mh_execute_header, v27, v28, "Buddy Activate: Warning: Unhandled state in connection response.\n", (uint8_t *)v29, 2u);
      }
      objc_storeStrong((id *)&v31, 0);
    }
    [(RUIPage *)v79->_loadingPage setLoading:0];
    objc_storeStrong((id *)&v79->_loadingPage, 0);
  }
  [(ActivationController *)v79 _cleanup];
  objc_storeStrong(&v74, 0);
  objc_storeStrong((id *)&v75[1], 0);
  objc_storeStrong(&v76, 0);
  objc_storeStrong(&v77, 0);
  objc_storeStrong(location, 0);
}

- (void)_handleFailureWithError:(id)a3
{
  id v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    int state = v11->_state;
    char v7 = 0;
    char v5 = 0;
    if (_BYIsInternalInstall())
    {
      char v4 = (NSString *)location[0];
    }
    else if (location[0])
    {
      id v8 = [location[0] domain];
      char v7 = 1;
      char v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v8, [location[0] code]);
      char v6 = v4;
      char v5 = 1;
    }
    else
    {
      char v4 = 0;
    }
    sub_1000639A4((uint64_t)buf, state, (uint64_t)v4);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: connection failed, int state = %d, error = '%{public}@'", buf, 0x12u);
    if (v5) {

    }
    if (v7) {
  }
    }
  objc_storeStrong((id *)&oslog, 0);
  if (v11->_state != 3)
  {
    v11->_connectionFailed = 1;
    [(ActivationController *)v11 _enterState:5];
  }
  [(RUIPage *)v11->_loadingPage setLoading:0];
  objc_storeStrong((id *)&v11->_loadingPage, 0);
  [(ActivationController *)v11 _cleanup];
  objc_storeStrong(location, 0);
}

- (void)_getSRPInitNonceRequestOptionsCompletion:(id)a3
{
  os_log_t v32 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v30 = [(SecureBackup *)v32->_secureBackup srpInitNonce];
  id v29 = [v30 base64EncodedStringWithOptions:0];
  id v28 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
  id v27 = +[NSMutableDictionary dictionary];
  if (v29) {
    [v27 setObject:v29 forKeyedSubscript:@"nonce"];
  }
  id v26 = 0;
  os_log_type_t v25 = 0;
  id v3 = (id)_BYSignpostSubsystem();
  char v4 = (void *)_BYSignpostCreate();
  id v24 = v5;
  uint64_t v23 = v4;

  os_log_t log = (os_log_t)(id)_BYSignpostSubsystem();
  char v21 = 1;
  id v20 = v23;
  if (v23 && v20 != (void *)-1 && os_signpost_enabled(log))
  {
    char v6 = log;
    os_signpost_type_t v7 = v21;
    os_signpost_id_t v8 = (os_signpost_id_t)v20;
    sub_10004B24C(buf);
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v6, v7, v8, "ActivationFindMyIdentity", "", buf, 2u);
  }
  objc_storeStrong((id *)&log, 0);
  os_log_t oslog = (os_log_t)(id)_BYSignpostSubsystem();
  os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_100046588((uint64_t)v33, (uint64_t)v23);
    _os_log_impl((void *)&_mh_execute_header, oslog, v17, "BEGIN [%lld]: ActivationFindMyIdentity ", v33, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  os_log_type_t v25 = v23;
  id v26 = v24;
  id v9 = v28;
  id v10 = v27;
  id v11 = _NSConcreteStackBlock;
  int v12 = -1073741824;
  int v13 = 0;
  id v14 = sub_1000B9BE4;
  char v15 = &unk_1002B2490;
  v16[1] = v23;
  v16[2] = v24;
  v16[0] = location[0];
  [v9 identityForPasscodeActivationUnlockWithContext:v10 completion:&v11];
  objc_storeStrong(v16, 0);
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(&v29, 0);
  objc_storeStrong(&v30, 0);
  objc_storeStrong(location, 0);
}

- (void)_tryActivateWithOptions:(id)a3 requestMutator:(id)a4
{
  id v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v24 = 0;
  objc_storeStrong(&v24, a4);
  id v5 = +[BYPreferencesController buddyPreferencesInternal];
  unsigned __int8 v6 = [v5 BOOLForKey:@"ForceActivationFailure"];

  if (v6)
  {
    os_signpost_type_t v7 = &_dispatch_main_q;
    block = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    char v21 = sub_1000BA1A0;
    objc_super v22 = &unk_1002B0D20;
    uint64_t v23 = v26;
    dispatch_async((dispatch_queue_t)v7, &block);

    int v17 = 1;
    objc_storeStrong((id *)&v23, 0);
  }
  else
  {
    if (v26->_engine)
    {
      engine = v26->_engine;
      id v9 = location[0];
      id v10 = v24;
      id v11 = _NSConcreteStackBlock;
      int v12 = -1073741824;
      int v13 = 0;
      id v14 = sub_1000BA1D0;
      char v15 = &unk_1002B24B8;
      id v16 = v26;
      [(BuddyActivationEngine *)engine tryActivateWithOptions:v9 requestMutator:v10 completion:&v11];
      objc_storeStrong((id *)&v16, 0);
    }
    int v17 = 0;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
}

- (void)_startActivation
{
  v58 = self;
  SEL v57 = a2;
  objc_storeStrong((id *)&self->_escrowSessionKey, 0);
  objc_storeStrong((id *)&v58->_srpInitResponse, 0);
  objc_storeStrong((id *)&v58->_accountDSID, 0);
  v58->_hasPresentedRemoteUI = 0;
  id v2 = +[NSDate date];
  startedActivationDate = v58->_startedActivationDate;
  v58->_startedActivationDate = v2;

  [(ActivationController *)v58 _enterState:1];
  v58->_cdmaSelectionActivation = 0;
  v58->_connectionFailed = 0;
  char v4 = [(ActivationController *)v58 activationState];
  [(BuddyActivationState *)v4 setError:0];

  char v56 = 0;
  id v5 = +[BuddyActivationConfiguration currentConfiguration];
  char v54 = 0;
  char v52 = 0;
  char v6 = 0;
  if ([v5 supportsCellularActivation])
  {
    v55 = [(ActivationController *)v58 networkProvider];
    char v54 = 1;
    char v6 = 1;
    if ([(BuddyNetworkProvider *)v55 networkReachable])
    {
      int v53 = [(ActivationController *)v58 networkProvider];
      char v52 = 1;
      char v6 = ![(BuddyNetworkProvider *)v53 connectedOverWiFi];
    }
  }
  if (v52) {

  }
  if (v54) {
  char v56 = v6 & 1;
  }
  id v51 = 0;
  id location = 0;
  char v49 = 0;
  CFTypeRef v48 = CFPreferencesCopyAppValue(@"ActivationURL", @"com.apple.purplebuddy");
  if (v48)
  {
    CFTypeID v7 = CFGetTypeID(v48);
    if (v7 == CFStringGetTypeID())
    {
      os_signpost_id_t v8 = +[NSURL URLWithString:v48];
      id v9 = v51;
      id v51 = v8;
    }
    CFRelease(v48);
  }
  CFTypeRef v47 = CFPreferencesCopyAppValue(@"ActivationSessionURL", @"com.apple.purplebuddy");
  if (v47)
  {
    CFTypeID v10 = CFGetTypeID(v47);
    if (v10 == CFStringGetTypeID())
    {
      id v11 = +[NSURL URLWithString:v47];
      id v12 = location;
      id location = v11;
    }
    CFRelease(v47);
  }
  CFTypeRef cf = CFPreferencesCopyAppValue(@"ActivationAllowAnyHTTPSCertificate", @"com.apple.purplebuddy");
  if (cf)
  {
    CFTypeID v13 = CFGetTypeID(cf);
    if (v13 == CFStringGetTypeID())
    {
      char v49 = [(id)cf BOOLValue] & 1;
    }
    else
    {
      CFTypeID v14 = CFGetTypeID(cf);
      if (v14 == CFBooleanGetTypeID()) {
        char v49 = cf == kCFBooleanTrue;
      }
    }
    CFRelease(cf);
  }
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v44 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v51);
    _os_log_impl((void *)&_mh_execute_header, oslog, v44, "Buddy Activate: Got activation URL override: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  os_log_t v43 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)v60, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, v43, v42, "Buddy Activate: Got session URL override: %@", v60, 0xCu);
  }
  objc_storeStrong((id *)&v43, 0);
  os_log_t v41 = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    sub_10005A060(v59, v49 & 1);
    _os_log_impl((void *)&_mh_execute_header, v41, v40, "Buddy Activate: Allow any HTTPS certificate = %d", v59, 8u);
  }
  objc_storeStrong((id *)&v41, 0);
  [(BuddyActivationEngine *)v58->_engine cancel];
  if (v56)
  {
    os_log_t v39 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v38 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      char v15 = v39;
      os_log_type_t v16 = v38;
      sub_10004B24C(v37);
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Creating Activation Connection OTA.", v37, 2u);
    }
    objc_storeStrong((id *)&v39, 0);
    v58->_connectionOTA = 1;
    id v17 = +[BuddyActivationConfiguration currentConfiguration];
    id v18 = [v17 cellularActivationMethod];

    if (v18)
    {
      if (v18 == (id)1)
      {
        v58->_usingBootstrap = 1;
LABEL_37:
        int v19 = (BuddyActivationEngine *)+[BuddyActivationEngine cellularActivationEngineWithOverrideActivationURL:v51 sessionURL:location usingBootstrap:v58->_usingBootstrap];
        engine = v58->_engine;
        v58->_engine = v19;

        if (!v58->_otaAssertion)
        {
          memset(__b, 0, sizeof(__b));
          CFTypeRef v35 = (CFTypeRef)_CTServerConnectionCreate();
          if (v35)
          {
            v34[1] = (os_log_t)_CTServerConnectionOTAActivationAssertionCreate();
            CFRelease(v35);
          }
        }
        goto LABEL_44;
      }
      if (v18 != (id)2) {
        goto LABEL_37;
      }
    }
    v58->_usingBootstrap = 0;
    goto LABEL_37;
  }
  v34[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v33 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(v34[0], OS_LOG_TYPE_DEFAULT))
  {
    char v21 = v34[0];
    os_log_type_t v22 = v33;
    sub_10004B24C(v32);
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "Creating Activation Connection WiFi.", v32, 2u);
  }
  objc_storeStrong((id *)v34, 0);
  v58->_connectionOTA = 0;
  v58->_usingBootstrap = 0;
  uint64_t v23 = (BuddyActivationEngine *)+[BuddyActivationEngine wifiActivationEngineWithOverrideActivationURL:v51 sessionURL:location];
  id v24 = v58->_engine;
  v58->_engine = v23;

LABEL_44:
  [(BuddyActivationEngine *)v58->_engine setAllowAnyHTTPSCertificate:v49 & 1];
  os_log_type_t v25 = v58;
  id v26 = _NSConcreteStackBlock;
  int v27 = -1073741824;
  int v28 = 0;
  id v29 = sub_1000BAB9C;
  id v30 = &unk_1002B24E0;
  os_log_t v31 = v58;
  [(ActivationController *)v25 _getSRPInitNonceRequestOptionsCompletion:&v26];
  objc_storeStrong((id *)&v31, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v51, 0);
}

- (void)_checkBasebandStatusBeforeActivation
{
  os_log_type_t v33 = self;
  SEL v32 = a2;
  char v31 = 0;
  BOOL v30 = 0;
  CFTypeRef cf = (CFTypeRef)MGCopyAnswer();
  if (cf)
  {
    CFTypeID v2 = CFGetTypeID(cf);
    if (v2 == CFStringGetTypeID())
    {
      unsigned __int8 v3 = [(id)cf isEqualToString:kCTPostponementStatusNotReady];
      unsigned __int8 v4 = 1;
      if ((v3 & 1) == 0) {
        unsigned __int8 v4 = [(id)cf isEqualToString:@"BBNotReady"];
      }
      char v31 = v4 & 1;
      BOOL v30 = [(id)cf length] != 0;
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        sub_1000BB014((uint64_t)buf, (uint64_t)cf, v31 & 1);
        _os_log_impl((void *)&_mh_execute_header, oslog, v27, "Buddy Activate: _checkBasebandStatusBeforeActivation = %@, notReady = %d", buf, 0x12u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    CFRelease(cf);
  }
  if ((v31 & 1) == 0 && v30)
  {
    [(ActivationController *)v33 _startActivation];
  }
  else if ((float)((float)++v33->_waitingForBasebandFailureCount * 2.0) <= 120.0)
  {
    if (v30)
    {
      os_log_t v20 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = v20;
        os_log_type_t v10 = v19;
        sub_10004B24C(v18);
        _os_log_impl((void *)&_mh_execute_header, v9, v10, "Buddy Activate: BasebandStatus = NotReady. Waiting for Baseband.", v18, 2u);
      }
      objc_storeStrong((id *)&v20, 0);
    }
    else
    {
      os_log_t v17 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v17;
        os_log_type_t v12 = v16;
        sub_10004B24C(v15);
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Buddy Activate: Unable to read BasebandStatus. Waiting for Baseband.", (uint8_t *)v15, 2u);
      }
      objc_storeStrong((id *)&v17, 0);
    }
    [(ActivationController *)v33 _enterState:7];
    CFTypeID v13 = +[NSTimer scheduledTimerWithTimeInterval:v33 target:"_waitingForBasebandTimeout" selector:0 userInfo:0 repeats:2.0];
    waitingForBasebandTimer = v33->_waitingForBasebandTimer;
    v33->_waitingForBasebandTimer = v13;
  }
  else
  {
    if (v30)
    {
      os_log_t v26 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = v26;
        os_log_type_t v6 = v25;
        sub_10004B24C(v24);
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Buddy Activate: BasebandStatus = NotReady. Too many failures.", v24, 2u);
      }
      objc_storeStrong((id *)&v26, 0);
    }
    else
    {
      os_log_t v23 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        CFTypeID v7 = v23;
        os_log_type_t v8 = v22;
        sub_10004B24C(v21);
        _os_log_impl((void *)&_mh_execute_header, v7, v8, "Buddy Activate: Unable to read BasebandStatus. Too many failures.", v21, 2u);
      }
      objc_storeStrong((id *)&v23, 0);
    }
    [(ActivationController *)v33 _enterState:5];
  }
}

- (void)_clearWaitingForBasebandTimer
{
}

- (void)_waitingForBasebandTimeout
{
}

- (void)_sanitizeSystemTime
{
  v11[2] = self;
  v11[1] = (id)a2;
  v11[0] = objc_alloc_init((Class)NSDateFormatter);
  [v11[0] setDateFormat:@"MMM d yyyy"];
  CFTypeID v2 = +[NSString stringWithCString:"Nov 20 2024" encoding:1];
  id location = [v11[0] dateFromString:v2];

  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v8, "Setting Device to default date: %@", buf, 0xCu);
  }
  objc_storeStrong((id *)&oslog, 0);
  [location timeIntervalSince1970];
  double v7 = v3;
  __darwin_time_t v6 = (uint64_t)rint(v3);
  memset(&v5, 0, sizeof(v5));
  v5.tv_sec = v6;
  v5.tv_usec = 0;
  settimeofday(&v5, 0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SignificantTimeChangeNotification", 0, 0, 1u);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v11, 0);
}

- (void)_systemTimeUpdated
{
  os_log_type_t v10 = self;
  oslog[1] = (os_log_t)a2;
  CFTypeID v2 = +[NSNotificationCenter defaultCenter];
  [(NSNotificationCenter *)v2 removeObserver:v10 name:@"BuddySystemTimeUpdateFinishedNotification" object:0];

  double v3 = [(ActivationController *)v10 systemTimeUpdateManager];
  id v4 = [(BuddySystemTimeUpdateManager *)v3 status];

  if (v4 == (id)3)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      timeval v5 = oslog[0];
      os_log_type_t v6 = v8;
      sub_10004B24C(v7);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Device Time Update failed.", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    [(ActivationController *)v10 _sanitizeSystemTime];
  }
  [(ActivationController *)v10 _checkBasebandStatusBeforeActivation];
}

- (void)_activate
{
  double v7 = self;
  location[1] = (id)a2;
  location[0] = +[NSDate date];
  v7->_waitingForBasebandFailureCount = 0;
  [location[0] timeIntervalSince1970];
  if (v2 < 315532800.0)
  {
    double v3 = [(ActivationController *)v7 systemTimeUpdateManager];
    id v4 = [(BuddySystemTimeUpdateManager *)v3 status];

    if (v4 == (id)1)
    {
      [(ActivationController *)v7 _enterState:6];
      timeval v5 = +[NSNotificationCenter defaultCenter];
      [(NSNotificationCenter *)v5 addObserver:v7 selector:"_systemTimeUpdated" name:@"BuddySystemTimeUpdateFinishedNotification" object:0];
    }
    else
    {
      [(ActivationController *)v7 _sanitizeSystemTime];
    }
  }
  if (v7->_state != 6) {
    [(ActivationController *)v7 _checkBasebandStatusBeforeActivation];
  }
  objc_storeStrong(location, 0);
}

- (void)_dismissRemoteUI
{
  double v3 = self;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    sub_10005A060(buf, v3->_state);
    _os_log_impl((void *)&_mh_execute_header, oslog[0], OS_LOG_TYPE_DEFAULT, "Buddy Activate: Dismiss RemoteUI, int state = %d", buf, 8u);
  }
  objc_storeStrong((id *)oslog, 0);
  [(ActivationController *)v3 _enterState:5];
}

- (void)_writeAcknowledgment
{
  double v2 = dispatch_get_global_queue(0, 0);
  dispatch_async(v2, &stru_1002B2500);
}

- (void)_startActivationLockExpirationTimerForPage:(id)a3
{
  os_log_type_t v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = (id)_BYLoggingFacility();
  os_log_type_t v19 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = v20;
    os_log_type_t v4 = v19;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Starting Activation Lock Expiration timer", buf, 2u);
  }
  objc_storeStrong(&v20, 0);
  if (v22->_activationLockTimer)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      timeval v5 = oslog;
      os_log_type_t v6 = v16;
      sub_10004B24C(v15);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Buddy Activate: Pushing a second Activation lock page?", v15, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(NSTimer *)v22->_activationLockTimer invalidate];
  }
  objc_storeStrong((id *)&v22->_activationLockPage, location[0]);
  id v9 = _NSConcreteStackBlock;
  int v10 = -1073741824;
  int v11 = 0;
  os_log_type_t v12 = sub_1000BB94C;
  CFTypeID v13 = &unk_1002B2528;
  CFTypeID v14 = v22;
  double v7 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v9 block:3600.0];
  activationLockTimer = v22->_activationLockTimer;
  v22->_activationLockTimer = v7;

  objc_storeStrong((id *)&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)_stopActivationLockExpirationTimer
{
  double v7 = self;
  oslog[1] = (os_log_t)a2;
  if (self->_activationLockTimer)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      double v2 = oslog[0];
      os_log_type_t v3 = v5;
      sub_10004B24C(v4);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Stopping Activation Lock Expiration timer", (uint8_t *)v4, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    objc_storeStrong((id *)&v7->_activationLockPage, 0);
    [(NSTimer *)v7->_activationLockTimer invalidate];
    objc_storeStrong((id *)&v7->_activationLockTimer, 0);
  }
}

- (void)agreeToRemoteUIDialog
{
  os_log_t v23 = self;
  v22[1] = (id)a2;
  [(ActivationController *)self _cleanup];
  id v2 = [(NSMutableArray *)v23->_objectModels lastObject];
  id v3 = [v2 clientInfo];
  v22[0] = [v3 objectForKey:@"agreeDialogTitle"];

  id v4 = [(NSMutableArray *)v23->_objectModels lastObject];
  id v5 = [v4 clientInfo];
  id v21 = [v5 objectForKey:@"agreeDialogText"];

  id v6 = [(NSMutableArray *)v23->_objectModels lastObject];
  id v7 = [v6 clientInfo];
  id v20 = [v7 objectForKey:@"agreeDialogOK"];

  id v8 = [(NSMutableArray *)v23->_objectModels lastObject];
  id v9 = [v8 clientInfo];
  id v19 = [v9 objectForKey:@"agreeDialogCancel"];

  if (v21 && v20 && v19)
  {
    id location = +[UIAlertController alertControllerWithTitle:v22[0] message:v21 preferredStyle:1];
    int v10 = +[UIAlertAction actionWithTitle:v19 style:1 handler:0];
    [location addAction:v10];

    id v11 = location;
    CFTypeID v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    char v15 = sub_1000BBF30;
    os_log_type_t v16 = &unk_1002B1040;
    os_log_t v17 = v23;
    os_log_type_t v12 = +[UIAlertAction actionWithTitle:v20 style:0 handler:&v13];
    [v11 addAction:v12, v13, v14, v15, v16];

    [(ActivationController *)v23 presentViewController:location animated:1 completion:0];
    objc_storeStrong((id *)&v17, 0);
    objc_storeStrong(&location, 0);
  }
  else
  {
    [(ActivationController *)v23 _userAgreedToTCs:1];
  }
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(&v21, 0);
  objc_storeStrong(v22, 0);
}

- (void)disagreeToRemoteUIDialog
{
}

- (void)tryAgainOnRemoteUIDialog
{
  [(ActivationController *)self _cleanup];
  self->_int state = 0;
  id v2 = [(ActivationController *)self navigationController];
  id v3 = [v2 popToViewController:self animated:1];
}

- (BOOL)isEphemeral
{
  return 0;
}

- (void)_stashPasteboard
{
  id v2 = +[UIPasteboard generalPasteboard];
  id v3 = [(UIPasteboard *)v2 strings];
  previousPasteboard = self->_previousPasteboard;
  self->_previousPasteboard = v3;

  id v5 = +[UIPasteboard generalPasteboard];
  [(UIPasteboard *)v5 setStrings:0];
}

- (void)_restorePasteboard
{
  char v6 = 0;
  char v4 = 0;
  BOOL v2 = 0;
  if (self->_previousPasteboard)
  {
    id v7 = +[UIPasteboard generalPasteboard];
    char v6 = 1;
    id v5 = [(UIPasteboard *)v7 strings];
    char v4 = 1;
    BOOL v2 = [(NSArray *)v5 count] == 0;
  }
  if (v4) {

  }
  if (v6) {
  if (v2)
  }
  {
    id v3 = +[UIPasteboard generalPasteboard];
    [(UIPasteboard *)v3 setStrings:self->_previousPasteboard];

    objc_storeStrong((id *)&self->_previousPasteboard, 0);
  }
}

- (void)activationConfigurationChanged:(BOOL)a3 isActivated:(BOOL)a4
{
  id v20 = self;
  SEL v19 = a2;
  BOOL v18 = a3;
  BOOL v17 = a4;
  if (a3)
  {
    id location = (id)_BYLoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      char v4 = location;
      os_log_type_t v5 = v15;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Buddy Activate: Activation State Changed!", buf, 2u);
    }
    objc_storeStrong(&location, 0);
    char v6 = &_dispatch_main_q;
    id v7 = _NSConcreteStackBlock;
    int v8 = -1073741824;
    int v9 = 0;
    int v10 = sub_1000BC39C;
    id v11 = &unk_1002B1130;
    os_log_type_t v12 = v20;
    BOOL v13 = v17;
    dispatch_async((dispatch_queue_t)v6, &v7);

    objc_storeStrong((id *)&v12, 0);
  }
}

- (BOOL)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5
{
  os_log_type_t v33 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v31 = 0;
  objc_storeStrong(&v31, a4);
  id v30 = 0;
  objc_storeStrong(&v30, a5);
  if (v33->_state == 3)
  {
    char v34 = 0;
    int v29 = 1;
  }
  else
  {
    [(ActivationController *)v33 _cleanup];
    [(RUIPage *)v33->_loadingPage setLoading:0];
    id v7 = [(NSMutableArray *)v33->_objectModels lastObject];
    int v8 = (RUIPage *)[v7 visiblePage];
    loadingPage = v33->_loadingPage;
    v33->_loadingPage = v8;

    [(RUIPage *)v33->_loadingPage setLoading:1];
    id v10 = [(NSMutableArray *)v33->_objectModels lastObject];
    id v11 = [v10 clientInfo];
    id v28 = [v11 objectForKeyedSubscript:@"elementIdForiCloudAppleId"];

    if (![v28 length]) {
      objc_storeStrong(&v28, @"login");
    }
    id v12 = [(NSMutableArray *)v33->_objectModels lastObject];
    id v27 = [v12 rowForFormField:v28];

    if (v27)
    {
      id v26 = objc_alloc_init((Class)NSMutableDictionary);
      [v27 populatePostbackDictionary:v26];
      id v25 = [v26 objectForKeyedSubscript:v28];
      if (v25)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          BOOL v13 = [(ActivationController *)v33 miscState];
          [(BuddyMiscState *)v13 setICloudAppleIdFromActivation:v25];
        }
      }
      objc_storeStrong(&v25, 0);
      objc_storeStrong(&v26, 0);
    }
    id v24 = 0;
    id v14 = [v31 HTTPMethod];
    id v15 = [v14 lowercaseString];
    unsigned __int8 v16 = [v15 isEqualToString:@"post"];

    if (v16)
    {
      id v17 = [(NSMutableArray *)v33->_objectModels lastObject];
      id v18 = [v17 postbackData];
      id v19 = v24;
      id v24 = v18;
    }
    if (v24)
    {
      [v31 setHTTPBody:v24];
      [v31 setHTTPMethod:@"POST"];
      [v31 setValue:@"application/x-plist" forHTTPHeaderField:@"Content-Type"];
    }
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v31 URL];
      sub_10004B238((uint64_t)buf, (uint64_t)v21);
      _os_log_impl((void *)&_mh_execute_header, oslog, v22, "Buddy Activate: RemoteUI hand off of request for URL %@", buf, 0xCu);

      objc_storeStrong(&v21, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(ActivationController *)v33 startRequest:v31 completion:0];
    char v34 = 0;
    int v29 = 1;
    objc_storeStrong(&v24, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(&v31, 0);
  objc_storeStrong(location, 0);
  return v34 & 1;
}

- (void)_handleEscrowResponse:(id)a3
{
  os_log_t v41 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v39 = location[0];
    id v38 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v39 options:1];
    if (v38)
    {
      id v37 = 0;
      id obj = 0;
      id v3 = +[NSJSONSerialization JSONObjectWithData:v38 options:0 error:&obj];
      objc_storeStrong(&v37, obj);
      id v36 = v3;
      if (v37 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        os_log_t v22 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v6 = (id)objc_opt_class();
          id v20 = v6;
          char v18 = 0;
          char v16 = 0;
          if (_BYIsInternalInstall())
          {
            id v7 = (NSString *)v37;
          }
          else if (v37)
          {
            id v19 = [v37 domain];
            char v18 = 1;
            id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v19, [v37 code]);
            id v17 = v7;
            char v16 = 1;
          }
          else
          {
            id v7 = 0;
          }
          sub_10004CECC((uint64_t)v43, (uint64_t)v6, (uint64_t)v7);
          _os_log_impl((void *)&_mh_execute_header, v22, v21, "Buddy Activate: Failed to json-decode esecrowResponse. json type = %{public}@, error = %{public}@", v43, 0x16u);
          if (v16) {

          }
          if (v18) {
          objc_storeStrong(&v20, 0);
          }
        }
        objc_storeStrong((id *)&v22, 0);
      }
      else
      {
        id v34 = [v36 objectForKeyedSubscript:@"escrowSessionKey"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v41->_escrowSessionKey, v34);
        }
        else
        {
          os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            id v31 = (id)objc_opt_class();
            sub_10004BB7C((uint64_t)buf, (uint64_t)v31);
            _os_log_impl((void *)&_mh_execute_header, oslog, v32, "Buddy Activate: Escrow session key was not a string, it was a %{public}@", buf, 0xCu);
            objc_storeStrong(&v31, 0);
          }
          objc_storeStrong((id *)&oslog, 0);
        }
        id v30 = [v36 objectForKeyedSubscript:@"responseBlob"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char v4 = (NSData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:v30 options:0];
          srpInitResponse = v41->_srpInitResponse;
          v41->_srpInitResponse = v4;
        }
        else
        {
          os_log_t v29 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v28 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            id v27 = (id)objc_opt_class();
            sub_10004BB7C((uint64_t)v45, (uint64_t)v27);
            _os_log_impl((void *)&_mh_execute_header, v29, v28, "Buddy Activate: SRP Init Response was not a string, it was a %{public}@", v45, 0xCu);
            objc_storeStrong(&v27, 0);
          }
          objc_storeStrong((id *)&v29, 0);
        }
        id v26 = [v36 objectForKeyedSubscript:@"uniqueId"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_storeStrong((id *)&v41->_accountDSID, v26);
        }
        else
        {
          os_log_t v25 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            id v23 = (id)objc_opt_class();
            sub_10004BB7C((uint64_t)v44, (uint64_t)v23);
            _os_log_impl((void *)&_mh_execute_header, v25, v24, "Buddy Activate: UniqueID was not a string, it was a %{public}@", v44, 0xCu);
            objc_storeStrong(&v23, 0);
          }
          objc_storeStrong((id *)&v25, 0);
        }
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v30, 0);
        objc_storeStrong(&v34, 0);
      }
      objc_storeStrong(&v36, 0);
      objc_storeStrong(&v37, 0);
    }
    else
    {
      os_log_t v15 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = v15;
        os_log_type_t v9 = v14;
        sub_10004B24C(v13);
        _os_log_impl((void *)&_mh_execute_header, v8, v9, "Buddy Activate: Could not base64-decode escrowResponse", v13, 2u);
      }
      objc_storeStrong((id *)&v15, 0);
    }
    objc_storeStrong(&v38, 0);
    objc_storeStrong(&v39, 0);
  }
  else
  {
    os_log_t v12 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = (id)objc_opt_class();
      sub_10004BB7C((uint64_t)v42, (uint64_t)v10);
      _os_log_impl((void *)&_mh_execute_header, v12, v11, "Buddy Activate: Escrow response has wrong type, expecting string, got %{public}@", v42, 0xCu);
      objc_storeStrong(&v10, 0);
    }
    objc_storeStrong((id *)&v12, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)_handlePlanAddition:(id)a3
{
  os_log_t v25 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v23 = [location[0] objectForKeyedSubscript:@"eid"];
  id v22 = [location[0] objectForKeyedSubscript:@"iccid"];
  id v21 = [location[0] objectForKeyedSubscript:@"phoneNumber"];
  if (v23 && v22 && v21)
  {
    id v3 = objc_alloc((Class)CTCellularPlanProvisioningOnDeviceActivationRequest);
    id v18 = [location[0] objectForKeyedSubscript:@"sourceIccid"];
    id v4 = [location[0] objectForKeyedSubscript:@"UnusableIccid"];
    id v15 = [location[0] objectForKeyedSubscript:@"mcc"];
    id v17 = [location[0] objectForKeyedSubscript:@"mnc"];
    id v16 = [location[0] objectForKeyedSubscript:@"gid1"];
    id v5 = [location[0] objectForKeyedSubscript:@"gid2"];
    id v6 = [location[0] objectForKeyedSubscript:@"smdpAddress"];
    id v7 = [location[0] objectForKeyedSubscript:@"useDS"];
    unsigned __int8 v8 = [v7 BOOLValue];
    id v9 = [location[0] objectForKeyedSubscript:@"isESim"];
    id v10 = v5;
    LOBYTE(v14) = v8 & 1;
    BYTE1(v14) = [v9 BOOLValue] & 1;
    id v11 = [v3 initWithDetails:v23 installIccid:v22 sourceIccid:v18 unusableIccid:v4 phoneNumber:v21 mcc:v15 mnc:v17 gid1:v16 gid2:v5 smdp:v6 useDS:v14 esim:v13 flowType:@"ODA"];
    os_log_t v12 = [(ActivationController *)v25 miscState];
    [(BuddyMiscState *)v12 setActivationPlanRequest:v11];

    id v19 = [location[0] objectForKeyedSubscript:@"success"];
    if ([v19 BOOLValue])
    {
      BOOL v13 = [(ActivationController *)v25 miscState];
      [(BuddyMiscState *)v13 setSkipActivationForActivationPlanRequest:0];
    }
    else
    {
      BOOL v13 = [(ActivationController *)v25 miscState];
      [(BuddyMiscState *)v13 setSkipActivationForActivationPlanRequest:1];
    }

    objc_storeStrong(&v19, 0);
    int v20 = 0;
  }
  else
  {
    int v20 = 1;
  }
  objc_storeStrong(&v21, 0);
  objc_storeStrong(&v22, 0);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  SEL v46 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v44 = 0;
  objc_storeStrong(&v44, a4);
  os_log_t v43 = a5;
  id v42 = [v44 clientInfo];
  id v7 = [v42 objectForKeyedSubscript:@"carrierSelection"];
  LOBYTE(a4) = [v7 BOOLValue];

  if (a4)
  {
    v46->_cdmaSelectionActivation = 1;
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v40 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v8 = oslog;
      os_log_type_t v9 = v40;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Buddy Activate: carrierSelection.", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  char v37 = 0;
  BOOL v10 = 0;
  if (v43)
  {
    id v38 = [(RemoteUIController *)v46->_remoteUIController displayedPages];
    char v37 = 1;
    BOOL v10 = [v38 count] == 0;
  }
  if (v37) {

  }
  if (v10)
  {
    if (*v43 == 3)
    {
      os_log_t v36 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v35 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        id v11 = v36;
        os_log_type_t v12 = v35;
        sub_10004B24C(v34);
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "Activation: Server bug, got a replace with no pages", v34, 2u);
      }
      objc_storeStrong((id *)&v36, 0);
      *os_log_t v43 = 2;
    }
    if (*v43 == 4)
    {
      os_log_t v33 = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v13 = v33;
        os_log_type_t v14 = v32;
        sub_10004B24C(v31);
        _os_log_impl((void *)&_mh_execute_header, v13, v14, "Activation: Server bug, got a pop with no pages", v31, 2u);
      }
      objc_storeStrong((id *)&v33, 0);
      *os_log_t v43 = 0;
    }
  }
  if (v43 && *v43 == 1) {
    [(ActivationController *)v46 _dismissRemoteUI];
  }
  id v15 = v44;
  id v16 = [v42 objectForKey:@"agreeURL"];
  id v17 = (NSURL *)[v15 absoluteURLWithString:v16];
  id v18 = v17;
  char v29 = 0;
  if (v17)
  {
    id v19 = v17;
  }
  else
  {
    id v19 = [(ActivationController *)v46 agreeURL];
    id v30 = v19;
    char v29 = 1;
  }
  [(ActivationController *)v46 setAgreeURL:v19];
  if (v29) {

  }
  id v20 = v44;
  id v21 = [v42 objectForKey:@"disagreeURL"];
  id v22 = (NSURL *)[v20 absoluteURLWithString:v21];
  id v23 = v22;
  char v27 = 0;
  if (v22)
  {
    os_log_type_t v24 = v22;
  }
  else
  {
    os_log_type_t v24 = [(ActivationController *)v46 disagreeURL];
    os_log_type_t v28 = v24;
    char v27 = 1;
  }
  [(ActivationController *)v46 setDisagreeURL:v24];
  if (v27) {

  }
  os_log_t v25 = v46;
  id v26 = [v42 objectForKeyedSubscript:@"escrowResponse"];
  [(ActivationController *)v25 _handleEscrowResponse:v26];

  [(ActivationController *)v46 _handlePlanAddition:v42];
  [(RUIPage *)v46->_loadingPage setLoading:0];
  objc_storeStrong((id *)&v46->_loadingPage, 0);
  objc_storeStrong(&v42, 0);
  objc_storeStrong(&v44, 0);
  objc_storeStrong(location, 0);
}

- (void)_activateWithPasscode:(id)a3 fromObjectModel:(id)a4
{
  int v59 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v57 = 0;
  objc_storeStrong(&v57, a4);
  id v5 = v57;
  id v6 = [v57 clientInfo];
  id v7 = [v6 objectForKeyedSubscript:@"activationURL"];
  id v56 = [v5 absoluteURLWithString:v7];

  id v55 = (id)_BYLoggingFacility();
  os_log_type_t v54 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v55, OS_LOG_TYPE_DEFAULT))
  {
    sub_10004B238((uint64_t)buf, (uint64_t)v56);
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)v55, v54, "Buddy Activate: Got URL for Activation Lock endpoint: %@", buf, 0xCu);
  }
  objc_storeStrong(&v55, 0);
  if (v59->_escrowSessionKey && v59->_srpInitResponse && v59->_accountDSID && v56)
  {
    id v50 = (id)_BYLoggingFacility();
    os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = v50;
      os_log_type_t v11 = v49;
      sub_10004B24C(v48);
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Buddy Activate: Activating with passcode", v48, 2u);
    }
    objc_storeStrong(&v50, 0);
    [(SecureBackup *)v59->_secureBackup srpRecoveryUpdateDSID:v59->_accountDSID recoveryPassphrase:location[0]];
    id v47 = [(SecureBackup *)v59->_secureBackup srpRecoveryBlobFromSRPInitResponse:v59->_srpInitResponse];
    id v46 = [v47 base64EncodedStringWithOptions:0];
    os_log_type_t v12 = (SecureBackup *)objc_alloc_init((Class)SecureBackup);
    secureBackup = v59->_secureBackup;
    v59->_secureBackup = v12;

    id v45 = [(SecureBackup *)v59->_secureBackup srpInitNonce];
    id v44 = [v45 base64EncodedStringWithOptions:0];
    id v43 = objc_alloc_init((Class)FMDDeviceIdentityFactory);
    id v42 = +[NSMutableDictionary dictionary];
    if (v44) {
      [v42 setObject:v44 forKeyedSubscript:@"nonce"];
    }
    if (v46) {
      [v42 setObject:v46 forKeyedSubscript:@"blob"];
    }
    [v42 setObject:v59->_escrowSessionKey forKeyedSubscript:@"escrowSessionKey"];
    id v41 = @"passcodeActivation";
    [(ActivationController *)v59 startSpinningWithIdentifier:v41];
    os_log_type_t v40 = 0;
    id v39 = 0;
    id v14 = (id)_BYSignpostSubsystem();
    id v15 = (void *)_BYSignpostCreate();
    id v38 = v16;
    char v37 = v15;

    os_log_t log = (os_log_t)(id)_BYSignpostSubsystem();
    char v35 = 1;
    id v34 = v37;
    if (v37 && v34 != (void *)-1 && os_signpost_enabled(log))
    {
      id v17 = log;
      os_signpost_type_t v18 = v35;
      os_signpost_id_t v19 = (os_signpost_id_t)v34;
      sub_10004B24C(v33);
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, v18, v19, "ActivationFindMyIdentity", "", v33, 2u);
    }
    objc_storeStrong((id *)&log, 0);
    os_log_t oslog = (os_log_t)(id)_BYSignpostSubsystem();
    os_log_type_t v31 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_100046588((uint64_t)v60, (uint64_t)v37);
      _os_log_impl((void *)&_mh_execute_header, oslog, v31, "BEGIN [%lld]: ActivationFindMyIdentity ", v60, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v39 = v37;
    os_log_type_t v40 = v38;
    id v20 = v43;
    id v21 = v42;
    id v22 = _NSConcreteStackBlock;
    int v23 = -1073741824;
    int v24 = 0;
    os_log_t v25 = sub_1000BDF04;
    id v26 = &unk_1002B25A0;
    v30[1] = v37;
    v30[2] = v38;
    id v27 = v57;
    id v28 = v56;
    char v29 = v59;
    v30[0] = v41;
    [v20 identityForPasscodeActivationUnlockWithContext:v21 completion:&v22];
    objc_storeStrong(v30, 0);
    objc_storeStrong((id *)&v29, 0);
    objc_storeStrong(&v28, 0);
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
    objc_storeStrong(&v43, 0);
    objc_storeStrong(&v44, 0);
    objc_storeStrong(&v45, 0);
    objc_storeStrong(&v46, 0);
    objc_storeStrong(&v47, 0);
  }
  else
  {
    id v53 = (id)_BYLoggingFacility();
    os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v53, OS_LOG_TYPE_DEFAULT))
    {
      unsigned __int8 v8 = v53;
      os_log_type_t v9 = v52;
      sub_10004B24C(v51);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "Buddy Activate: Missing required data for passcode activation", v51, 2u);
    }
    objc_storeStrong(&v53, 0);
    [(ActivationController *)v59 _enterState:5];
  }
  objc_storeStrong(&v56, 0);
  objc_storeStrong(&v57, 0);
  objc_storeStrong(location, 0);
}

- (void)_setHandlerForPasscode
{
  os_log_type_t v11 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  remoteUIController = v11->_remoteUIController;
  id v4 = _NSConcreteStackBlock;
  int v5 = -1073741824;
  int v6 = 0;
  id v7 = sub_1000BE96C;
  unsigned __int8 v8 = &unk_1002B2468;
  objc_copyWeak(&v9, location);
  id v3 = [(RemoteUIController *)remoteUIController setHandlerForElementsMatching:&stru_1002B25E0 handler:&v4];
  objc_destroyWeak(&v9);
  objc_destroyWeak(location);
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  id v15 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v13 = 0;
  objc_storeStrong(&v13, a4);
  BOOL v12 = a5;
  v15->_hasPresentedRemoteUI = 1;
  [(NSMutableArray *)v15->_objectModels addObject:v13];
  id v7 = [v13 defaultPages];
  id v11 = [v7 firstObject];

  id v8 = [v11 attributes];
  id v9 = [v8 objectForKeyedSubscript:@"name"];
  unsigned __int8 v10 = [v9 isEqualToString:@"FMIPLockChallenge"];

  if (v10)
  {
    [(ActivationController *)v15 _startActivationLockExpirationTimerForPage:v11];
    [(ActivationController *)v15 _stashPasteboard];
  }
  objc_storeStrong(&v11, 0);
  objc_storeStrong(&v13, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didRemoveObjectModel:(id)a4
{
  BOOL v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  id v5 = [v10 defaultPages];
  int v6 = (RUIPage *)[v5 firstObject];
  activationLockPage = v12->_activationLockPage;

  if (v6 == activationLockPage)
  {
    [(ActivationController *)v12 _stopActivationLockExpirationTimer];
    [(ActivationController *)v12 _restorePasteboard];
  }
  id v9 = 0;
  id v9 = [(NSMutableArray *)v12->_objectModels indexOfObject:v10];
  if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      sub_10004B238((uint64_t)buf, (uint64_t)v10);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: RUI removed an object model that is not on our stack: %@", buf, 0xCu);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    [(NSMutableArray *)v12->_objectModels removeObjectAtIndex:v9];
  }
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  if (v14)
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      char v10 = 0;
      char v8 = 0;
      if (_BYIsInternalInstall())
      {
        id v7 = (NSString *)v14;
      }
      else if (v14)
      {
        id v11 = [v14 domain];
        char v10 = 1;
        id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v11, [v14 code]);
        id v9 = v7;
        char v8 = 1;
      }
      else
      {
        id v7 = 0;
      }
      sub_10004BB7C((uint64_t)buf, (uint64_t)v7);
      _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: RUILoader didFailWithError: %{public}@", buf, 0xCu);
      if (v8) {

      }
      if (v10) {
    }
      }
    objc_storeStrong((id *)&oslog, 0);
    [(ActivationController *)v16 _enterState:5];
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)_userAgreedToTCs:(BOOL)a3
{
  id v13 = self;
  SEL v12 = a2;
  BOOL v11 = a3;
  char v8 = 0;
  char v6 = 0;
  if (a3)
  {
    id v3 = [(ActivationController *)v13 agreeURL];
    id v9 = v3;
    char v8 = 1;
  }
  else
  {
    id v3 = [(ActivationController *)v13 disagreeURL];
    id v7 = v3;
    char v6 = 1;
  }
  id v10 = v3;
  if (v6) {

  }
  if (v8) {
  id location = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v10 cachePolicy:1 timeoutInterval:30.0];
  }
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    sub_10006E000((uint64_t)buf, v11, (uint64_t)v10);
    _os_log_impl((void *)&_mh_execute_header, oslog, OS_LOG_TYPE_DEFAULT, "Buddy Activate: T&C request %d for URL %@", buf, 0x12u);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(ActivationController *)v13 startRequest:location completion:0];
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v10, 0);
}

- (BuddyMiscState)miscState
{
  return self->_miscState;
}

- (void)setMiscState:(id)a3
{
}

- (BuddyNetworkProvider)networkProvider
{
  return self->_networkProvider;
}

- (void)setNetworkProvider:(id)a3
{
}

- (BuddySystemTimeUpdateManager)systemTimeUpdateManager
{
  return self->_systemTimeUpdateManager;
}

- (void)setSystemTimeUpdateManager:(id)a3
{
}

- (NSURL)activationURL
{
  return self->_activationURL;
}

- (void)setActivationURL:(id)a3
{
}

- (NSString)contentType
{
  return self->_contentType;
}

- (void)setContentType:(id)a3
{
}

- (NSURL)agreeURL
{
  return self->_agreeURL;
}

- (void)setAgreeURL:(id)a3
{
}

- (NSURL)disagreeURL
{
  return self->_disagreeURL;
}

- (void)setDisagreeURL:(id)a3
{
}

- (BOOL)cdmaSelectionActivation
{
  return self->_cdmaSelectionActivation;
}

- (BYAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
}

- (MCProfileConnection)managedConfiguration
{
  return self->_managedConfiguration;
}

- (void)setManagedConfiguration:(id)a3
{
}

- (BuddyActivationState)activationState
{
  return self->_activationState;
}

- (void)setActivationState:(id)a3
{
}

- (void).cxx_destruct
{
}

@end