@interface PHAudioCallControlsViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)controlTypeIsEnabled:(unint64_t)a3;
- (BOOL)controlTypeIsSelected:(unint64_t)a3;
- (BOOL)enabled;
- (BOOL)hasActiveAndIncomingCallPresent;
- (BOOL)isContactStoreAuthorized;
- (BOOL)isEnabled;
- (BOOL)multipleCallsArePresent;
- (BOOL)updatesPaused;
- (CNKFeatures)features;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (NSArray)buttonsForAmbientTransition;
- (NSObject)screenSharingButtonViewModelObserver;
- (PHAudioCallControlArrangement)controlArrangement;
- (PHAudioCallControlArrangement)currentArrangement;
- (PHAudioCallControlsView)controlsView;
- (PHAudioCallControlsViewController)initWithCallDisplayStyleManager:(id)a3;
- (PHAudioCallControlsViewControllerDelegate)delegate;
- (PHScreenSharingButtonViewModel)getScreenSharingButtonViewModel;
- (TUCallCenter)callCenter;
- (TUCallContainerPrivate)callContainer;
- (TURoute)lastPickedRoute;
- (id)audioRouteMenu;
- (id)currentArrangementWithSenderIdentityClient:(id)a3;
- (id)endCallButton;
- (id)imageForControlType:(unint64_t)a3;
- (id)speakerphoneTipReferenceButton;
- (id)titleForControlType:(unint64_t)a3;
- (int)proximitySensorNotificationToken;
- (unint64_t)controlTypeAtRow:(unint64_t)a3 column:(unint64_t)a4;
- (unint64_t)numberOfColumnsInControlsView:(id)a3;
- (unint64_t)numberOfRowsInControlsView:(id)a3;
- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4;
- (void)callIsOnHoldChangedNotification:(id)a3;
- (void)callModelChangedNotification:(id)a3;
- (void)callStatusChangedNotification:(id)a3;
- (void)conferenceParticipantCallsChangedNotification:(id)a3;
- (void)controlTypeLongPressed:(unint64_t)a3;
- (void)controlTypeShortPressed:(unint64_t)a3;
- (void)controlTypeTapped:(unint64_t)a3 forView:(id)a4;
- (void)dealloc;
- (void)faceTimeIDStatusChangedNotification:(id)a3;
- (void)fetchAudioRoutesImageWithCompletion:(id)a3;
- (void)handleMutedTalkerBannerTap;
- (void)handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3;
- (void)handleTUCallTTYTypeChangedNotification:(id)a3;
- (void)loadView;
- (void)openMessagesForCall:(id)a3;
- (void)proximityStateChanged;
- (void)routesChangedForRouteController:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setCallContainer:(id)a3;
- (void)setContactStoreAuthorized:(BOOL)a3;
- (void)setControlArrangement:(id)a3;
- (void)setControlsView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setLastPickedRoute:(id)a3;
- (void)setProximitySensorNotificationToken:(int)a3;
- (void)setScreenSharingButtonViewModel:(id)a3;
- (void)setScreenSharingButtonViewModelObserver:(id)a3;
- (void)setUpdatesPaused:(BOOL)a3;
- (void)tipKitStartObservation;
- (void)tipKitStopObservation;
- (void)updateControls;
- (void)uplinkStateChangedNotification:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PHAudioCallControlsViewController

- (PHAudioCallControlsViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PHAudioCallControlsViewController;
  v6 = [(PHAudioCallControlsViewController *)&v16 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    v7->_contactStoreAuthorized = +[CNContactStore phoneKit_isAuthorized];
    uint64_t v8 = +[CNKFeatures sharedInstance];
    features = v7->_features;
    v7->_features = (CNKFeatures *)v8;

    v7->_updatesPaused = 0;
    v7->_proximitySensorNotificationToken = 0;
    v10 = +[TUCallCenter sharedInstance];
    [(PHAudioCallControlsViewController *)v7 setCallCenter:v10];

    v11 = [(PHAudioCallControlsViewController *)v7 callCenter];
    v12 = [v11 routeController];
    [v12 addDelegate:v7];

    v13 = [(PHAudioCallControlsViewController *)v7 callCenter];
    [(PHAudioCallControlsViewController *)v7 setCallContainer:v13];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v7 selector:"callStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v14 addObserver:v7 selector:"callStatusChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
    [v14 addObserver:v7 selector:"callIsOnHoldChangedNotification:" name:TUCallIsOnHoldChangedNotification object:0];
    [v14 addObserver:v7 selector:"conferenceParticipantCallsChangedNotification:" name:TUCallCenterConferenceParticipantsChangedNotification object:0];
    [v14 addObserver:v7 selector:"callModelChangedNotification:" name:TUCallModelChangedNotification object:0];
    [v14 addObserver:v7 selector:"faceTimeIDStatusChangedNotification:" name:TUCallFaceTimeIDStatusChangedNotification object:0];
    [v14 addObserver:v7 selector:"uplinkStateChangedNotification:" name:TUCallIsUplinkMutedChangedNotification object:0];
    [v14 addObserver:v7 selector:"handleTUCallSupportsTTYWithVoiceChangedNotification:" name:TUCallSupportsTTYWithVoiceChangedNotification object:0];
    [v14 addObserver:v7 selector:"handleTUCallTTYTypeChangedNotification:" name:TUCallTTYTypeChangedNotification object:0];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallControlsViewController;
  [(PHAudioCallControlsViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = [PHAudioCallControlsView alloc];
  objc_super v4 = [(PHAudioCallControlsViewController *)self callDisplayStyleManager];
  id v5 = [(PHAudioCallControlsView *)v3 initWithCallDisplayStyleManager:v4];
  controlsView = self->_controlsView;
  self->_controlsView = v5;

  [(PHAudioCallControlsView *)self->_controlsView setDelegate:self];
  v7 = self->_controlsView;

  [(PHAudioCallControlsViewController *)self setView:v7];
}

- (id)speakerphoneTipReferenceButton
{
  v3 = [(PHAudioCallControlsViewController *)self controlsView];
  id v4 = [v3 buttonForControlType:2];

  if ((v4
     || ([(PHAudioCallControlsViewController *)self controlsView],
         id v5 = objc_claimAutoreleasedReturnValue(),
         [v5 buttonForControlType:3],
         id v4 = (id)objc_claimAutoreleasedReturnValue(),
         v5,
         v4))
    && [v4 state] != (id)4
    && [v4 state] != (id)2)
  {
    id v4 = v4;
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)endCallButton
{
  v2 = [(PHAudioCallControlsViewController *)self controlsView];
  v3 = [v2 buttonForControlType:15];

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHAudioCallControlsViewController;
  [(PHAudioCallControlsViewController *)&v6 viewDidAppear:a3];
  id v4 = [(PHAudioCallControlsViewController *)self callDisplayStyleManager];
  id v5 = [v4 callDisplayStyle];

  if (v5 == (id)2) {
    [(PHAudioCallControlsViewController *)self tipKitStartObservation];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHAudioCallControlsViewController;
  [(PHAudioCallControlsViewController *)&v4 viewWillDisappear:a3];
  [(PHAudioCallControlsViewController *)self tipKitStopObservation];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PHScreenSharingButtonViewModel)getScreenSharingButtonViewModel
{
  screenSharingButtonViewModel = self->_screenSharingButtonViewModel;
  if (!screenSharingButtonViewModel) {
    goto LABEL_3;
  }
  objc_super v4 = [(PHScreenSharingButtonViewModel *)screenSharingButtonViewModel callUUID];
  id v5 = [(PHAudioCallControlsViewController *)self callCenter];
  objc_super v6 = [v5 frontmostCall];
  v7 = [v6 callUUID];

  if (v4 == v7)
  {
    v20 = self->_screenSharingButtonViewModel;
  }
  else
  {
LABEL_3:
    uint64_t v8 = [(PHAudioCallControlsViewController *)self callCenter];
    v9 = [v8 frontmostCall];

    v10 = sub_1000D5130();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Creating new PHScreenSharingButtonViewModel", (uint8_t *)buf, 2u);
      }

      v12 = [PHScreenSharingButtonViewModel alloc];
      v13 = [(PHAudioCallControlsViewController *)self callCenter];
      v14 = [v13 frontmostCall];
      v15 = [(PHAudioCallControlsViewController *)self callCenter];
      objc_super v16 = [(PHScreenSharingButtonViewModel *)v12 initWithCall:v14 callCenter:v15];
      v17 = self->_screenSharingButtonViewModel;
      self->_screenSharingButtonViewModel = v16;

      objc_initWeak(buf, self);
      v18 = self->_screenSharingButtonViewModel;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10010E6DC;
      v22[3] = &unk_1002D0CF8;
      objc_copyWeak(&v23, buf);
      v19 = [(PHScreenSharingButtonViewModel *)v18 listenWith:v22];
      [(PHAudioCallControlsViewController *)self setScreenSharingButtonViewModelObserver:v19];

      v20 = self->_screenSharingButtonViewModel;
      objc_destroyWeak(&v23);
      objc_destroyWeak(buf);
    }
    else
    {
      if (v11)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not creating new PHScreenSharingButtonViewModel because fontmostCall is nil", (uint8_t *)buf, 2u);
      }

      v20 = 0;
    }
  }

  return v20;
}

- (void)callStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHAudioCallControlsViewController *)self updateControls];
}

