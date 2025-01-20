@interface APUISetupViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (BOOL)isMultipleWifiFeatureEnabled;
+ (id)_localizedSystemWiFiString;
- (AirPlayAlertViewController)airPlayAlertController;
- (AirPlayProxCardViewController)completedProxCardController;
- (AirPlayProxCardViewController)connectingProxCardController;
- (AirPlayProxCardViewController)setupProxCardController;
- (BOOL)_canShowWhileLocked;
- (BOOL)shouldSkipInvalidateOnProxCardFlowDidDismiss;
- (UIButton)pinPairingButton;
- (UINavigationController)proxCardNavigationController;
- (void)_connectToAirPlayReceiverWithDeviceID:(id)a3 andSetupPayload:(id)a4;
- (void)_getSupportedNetworks:(id)a3 withSetupPayload:(id)a4 completion:(id)a5;
- (void)_initializeAirPlayConnectionProxCardManagerWithSetupPayload:(id)a3 andCompletion:(id)a4;
- (void)_initializeSetupCompletionProxCardManagerWithSetupPayload:(id)a3 isAirPlaySetUp:(BOOL)a4 andCompletion:(id)a5;
- (void)_joinWiFiAndConnectToReceiverWithSetupPayload:(id)a3;
- (void)_performBrokerAuthenticationWithSetupPayload:(id)a3 switchWiFiIfFailed:(BOOL)a4;
- (void)_presentAirPlayConnectionProxCardWithSetupPayload:(id)a3;
- (void)_presentInvalidCodeAlertWithSetupPayload:(id)a3;
- (void)_presentProxCardFlowForLaunchType:(int64_t)a3 andSetupPayload:(id)a4;
- (void)_presentSetupCompletedProxCard:(id)a3 isAirPlaySetUp:(BOOL)a4;
- (void)_presentUnableToConnectToDeviceAlertWithSetupPayload:(id)a3;
- (void)_presentUnableToConnectToWiFiAlertWithSetupPayload:(id)a3;
- (void)_setUpByURL:(id)a3;
- (void)_setupAirPlayConnectingProxCardManagerWithSetupPayload:(id)a3 withTitle:(id)a4 withSubTitle:(id)a5 withImageName:(id)a6 andCompletion:(id)a7;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)proxCardFlowDidDismiss;
- (void)proxCardFlowWillPresent;
- (void)setAirPlayAlertController:(id)a3;
- (void)setCompletedProxCardController:(id)a3;
- (void)setConnectingProxCardController:(id)a3;
- (void)setPinPairingButton:(id)a3;
- (void)setProxCardNavigationController:(id)a3;
- (void)setSetupProxCardController:(id)a3;
- (void)setShouldSkipInvalidateOnProxCardFlowDidDismiss:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation APUISetupViewController

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)APUISetupViewController;
  [(APUISetupViewController *)&v21 viewDidLoad];
  uint64_t IntWithDefault = APSSettingsGetIntWithDefault();
  if (IntWithDefault)
  {
    uint64_t v4 = IntWithDefault;
    id v5 = [objc_alloc((Class)AVOutputDeviceDiscoverySession) initWithDeviceFeatures:8];
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v15 = v4;
      id v16 = v5;
      v14 = self;
      LogPrintF();
    }
    [v5 setDiscoveryMode:3 v14, v15, v16];
    objc_initWeak(&location, self);
    dispatch_time_t v6 = dispatch_time(0, 1000000000 * (int)v4);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100009B80;
    block[3] = &unk_100018878;
    objc_copyWeak(&v19, &location);
    id v7 = v5;
    id v18 = v7;
    dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, block);
    discoverySession = self->_discoverySession;
    self->_discoverySession = (AVOutputDeviceDiscoverySession *)v7;
    id v9 = v7;

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  [(APUISetupViewController *)self setShouldSkipInvalidateOnProxCardFlowDidDismiss:0];
  v10 = +[APUIConnectivityManager sharedInstance];
  [v10 startMonitoringWiFiInterfaceChange];

  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
  {
    v14 = self;
    LogPrintF();
  }
  v11 = +[APUIConnectivityManager sharedInstance];
  [v11 enableCaptiveWebsheet:0];

  v12 = (APUIRouteManager *)objc_opt_new();
  routeManager = self->_routeManager;
  self->_routeManager = v12;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)APUISetupViewController;
  [(APUISetupViewController *)&v4 viewWillDisappear:a3];
  [(APUISetupViewController *)self invalidate];
}