- (void)callIsOnHoldChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHAudioCallControlsViewController *)self updateControls];
}

- (void)conferenceParticipantCallsChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHAudioCallControlsViewController *)self updateControls];
}

- (void)faceTimeIDStatusChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHAudioCallControlsViewController *)self updateControls];
}

- (void)callModelChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHAudioCallControlsViewController *)self updateControls];
}

- (void)uplinkStateChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHAudioCallControlsViewController *)self updateControls];
}

- (void)handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHAudioCallControlsViewController *)self updateControls];
}

- (void)handleTUCallTTYTypeChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = objc_opt_class();
    id v7 = v6;
    uint64_t v8 = [v4 name];
    int v9 = 138412546;
    v10 = v6;
    __int16 v11 = 2112;
    v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHAudioCallControlsViewController *)self updateControls];
}

- (unint64_t)numberOfRowsInControlsView:(id)a3
{
  v3 = [(PHAudioCallControlsViewController *)self currentArrangement];
  id v4 = [v3 rows];

  return (unint64_t)v4;
}

- (unint64_t)numberOfColumnsInControlsView:(id)a3
{
  v3 = [(PHAudioCallControlsViewController *)self currentArrangement];
  id v4 = [v3 columns];

  return (unint64_t)v4;
}

- (unint64_t)controlTypeAtRow:(unint64_t)a3 column:(unint64_t)a4
{
  objc_super v6 = [(PHAudioCallControlsViewController *)self currentArrangement];
  id v7 = [v6 controlTypeAtRow:a3 column:a4];

  return (unint64_t)v7;
}

- (void)fetchAudioRoutesImageWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 routeController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010F0CC;
  v7[3] = &unk_1002CF650;
  id v8 = v3;
  id v6 = v3;
  [v5 fetchAudioControlsGlyphWithCompletion:v7];
}

- (id)imageForControlType:(unint64_t)a3
{
  uint64_t v4 = 0;
  switch(a3)
  {
    case 0uLL:
      uint64_t v4 = 22;
      goto LABEL_26;
    case 1uLL:
      uint64_t v4 = 19;
      goto LABEL_26;
    case 2uLL:
      uint64_t v4 = +[TURoute speakerAudioRouteGlyph];
      if (!v4) {
        goto LABEL_26;
      }
      goto LABEL_31;
    case 4uLL:
      id v5 = [(PHAudioCallControlsViewController *)self features];
      if ([v5 isButtonLayoutEnabled]) {
        uint64_t v4 = 18;
      }
      else {
        uint64_t v4 = 17;
      }

      goto LABEL_26;
    case 5uLL:
      id v6 = [(PHAudioCallControlsViewController *)self callContainer];
      id v7 = [v6 frontmostCall];
      unsigned int v8 = [v7 faceTimeIDStatus];

      if (v8 == 2) {
        uint64_t v4 = 5;
      }
      else {
        uint64_t v4 = 7;
      }
      goto LABEL_26;
    case 6uLL:
      uint64_t v4 = 13;
      goto LABEL_26;
    case 7uLL:
      uint64_t v4 = 14;
      goto LABEL_26;
    case 8uLL:
      uint64_t v4 = 26;
      goto LABEL_26;
    case 9uLL:
      uint64_t v4 = 21;
      goto LABEL_26;
    case 0xAuLL:
      uint64_t v4 = 20;
      goto LABEL_26;
    case 0xBuLL:
    case 0xEuLL:
      uint64_t v4 = 29;
      goto LABEL_26;
    case 0xCuLL:
    case 0x11uLL:
      uint64_t v4 = 5;
      goto LABEL_26;
    case 0xDuLL:
      int v9 = [(PHAudioCallControlsViewController *)self delegate];
      v10 = [v9 frontmostCallProviderIconForAudioCallControlsViewController:self];
      uint64_t v4 = [v10 imageWithRenderingMode:2];

      if (!v4) {
        goto LABEL_26;
      }
      goto LABEL_31;
    case 0xFuLL:
      uint64_t v4 = 2;
      goto LABEL_26;
    case 0x10uLL:
      uint64_t v11 = +[UIImage imageNamed:@"text_sos_icon"];
      goto LABEL_30;
    case 0x12uLL:
      uint64_t v4 = 88;
      goto LABEL_26;
    case 0x13uLL:
      uint64_t v4 = 89;
      goto LABEL_26;
    default:
LABEL_26:
      v12 = [(PHAudioCallControlsViewController *)self callDisplayStyleManager];
      id v13 = [v12 callDisplayStyle];

      if (v13 == (id)3) {
        +[UIImage tpHierarchicalImageForSymbolType:v4 pointSize:2 scale:32.0];
      }
      else {
      uint64_t v11 = +[UIImage tpHierarchicalImageForSymbolType:v4 pointSize:32.0];
      }
LABEL_30:
      uint64_t v4 = v11;
LABEL_31:
      return (id)v4;
  }
}

- (id)titleForControlType:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"MUTE";
      goto LABEL_23;
    case 1uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"KEYPAD";
      goto LABEL_23;
    case 2uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"SPEAKER";
      goto LABEL_23;
    case 3uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"ROUTE";
      goto LABEL_23;
    case 4uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"ADD";
      goto LABEL_23;
    case 5uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"FACETIME";
      goto LABEL_23;
    case 6uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"CONTACTS";
      goto LABEL_23;
    case 7uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"MESSAGES";
      goto LABEL_23;
    case 8uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"HOLD";
      goto LABEL_23;
    case 9uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"SWAP";
      goto LABEL_23;
    case 0xAuLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"MERGE";
      goto LABEL_23;
    case 0xBuLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"TTY";
      goto LABEL_23;
    case 0xCuLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"VIDEO";
      goto LABEL_23;
    case 0xDuLL:
      uint64_t v4 = [(PHAudioCallControlsViewController *)self callContainer];
      id v7 = [v4 frontmostCall];
      unsigned int v8 = [v7 provider];
      id v6 = [v8 localizedName];

      goto LABEL_24;
    case 0xEuLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"RTT";
      goto LABEL_23;
    case 0xFuLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"END";
      goto LABEL_23;
    case 0x10uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"EMERGENCY_TEXT";
      goto LABEL_23;
    case 0x11uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"LIVE_VIDEO";
      goto LABEL_23;
    case 0x12uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"SHARE_MEDIA";
      goto LABEL_23;
    case 0x13uLL:
      id v3 = +[NSBundle mainBundle];
      uint64_t v4 = v3;
      CFStringRef v5 = @"SHARE_CARD";
LABEL_23:
      id v6 = [v3 localizedStringForKey:v5 value:&stru_1002D6110 table:@"InCallService"];
LABEL_24:

      break;
    default:
      id v6 = 0;
      break;
  }

  return v6;
}

- (void)updateControls
{
  if ([(PHAudioCallControlsViewController *)self updatesPaused])
  {
    id v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v7 = (id)objc_opt_class();
      id v4 = v7;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%@ updates are paused, skipping update.", buf, 0xCu);
    }
  }
  else
  {
    id v5 = [(PHAudioCallControlsViewController *)self controlsView];
    [v5 updateControls];
  }
}

- (void)controlTypeTapped:(unint64_t)a3 forView:(id)a4
{
  id v6 = a4;
  id v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v57 = 134217984;
    unint64_t v58 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Control type tapped (%lu)", (uint8_t *)&v57, 0xCu);
  }

  switch(a3)
  {
    case 0uLL:
      int v9 = [(PHAudioCallControlsViewController *)self callContainer];
      unsigned int v8 = [v9 frontmostCall];

      [v8 setUplinkMuted:[v8 isUplinkMuted] ^ 1];
      v10 = [(PHAudioCallControlsViewController *)self controlsView];
      [v10 setSelectedState:[v8 isUplinkMuted] forControlType:0];

      uint64_t v11 = [(PHAudioCallControlsViewController *)self delegate];
      [v11 audioCallControlsViewControllerDidToggleMuteButton:[v8 isUplinkMuted]];
      goto LABEL_50;
    case 1uLL:
      [(PHAudioCallControlsViewController *)self tipKitStopObservation];
      unsigned int v8 = [(PHAudioCallControlsViewController *)self delegate];
      [v8 audioCallControlsViewControllerRequestedKeypadPresentation:self];
      goto LABEL_51;
    case 2uLL:
      v12 = +[TUCallCenter sharedInstance];
      id v13 = [v12 routeController];
      v14 = [v13 pickedRoute];
      unsigned int v15 = [v14 isSpeaker];

      objc_super v16 = +[TUCallCenter sharedInstance];
      v17 = [v16 routeController];
      v18 = v17;
      if (v15)
      {
        unsigned int v8 = [v17 routeForSpeakerDisable];

        if (v8)
        {
          v19 = +[TUCallCenter sharedInstance];
          v20 = [v19 routeController];
          [v20 pickRoute:v8];

          uint64_t v11 = [(PHAudioCallControlsViewController *)self controlsView];
          [v11 setSelectedState:0 forControlType:2];
          goto LABEL_50;
        }
        uint64_t v11 = sub_1000D5130();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v57) = 0;
          v56 = "[WARN] Could not find available route to pick for speaker disable";
LABEL_49:
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v56, (uint8_t *)&v57, 2u);
        }
      }
      else
      {
        unsigned int v8 = [v17 routeForSpeakerEnable];

        if (v8)
        {
          v43 = +[TUCallCenter sharedInstance];
          v44 = [v43 routeController];
          [v44 pickRoute:v8];

          v45 = [(PHAudioCallControlsViewController *)self controlsView];
          [v45 setSelectedState:1 forControlType:2];

          +[TPTipsHelper donateEventSpeakerUsed];
          goto LABEL_51;
        }
        uint64_t v11 = sub_1000D5130();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v57) = 0;
          v56 = "[WARN] Could not find available route to pick for speaker enable";
          goto LABEL_49;
        }
      }
LABEL_50:

LABEL_51:
LABEL_52:

      return;
    case 3uLL:
      v21 = +[TUCallCenter sharedInstance];
      v22 = [v21 routeController];
      unsigned int v23 = [v22 areAuxiliaryRoutesAvailable];

      if (!v23) {
        goto LABEL_52;
      }
      unsigned int v8 = [(PHAudioCallControlsViewController *)self delegate];
      [v8 audioCallControlsViewControllerRequestedAudioRoutesPresentation:self];
      goto LABEL_51;
    case 4uLL:
      v24 = [(PHAudioCallControlsViewController *)self view];
      id v25 = [v24 _currentUserInterfaceIdiom];

      v26 = [(PHAudioCallControlsViewController *)self delegate];
      unsigned int v8 = v26;
      if (v25 == (id)1) {
        goto LABEL_17;
      }
      [v26 audioCallControlsViewControllerRequestedAddCallPresentation:self forView:v6];
      goto LABEL_51;
    case 5uLL:
      v27 = [(PHAudioCallControlsViewController *)self callContainer];
      v28 = [v27 callWithStatus:1];
      v29 = v28;
      if (v28)
      {
        unsigned int v8 = v28;
      }
      else
      {
        v46 = [(PHAudioCallControlsViewController *)self callContainer];
        unsigned int v8 = [v46 callWithStatus:2];
      }
      v47 = +[TUCallCenter sharedInstance];
      [v47 requestVideoUpgradeForCall:v8 originatingUIType:27];

      [v8 setIsSendingVideo:1];
      v48 = +[TUCallCenter sharedInstance];
      v49 = [v48 routeController];
      v50 = [v49 pickedRoute];
      unsigned int v51 = [v50 isReceiver];

      if (!v51) {
        goto LABEL_51;
      }
      uint64_t v11 = +[TUCallCenter sharedInstance];
      v52 = [v11 routeController];
      v53 = +[TUCallCenter sharedInstance];
      v54 = [v53 routeController];
      v55 = [v54 speakerRoute];
      [v52 pickRoute:v55];

      goto LABEL_50;
    case 6uLL:
      v26 = [(PHAudioCallControlsViewController *)self delegate];
      unsigned int v8 = v26;
LABEL_17:
      [v26 audioCallControlsViewControllerRequestedContactsPresentation:self forView:v6];
      goto LABEL_51;
    case 7uLL:
      unsigned int v8 = [(PHAudioCallControlsViewController *)self callContainer];
      v30 = [v8 frontmostCall];
      [(PHAudioCallControlsViewController *)self openMessagesForCall:v30];
      goto LABEL_25;
    case 8uLL:
      v31 = [(PHAudioCallControlsViewController *)self callContainer];
      uint64_t v32 = [v31 currentCalls];
      unsigned int v8 = [(id)v32 firstObject];

      LOBYTE(v32) = [v8 isOnHold];
      v33 = [(PHAudioCallControlsViewController *)self callCenter];
      v34 = v33;
      if (v32) {
        [v33 unholdCall:v8];
      }
      else {
        [v33 holdCall:v8];
      }

      [(PHAudioCallControlsViewController *)self updateControls];
      goto LABEL_51;
    case 9uLL:
      unsigned int v8 = [(PHAudioCallControlsViewController *)self callCenter];
      [v8 swapCalls];
      goto LABEL_51;
    case 0xAuLL:
      v35 = [(PHAudioCallControlsViewController *)self callContainer];
      unsigned int v8 = [v35 callWithStatus:2];

      v36 = [(PHAudioCallControlsViewController *)self callContainer];
      v30 = [v36 callWithStatus:1];

      v37 = sub_1000D5130();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        int v57 = 138412546;
        unint64_t v58 = (unint64_t)v8;
        __int16 v59 = 2112;
        v60 = v30;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "PHAudioCallControlTypeMerge tapped. Grouping held call %@ with active call %@", (uint8_t *)&v57, 0x16u);
      }

      v38 = [(PHAudioCallControlsViewController *)self callCenter];
      [v38 groupCall:v8 withOtherCall:v30];

LABEL_25:
      goto LABEL_51;
    case 0xBuLL:
    case 0xEuLL:
      unsigned int v8 = [(PHAudioCallControlsViewController *)self delegate];
      [v8 audioCallControlsViewControllerDidTapRTTButton];
      goto LABEL_51;
    case 0xCuLL:
      unsigned int v8 = [(PHAudioCallControlsViewController *)self delegate];
      [v8 audioCallControlsViewControllerRequestedVideoPresentation:self];
      goto LABEL_51;
    case 0xDuLL:
      unsigned int v8 = [(PHAudioCallControlsViewController *)self delegate];
      [v8 audioCallControlsViewControllerRequestedPunchOutPresentation:self];
      goto LABEL_51;
    case 0xFuLL:
      unsigned int v8 = [(PHAudioCallControlsViewController *)self delegate];
      [v8 audioCallControlsViewControllerDidTapEndButton:self];
      goto LABEL_51;
    case 0x10uLL:
      unsigned int v8 = [(PHAudioCallControlsViewController *)self delegate];
      [v8 audioCallControlsViewControllerRequestedInvokeAlert];
      goto LABEL_51;
    case 0x11uLL:
      unsigned int v8 = [(PHAudioCallControlsViewController *)self delegate];
      [v8 audioCallControlsViewControllerDidTapVideoStreamingButton];
      goto LABEL_51;
    case 0x12uLL:
      unsigned int v8 = [(PHAudioCallControlsViewController *)self delegate];
      [v8 audioCallControlsViewControllerRequestedShareMedia];
      goto LABEL_51;
    case 0x13uLL:
      v39 = [(PHAudioCallControlsViewController *)self getScreenSharingButtonViewModel];

      if (v39)
      {
        v40 = [(PHAudioCallControlsViewController *)self getScreenSharingButtonViewModel];
        id v41 = [v40 currentState];

        v42 = [(PHAudioCallControlsViewController *)self getScreenSharingButtonViewModel];
        unsigned int v8 = v42;
        if (v41 == (id)2)
        {
          [v42 userDidRequestScreenSharingToEnd];
        }
        else
        {
          [v42 userIsPresentingShareSheet];

          unsigned int v8 = [(PHAudioCallControlsViewController *)self delegate];
          [v8 audioCallControlsViewControllerRequestedShareCardFromSourceView:v6];
        }
      }
      else
      {
        unsigned int v8 = sub_1000D5130();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_1001EC38C(v8);
        }
      }
      goto LABEL_51;
    default:
      goto LABEL_52;
  }
}

- (void)controlTypeShortPressed:(unint64_t)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    unint64_t v6 = a3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Control type short pressed (%lu)", (uint8_t *)&v5, 0xCu);
  }
}

- (void)controlTypeLongPressed:(unint64_t)a3
{
  int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 134217984;
    *(void *)v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Control type long pressed (%lu)", (uint8_t *)&v18, 0xCu);
  }

  if (a3 == 1)
  {
    id v7 = [(PHAudioCallControlsViewController *)self delegate];
    [v7 audioCallControlsViewControllerRequestedKeypadPresentationForFieldMode:self];
    goto LABEL_14;
  }
  if (a3) {
    return;
  }
  unint64_t v6 = [(PHAudioCallControlsViewController *)self callContainer];
  id v7 = [v6 callWithStatus:1];

  unsigned int v8 = [(PHAudioCallControlsViewController *)self callContainer];
  int v9 = [v8 currentCallGroups];
  if ([v9 count] != (id)1 || !v7)
  {

    goto LABEL_11;
  }
  v10 = [v7 model];
  unsigned int v11 = [v10 supportsHolding];

  if (!v11)
  {
LABEL_11:
    v12 = sub_1000D5130();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [(PHAudioCallControlsViewController *)self callContainer];
      v14 = [v13 currentCallGroups];
      BOOL v15 = [v14 count] != (id)1;
      objc_super v16 = [v7 model];
      unsigned int v17 = [v16 supportsHolding];
      int v18 = 67109632;
      *(_DWORD *)v19 = v15;
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = v7 == 0;
      __int16 v20 = 1024;
      int v21 = v17 ^ 1;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not holding: current call count isn't 1 (%d), active call doesn't exist (%d), or active call doesn't support holding (%d)", (uint8_t *)&v18, 0x14u);
    }
    goto LABEL_14;
  }
  [(PHAudioCallControlsViewController *)self controlTypeTapped:8 forView:0];