- (void)invalidate
{
  discoverySession = self->_discoverySession;
  if (discoverySession)
  {
    if (dword_10001EDE8 <= 50)
    {
      if (dword_10001EDE8 != -1 || (int v4 = _LogCategory_Initialize(), discoverySession = self->_discoverySession, v4))
      {
        id v9 = self;
        v10 = discoverySession;
        LogPrintF();
        discoverySession = self->_discoverySession;
      }
    }
    -[AVOutputDeviceDiscoverySession setDiscoveryMode:](discoverySession, "setDiscoveryMode:", 0, v9, v10);
    id v5 = self->_discoverySession;
    self->_discoverySession = 0;
  }
  dispatch_time_t v6 = +[APUIConnectivityManager sharedInstance];
  [v6 stopMonitoringWiFiInterfaceChange];

  id v11 = [(APUISetupViewController *)self _remoteViewControllerProxy];
  [v11 invalidate];
  id v7 = +[APUIConnectivityManager sharedInstance];
  [v7 enableCaptiveWebsheet:1];

  [(APUIRouteManager *)self->_routeManager invalidate];
  routeManager = self->_routeManager;
  self->_routeManager = 0;

  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_setupAirPlayConnectingProxCardManagerWithSetupPayload:(id)a3 withTitle:(id)a4 withSubTitle:(id)a5 withImageName:(id)a6 andCompletion:(id)a7
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  v13 = [AirPlayProxCardViewController alloc];
  v14 = +[UIColor systemGrayColor];
  uint64_t v15 = [(AirPlayProxCardViewController *)v13 initWithTitle:v12 subTitle:v11 imageName:v10 tintColor:v14 shouldAnimate:0 actionTitle:0 bottomSubtitle:0 completion:&stru_1000188B8];

  [(APUISetupViewController *)self setConnectingProxCardController:v15];
  id v18 = [(APUISetupViewController *)self connectingProxCardController];
  id v16 = +[NSBundle mainBundle];
  v17 = [v16 localizedStringForKey:@"AirPlaySenderUI_Action_Connecting" value:&stru_100018E60 table:0];
  [v18 showActivityIndicatorWithStatus:v17];
}

- (void)_initializeAirPlayConnectionProxCardManagerWithSetupPayload:(id)a3 andCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"AirPlaySenderUI_AirPlayConnect_Title" value:&stru_100018E60 table:0];

  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"AirPlaySenderUI_AirPlayConnect_Subtitle" value:&stru_100018E60 table:0];
  id v11 = [v5 wifiSSID];
  id v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v11);

  v20 = [AirPlayProxCardViewController alloc];
  v13 = +[UIColor systemGrayColor];
  v14 = +[NSBundle mainBundle];
  uint64_t v15 = [v14 localizedStringForKey:@"AirPlaySenderUI_Action_Continue" value:&stru_100018E60 table:0];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000A198;
  v23[3] = &unk_1000188E0;
  v23[4] = self;
  id v24 = v5;
  id v25 = v8;
  id v26 = v12;
  v27 = @"tv.badge.wifi";
  id v28 = v6;
  id v21 = v6;
  id v16 = v12;
  id v17 = v8;
  id v18 = v5;
  id v19 = [(AirPlayProxCardViewController *)v20 initWithTitle:v17 subTitle:v16 imageName:@"tv.badge.wifi" tintColor:v13 shouldAnimate:0 actionTitle:v15 bottomSubtitle:0 completion:v23];
  [(APUISetupViewController *)self setSetupProxCardController:v19];
}