LABEL_14:
}

- (id)audioRouteMenu
{
  v2 = [(PHAudioCallControlsViewController *)self delegate];
  id v3 = [v2 audioRouteMenu];

  return v3;
}

- (BOOL)controlTypeIsEnabled:(unint64_t)a3
{
  if (![(PHAudioCallControlsViewController *)self isEnabled])
  {
    LOBYTE(v14) = 0;
    return (char)v14;
  }
  int v5 = [(PHAudioCallControlsViewController *)self callContainer];
  unint64_t v6 = [v5 callWithStatus:2];

  id v7 = [(PHAudioCallControlsViewController *)self callContainer];
  unsigned int v8 = [v7 callWithStatus:1];

  int v9 = [(PHAudioCallControlsViewController *)self callContainer];
  uint64_t v10 = [v9 callWithStatus:3];

  if (v8) {
    unsigned int v11 = v8;
  }
  else {
    unsigned int v11 = v6;
  }
  uint64_t v12 = v11;
  id v13 = (void *)v12;
  switch(a3)
  {
    case 0uLL:
      LOBYTE(v14) = (v12 | v10) != 0;
      goto LABEL_99;
    case 1uLL:
      if (v12)
      {
        if ([(id)v12 isOnHold] && !v10) {
          goto LABEL_88;
        }
      }
      else if (!v10)
      {
        goto LABEL_87;
      }
      unsigned int v23 = [v13 model];
      if ([v23 supportsDTMF])
      {
        LOBYTE(v14) = 1;
        goto LABEL_82;
      }
      v28 = [(id)v10 model];
      LOBYTE(v14) = [v28 supportsDTMF];
      goto LABEL_81;
    case 2uLL:
    case 3uLL:
      BOOL v15 = +[TUCallCenter sharedInstance];
      objc_super v16 = [v15 routeController];
      unsigned int v17 = [v16 routes];
      if ((unint64_t)[v17 count] > 1)
      {
        char v21 = 0;
      }
      else
      {
        int v18 = +[TUCallCenter sharedInstance];
        v19 = [v18 routeController];
        __int16 v20 = [v19 pickedRoute];
        unsigned __int8 v44 = [v20 isSpeaker];

        char v21 = v44 ^ 1;
      }

      if (v13) {
        v31 = v13;
      }
      else {
        v31 = (void *)v10;
      }
      unint64_t v32 = v31;

      LOBYTE(v14) = 0;
      if (v10 | v32 && (v21 & 1) == 0) {
        LODWORD(v14) = [(id)v32 isTTY] ^ 1;
      }
      id v13 = (void *)v32;
      goto LABEL_99;
    case 4uLL:
      if (v12) {
        v24 = (void *)v12;
      }
      else {
        v24 = (void *)v10;
      }
      id v25 = v24;
      v26 = [(PHAudioCallControlsViewController *)self callCenter];
      if (![v26 isAddCallAllowed])
      {
        LOBYTE(v14) = 0;
        goto LABEL_98;
      }
      v27 = +[PHInCallUtilities sharedInstance];
      if ([v27 isSetupAssistantRunning]) {
        goto LABEL_22;
      }
      unsigned int v40 = [v25 isConversation];
      if (!v40) {
        goto LABEL_93;
      }
      if (![v25 isConversation])
      {
LABEL_22:
        LOBYTE(v14) = 0;
        goto LABEL_97;
      }
      v43 = [v25 remoteParticipantHandles];
      if ([v43 count] == (id)1)
      {
LABEL_93:
        id v41 = +[PHInCallUtilities sharedInstance];
        LODWORD(v14) = [v41 isInLostMode] ^ 1;

        if (!v40) {
          goto LABEL_97;
        }
      }
      else
      {
        LOBYTE(v14) = 0;
      }

LABEL_97:
LABEL_98:

      goto LABEL_99;
    case 5uLL:
    case 0xCuLL:
      v22 = [(id)v12 provider];
      if ([v22 supportsAudioAndVideo])
      {
        unsigned int v23 = [v13 provider];
      }
      else
      {
        v33 = [(PHAudioCallControlsViewController *)self callCenter];
        v34 = [v33 providerManager];
        unsigned int v23 = [v34 faceTimeProvider];
      }
      if ([v23 isFaceTimeProvider])
      {
        v35 = +[PHInCallUtilities sharedInstance];
        unsigned int v36 = [v35 faceTimeVideoIsAvailable];
      }
      else
      {
        unsigned int v36 = [v23 supportsAudioAndVideo];
      }
      if (!v13) {
        goto LABEL_78;
      }
      v28 = [v13 handle];
      v37 = [v28 value];
      if (![v37 length]
        || ([v13 isConferenced] & 1) != 0
        || ([v13 isVoicemail] & 1) != 0
        || ([v13 isEmergency] & 1) != 0
        || [v13 status] != 1
        || ([v13 faceTimeIDStatus] != 1 ? (unsigned int v38 = v36) : (unsigned int v38 = 0), v38 != 1))
      {
        LOBYTE(v14) = 0;
      }
      else
      {
        v39 = +[PHInCallUtilities sharedInstance];
        LODWORD(v14) = [v39 isSetupAssistantRunning] ^ 1;
      }
      goto LABEL_81;
    case 6uLL:
      if (!(v10 | v12))
      {
LABEL_87:
        id v13 = 0;
        goto LABEL_88;
      }
      if (![(PHAudioCallControlsViewController *)self isContactStoreAuthorized])
      {
LABEL_88:
        LOBYTE(v14) = 0;
        goto LABEL_99;
      }
      unsigned int v23 = +[PHInCallUtilities sharedInstance];
      if ([v23 isSetupAssistantRunning])
      {
LABEL_78:
        LOBYTE(v14) = 0;
      }
      else
      {
        v28 = +[PHInCallUtilities sharedInstance];
        LODWORD(v14) = [v28 isInLostMode] ^ 1;
LABEL_81:
      }
LABEL_82:

LABEL_99:
      return (char)v14;
    case 7uLL:
      if (!v12) {
        uint64_t v12 = v10;
      }
      unsigned __int8 v29 = [(id)v12 isConversation];
      goto LABEL_48;
    case 8uLL:
      if (!v10) {
        goto LABEL_35;
      }
      goto LABEL_88;
    case 9uLL:
      LOBYTE(v14) = 0;
      if (v10 || !v6) {
        goto LABEL_99;
      }
      uint64_t v12 = (uint64_t)v8;
LABEL_35:
      unsigned int v23 = [(id)v12 model];
      LOBYTE(v14) = [v23 supportsHolding];
      goto LABEL_82;
    case 0xAuLL:
      LOBYTE(v14) = 0;
      if (v10 || !v12 || !v6) {
        goto LABEL_99;
      }
      unsigned int v23 = [(PHAudioCallControlsViewController *)self callCenter];
      if (![v23 canGroupCall:v13 withCall:v6]
        || ([v13 isRTT] & 1) != 0
        || ([v13 isTTY] & 1) != 0
        || ([v6 isRTT] & 1) != 0)
      {
        goto LABEL_78;
      }
      LODWORD(v14) = [v6 isTTY] ^ 1;
      goto LABEL_82;
    case 0xBuLL:
      if (!v12) {
        goto LABEL_88;
      }
      unsigned __int8 v29 = [(id)v12 isTTY];
      goto LABEL_48;
    case 0xDuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
      LOBYTE(v14) = 1;
      goto LABEL_99;
    case 0xEuLL:
      if (!v12) {
        goto LABEL_88;
      }
      unsigned __int8 v29 = [(id)v12 isRTT];
LABEL_48:
      LOBYTE(v14) = v29;
      goto LABEL_99;
    case 0x13uLL:
      v14 = [(PHAudioCallControlsViewController *)self getScreenSharingButtonViewModel];

      if (!v14) {
        goto LABEL_99;
      }
      if (v13) {
        v30 = v13;
      }
      else {
        v30 = (void *)v10;
      }
      if (![v30 isConversation]) {
        goto LABEL_88;
      }
      unsigned int v23 = [(PHAudioCallControlsViewController *)self getScreenSharingButtonViewModel];
      LOBYTE(v14) = [v23 currentState] != (id)1;
      goto LABEL_82;
    default:
      goto LABEL_88;
  }
}

- (BOOL)controlTypeIsSelected:(unint64_t)a3
{
  unint64_t v6 = [(PHAudioCallControlsViewController *)self callContainer];
  int v5 = [v6 frontmostCall];

  LOBYTE(v6) = 0;
  if ((uint64_t)a3 > 7)
  {
    switch(a3)
    {
      case 0x13uLL:
        unint64_t v6 = [(PHAudioCallControlsViewController *)self getScreenSharingButtonViewModel];

        if (v6)
        {
          int v9 = [(PHAudioCallControlsViewController *)self getScreenSharingButtonViewModel];
          LOBYTE(v6) = [v9 currentState] == (id)2;
          goto LABEL_17;
        }
        break;
      case 0x11uLL:
        int v9 = [(PHAudioCallControlsViewController *)self delegate];
        unsigned __int8 v11 = [v9 videoStreamingIsGoingOn];
        goto LABEL_16;
      case 8uLL:
        unsigned __int8 v10 = [v5 isOnHold];
LABEL_11:
        LOBYTE(v6) = v10;
        break;
    }
  }
  else
  {
    if (a3 - 2 < 2)
    {
      id v7 = +[TUCallCenter sharedInstance];
      unsigned int v8 = [v7 routeController];
      int v9 = [v8 pickedRoute];

      if ([v9 isAuxiliary])
      {
        LOBYTE(v6) = 1;
LABEL_17:

        goto LABEL_18;
      }
      unsigned __int8 v11 = [v9 isSpeaker];
LABEL_16:
      LOBYTE(v6) = v11;
      goto LABEL_17;
    }
    if (!a3)
    {
      unsigned __int8 v10 = [v5 isUplinkMuted];
      goto LABEL_11;
    }
  }
LABEL_18:

  return (char)v6;
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PHAudioCallControlsViewController *)self controlsView];
  [v4 setButtonsEnabled:v3];
}

- (BOOL)isEnabled
{
  v2 = [(PHAudioCallControlsViewController *)self controlsView];
  unsigned __int8 v3 = [v2 buttonsEnabled];

  return v3;
}

- (void)setUpdatesPaused:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = (id)objc_opt_class();
    __int16 v10 = 1024;
    BOOL v11 = v3;
    id v6 = v9;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ setUpdatesPaused=%d", (uint8_t *)&v8, 0x12u);
  }
  self->_updatesPaused = v3;
  if (!v3)
  {
    id v7 = [(PHAudioCallControlsViewController *)self controlsView];
    [v7 updateControls];
  }
}

- (BOOL)multipleCallsArePresent
{
  v2 = [(PHAudioCallControlsViewController *)self callContainer];
  BOOL v3 = [v2 currentCallGroups];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "status", (void)v10) - 1 < 4) {
          ++v6;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
    LOBYTE(v5) = v6 > 1;
  }

  return (char)v5;
}

- (BOOL)hasActiveAndIncomingCallPresent
{
  v2 = [(PHAudioCallControlsViewController *)self callContainer];
  BOOL v3 = [v2 currentCallGroups];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5)
  {
    char v7 = 0;
    char v8 = 0;
    goto LABEL_18;
  }
  id v6 = v5;
  char v7 = 0;
  char v8 = 0;
  uint64_t v9 = *(void *)v14;
  while (2)
  {
    for (i = 0; i != v6; i = (char *)i + 1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v4);
      }
      unsigned int v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) status];
      if (v11 == 4)
      {
        char v7 = 1;
        if ((v8 & 1) == 0) {
          continue;
        }
      }
      else
      {
        if (v11 == 1) {
          char v8 = 1;
        }
        if ((v8 & 1) == 0) {
          continue;
        }
      }
      if (v7)
      {
        char v7 = 1;
        char v8 = 1;
        goto LABEL_18;
      }
    }
    id v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6) {
      continue;
    }
    break;
  }
LABEL_18:

  return v8 & v7 & 1;
}

- (PHAudioCallControlArrangement)currentArrangement
{
  id v3 = objc_alloc_init((Class)TUSenderIdentityClient);
  id v4 = [(PHAudioCallControlsViewController *)self currentArrangementWithSenderIdentityClient:v3];

  return (PHAudioCallControlArrangement *)v4;
}