- (void)_initializeSetupCompletionProxCardManagerWithSetupPayload:(id)a3 isAirPlaySetUp:(BOOL)a4 andCompletion:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = +[APUIConnectivityManager sharedInstance];
  uint64_t v10 = [v9 currentNetworkSSID];

  id v11 = +[NSBundle mainBundle];
  v31 = [v11 localizedStringForKey:@"AirPlaySenderUI_AirPlayCompleted_Title" value:&stru_100018E60 table:0];

  BOOL v12 = [v7 routeToReceiver] | v6;
  v13 = +[NSBundle mainBundle];
  v14 = v13;
  if (v12) {
    CFStringRef v15 = @"AirPlaySenderUI_AirPlaySetupCompleted_Subtitle";
  }
  else {
    CFStringRef v15 = @"AirPlaySenderUI_WiFiSetupCompleted_Subtitle";
  }
  id v16 = [v13 localizedStringForKey:v15 value:&stru_100018E60 table:0];
  v33 = (void *)v10;
  id v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v10);

  id v18 = +[NSBundle mainBundle];
  id v19 = [v18 localizedStringForKey:@"AirPlaySenderUI_Action_Done" value:&stru_100018E60 table:0];

  v20 = +[NSBundle mainBundle];
  id v21 = [v20 localizedStringForKey:@"AirPlaySenderUI_UnableToConnect_HelpContact_FrontDesk" value:&stru_100018E60 table:0];

  if (v6)
  {
    v22 = 0;
    v23 = @"checkmark";
  }
  else
  {
    if ([v7 routeToReceiver])
    {
      v22 = 0;
    }
    else
    {
      id v24 = +[NSBundle mainBundle];
      id v25 = [v24 localizedStringForKey:@"AirPlaySenderUI_UnableToSetUpAirPlay_BottomSubTitle" value:&stru_100018E60 table:0];
      v22 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, v21);
    }
    v23 = @"wifi";
  }
  id v26 = v23;
  v27 = [AirPlayProxCardViewController alloc];
  if (v6) {
    +[UIColor systemGreenColor];
  }
  else {
  id v28 = +[UIColor systemGrayColor];
  }
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10000A560;
  v34[3] = &unk_100018908;
  id v35 = v8;
  id v29 = v8;
  v30 = [(AirPlayProxCardViewController *)v27 initWithTitle:v31 subTitle:v17 imageName:v26 tintColor:v28 shouldAnimate:v6 actionTitle:v19 bottomSubtitle:v22 completion:v34];

  [(APUISetupViewController *)self setCompletedProxCardController:v30];
}

+ (id)_localizedSystemWiFiString
{
  v2 = SFLocalizableWAPIStringKeyForKey();
  v3 = +[NSBundle mainBundle];
  int v4 = [v3 localizedStringForKey:v2 value:&stru_100018E60 table:0];

  return v4;
}

- (void)_presentUnableToConnectToWiFiAlertWithSetupPayload:(id)a3
{
  id v3 = a3;
  int v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"AirPlaySenderUI_UnableToConnect_WiFi_Title" value:&stru_100018E60 table:0];
  BOOL v6 = [v3 wifiSSID];
  id v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v5, v6);

  id v8 = +[APUISetupViewController _localizedSystemWiFiString];
  id v9 = +[NSBundle mainBundle];
  uint64_t v10 = [v9 localizedStringForKey:@"AirPlaySenderUI_UnableToConnect_WiFi_Subtitle" value:&stru_100018E60 table:0];
  id v11 = [v3 wifiSSID];

  BOOL v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v8, v11);

  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"AirPlaySenderUI_UnableToConnect_WiFi_Action" value:&stru_100018E60 table:0];
  CFStringRef v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v8);

  id v16 = +[NSBundle mainBundle];
  id v17 = [v16 localizedStringForKey:@"AirPlaySenderUI_Action_Dismiss" value:&stru_100018E60 table:0];

  v28[0] = v15;
  v28[1] = v17;
  +[NSArray arrayWithObjects:v28 count:2];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000A8C8;
  block[3] = &unk_100018958;
  void block[4] = self;
  id v24 = v7;
  id v25 = v12;
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  id v27 = v15;
  id v18 = v15;
  id v19 = v26;
  id v20 = v12;
  id v21 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_presentUnableToConnectToDeviceAlertWithSetupPayload:(id)a3
{
  int v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"AirPlaySenderUI_UnableToConnect_Title" value:&stru_100018E60 table:0];

  BOOL v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"AirPlaySenderUI_UnableToConnect_HelpContact_FrontDesk" value:&stru_100018E60 table:0];

  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"AirPlaySenderUI_UnableToConnect_Device_Subtitle" value:&stru_100018E60 table:0];
  uint64_t v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);

  id v11 = +[NSBundle mainBundle];
  BOOL v12 = [v11 localizedStringForKey:@"AirPlaySenderUI_Action_Dismiss" value:&stru_100018E60 table:0];

  id v20 = v12;
  +[NSArray arrayWithObjects:&v20 count:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000ADE8;
  block[3] = &unk_1000189A8;
  void block[4] = self;
  id v17 = v5;
  id v18 = v10;
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v19;
  id v14 = v10;
  id v15 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_presentInvalidCodeAlertWithSetupPayload:(id)a3
{
  int v4 = +[NSBundle mainBundle];
  id v5 = [v4 localizedStringForKey:@"AirPlaySenderUI_UnableToConnect_Title" value:&stru_100018E60 table:0];

  BOOL v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"AirPlaySenderUI_UnableToConnect_InvalidQRCode_Subtitle" value:&stru_100018E60 table:0];

  id v8 = +[NSBundle mainBundle];
  id v9 = [v8 localizedStringForKey:@"AirPlaySenderUI_Action_Dismiss" value:&stru_100018E60 table:0];

  id v17 = v9;
  +[NSArray arrayWithObjects:&v17 count:1];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000B1C8;
  v13[3] = &unk_1000189A8;
  v13[4] = self;
  id v14 = v5;
  id v15 = v7;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v16;
  id v11 = v7;
  id v12 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
}

- (void)_presentProxCardFlowForLaunchType:(int64_t)a3 andSetupPayload:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  id v8 = v6;
  if (dword_10001EDE8 <= 50)
  {
    if (dword_10001EDE8 != -1 || (id v6 = (id)_LogCategory_Initialize(), v7 = v8, v6))
    {
      id v6 = (id)LogPrintF();
      id v7 = v8;
    }
  }
  if (!v7 && dword_10001EDE8 <= 90)
  {
    if (dword_10001EDE8 != -1 || (id v6 = (id)_LogCategory_Initialize(), v6)) {
      id v6 = (id)LogPrintF();
    }
  }
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3)
    {
      if (dword_10001EDE8 <= 50)
      {
        if (dword_10001EDE8 != -1 || (id v6 = (id)_LogCategory_Initialize(), v6)) {
          id v6 = (id)LogPrintF();
        }
      }
    }
    else
    {
      id v6 = [(APUISetupViewController *)self _setUpByURL:v8];
    }
  }

  _objc_release_x2(v6);
}