- (id)currentArrangementWithSenderIdentityClient:(id)a3
{
  id v4 = a3;
  id v5 = [(PHAudioCallControlsViewController *)self callDisplayStyleManager];
  id v6 = [v5 callDisplayStyle];

  char v7 = [(PHAudioCallControlsViewController *)self callContainer];
  uint64_t v8 = [v7 frontmostCall];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
LABEL_3:

    goto LABEL_5;
  }
  long long v10 = [(PHAudioCallControlsViewController *)self callContainer];
  unsigned int v11 = [v10 currentCalls];
  uint64_t v9 = [v11 firstObject];

  if (!v9)
  {
    char v7 = +[UIApplication sharedApplication];
    v56 = [v7 delegate];
    uint64_t v9 = [v56 mostRecentlyDisconnectedAudioCall];

    goto LABEL_3;
  }
LABEL_5:
  long long v12 = [(PHAudioCallControlsViewController *)self features];
  if ([v12 isButtonLayoutEnabled])
  {
    long long v13 = [(PHAudioCallControlsViewController *)self delegate];
    unsigned int v14 = [v9 canDisplayAlertUI:[v13 audioControlsShouldPresentAlertButton]];

    if (v14)
    {
      long long v15 = [PHAudioCallControlArrangement alloc];
      if (v6 == (id)3) {
        +[PHAudioCallControlArrangement simplifiedDefaultAlertControlTypes];
      }
      else {
      v49 = +[PHAudioCallControlArrangement defaultAlertControlTypes];
      }
      v26 = [(PHAudioCallControlArrangement *)v15 initWithControlTypes:v49];
LABEL_67:

      goto LABEL_68;
    }
  }
  else
  {
  }
  if (v6 == (id)3)
  {
    unsigned int v16 = [(PHAudioCallControlsViewController *)self hasActiveAndIncomingCallPresent];
    unsigned int v17 = [(PHAudioCallControlsViewController *)self multipleCallsArePresent];
    int v18 = [PHAudioCallControlArrangement alloc];
    if (v17 && !v16)
    {
      v19 = +[PHAudioCallControlArrangement simplifiedDefaultMultipleCallControlTypes];
      __int16 v20 = v18;
LABEL_21:
      v26 = [(PHAudioCallControlArrangement *)v20 initWithControlTypes:v19];
      char v27 = 1;
      goto LABEL_24;
    }
    v19 = +[PHAudioCallControlArrangement simplifiedDefaultControlTypes];
    unsigned int v23 = v18;
  }
  else
  {
    char v21 = [(PHAudioCallControlsViewController *)self features];
    if ([v21 shouldEmbedSwapBanner]) {
      unsigned __int8 v22 = [(PHAudioCallControlsViewController *)self hasActiveAndIncomingCallPresent];
    }
    else {
      unsigned __int8 v22 = 0;
    }

    unsigned int v24 = [(PHAudioCallControlsViewController *)self multipleCallsArePresent];
    id v25 = [PHAudioCallControlArrangement alloc];
    if (v24 && (v22 & 1) == 0)
    {
      v19 = +[PHAudioCallControlArrangement defaultMultipleCallControlTypes];
      __int16 v20 = v25;
      goto LABEL_21;
    }
    v19 = +[PHAudioCallControlArrangement defaultControlTypes];
    unsigned int v23 = v25;
  }
  v26 = [(PHAudioCallControlArrangement *)v23 initWithControlTypes:v19];
  char v27 = 0;
LABEL_24:

  if ([v9 isRTT])
  {
    v28 = v26;
    uint64_t v29 = 0;
    uint64_t v30 = 14;
LABEL_26:
    [(PHAudioCallControlArrangement *)v28 replaceControlsOfType:v29 withControlOfType:v30];
    goto LABEL_41;
  }
  if (![v9 isTTY])
  {
    if ((v27 & 1) == 0
      && [v9 isOnHold]
      && ([v9 model],
          v33 = objc_claimAutoreleasedReturnValue(),
          unsigned int v34 = [v33 supportsHolding],
          v33,
          v34))
    {
      v28 = v26;
      uint64_t v29 = 0;
      uint64_t v30 = 8;
    }
    else
    {
      if (![v9 isConversation]) {
        goto LABEL_41;
      }
      v28 = v26;
      uint64_t v29 = 6;
      uint64_t v30 = 7;
    }
    goto LABEL_26;
  }
  v31 = [v9 localSenderIdentityUUID];
  if (!v31)
  {
    unint64_t v32 = sub_1000D5130();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v58 = 138412290;
      __int16 v59 = v9;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Could not retrieve a sender identity UUID from the call %@; checking if TTY software is available anyway.",
        (uint8_t *)&v58,
        0xCu);
    }
  }
  if ([v4 isTTYSoftwareAvailableForSenderIdentityUUID:v31]) {
    [(PHAudioCallControlArrangement *)v26 replaceControlsOfType:0 withControlOfType:11];
  }

LABEL_41:
  if ([v9 isConversation])
  {
    v35 = [(PHAudioCallControlsViewController *)self features];
    unsigned int v36 = [v35 requestToScreenShareEnabled];

    if (v36) {
      [(PHAudioCallControlArrangement *)v26 replaceControlsOfType:1 withControlOfType:19];
    }
  }
  v37 = +[TUCallCenter sharedInstance];
  unsigned int v38 = [v37 routeController];
  unsigned int v39 = [v38 areAuxiliaryRoutesAvailable];

  if (v39) {
    [(PHAudioCallControlArrangement *)v26 replaceControlsOfType:2 withControlOfType:3];
  }
  unsigned int v40 = [(PHAudioCallControlsViewController *)self callDisplayStyleManager];
  id v41 = [v40 callDisplayStyle];

  if (v41 == (id)3
    && ([(PHAudioCallControlsViewController *)self controlTypeIsEnabled:5]
     || ![(PHAudioCallControlsViewController *)self controlTypeIsEnabled:1]))
  {
    [(PHAudioCallControlArrangement *)v26 replaceControlsOfType:1 withControlOfType:5];
  }
  if (v9)
  {
    v42 = [v9 provider];
    unsigned __int8 v43 = [v42 isSystemProvider];

    if ((v43 & 1) == 0)
    {
      unsigned __int8 v44 = [(PHAudioCallControlsViewController *)self features];
      unsigned int v45 = [v44 isButtonLayoutEnabled];

      uint64_t v46 = v45 ? 4 : 6;
      [(PHAudioCallControlArrangement *)v26 replaceControlsOfType:v46 withControlOfType:13];
      v47 = [v9 provider];
      unsigned int v48 = [v47 supportsAudioAndVideo];

      if (v48) {
        [(PHAudioCallControlArrangement *)v26 replaceControlsOfType:5 withControlOfType:12];
      }
    }
  }
  v49 = [(PHAudioCallControlsViewController *)self features];
  unsigned int v50 = [v49 isEnhancedEmergencyEnabled];
  if (!v9 || !v50) {
    goto LABEL_67;
  }
  unsigned int v51 = [v9 isEmergency];

  if (v51)
  {
    v52 = [(PHAudioCallControlsViewController *)self delegate];
    unsigned int v53 = [v52 shouldEnableVideoStreamingButton];

    if (v53) {
      [(PHAudioCallControlArrangement *)v26 replaceControlsOfType:5 withControlOfType:17];
    }
    v54 = [(PHAudioCallControlsViewController *)self delegate];
    unsigned int v55 = [v54 shouldEnableShareMediaButton];

    if (v55) {
      [(PHAudioCallControlArrangement *)v26 replaceControlsOfType:4 withControlOfType:18];
    }
  }