- (void)_setUpByURL:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 wifiSSID];
  if (v4
    && (id v5 = (void *)v4,
        [v8 wifiSSID],
        id v6 = objc_claimAutoreleasedReturnValue(),
        id v7 = [v6 length],
        v6,
        v5,
        v7))
  {
    [(APUISetupViewController *)self _presentAirPlayConnectionProxCardWithSetupPayload:v8];
  }
  else if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_joinWiFiAndConnectToReceiverWithSetupPayload:(id)a3
{
  id v4 = a3;
  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
  {
    id v11 = self;
    LogPrintF();
  }
  id v5 = +[APUIConnectivityManager sharedInstance];
  id v6 = [v4 wifiSSID];
  id v7 = [v4 isNetworkHidden];
  id v8 = [v4 wifiPassphrase];
  id v9 = [v4 captivePortalAuthToken];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000B7F0;
  v12[3] = &unk_1000189D0;
  v12[4] = self;
  id v13 = v4;
  id v10 = v4;
  [v5 joinWiFiNetworkWithSSID:v6 isNetworkHidden:v7 passPhrase:v8 captivePortalAuthToken:v9 completion:v12];
}

- (void)_getSupportedNetworks:(id)a3 withSetupPayload:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void, void))v10;
  if (v8)
  {
    id v12 = [v9 wifiSSID];
    unsigned int v13 = [v12 isEqualToString:v8];

    if (v13)
    {
      if (v11) {
        v11[2](v11, 1);
      }
    }
    else
    {
      id v14 = +[APUIBrokerHelper sharedInstance];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10000BB68;
      v15[3] = &unk_1000189F8;
      v15[4] = self;
      id v17 = v11;
      id v16 = v8;
      [v14 getBrokerGroupInfo:0 completion:v15];
    }
  }
  else if (v10)
  {
    (*((void (**)(id, void))v10 + 2))(v10, 0);
  }
}

- (void)_performBrokerAuthenticationWithSetupPayload:(id)a3 switchWiFiIfFailed:(BOOL)a4
{
  id v6 = a3;
  id v7 = +[APUIBrokerHelper sharedInstance];
  id v8 = [v6 brokerToken];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000BE30;
  v10[3] = &unk_100018A20;
  BOOL v12 = a4;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [v7 performBrokerAuthenticationForBrokerGroup:0 withBrokerAuth:v8 completion:v10];
}

- (void)_connectToAirPlayReceiverWithDeviceID:(id)a3 andSetupPayload:(id)a4
{
  id v6 = a4;
  routeManager = self->_routeManager;
  id v8 = a3;
  id v9 = [v6 receiverToken];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000C25C;
  v12[3] = &unk_1000189D0;
  uint64_t v10 = [v6 routeToReceiver] ^ 1;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(APUIRouteManager *)routeManager pickRouteWithRouteID:v8 authString:v9 useRemoteControl:v10 completion:v12];
}

- (void)_presentAirPlayConnectionProxCardWithSetupPayload:(id)a3
{
  id v4 = a3;
  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000C618;
  v10[3] = &unk_100018A70;
  id v5 = v4;
  id v11 = v5;
  BOOL v12 = self;
  [(APUISetupViewController *)self _initializeAirPlayConnectionProxCardManagerWithSetupPayload:v5 andCompletion:v10];
  id v6 = [(APUISetupViewController *)self setupProxCardController];

  if (v6)
  {
    id v7 = [(APUISetupViewController *)self setupProxCardController];
    id v8 = +[PRXFlowConfiguration defaultConfiguration];
    id v9 = [(APUISetupViewController *)self presentProxCardFlowWithDelegate:self initialViewController:v7 configuration:v8];
    [(APUISetupViewController *)self setProxCardNavigationController:v9];
  }
}