LABEL_68:

  return v26;
}

- (void)openMessagesForCall:(id)a3
{
  id v3 = a3;
  if ([v3 isConversation])
  {
    id v4 = +[TUCallCenter sharedInstance];
    id v5 = [v4 activeConversationForCall:v3];

    if (v5)
    {
      id v6 = objc_alloc_init((Class)NSMutableArray);
      char v7 = [v5 groupUUID];

      if (v7)
      {
        id v8 = objc_alloc((Class)NSURLQueryItem);
        uint64_t v9 = [v5 groupUUID];
        long long v10 = [v9 UUIDString];
        id v11 = [v8 initWithName:@"groupid" value:v10];

        [v6 addObject:v11];
      }
      id v12 = objc_alloc_init((Class)NSMutableArray);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v13 = [v5 remoteMembers];
      id v14 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v14)
      {
        id v15 = v14;
        uint64_t v16 = *(void *)v30;
        do
        {
          unsigned int v17 = 0;
          do
          {
            if (*(void *)v30 != v16) {
              objc_enumerationMutation(v13);
            }
            int v18 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)v17) handles];
            v19 = [v18 anyObject];

            __int16 v20 = [v19 value];

            if (v20)
            {
              char v21 = [v19 value];
              [v12 addObject:v21];
            }
            unsigned int v17 = (char *)v17 + 1;
          }
          while (v15 != v17);
          id v15 = [v13 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v15);
      }

      if ([v12 count])
      {
        id v22 = objc_alloc((Class)NSURLQueryItem);
        unsigned int v23 = [v12 componentsJoinedByString:@","];
        id v24 = [v22 initWithName:@"addresses" value:v23];

        [v6 addObject:v24];
      }
      id v25 = objc_alloc_init((Class)NSURLComponents);
      [v25 setScheme:@"sms"];
      [v25 setPath:@"open"];
      [v25 setQueryItems:v6];
      v26 = sub_1000D5130();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        char v27 = [v25 URL];
        *(_DWORD *)buf = 138412290;
        id v34 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Opening Multiway Messages URL: %@ ...", buf, 0xCu);
      }
      v28 = [v25 URL];
      TUUnlockAndOpenURL();
    }
    else
    {
      id v6 = sub_1000D5130();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1001EC3D0((uint64_t)v3, v6);
      }
    }
  }
  else
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Not opening Multiway Messages for call. Call is not a conversation: %@", buf, 0xCu);
    }
  }
}

- (void)routesChangedForRouteController:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v10, 2u);
  }

  [(PHAudioCallControlsViewController *)self updateControls];
  id v6 = [v4 pickedRoute];

  char v7 = [(PHAudioCallControlsViewController *)self lastPickedRoute];
  unsigned __int8 v8 = [v6 isEqualToRoute:v7];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [(PHAudioCallControlsViewController *)self controlsView];
    [v9 dismissAudioRoutesMenu];

    [(PHAudioCallControlsViewController *)self setLastPickedRoute:v6];
  }
}

- (void)handleMutedTalkerBannerTap
{
  id v3 = [(PHAudioCallControlsViewController *)self callContainer];
  id v5 = [v3 frontmostCall];

  [v5 setUplinkMuted:[v5 isUplinkMuted] ^ 1];
  id v4 = [(PHAudioCallControlsViewController *)self controlsView];
  [v4 setSelectedState:[v5 isUplinkMuted] forControlType:0];
}

- (NSArray)buttonsForAmbientTransition
{
  v2 = [(PHAudioCallControlsViewController *)self controlsView];
  id v3 = [v2 buttonsForAmbientTransition];

  return (NSArray *)v3;
}

- (PHAudioCallControlsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAudioCallControlsViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (BOOL)updatesPaused
{
  return self->_updatesPaused;
}

- (int)proximitySensorNotificationToken
{
  return self->_proximitySensorNotificationToken;
}

- (void)setProximitySensorNotificationToken:(int)a3
{
  self->_proximitySensorNotificationToken = a3;
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return (ICSCallDisplayStyleManager *)objc_getProperty(self, a2, 24, 1);
}

- (PHAudioCallControlsView)controlsView
{
  return (PHAudioCallControlsView *)objc_getProperty(self, a2, 32, 1);
}

- (void)setControlsView:(id)a3
{
}

- (PHAudioCallControlArrangement)controlArrangement
{
  return (PHAudioCallControlArrangement *)objc_getProperty(self, a2, 40, 1);
}

- (void)setControlArrangement:(id)a3
{
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
}

- (TUCallContainerPrivate)callContainer
{
  return self->_callContainer;
}

- (void)setCallContainer:(id)a3
{
}

- (TURoute)lastPickedRoute
{
  return (TURoute *)objc_getProperty(self, a2, 64, 1);
}

- (void)setLastPickedRoute:(id)a3
{
}

- (void)setScreenSharingButtonViewModel:(id)a3
{
}

- (NSObject)screenSharingButtonViewModelObserver
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setScreenSharingButtonViewModelObserver:(id)a3
{
}

- (BOOL)isContactStoreAuthorized
{
  return self->_contactStoreAuthorized;
}

- (void)setContactStoreAuthorized:(BOOL)a3
{
  self->_contactStoreAuthorized = a3;
}

- (CNKFeatures)features
{
  return self->_features;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_screenSharingButtonViewModelObserver, 0);
  objc_storeStrong((id *)&self->_screenSharingButtonViewModel, 0);
  objc_storeStrong((id *)&self->_lastPickedRoute, 0);
  objc_storeStrong((id *)&self->_callContainer, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_controlArrangement, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)callDisplayStyleDidChangeFromStyle:(int64_t)a3 toStyle:(int64_t)a4
{
  if (a4 == 2) {
    [(PHAudioCallControlsViewController *)self tipKitStartObservation];
  }
  else {
    [(PHAudioCallControlsViewController *)self tipKitStopObservation];
  }
}

- (void)tipKitStartObservation
{
  v2 = self;
  sub_100127A5C();
}

- (void)proximityStateChanged
{
  v2 = self;
  sub_100128F54();
}

- (void)tipKitStopObservation
{
  v2 = self;
  sub_100129178();
}

@end