- (void)_presentSetupCompletedProxCard:(id)a3 isAirPlaySetUp:(BOOL)a4
{
  id v6 = a3;
  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CB00;
  block[3] = &unk_100018AC0;
  void block[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)proxCardFlowWillPresent
{
  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)proxCardFlowDidDismiss
{
  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v5 = (void (**)(void))a4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CEF8;
  v7[3] = &unk_100018A98;
  v7[4] = self;
  id v6 = [(APUISetupViewController *)self _remoteViewControllerProxyWithErrorHandler:v7];
  [v6 setReachabilityDisabled:1];
  [v6 setAllowsAlertStacking:0];
  [v6 setAllowsBanners:1];
  [v6 setAllowsAlertItems:1];
  [v6 setAllowsControlCenter:1];
  [v6 setAllowsSiri:1];
  [v6 setAllowsMenuButtonDismissal:1];
  if (v5) {
    v5[2](v5);
  }
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10000D244;
  v18[3] = &unk_100018A98;
  v18[4] = self;
  id v7 = a3;
  id v8 = [(APUISetupViewController *)self _remoteViewControllerProxyWithErrorHandler:v18];
  id v9 = [v7 userInfo];

  BOOL v10 = [v9 objectForKey:@"setupPayload"];

  uint64_t v11 = objc_opt_class();
  id v17 = 0;
  BOOL v12 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v11 fromData:v10 error:&v17];
  id v13 = v17;
  if (v12)
  {
    [v8 setStatusBarHidden:1 withDuration:0.4];
    if (v6) {
      v6[2](v6);
    }
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
      -[APUISetupViewController _presentProxCardFlowForLaunchType:andSetupPayload:](self, "_presentProxCardFlowForLaunchType:andSetupPayload:", 0, v12, self, 0, v12);
    }
    else
    {
      -[APUISetupViewController _presentProxCardFlowForLaunchType:andSetupPayload:](self, "_presentProxCardFlowForLaunchType:andSetupPayload:", 0, v12, v14, v15, v16);
    }
  }
  else
  {
    if (dword_10001EDE8 <= 90 && (dword_10001EDE8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (v13 && dword_10001EDE8 <= 90 && (dword_10001EDE8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

+ (BOOL)isMultipleWifiFeatureEnabled
{
  return APSSettingsIsFeatureEnabled() != 0;
}

- (UIButton)pinPairingButton
{
  return self->_pinPairingButton;
}

- (void)setPinPairingButton:(id)a3
{
}

- (BOOL)shouldSkipInvalidateOnProxCardFlowDidDismiss
{
  return self->_shouldSkipInvalidateOnProxCardFlowDidDismiss;
}

- (void)setShouldSkipInvalidateOnProxCardFlowDidDismiss:(BOOL)a3
{
  self->_shouldSkipInvalidateOnProxCardFlowDidDismiss = a3;
}

- (AirPlayAlertViewController)airPlayAlertController
{
  return (AirPlayAlertViewController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAirPlayAlertController:(id)a3
{
}

- (UINavigationController)proxCardNavigationController
{
  return (UINavigationController *)objc_getProperty(self, a2, 48, 1);
}

- (void)setProxCardNavigationController:(id)a3
{
}

- (AirPlayProxCardViewController)setupProxCardController
{
  return (AirPlayProxCardViewController *)objc_getProperty(self, a2, 56, 1);
}

- (void)setSetupProxCardController:(id)a3
{
}

- (AirPlayProxCardViewController)connectingProxCardController
{
  return (AirPlayProxCardViewController *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConnectingProxCardController:(id)a3
{
}

- (AirPlayProxCardViewController)completedProxCardController
{
  return (AirPlayProxCardViewController *)objc_getProperty(self, a2, 72, 1);
}

- (void)setCompletedProxCardController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedProxCardController, 0);
  objc_storeStrong((id *)&self->_connectingProxCardController, 0);
  objc_storeStrong((id *)&self->_setupProxCardController, 0);
  objc_storeStrong((id *)&self->_proxCardNavigationController, 0);
  objc_storeStrong((id *)&self->_airPlayAlertController, 0);
  objc_storeStrong((id *)&self->_pinPairingButton, 0);
  objc_storeStrong((id *)&self->_routeManager, 0);

  objc_storeStrong((id *)&self->_discoverySession, 0);
}

@end