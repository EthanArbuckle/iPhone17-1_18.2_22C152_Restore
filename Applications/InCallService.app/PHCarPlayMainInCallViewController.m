@interface PHCarPlayMainInCallViewController
- (BOOL)_shouldPresentAlertUI;
- (BOOL)areIncomingCallOptionsAllowed;
- (BOOL)canSendMessage;
- (BOOL)canSendMessageToCall:(id)a3;
- (BOOL)currentCallStateWarrantsCallWaitingMode;
- (BOOL)isAddCallAllowed;
- (BOOL)isDismissable;
- (BOOL)isHoldEnabled;
- (BOOL)isKeypadAllowed;
- (BOOL)isKeypadEnabled;
- (BOOL)isMergeCallsAllowed;
- (BOOL)isMuted;
- (BOOL)isSendToVoicemailAllowed;
- (BOOL)isShowSOSConfirmationSupported;
- (BOOL)isShowingStickyAlert;
- (BOOL)isSwapCallsAllowed;
- (BOOL)shouldAllowAddContactsAccess;
- (BOOL)shouldPresentAlertButton;
- (CARSessionStatus)carSessionStatus;
- (MPCarPlayInCallViewControllerDelegate)delegate;
- (NFMPlayCommands)nfmPlayCommands;
- (NSArray)conferenceParticipants;
- (NSArray)primaryCalls;
- (NSString)redialedCallUUID;
- (NSTimer)viewUpdateClockTickTimer;
- (PHCarPlayInCallButtonsView)buttonsView;
- (PHCarPlayInCallHardPauseButton)hardPauseButton;
- (PHCarPlayMainInCallViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHCarPlayPhoneCallGalleryView)galleryView;
- (TUCall)callToDecline;
- (TUCall)emergencyCallBeforePresentingStickyAlert;
- (TUCall)failedCall;
- (TUCall)incomingCall;
- (TUCallCenter)callCenter;
- (TUCallContainerPrivate)callContainer;
- (UIView)flippyView;
- (_TtP13InCallService24AlertCoordinatorProtocol_)alertCoordinator;
- (id)__sanitizedPrimaryPhoneCallOrdering:(id)a3;
- (id)allConferenceParticipantCalls;
- (id)callForHardPauseState;
- (id)canSendTextMessagesBlock;
- (id)conferenceParticipantCallsForPhoneCall:(id)a3;
- (id)currentActivePhoneCall;
- (id)preferredFocusEnvironments;
- (id)primaryPhoneCallsForGalleryView:(id)a3;
- (id)replyWithMessageStore;
- (id)representativePhoneCallForConferenceForGalleryView:(id)a3;
- (int64_t)currentCallState;
- (unsigned)currentMode;
- (void)_handleAlertButtonPressed;
- (void)_presentAlertForEmergencyCallFailure;
- (void)_sendMessageResponse:(id)a3 toCall:(id)a4;
- (void)alertViewWillDismiss;
- (void)alertWillInvoke;
- (void)answerIncomingCallWithBehavior:(int64_t)a3;
- (void)answerIncomingConversation:(id)a3;
- (void)callStateChangedNotification:(id)a3;
- (void)cleanAlertUIInCarPlay;
- (void)dealloc;
- (void)handleAlertControllerSendMessageResponse:(id)a3;
- (void)hardPauseButtonDidSendHardPauseDigits:(id)a3;
- (void)inCallButtonWasTapped:(id)a3;
- (void)limitedUIChangedNotification:(id)a3;
- (void)loadView;
- (void)muteStateChangedNotification:(id)a3;
- (void)presentDisconnectionAlert:(id)a3;
- (void)sessionDidConnect:(id)a3;
- (void)setAlertCoordinator:(id)a3;
- (void)setButtonsView:(id)a3;
- (void)setCallCenter:(id)a3;
- (void)setCallContainer:(id)a3;
- (void)setCallToDecline:(id)a3;
- (void)setCanSendTextMessagesBlock:(id)a3;
- (void)setCarSessionStatus:(id)a3;
- (void)setConferenceParticipants:(id)a3;
- (void)setCurrentMode:(unsigned __int16)a3;
- (void)setDelegate:(id)a3;
- (void)setEmergencyCallBeforePresentingStickyAlert:(id)a3;
- (void)setFailedCall:(id)a3;
- (void)setFlippyView:(id)a3;
- (void)setGalleryView:(id)a3;
- (void)setHardPauseButton:(id)a3;
- (void)setIncomingCall:(id)a3;
- (void)setIsMuted:(BOOL)a3;
- (void)setNfmPlayCommands:(id)a3;
- (void)setPrimaryCalls:(id)a3;
- (void)setPrimaryCalls:(id)a3 conferencePhoneCalls:(id)a4 incomingCall:(id)a5;
- (void)setRedialedCallUUID:(id)a3;
- (void)setShouldPresentAlertButton:(BOOL)a3;
- (void)setShowingStickyAlert:(BOOL)a3;
- (void)setViewUpdateClockTickTimer:(id)a3;
- (void)shouldCallAgain;
- (void)shouldPlaySound;
- (void)updateButtonsViewState;
- (void)updateHardPauseButtonState;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewUpdateClockTickTimerFired:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PHCarPlayMainInCallViewController

- (PHCarPlayMainInCallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v27.receiver = self;
  v27.super_class = (Class)PHCarPlayMainInCallViewController;
  v4 = [(PHCarPlayMainInCallViewController *)&v27 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(PHCarPlayMainInCallViewController *)v4 setCurrentMode:0];
    v6 = +[TUCallCenter sharedInstance];
    [(PHCarPlayMainInCallViewController *)v5 setCallCenter:v6];

    v7 = [(PHCarPlayMainInCallViewController *)v5 callCenter];
    [(PHCarPlayMainInCallViewController *)v5 setCallContainer:v7];

    id v8 = objc_alloc_init((Class)CARSessionStatus);
    [(PHCarPlayMainInCallViewController *)v5 setCarSessionStatus:v8];

    v9 = [(PHCarPlayMainInCallViewController *)v5 carSessionStatus];
    [v9 setSessionObserver:v5];

    v10 = dispatch_queue_create("com.apple.calls.incallservice.carplay", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1001141F0;
    block[3] = &unk_1002CD518;
    v11 = v5;
    v26 = v11;
    dispatch_async(v10, block);

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v11 selector:"muteStateChangedNotification:" name:TUCallIsUplinkMutedChangedNotification object:0];

    v13 = +[NSNotificationCenter defaultCenter];
    [v13 addObserver:v11 selector:"hardPauseDigitsStateChangedNotification:" name:TUCallHardPauseDigitsStateChangedNotification object:0];

    v14 = +[NSNotificationCenter defaultCenter];
    [v14 addObserver:v11 selector:"callStateChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];

    v15 = +[NSNotificationCenter defaultCenter];
    [v15 addObserver:v11 selector:"callStateChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];

    v16 = +[NSNotificationCenter defaultCenter];
    [v16 addObserver:v11 selector:"callModelChangedNotification:" name:TUCallModelChangedNotification object:0];

    v17 = +[NSNotificationCenter defaultCenter];
    [v17 addObserver:v11 selector:"limitedUIChangedNotification:" name:CARSessionLimitUserInterfacesChangedNotification object:0];

    [(PHCarPlayMainInCallViewController *)v11 setCanSendTextMessagesBlock:&stru_1002D0D68];
    v18 = +[PHSOSDisconnectionConfirmation sharedInstance];
    [v18 addDelegate:v11];

    v11->_shouldPresentAlertButton = 0;
    v19 = objc_alloc_init(_TtC13InCallService16AlertCoordinator);
    [(AlertCoordinator *)v19 setDelegate:v11];
    alertCoordinator = v11->_alertCoordinator;
    v11->_alertCoordinator = (_TtP13InCallService24AlertCoordinatorProtocol_ *)v19;
    v21 = v19;

    v22 = (NFMPlayCommands *)objc_alloc_init((Class)NFMPlayCommands);
    nfmPlayCommands = v11->_nfmPlayCommands;
    v11->_nfmPlayCommands = v22;
  }
  return v5;
}

- (void)loadView
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MPCarPlayInCallViewController loadView", buf, 2u);
  }

  if (([(PHCarPlayMainInCallViewController *)self isViewLoaded] & 1) == 0)
  {
    id v95 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [(PHCarPlayMainInCallViewController *)self setView:v95];
    v4 = +[UIColor tableBackgroundColor];
    v5 = [(PHCarPlayMainInCallViewController *)self view];
    [v5 setBackgroundColor:v4];

    id v6 = objc_alloc_init((Class)UIView);
    [(PHCarPlayMainInCallViewController *)self setFlippyView:v6];

    v7 = [(PHCarPlayMainInCallViewController *)self flippyView];
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v8 = [PHCarPlayPhoneCallGalleryView alloc];
    [v95 bounds];
    v9 = -[PHCarPlayPhoneCallGalleryView initWithFrame:](v8, "initWithFrame:");
    [(PHCarPlayMainInCallViewController *)self setGalleryView:v9];

    v10 = [(PHCarPlayMainInCallViewController *)self galleryView];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    v11 = [(PHCarPlayMainInCallViewController *)self galleryView];
    [v11 setDelegate:self];

    v12 = [(PHCarPlayMainInCallViewController *)self flippyView];
    v13 = [(PHCarPlayMainInCallViewController *)self galleryView];
    [v12 addSubview:v13];

    v14 = objc_alloc_init(PHCarPlayInCallButtonsView);
    [(PHCarPlayMainInCallViewController *)self setButtonsView:v14];

    v15 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(PHCarPlayMainInCallViewController *)self view];
    v17 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    [v16 addSubview:v17];

    v18 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    [v18 setDelegate:self];

    v19 = [(PHCarPlayMainInCallViewController *)self view];
    v20 = [(PHCarPlayMainInCallViewController *)self flippyView];
    [v19 addSubview:v20];

    v21 = [(PHCarPlayMainInCallViewController *)self flippyView];
    CFStringRef v100 = @"view";
    v22 = [(PHCarPlayMainInCallViewController *)self galleryView];
    v101 = v22;
    v23 = +[NSDictionary dictionaryWithObjects:&v101 forKeys:&v100 count:1];
    v24 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:0 views:v23];
    [v21 addConstraints:v24];

    v25 = [(PHCarPlayMainInCallViewController *)self flippyView];
    CFStringRef v98 = @"view";
    v26 = [(PHCarPlayMainInCallViewController *)self galleryView];
    v99 = v26;
    objc_super v27 = +[NSDictionary dictionaryWithObjects:&v99 forKeys:&v98 count:1];
    v28 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:v27];
    [v25 addConstraints:v28];

    v29 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    v30 = [(PHCarPlayMainInCallViewController *)self view];
    v31 = [v30 safeAreaLayoutGuide];
    LODWORD(v32) = 1148846080;
    v94 = +[NSLayoutConstraint constraintWithItem:v29 attribute:4 relatedBy:0 toItem:v31 attribute:4 multiplier:1.0 constant:0.0 priority:v32];

    v33 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    LODWORD(v34) = 1148846080;
    v93 = +[NSLayoutConstraint constraintWithItem:v33 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:87.0 priority:v34];

    v35 = objc_alloc_init(PHCarPlayInCallHardPauseButton);
    [(PHCarPlayMainInCallViewController *)self setHardPauseButton:v35];

    v36 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
    [v36 setDelegate:self];

    v37 = [(PHCarPlayMainInCallViewController *)self view];
    v38 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
    [v37 addSubview:v38];

    v97[0] = v94;
    v97[1] = v93;
    v92 = [(PHCarPlayMainInCallViewController *)self view];
    v91 = [v92 safeAreaLayoutGuide];
    v89 = [v91 leftAnchor];
    v90 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    v88 = [v90 leftAnchor];
    v87 = [v89 constraintEqualToAnchor:v88];
    v97[2] = v87;
    v86 = [(PHCarPlayMainInCallViewController *)self view];
    v85 = [v86 safeAreaLayoutGuide];
    v83 = [v85 rightAnchor];
    v84 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    v82 = [v84 rightAnchor];
    v81 = [v83 constraintEqualToAnchor:v82];
    v97[3] = v81;
    v80 = [(PHCarPlayMainInCallViewController *)self flippyView];
    v77 = [v80 topAnchor];
    v79 = [(PHCarPlayMainInCallViewController *)self view];
    v78 = [v79 safeAreaLayoutGuide];
    v76 = [v78 topAnchor];
    v75 = [v77 constraintEqualToAnchor:v76 constant:12.0];
    v97[4] = v75;
    v74 = [(PHCarPlayMainInCallViewController *)self flippyView];
    v72 = [v74 bottomAnchor];
    v73 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    v71 = [v73 topAnchor];
    v70 = [v72 constraintEqualToAnchor:v71 constant:-12.0];
    v97[5] = v70;
    v69 = [(PHCarPlayMainInCallViewController *)self flippyView];
    v67 = [v69 leadingAnchor];
    v68 = [(PHCarPlayMainInCallViewController *)self view];
    v66 = [v68 safeAreaLayoutGuide];
    v65 = [v66 leadingAnchor];
    v64 = [v67 constraintEqualToAnchor:v65 constant:12.0];
    v97[6] = v64;
    v63 = [(PHCarPlayMainInCallViewController *)self flippyView];
    v61 = [v63 trailingAnchor];
    v62 = [(PHCarPlayMainInCallViewController *)self view];
    v60 = [v62 safeAreaLayoutGuide];
    v59 = [v60 trailingAnchor];
    v58 = [v61 constraintEqualToAnchor:v59 constant:-12.0];
    v97[7] = v58;
    v57 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
    v55 = [v57 topAnchor];
    v56 = [(PHCarPlayMainInCallViewController *)self view];
    v54 = [v56 safeAreaLayoutGuide];
    v53 = [v54 topAnchor];
    v52 = [v55 constraintEqualToAnchor:v53 constant:12.0];
    v97[8] = v52;
    v51 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
    v50 = [v51 heightAnchor];
    v49 = [v50 constraintEqualToConstant:28.0];
    v97[9] = v49;
    v39 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
    v40 = [v39 rightAnchor];
    v41 = [(PHCarPlayMainInCallViewController *)self view];
    v42 = [v41 safeAreaLayoutGuide];
    v43 = [v42 rightAnchor];
    v44 = [v40 constraintEqualToAnchor:v43 constant:-12.0];
    v97[10] = v44;
    v45 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
    v46 = [v45 widthAnchor];
    v47 = [v46 constraintEqualToConstant:107.0];
    v97[11] = v47;
    v48 = +[NSArray arrayWithObjects:v97 count:12];
    +[NSLayoutConstraint activateConstraints:v48];
  }
}

- (void)dealloc
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "MPCarPlay IN CALL VIEW CONTROLLER DEALLOC %@", buf, 0xCu);
  }

  v4 = +[PHSOSDisconnectionConfirmation sharedInstance];
  [v4 removeDelegate:self];

  [(PHCarPlayPhoneCallGalleryView *)self->_galleryView setDelegate:0];
  [(PHCarPlayInCallButtonsView *)self->_buttonsView setDelegate:0];
  [(PHCarPlayInCallHardPauseButton *)self->_hardPauseButton setDelegate:0];
  [(NSTimer *)self->_viewUpdateClockTickTimer invalidate];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)PHCarPlayMainInCallViewController;
  [(PHCarPlayMainInCallViewController *)&v6 dealloc];
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayMainInCallViewController;
  [(PHCarPlayMainInCallViewController *)&v4 viewDidLoad];
  v3 = [(PHCarPlayMainInCallViewController *)self alertCoordinator];
  [v3 startMonitoring];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHCarPlayMainInCallViewController;
  [(PHCarPlayMainInCallViewController *)&v6 viewWillAppear:a3];
  objc_super v4 = [(PHCarPlayMainInCallViewController *)self viewUpdateClockTickTimer];
  [v4 invalidate];

  [(PHCarPlayMainInCallViewController *)self setViewUpdateClockTickTimer:0];
  v5 = +[NSTimer scheduledTimerWithTimeInterval:self target:"viewUpdateClockTickTimerFired:" selector:0 userInfo:1 repeats:1.0];
  [(PHCarPlayMainInCallViewController *)self setViewUpdateClockTickTimer:v5];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHCarPlayMainInCallViewController;
  [(PHCarPlayMainInCallViewController *)&v6 viewDidAppear:a3];
  objc_super v4 = [(PHCarPlayMainInCallViewController *)self presentedViewController];

  if (!v4)
  {
    v5 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    [v5 becomeFirstResponder];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PHCarPlayMainInCallViewController;
  [(PHCarPlayMainInCallViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(PHCarPlayMainInCallViewController *)self viewUpdateClockTickTimer];
  [v4 invalidate];

  [(PHCarPlayMainInCallViewController *)self setViewUpdateClockTickTimer:0];
}

- (void)setPrimaryCalls:(id)a3 conferencePhoneCalls:(id)a4 incomingCall:(id)a5
{
  id v7 = a3;
  unint64_t v113 = (unint64_t)a4;
  id v8 = a5;
  v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    id v141 = v7;
    __int16 v142 = 2112;
    unint64_t v143 = v113;
    __int16 v144 = 2112;
    id v145 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "-- CarPlay: Set primary phone calls: %@. \nConference phone calls: %@. \nIncoming phone call: %@", buf, 0x20u);
  }
  unint64_t v110 = (unint64_t)v8;

  v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
    v12 = [(PHCarPlayMainInCallViewController *)self conferenceParticipants];
    v13 = [(PHCarPlayMainInCallViewController *)self incomingCall];
    *(_DWORD *)buf = 138412802;
    id v141 = v11;
    __int16 v142 = 2112;
    unint64_t v143 = (unint64_t)v12;
    __int16 v144 = 2112;
    id v145 = v13;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "-- CarPlay: Existing primary phone calls: %@. \nConference phone calls: %@. \nIncoming phone call: %@", buf, 0x20u);
  }
  if (([(PHCarPlayMainInCallViewController *)self isViewLoaded] & 1) == 0) {
    [(PHCarPlayMainInCallViewController *)self loadView];
  }
  long long v133 = 0u;
  long long v134 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v14 = v7;
  id v15 = [v14 countByEnumeratingWithState:&v131 objects:v139 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v132;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(void *)v132 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v131 + 1) + 8 * i);
        if ([v19 originatingUIType] == 10)
        {
          v20 = +[TUCallCenter sharedInstance];
          v21 = [v20 routeController];
          v22 = [v21 pickedRoute];
          unsigned __int8 v23 = [v22 isSpeaker];

          if ((v23 & 1) == 0)
          {
            v36 = +[TUCallCenter sharedInstance];
            v37 = [v36 routeController];
            v30 = [v37 routeForSpeakerEnable];

            if (!v30)
            {
              v33 = sub_1000D5130();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
                sub_1001EC570(&v129, v130, v33);
              }
              goto LABEL_27;
            }
            v38 = +[TUCallCenter sharedInstance];
            v39 = [v38 routeController];
            [v39 pickRoute:v30];

            v33 = sub_1000D5130();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
LABEL_27:

              continue;
            }
            *(_WORD *)buf = 0;
            double v34 = v33;
            v35 = "-- CarPlay: Routing audio back to speaker";
LABEL_26:
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, v35, buf, 2u);
            goto LABEL_27;
          }
        }
        if ([v19 originatingUIType] == 12)
        {
          v24 = +[TUCallCenter sharedInstance];
          v25 = [v24 routeController];
          v26 = [v25 pickedRoute];
          unsigned __int8 v27 = [v26 isReceiver];

          if ((v27 & 1) == 0)
          {
            v28 = +[TUCallCenter sharedInstance];
            v29 = [v28 routeController];
            v30 = [v29 routeForSpeakerDisable];

            if (v30)
            {
              v31 = +[TUCallCenter sharedInstance];
              double v32 = [v31 routeController];
              [v32 pickRoute:v30];

              v33 = sub_1000D5130();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                double v34 = v33;
                v35 = "-- CarPlay: Routing audio back to receiver";
                goto LABEL_26;
              }
              goto LABEL_27;
            }
            v33 = sub_1000D5130();
            if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_27;
            }
            *(_WORD *)buf = 0;
            double v34 = v33;
            v35 = "[WARN] -- CarPlay: Could not find available route to pick for speaker disable";
            goto LABEL_26;
          }
        }
      }
      id v16 = [v14 countByEnumeratingWithState:&v131 objects:v139 count:16];
    }
    while (v16);
  }

  uint64_t v40 = [(PHCarPlayMainInCallViewController *)self __sanitizedPrimaryPhoneCallOrdering:v14];

  uint64_t v41 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
  uint64_t v42 = [(PHCarPlayMainInCallViewController *)self conferenceParticipants];
  uint64_t v43 = [(PHCarPlayMainInCallViewController *)self incomingCall];
  v44 = (void *)v110;
  if (([(id)v41 isEqualToArray:v40] & 1) == 0 && v40 | v41
    || ([(id)v42 isEqualToArray:v113] & 1) == 0 && v113 | v42
    || v43 != v110 && v110 | v43)
  {
    *(void *)v111 = v43;
    uint64_t v108 = v42;
    v109 = (void *)v41;
    v45 = +[NSMutableArray array];
    v46 = +[NSMutableArray array];
    long long v125 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    uint64_t v107 = v40;
    id v47 = (id)v40;
    id v48 = [v47 countByEnumeratingWithState:&v125 objects:v138 count:16];
    if (v48)
    {
      id v49 = v48;
      uint64_t v50 = *(void *)v126;
      do
      {
        for (j = 0; j != v49; j = (char *)j + 1)
        {
          if (*(void *)v126 != v50) {
            objc_enumerationMutation(v47);
          }
          uint64_t v52 = *(void *)(*((void *)&v125 + 1) + 8 * (void)j);
          v53 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
          unsigned __int8 v54 = [v53 containsObject:v52];

          if ((v54 & 1) == 0) {
            [v45 addObject:v52];
          }
        }
        id v49 = [v47 countByEnumeratingWithState:&v125 objects:v138 count:16];
      }
      while (v49);
    }

    long long v123 = 0u;
    long long v124 = 0u;
    long long v121 = 0u;
    long long v122 = 0u;
    v55 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
    id v56 = [v55 countByEnumeratingWithState:&v121 objects:v137 count:16];
    if (v56)
    {
      id v57 = v56;
      uint64_t v58 = *(void *)v122;
      do
      {
        for (k = 0; k != v57; k = (char *)k + 1)
        {
          if (*(void *)v122 != v58) {
            objc_enumerationMutation(v55);
          }
          uint64_t v60 = *(void *)(*((void *)&v121 + 1) + 8 * (void)k);
          if ((objc_msgSend(v47, "containsObject:", v60, v107) & 1) == 0) {
            [v46 addObject:v60];
          }
        }
        id v57 = [v55 countByEnumeratingWithState:&v121 objects:v137 count:16];
      }
      while (v57);
    }

    long long v119 = 0u;
    long long v120 = 0u;
    long long v118 = 0u;
    long long v117 = 0u;
    v61 = [(PHCarPlayMainInCallViewController *)self conferenceParticipants];
    id v62 = [v61 countByEnumeratingWithState:&v117 objects:v136 count:16];
    if (v62)
    {
      id v63 = v62;
      uint64_t v64 = *(void *)v118;
      do
      {
        for (m = 0; m != v63; m = (char *)m + 1)
        {
          if (*(void *)v118 != v64) {
            objc_enumerationMutation(v61);
          }
          uint64_t v66 = *(void *)(*((void *)&v117 + 1) + 8 * (void)m);
          v67 = [v113 arrayByAddingObjectsFromArray:v47, v107];
          unsigned __int8 v68 = [v67 containsObject:v66];

          if ((v68 & 1) == 0 && ([v46 containsObject:v66] & 1) == 0) {
            [v46 addObject:v66];
          }
        }
        id v63 = [v61 countByEnumeratingWithState:&v117 objects:v136 count:16];
      }
      while (v63);
    }

    v69 = self;
    [(PHCarPlayMainInCallViewController *)self setPrimaryCalls:v47];
    [(PHCarPlayMainInCallViewController *)self setConferenceParticipants:v113];
    v44 = (void *)v110;
    [(PHCarPlayMainInCallViewController *)self setIncomingCall:v110];
    if ([(PHCarPlayMainInCallViewController *)self currentCallStateWarrantsCallWaitingMode]&& ![(PHCarPlayMainInCallViewController *)self currentMode])
    {
      v76 = sub_1000D5130();
      uint64_t v41 = (uint64_t)v109;
      if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEFAULT, "- call waiting - snapping to call waiting mode", buf, 2u);
      }

      v77 = [(PHCarPlayMainInCallViewController *)self view];
      v78 = [v77 superview];
      v116[0] = _NSConcreteStackBlock;
      v116[1] = 3221225472;
      v116[2] = sub_100116088;
      v116[3] = &unk_1002CD518;
      v116[4] = self;
      v115[0] = _NSConcreteStackBlock;
      v115[1] = 3221225472;
      v115[2] = sub_100116144;
      v115[3] = &unk_1002CD540;
      v115[4] = self;
      +[UIView transitionWithView:v78 duration:1048704 options:v116 animations:v115 completion:0.5];

      v69 = self;
    }
    else
    {
      uint64_t v41 = (uint64_t)v109;
      if ([(PHCarPlayMainInCallViewController *)self currentMode] == 1)
      {
        v70 = sub_1000D5130();
        if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "- in call waiting and the call state changed...", buf, 2u);
        }

        v71 = [(PHCarPlayMainInCallViewController *)self incomingCall];
        uint64_t v40 = v107;
        if (v71)
        {
        }
        else if (!*(void *)v111 {
               || ([(PHCarPlayMainInCallViewController *)self primaryCalls],
        }
                   v79 = objc_claimAutoreleasedReturnValue(),
                   unsigned __int8 v80 = [v79 containsObject:*(void *)v111],
                   v79,
                   (v80 & 1) == 0))
        {
          v81 = sub_1000D5130();
          if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "- ... it was the incoming phone call which went away", buf, 2u);
          }

          v82 = [(PHCarPlayMainInCallViewController *)self view];
          v83 = [v82 superview];
          v114[0] = _NSConcreteStackBlock;
          v114[1] = 3221225472;
          v114[2] = sub_100116158;
          v114[3] = &unk_1002CD518;
          v114[4] = self;
          +[UIView transitionWithView:v83 duration:2097280 options:v114 animations:0 completion:0.5];

          v69 = self;
        }
        v84 = [(PHCarPlayMainInCallViewController *)v69 primaryCalls];
        if ([v84 containsObject:*(void *)v111])
        {
          v85 = [(PHCarPlayMainInCallViewController *)v69 primaryCalls];
          id v86 = [v85 count];
          id v87 = [v109 count];

          v69 = self;
          if (v86 == v87) {
            [(PHCarPlayMainInCallViewController *)self setCurrentMode:0];
          }
        }
        else
        {
        }
        v88 = [(PHCarPlayMainInCallViewController *)v69 primaryCalls];
        if (([v88 containsObject:*(void *)v111] & 1) == 0) {
          goto LABEL_115;
        }
        v89 = [(PHCarPlayMainInCallViewController *)v69 primaryCalls];
        id v90 = [v89 count];
        id v91 = [v109 count];

        BOOL v92 = v90 > v91;
        uint64_t v41 = (uint64_t)v109;
        v69 = self;
        v44 = (void *)v110;
        if (!v92) {
          goto LABEL_121;
        }
        [(PHCarPlayMainInCallViewController *)self setCurrentMode:0];
        v88 = [(PHCarPlayMainInCallViewController *)self galleryView];
        v93 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
        v94 = v93;
        if (*(void *)v111)
        {
          uint64_t v135 = *(void *)v111;
          id v95 = +[NSArray arrayWithObjects:&v135 count:1];
          v96 = [v94 arrayByExcludingObjectsInArray:v95];
          v97 = [v96 lastObject];
          [v88 addPrimaryPhoneCall:v97 animated:1];

          v69 = self;
        }
        else
        {
          id v95 = [v93 lastObject];
          [v88 addPrimaryPhoneCall:v95 animated:1];
        }

LABEL_114:
LABEL_115:

        uint64_t v41 = (uint64_t)v109;
        v44 = (void *)v110;
LABEL_121:
        [(PHCarPlayMainInCallViewController *)v69 updateButtonsViewState];

        uint64_t v42 = v108;
        uint64_t v43 = *(void *)v111;
        goto LABEL_122;
      }
      if ([v109 count] || !objc_msgSend(v47, "count"))
      {
        if ([v109 count] == (id)1
          && [v45 count] == (id)1
          && ![v46 count])
        {
          v103 = sub_1000D5130();
          if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v103, OS_LOG_TYPE_DEFAULT, "- addition of new call", buf, 2u);
          }

          [(PHCarPlayMainInCallViewController *)self setCurrentMode:0];
          v75 = [(PHCarPlayMainInCallViewController *)self galleryView];
          v104 = [v45 lastObject];
          [v75 addPrimaryPhoneCall:v104 animated:1];
        }
        else
        {
          v72 = [v46 lastObject];
          unsigned int v73 = [(id)v113 containsObject:v72];

          if (!v73)
          {
            if ([v46 count] != (id)1)
            {
              if ([v47 count]
                || (id v105 = [(id)v113 count], v110)
                || v105
                || !*(void *)v111)
              {
                v101 = sub_1000D5130();
                uint64_t v40 = v107;
                if (os_log_type_enabled(v101, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "- catch-all reload", buf, 2u);
                }

                [(PHCarPlayMainInCallViewController *)self setCurrentMode:0];
                v102 = [(PHCarPlayMainInCallViewController *)self galleryView];
                [v102 reloadPhoneCallData];
              }
              else
              {
                v106 = sub_1000D5130();
                uint64_t v40 = v107;
                if (os_log_type_enabled(v106, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v106, OS_LOG_TYPE_DEFAULT, "- incoming call was declined, we'll leave the UI as it is to animate out", buf, 2u);
                }

                [(PHCarPlayMainInCallViewController *)self setCurrentMode:0];
              }
              goto LABEL_121;
            }
            v99 = sub_1000D5130();
            if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "- removed calls contains an object, ending it", buf, 2u);
            }

            [(PHCarPlayMainInCallViewController *)self setCurrentMode:0];
            v88 = [v46 lastObject];
            uint64_t v40 = v107;
            if ([v88 disconnectedReason] == 14)
            {
              [(PHCarPlayMainInCallViewController *)self setFailedCall:v88];
              CFStringRef v100 = [(PHCarPlayMainInCallViewController *)self buttonsView];
              [v100 setButtonsMode:6 animated:1];

              v94 = [(PHCarPlayMainInCallViewController *)self galleryView];
              [v94 setIsShowingCallFailure:1];
            }
            else
            {
              v94 = [(PHCarPlayMainInCallViewController *)self galleryView];
              [v94 endPhoneCall:v88 animated:1];
            }
            goto LABEL_114;
          }
          v74 = sub_1000D5130();
          if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "- a removed call became a conference participant, merging", buf, 2u);
          }

          [(PHCarPlayMainInCallViewController *)self setCurrentMode:0];
          v75 = [(PHCarPlayMainInCallViewController *)self galleryView];
          [v75 mergePrimaryPhoneCallsAnimated:1];
        }
      }
      else
      {
        CFStringRef v98 = sub_1000D5130();
        if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "- initial call, reloading view", buf, 2u);
        }

        [(PHCarPlayMainInCallViewController *)self setCurrentMode:0];
        v75 = [(PHCarPlayMainInCallViewController *)self galleryView];
        [v75 reloadPhoneCallData];
      }
    }
    uint64_t v40 = v107;
    goto LABEL_121;
  }
  v45 = sub_1000D5130();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "-- CarPlay: No change to the phone calls, returning early.", buf, 2u);
  }
LABEL_122:
}

- (id)__sanitizedPrimaryPhoneCallOrdering:(id)a3
{
  id v3 = a3;
  objc_super v4 = v3;
  if ([v3 count] == (id)2)
  {
    objc_super v5 = [v3 firstObject];
    unsigned int v6 = [v5 isConferenced];

    objc_super v4 = v3;
    if (v6)
    {
      id v7 = [v3 objectAtIndexedSubscript:1];
      v10[0] = v7;
      id v8 = [v3 objectAtIndexedSubscript:0];
      v10[1] = v8;
      objc_super v4 = +[NSArray arrayWithObjects:v10 count:2];
    }
  }

  return v4;
}

- (id)currentActivePhoneCall
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
  id v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (!v4)
  {

LABEL_17:
    v13 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
    unsigned int v6 = [v13 lastObject];

    goto LABEL_18;
  }
  id v5 = v4;
  unsigned int v6 = 0;
  uint64_t v7 = *(void *)v16;
  do
  {
    for (i = 0; i != v5; i = (char *)i + 1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
      unsigned int v10 = [v9 status];
      if (v10 == 4 || v10 == 1)
      {
        id v12 = v9;

        unsigned int v6 = v12;
      }
    }
    id v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  }
  while (v5);

  if (!v6) {
    goto LABEL_17;
  }
LABEL_18:

  return v6;
}

- (BOOL)isDismissable
{
  id v3 = [(PHCarPlayMainInCallViewController *)self failedCall];
  if (v3)
  {

    return 0;
  }
  id v4 = [(PHCarPlayMainInCallViewController *)self callToDecline];

  if (v4) {
    return 0;
  }
  return ![(PHCarPlayMainInCallViewController *)self isShowingStickyAlert];
}

- (void)setShouldPresentAlertButton:(BOOL)a3
{
  if (self->_shouldPresentAlertButton != a3)
  {
    BOOL v3 = a3;
    self->_shouldPresentAlertButton = a3;
    id v5 = [(PHCarPlayMainInCallViewController *)self galleryView];
    [v5 setIsShowingAlertSubtitle:v3];

    [(PHCarPlayMainInCallViewController *)self updateButtonsViewState];
  }
}

- (void)setIsMuted:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PHCarPlayMainInCallViewController *)self buttonsView];
  [v4 setMuted:v3];
}

- (BOOL)isMuted
{
  v2 = [(PHCarPlayMainInCallViewController *)self callContainer];
  BOOL v3 = [v2 frontmostAudioOrVideoCall];

  LOBYTE(v2) = [v3 isUplinkMuted];
  return (char)v2;
}

- (id)primaryPhoneCallsForGalleryView:(id)a3
{
  unsigned int v4 = [(PHCarPlayMainInCallViewController *)self currentMode];
  uint64_t v5 = [(PHCarPlayMainInCallViewController *)self incomingCall];
  unsigned int v6 = (void *)v5;
  if (v4)
  {
    uint64_t v12 = v5;
    uint64_t v7 = +[NSArray arrayWithObjects:&v12 count:1];
LABEL_3:
    uint64_t v8 = v7;
    goto LABEL_6;
  }
  if (!v5)
  {
    uint64_t v7 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
    goto LABEL_3;
  }
  v9 = [(PHCarPlayMainInCallViewController *)self incomingCall];
  v13 = v9;
  uint64_t v8 = +[NSArray arrayWithObjects:&v13 count:1];

LABEL_6:
  if (v8) {
    unsigned int v10 = (void *)v8;
  }
  else {
    unsigned int v10 = &__NSArray0__struct;
  }

  return v10;
}

- (id)conferenceParticipantCallsForPhoneCall:(id)a3
{
  if ([(PHCarPlayMainInCallViewController *)self currentMode]) {
    goto LABEL_3;
  }
  unsigned int v4 = [(PHCarPlayMainInCallViewController *)self conferenceParticipants];
  uint64_t v5 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
  unsigned int v6 = [v4 arrayByExcludingObjectsInArray:v5];

  if (!v6) {
LABEL_3:
  }
    unsigned int v6 = &__NSArray0__struct;

  return v6;
}

- (id)allConferenceParticipantCalls
{
  if ([(PHCarPlayMainInCallViewController *)self currentMode]
    || ([(PHCarPlayMainInCallViewController *)self conferenceParticipants],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    BOOL v3 = &__NSArray0__struct;
  }

  return v3;
}

- (id)representativePhoneCallForConferenceForGalleryView:(id)a3
{
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v5);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v11 isConferenced])
        {
          id v12 = v11;

          uint64_t v8 = v12;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (BOOL)isAddCallAllowed
{
  BOOL v3 = [(PHCarPlayMainInCallViewController *)self shouldAllowAddContactsAccess];
  if (v3)
  {
    id v4 = [(PHCarPlayMainInCallViewController *)self callCenter];
    unsigned __int8 v5 = [v4 isAddCallAllowed];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isMergeCallsAllowed
{
  BOOL v3 = [(PHCarPlayMainInCallViewController *)self callContainer];
  id v4 = [v3 callWithStatus:3];

  unsigned __int8 v5 = [(PHCarPlayMainInCallViewController *)self callContainer];
  id v6 = [v5 callWithStatus:1];

  id v7 = [(PHCarPlayMainInCallViewController *)self callContainer];
  uint64_t v8 = [v7 callWithStatus:2];

  unsigned __int8 v9 = 0;
  if (!v4 && v6 && v8)
  {
    unsigned int v10 = [(PHCarPlayMainInCallViewController *)self callCenter];
    unsigned __int8 v9 = [v10 canGroupCall:v6 withCall:v8];
  }
  return v9;
}

- (BOOL)isSwapCallsAllowed
{
  BOOL v3 = [(PHCarPlayMainInCallViewController *)self callContainer];
  id v4 = [v3 callWithStatus:1];

  unsigned __int8 v5 = [(PHCarPlayMainInCallViewController *)self callContainer];
  id v6 = [v5 callWithStatus:2];

  if (v6)
  {
    id v7 = [v4 model];
    unsigned __int8 v8 = [v7 supportsHolding];
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (BOOL)isKeypadAllowed
{
  v2 = [(PHCarPlayMainInCallViewController *)self callContainer];
  BOOL v3 = [v2 frontmostAudioOrVideoCall];
  id v4 = [v3 model];
  unsigned __int8 v5 = [v4 supportsDTMF];

  return v5;
}

- (BOOL)isKeypadEnabled
{
  if ([(PHCarPlayMainInCallViewController *)self isKeypadAllowed])
  {
    BOOL v3 = [(PHCarPlayMainInCallViewController *)self callContainer];
    id v4 = [v3 frontmostAudioOrVideoCall];
    unsigned int v5 = [v4 isOnHold] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (BOOL)isHoldEnabled
{
  v2 = [(PHCarPlayMainInCallViewController *)self callContainer];
  BOOL v3 = [v2 frontmostAudioOrVideoCall];
  unsigned __int8 v4 = [v3 isOnHold];

  return v4;
}

- (BOOL)isSendToVoicemailAllowed
{
  BOOL v3 = +[ICSApplicationServices sharedInstance];
  unsigned __int8 v4 = [v3 accountManager];
  unsigned int v5 = [v4 accounts];
  if ([v5 count])
  {
    id v6 = [(PHCarPlayMainInCallViewController *)self callContainer];
    id v7 = [v6 incomingCall];
    unsigned __int8 v8 = [v7 model];
    unsigned __int8 v9 = [v8 supportsSendingToVoicemail];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (BOOL)canSendMessage
{
  BOOL v3 = [(PHCarPlayMainInCallViewController *)self callContainer];
  uint64_t v4 = [v3 incomingCall];
  if (v4)
  {
    unsigned int v5 = (void *)v4;

LABEL_4:
    BOOL v7 = [(PHCarPlayMainInCallViewController *)self canSendMessageToCall:v5];

    return v7;
  }
  id v6 = [(PHCarPlayMainInCallViewController *)self callCenter];
  unsigned int v5 = [v6 incomingVideoCall];

  if (v5) {
    goto LABEL_4;
  }
  return 0;
}

- (int64_t)currentCallState
{
  v2 = +[TUCallCenter sharedInstance];
  BOOL v3 = (char *)[v2 bottomBarCallState];

  if ((unint64_t)(v3 - 2) >= 3) {
    return 1;
  }
  else {
    return (int64_t)v3;
  }
}

- (BOOL)shouldAllowAddContactsAccess
{
  BOOL v3 = [(PHCarPlayMainInCallViewController *)self carSessionStatus];
  uint64_t v4 = [v3 currentSession];
  unsigned int v5 = [v4 configuration];
  id v6 = [v5 screens];
  BOOL v7 = [v6 firstObject];

  unsigned __int8 v8 = [(PHCarPlayMainInCallViewController *)self carSessionStatus];
  unsigned __int8 v9 = [v8 currentSession];
  unsigned int v10 = [v9 limitUserInterfaces];
  unsigned __int8 v11 = [v10 BOOLValue];

  if (((unint64_t)[v7 limitedUIElements] & 4) != 0) {
    char v12 = v11 ^ 1;
  }
  else {
    char v12 = 1;
  }

  return v12;
}

- (void)sessionDidConnect:(id)a3
{
}

- (void)_sendMessageResponse:(id)a3 toCall:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = +[IMDaemonController sharedInstance];
  unsigned __int8 v8 = +[NSBundle mainBundle];
  unsigned __int8 v9 = [v8 bundleIdentifier];
  [v7 addListenerID:v9 capabilities:(kFZListenerCapChats | kFZListenerCapAccounts)];

  unsigned int v10 = +[IMDaemonController sharedInstance];
  [v10 _setBlocksConnectionAtResume:1];

  unsigned __int8 v11 = [v5 handle];
  char v12 = [v11 value];

  if ([v12 destinationIdIsPhoneNumber])
  {
    v13 = (void *)CPPhoneNumberCopyCountryCodeForIncomingTextMessage();
    if (!v13)
    {
      v13 = TUActiveCountryCode();
    }
    long long v14 = TUNetworkCountryCode();
    TUNumberToDial();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = v12;
  }
  if (qword_1003263D8[0] != -1) {
    dispatch_once(qword_1003263D8, &stru_1002D0D88);
  }
  long long v16 = +[IMSystemMonitor sharedInstance];
  [v16 _forceSuspended];

  long long v17 = +[IMSystemMonitor sharedInstance];
  [v17 _forceResumed];

  long long v18 = (void (*)(void *, id, void *))off_1003263D0;
  id v23 = v15;
  v19 = +[NSArray arrayWithObjects:&v23 count:1];
  v20 = [v5 localSenderIdentity];
  v21 = [v20 accountUUID];
  v22 = [v21 UUIDString];
  v18(v19, v6, v22);
}

- (void)inCallButtonWasTapped:(id)a3
{
  id v4 = a3;
  if (![v4 inCallButtonType])
  {
    unsigned __int8 v8 = [(PHCarPlayMainInCallViewController *)self callCenter];
    [v8 disconnectCurrentCallAndActivateHeld];

    unsigned __int8 v9 = [(PHCarPlayMainInCallViewController *)self callContainer];
    unsigned int v10 = [v9 callWithStatus:2];

    if (v10)
    {
LABEL_16:

      goto LABEL_17;
    }
    unsigned __int8 v11 = sub_1000D5130();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Requesting delegate for dismissal since there are no held calls", buf, 2u);
    }

    char v12 = [(PHCarPlayMainInCallViewController *)self delegate];
    [v12 dismissalRequestedFromInCallViewController:self];
LABEL_8:

    goto LABEL_16;
  }
  if ([v4 inCallButtonType] == 1)
  {
    [v4 setToggledOn:[v4 toggledOn] ^ 1];
    id v5 = [(PHCarPlayMainInCallViewController *)self callContainer];
    id v6 = [v5 frontmostAudioOrVideoCall];

    [v6 setUplinkMuted:[v4 toggledOn]];
    BOOL v7 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    [v7 setMuted:[v4 toggledOn]];

LABEL_11:
    goto LABEL_17;
  }
  if ([v4 inCallButtonType] == 5)
  {
    v13 = [(PHCarPlayMainInCallViewController *)self callContainer];
    id v6 = [v13 callWithStatus:2];

    long long v14 = [(PHCarPlayMainInCallViewController *)self callContainer];
    id v15 = [v14 callWithStatus:1];

    long long v16 = [(PHCarPlayMainInCallViewController *)self callCenter];
    [v16 groupCall:v6 withOtherCall:v15];

    goto LABEL_11;
  }
  if ([v4 inCallButtonType] == 7)
  {
    unsigned int v10 = [(PHCarPlayMainInCallViewController *)self callCenter];
    long long v17 = [(PHCarPlayMainInCallViewController *)self conferenceParticipants];
    long long v18 = [v17 lastObject];
    [v10 ungroupCall:v18];
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  if ([v4 inCallButtonType] == 6)
  {
    v19 = [(PHCarPlayMainInCallViewController *)self callCenter];
    [v19 swapCalls];
LABEL_20:

    goto LABEL_17;
  }
  if ([v4 inCallButtonType] == 3)
  {
    unsigned int v10 = [(PHCarPlayMainInCallViewController *)self delegate];
    [v10 presentAddCallViewControllerRequestedFromInCallViewController:self];
    goto LABEL_16;
  }
  if ([v4 inCallButtonType] == 8)
  {
    v20 = [(PHCarPlayMainInCallViewController *)self incomingCall];

    if (!v20) {
      goto LABEL_17;
    }
    v21 = [(PHCarPlayMainInCallViewController *)self incomingCall];
    unsigned int v22 = [v21 status];

    id v23 = [(PHCarPlayMainInCallViewController *)self incomingCall];
    unsigned int v10 = v23;
    if (v22 == 4)
    {
      if ([v23 isVideo]) {
        uint64_t v24 = 4;
      }
      else {
        uint64_t v24 = 0;
      }
      [(PHCarPlayMainInCallViewController *)self answerIncomingCallWithBehavior:v24];
      goto LABEL_16;
    }
    if ([v23 isConversation])
    {
      v36 = [(PHCarPlayMainInCallViewController *)self incomingCall];
      unsigned int v37 = [v36 status];

      if (v37 == 3)
      {
        unsigned int v10 = +[TUCallCenter sharedInstance];
        char v12 = [(PHCarPlayMainInCallViewController *)self incomingCall];
        v38 = [v10 activeConversationForCall:v12];
        [(PHCarPlayMainInCallViewController *)self answerIncomingConversation:v38];

        goto LABEL_8;
      }
    }
    else
    {
    }
    v19 = sub_1000D5130();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Ignoring Answer command", buf, 2u);
    }
    goto LABEL_20;
  }
  if ([v4 inCallButtonType] == 4) {
    goto LABEL_39;
  }
  if ([v4 inCallButtonType] == 9)
  {
    v25 = [(PHCarPlayMainInCallViewController *)self incomingCall];

    if (!v25) {
      goto LABEL_17;
    }
    v26 = [(PHCarPlayMainInCallViewController *)self incomingCall];
    [(PHCarPlayMainInCallViewController *)self setCallToDecline:v26];

    unsigned __int8 v27 = [(PHCarPlayMainInCallViewController *)self replyWithMessageStore];
    unsigned int v10 = [v27 cannedReplyActionSheetOptions];

    v28 = +[NSBundle mainBundle];
    v29 = [v28 localizedStringForKey:@"CARPLAY_REPLY_WITH_MESSAGE_TITLE" value:&stru_1002D6110 table:@"PHCarPlay"];
    char v12 = +[UIAlertController _alertControllerWithTitle:v29 message:0];

    [v12 setPreferredStyle:0];
    [v12 setModalPresentationStyle:7];
    v30 = +[NSBundle mainBundle];
    v31 = [v30 localizedStringForKey:@"CARPLAY_REPLY_TEXT_MESSAGE_TITLE" value:&stru_1002D6110 table:@"PHCarPlay"];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100117ADC;
    v52[3] = &unk_1002CD518;
    v52[4] = self;
    [v12 _addActionWithTitle:v31 style:0 handler:v52];

    double v32 = [v10 objectAtIndexedSubscript:0];
    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100117B60;
    v51[3] = &unk_1002CD518;
    v51[4] = self;
    [v12 _addActionWithTitle:v32 style:0 handler:v51];

    v33 = [v10 objectAtIndexedSubscript:1];
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100117BE4;
    v50[3] = &unk_1002CD518;
    v50[4] = self;
    [v12 _addActionWithTitle:v33 style:0 handler:v50];

    double v34 = TelephonyUIBundle();
    v35 = [v34 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"General"];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100117C68;
    v49[3] = &unk_1002CD518;
    v49[4] = self;
    [v12 _addActionWithTitle:v35 style:1 handler:v49];

    [(PHCarPlayMainInCallViewController *)self presentViewController:v12 animated:1 completion:0];
    goto LABEL_8;
  }
  if ([v4 inCallButtonType] == 13
    || [v4 inCallButtonType] == 16)
  {
LABEL_39:
    v39 = [(PHCarPlayMainInCallViewController *)self incomingCall];

    if (!v39) {
      goto LABEL_17;
    }
    unsigned int v10 = [(PHCarPlayMainInCallViewController *)self callCenter];
    long long v17 = [(PHCarPlayMainInCallViewController *)self incomingCall];
    [v10 disconnectCall:v17 withReason:2];
    goto LABEL_15;
  }
  if ([v4 inCallButtonType] == 10)
  {
    uint64_t v40 = self;
    uint64_t v41 = 0;
LABEL_50:
    [(PHCarPlayMainInCallViewController *)v40 answerIncomingCallWithBehavior:v41];
    goto LABEL_17;
  }
  if ([v4 inCallButtonType] == 11)
  {
    uint64_t v40 = self;
    uint64_t v41 = 2;
    goto LABEL_50;
  }
  if ([v4 inCallButtonType] == 12)
  {
    uint64_t v40 = self;
    uint64_t v41 = 1;
    goto LABEL_50;
  }
  if ([v4 inCallButtonType] == 2)
  {
    unsigned int v10 = [(PHCarPlayMainInCallViewController *)self delegate];
    [v10 presentKeypadViewControllerRequestedFromInCallViewController:self];
    goto LABEL_16;
  }
  if ([v4 inCallButtonType] == 14)
  {
    uint64_t v42 = [(PHCarPlayMainInCallViewController *)self callCenter];
    uint64_t v43 = [(PHCarPlayMainInCallViewController *)self failedCall];
    v44 = [v43 dialRequestForRedial];
    id v45 = [v42 dialWithRequest:v44];

    [(PHCarPlayMainInCallViewController *)self setFailedCall:0];
    v19 = [(PHCarPlayMainInCallViewController *)self galleryView];
    [v19 setIsShowingCallFailure:0];
    goto LABEL_20;
  }
  if ([v4 inCallButtonType] == 15)
  {
    [(PHCarPlayMainInCallViewController *)self setFailedCall:0];
    v46 = [(PHCarPlayMainInCallViewController *)self galleryView];
    [v46 setIsShowingCallFailure:0];

    id v47 = [(PHCarPlayMainInCallViewController *)self callContainer];
    id v48 = [v47 currentCallCount];

    if (v48)
    {
      [(PHCarPlayMainInCallViewController *)self updateButtonsViewState];
      goto LABEL_17;
    }
    unsigned int v10 = [(PHCarPlayMainInCallViewController *)self delegate];
    [v10 dismissalRequestedFromInCallViewController:self];
    goto LABEL_16;
  }
  if ([v4 inCallButtonType] == 17)
  {
    unsigned int v10 = [(PHCarPlayMainInCallViewController *)self callCenter];
    long long v17 = [(PHCarPlayMainInCallViewController *)self callContainer];
    long long v18 = [v17 frontmostAudioOrVideoCall];
    [v10 unholdCall:v18];
    goto LABEL_14;
  }
  if ([v4 inCallButtonType] == 18) {
    [(PHCarPlayMainInCallViewController *)self _handleAlertButtonPressed];
  }
LABEL_17:
}

- (void)answerIncomingConversation:(id)a3
{
  id v4 = a3;
  id v9 = [objc_alloc((Class)TUJoinConversationRequest) initWithConversation:v4 originatingUIType:46];

  [v9 setVideoEnabled:0];
  id v5 = [(PHCarPlayMainInCallViewController *)self incomingCall];
  id v6 = [v5 uniqueProxyIdentifierUUID];
  [v9 setUUID:v6];

  BOOL v7 = +[TUCallCenter sharedInstance];
  id v8 = [v7 joinConversationWithConversationRequest:v9];
}

- (void)answerIncomingCallWithBehavior:(int64_t)a3
{
  id v5 = objc_alloc((Class)TUAnswerRequest);
  id v6 = [(PHCarPlayMainInCallViewController *)self incomingCall];
  id v8 = [v5 initWithCall:v6];

  [v8 setSourceIdentifier:TUCallSourceIdentifierCarPlay];
  [v8 setBehavior:a3];
  [v8 setDowngradeToAudio:1];
  BOOL v7 = [(PHCarPlayMainInCallViewController *)self callCenter];
  [v7 answerWithRequest:v8];
}

- (id)replyWithMessageStore
{
  replyWithMessageStore = self->_replyWithMessageStore;
  if (!replyWithMessageStore)
  {
    id v4 = (TUReplyWithMessageStore *)objc_alloc_init((Class)TUReplyWithMessageStore);
    id v5 = self->_replyWithMessageStore;
    self->_replyWithMessageStore = v4;

    replyWithMessageStore = self->_replyWithMessageStore;
  }

  return replyWithMessageStore;
}

- (void)handleAlertControllerSendMessageResponse:(id)a3
{
  id v9 = a3;
  if (v9)
  {
    id v4 = [(PHCarPlayMainInCallViewController *)self callToDecline];

    if (v4)
    {
      id v5 = [(PHCarPlayMainInCallViewController *)self callToDecline];
      [(PHCarPlayMainInCallViewController *)self _sendMessageResponse:v9 toCall:v5];

      id v6 = [(PHCarPlayMainInCallViewController *)self callCenter];
      BOOL v7 = [(PHCarPlayMainInCallViewController *)self incomingCall];
      [v6 disconnectCall:v7 withReason:4];
    }
  }
  [(PHCarPlayMainInCallViewController *)self setCallToDecline:0];
  id v8 = [(PHCarPlayMainInCallViewController *)self delegate];
  [v8 dismissalRequestedFromInCallViewController:self];
}

- (BOOL)areIncomingCallOptionsAllowed
{
  return 1;
}

- (BOOL)canSendMessageToCall:(id)a3
{
  return [a3 isMessagingAllowed];
}

- (void)updateButtonsViewState
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(PHCarPlayMainInCallViewController *)self failedCall];
    id v5 = [(PHCarPlayMainInCallViewController *)self incomingCall];
    id v6 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
    id v7 = [v6 count];
    id v8 = [(PHCarPlayMainInCallViewController *)self conferenceParticipants];
    int v41 = 138413058;
    uint64_t v42 = v4;
    __int16 v43 = 2112;
    v44 = v5;
    __int16 v45 = 2048;
    id v46 = v7;
    __int16 v47 = 2048;
    id v48 = [v8 count];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "-- CarPlay - updateButtonsViewState: self.failedCall=%@; self.incomingPhoneCall=%@; [self.primaryPhoneCalls count]"
      "=%ld; [self.conferenceParticipants count]=%ld",
      (uint8_t *)&v41,
      0x2Au);
  }
  id v9 = [(PHCarPlayMainInCallViewController *)self failedCall];

  if (v9)
  {
    unsigned int v10 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    unsigned __int8 v11 = v10;
    uint64_t v12 = 6;
LABEL_5:
    uint64_t v13 = 1;
LABEL_6:
    [v10 setButtonsMode:v12 animated:v13];

    long long v14 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
    [v14 setHidden:1];

LABEL_7:
    [(PHCarPlayMainInCallViewController *)self setNeedsFocusUpdate];
    return;
  }
  id v15 = [(PHCarPlayMainInCallViewController *)self incomingCall];

  if (v15)
  {
    long long v16 = [(PHCarPlayMainInCallViewController *)self incomingCall];
    if ([v16 status] == 3)
    {
    }
    else
    {
      unsigned int v22 = [(PHCarPlayMainInCallViewController *)self incomingCall];
      unsigned int v23 = [v22 status];

      if (v23 != 4) {
        goto LABEL_7;
      }
    }
    uint64_t v24 = [(PHCarPlayMainInCallViewController *)self incomingCall];
    if ([v24 isConversation])
    {
      v25 = [(PHCarPlayMainInCallViewController *)self incomingCall];
      unsigned int v26 = [v25 status];

      if (v26 == 3)
      {
        unsigned int v10 = [(PHCarPlayMainInCallViewController *)self buttonsView];
        unsigned __int8 v11 = v10;
LABEL_23:
        uint64_t v12 = 3;
        goto LABEL_5;
      }
    }
    else
    {
    }
    unsigned int v27 = [(PHCarPlayMainInCallViewController *)self currentCallStateWarrantsCallWaitingMode];
    unsigned int v10 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    unsigned __int8 v11 = v10;
    if (v27)
    {
      uint64_t v12 = 5;
      uint64_t v13 = 0;
      goto LABEL_6;
    }
    goto LABEL_23;
  }
  long long v17 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
  if ([v17 count] != (id)1)
  {

LABEL_25:
    v28 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
    id v29 = [v28 count];

    if ((unint64_t)v29 < 2)
    {
      v33 = [(PHCarPlayMainInCallViewController *)self conferenceParticipants];
      id v34 = [v33 count];

      if (!v34) {
        goto LABEL_7;
      }
      v30 = [(PHCarPlayMainInCallViewController *)self buttonsView];
      v31 = v30;
      uint64_t v32 = 4;
    }
    else
    {
      v30 = [(PHCarPlayMainInCallViewController *)self buttonsView];
      v31 = v30;
      uint64_t v32 = 2;
    }
LABEL_29:
    [v30 setButtonsMode:v32 animated:1];

    [(PHCarPlayMainInCallViewController *)self updateHardPauseButtonState];
    goto LABEL_7;
  }
  long long v18 = [(PHCarPlayMainInCallViewController *)self conferenceParticipants];
  id v19 = [v18 count];

  if (v19) {
    goto LABEL_25;
  }
  v20 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
  v21 = [v20 firstObject];
  if ([v21 status] == 5)
  {

    return;
  }
  v35 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
  v36 = [v35 firstObject];
  unsigned int v37 = [v36 status];

  if (v37 != 6)
  {
    if ([(PHCarPlayMainInCallViewController *)self _shouldPresentAlertUI])
    {
      v30 = [(PHCarPlayMainInCallViewController *)self buttonsView];
      v31 = v30;
      uint64_t v32 = 7;
    }
    else
    {
      v38 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
      v39 = [v38 firstObject];
      unsigned int v40 = [v39 isOnHold];

      v30 = [(PHCarPlayMainInCallViewController *)self buttonsView];
      v31 = v30;
      uint64_t v32 = v40 != 0;
    }
    goto LABEL_29;
  }
}

- (void)viewUpdateClockTickTimerFired:(id)a3
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"MPCarPlayInCallViewControllerUpdateClockTickNotification" object:0 userInfo:0];
}

- (void)muteStateChangedNotification:(id)a3
{
  BOOL v4 = [(PHCarPlayMainInCallViewController *)self isMuted];

  [(PHCarPlayMainInCallViewController *)self setIsMuted:v4];
}

- (void)callStateChangedNotification:(id)a3
{
  id v14 = a3;
  BOOL v4 = [(PHCarPlayMainInCallViewController *)self callContainer];
  id v5 = [v4 currentAudioAndVideoCallCount];

  if (v5) {
    [(PHCarPlayMainInCallViewController *)self updateButtonsViewState];
  }
  id v6 = [v14 object];
  unsigned int v7 = [v6 status];
  if (v7 == 6)
  {
    id v8 = [v6 callUUID];
    id v9 = [(PHCarPlayMainInCallViewController *)self redialedCallUUID];
    unsigned int v10 = [v8 isEqualToString:v9];

    if (v10)
    {
      unsigned __int8 v11 = [v6 dialRequestForRedial];
      uint64_t v12 = [(PHCarPlayMainInCallViewController *)self callCenter];
      id v13 = [v12 dialWithRequest:v11];

      [(PHCarPlayMainInCallViewController *)self setRedialedCallUUID:0];
    }
  }
  else if ((v7 & 0xFFFFFFFD) == 1)
  {
    +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHRedialCallAssertionReason"];
  }
}

- (void)limitedUIChangedNotification:(id)a3
{
  id v3 = a3;
  BOOL v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Limited UI changed %@", buf, 0xCu);
  }

  TUGuaranteeExecutionOnMainThreadAsync();
}

- (BOOL)currentCallStateWarrantsCallWaitingMode
{
  id v3 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
  if ([v3 count])
  {
    BOOL v4 = [(PHCarPlayMainInCallViewController *)self incomingCall];
    BOOL v5 = v4 != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)callForHardPauseState
{
  v2 = [(PHCarPlayMainInCallViewController *)self callContainer];
  id v3 = [v2 frontmostAudioOrVideoCall];

  return v3;
}

- (void)hardPauseButtonDidSendHardPauseDigits:(id)a3
{
  id v3 = [(PHCarPlayMainInCallViewController *)self callForHardPauseState];
  [v3 sendHardPauseDigits];
}

- (void)updateHardPauseButtonState
{
  id v3 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
  BOOL v4 = [(PHCarPlayMainInCallViewController *)self callForHardPauseState];
  BOOL v5 = [v4 hardPauseDigitsDisplayString];
  [v3 setTitle:v5 forState:0];

  id v7 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
  id v6 = [(PHCarPlayMainInCallViewController *)self callForHardPauseState];
  [v7 setHidden:[v6 hardPauseDigitsState] != 2];
}

- (id)preferredFocusEnvironments
{
  id v3 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
  unsigned int v4 = [v3 isHidden];

  if (v4)
  {
    BOOL v5 = [(PHCarPlayMainInCallViewController *)self buttonsView];
    unsigned int v10 = v5;
    id v6 = &v10;
  }
  else
  {
    BOOL v5 = [(PHCarPlayMainInCallViewController *)self hardPauseButton];
    id v9 = v5;
    id v6 = &v9;
  }
  id v7 = +[NSArray arrayWithObjects:v6 count:1];

  return v7;
}

- (void)cleanAlertUIInCarPlay
{
  uint64_t v3 = [(PHCarPlayMainInCallViewController *)self presentedViewController];
  if (v3)
  {
    unsigned int v4 = (void *)v3;
    BOOL v5 = [(PHCarPlayMainInCallViewController *)self presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = sub_1000D5130();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dismiss Carplay Alert UI", v8, 2u);
      }

      [(PHCarPlayMainInCallViewController *)self setShowingStickyAlert:0];
    }
  }
}

- (BOOL)_shouldPresentAlertUI
{
  v2 = self;
  uint64_t v3 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
  unsigned int v4 = [v3 firstObject];

  LOBYTE(v2) = [v4 canDisplayAlertUI:[self shouldPresentAlertButton]];
  return (char)v2;
}

- (void)_handleAlertButtonPressed
{
  uint64_t v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CarPlay alert button pressed", buf, 2u);
  }

  [(PHCarPlayMainInCallViewController *)self _presentAlertForEmergencyCallFailure];
  unsigned int v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Since CarPlay alert button pressed, invoking alert", v6, 2u);
  }

  [(PHCarPlayMainInCallViewController *)self setShowingStickyAlert:1];
  BOOL v5 = [(PHCarPlayMainInCallViewController *)self alertCoordinator];
  [v5 invokeAlertWithRequestUnlock:0 automaticallyInvoked:0];
}

- (void)_presentAlertForEmergencyCallFailure
{
  uint64_t v3 = objc_alloc_init(ICSCarPlayAlertViewController);
  [(ICSCarPlayAlertViewController *)v3 setDelegate:self];
  [(PHCarPlayMainInCallViewController *)self presentViewController:v3 animated:1 completion:0];
}

- (void)alertWillInvoke
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PHAlertDisconnectingCallsNotification" object:0];
}

- (void)setShowingStickyAlert:(BOOL)a3
{
  if (self->_showingStickyAlert != a3)
  {
    self->_showingStickyAlert = a3;
    if (a3)
    {
      unsigned int v4 = +[TUCallCenter sharedInstance];
      BOOL v5 = [v4 callPassingTest:&stru_1002D0DA8];
      [(PHCarPlayMainInCallViewController *)self setEmergencyCallBeforePresentingStickyAlert:v5];

      id v9 = +[UIApplication sharedApplication];
      id v6 = [v9 delegate];
      [v6 setShouldIgnoreCarPlayAssertionInvalidations:1];
    }
    else
    {
      id v7 = +[UIApplication sharedApplication];
      id v8 = [v7 delegate];
      [v8 setShouldIgnoreCarPlayAssertionInvalidations:0];

      id v9 = [(PHCarPlayMainInCallViewController *)self delegate];
      [v9 dismissalRequestedFromInCallViewController:self];
    }
  }
}

- (void)shouldPlaySound
{
  uint64_t v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Playing ping my phone", v5, 2u);
  }

  unsigned int v4 = [(PHCarPlayMainInCallViewController *)self nfmPlayCommands];
  [v4 playFindLocallySound];
}

- (void)shouldCallAgain
{
  unsigned int v3 = [(PHCarPlayMainInCallViewController *)self _shouldPresentAlertUI];
  unsigned int v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v5 = [(PHCarPlayMainInCallViewController *)self failedCall];
    id v6 = [v5 uniqueProxyIdentifier];
    id v7 = [(PHCarPlayMainInCallViewController *)self emergencyCallBeforePresentingStickyAlert];
    id v8 = [v7 uniqueProxyIdentifier];
    v19[0] = 67109634;
    v19[1] = v3;
    __int16 v20 = 2112;
    v21 = v6;
    __int16 v22 = 2112;
    unsigned int v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Carplay call again button pressed, shouldReconnect: %d failedCall: %@ emergencyCallBeforePresentingStickyAlert: %@", (uint8_t *)v19, 0x1Cu);
  }
  if (v3)
  {
    id v9 = [(PHCarPlayMainInCallViewController *)self primaryCalls];
    unsigned int v10 = [v9 firstObject];

    unsigned __int8 v11 = [v10 callUUID];
    [(PHCarPlayMainInCallViewController *)self setRedialedCallUUID:v11];

    +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHRedialCallAssertionReason"];
    uint64_t v12 = [(PHCarPlayMainInCallViewController *)self callCenter];
    [v12 disconnectCall:v10 withReason:34];
LABEL_12:

    goto LABEL_13;
  }
  id v13 = [(PHCarPlayMainInCallViewController *)self failedCall];
  if (v13)
  {

LABEL_8:
    id v15 = [(PHCarPlayMainInCallViewController *)self failedCall];
    if (v15) {
      [(PHCarPlayMainInCallViewController *)self failedCall];
    }
    else {
    unsigned int v10 = [(PHCarPlayMainInCallViewController *)self emergencyCallBeforePresentingStickyAlert];
    }

    uint64_t v12 = [v10 dialRequestForRedial];
    long long v16 = [(PHCarPlayMainInCallViewController *)self callCenter];
    id v17 = [v16 dialWithRequest:v12];

    [(PHCarPlayMainInCallViewController *)self setFailedCall:0];
    [(PHCarPlayMainInCallViewController *)self setEmergencyCallBeforePresentingStickyAlert:0];
    long long v18 = [(PHCarPlayMainInCallViewController *)self galleryView];
    [v18 setIsShowingCallFailure:0];

    goto LABEL_12;
  }
  id v14 = [(PHCarPlayMainInCallViewController *)self emergencyCallBeforePresentingStickyAlert];

  if (v14) {
    goto LABEL_8;
  }
LABEL_13:
  [(PHCarPlayMainInCallViewController *)self dismissViewControllerAnimated:1 completion:0];
  [(PHCarPlayMainInCallViewController *)self updateButtonsViewState];
}

- (void)alertViewWillDismiss
{
  [(PHCarPlayMainInCallViewController *)self setShowingStickyAlert:0];

  [(PHCarPlayMainInCallViewController *)self setEmergencyCallBeforePresentingStickyAlert:0];
}

- (void)presentDisconnectionAlert:(id)a3
{
}

- (BOOL)isShowSOSConfirmationSupported
{
  return 1;
}

- (MPCarPlayInCallViewControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MPCarPlayInCallViewControllerDelegate *)a3;
}

- (NSArray)primaryCalls
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPrimaryCalls:(id)a3
{
}

- (NSArray)conferenceParticipants
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConferenceParticipants:(id)a3
{
}

- (TUCall)incomingCall
{
  return (TUCall *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIncomingCall:(id)a3
{
}

- (UIView)flippyView
{
  return (UIView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFlippyView:(id)a3
{
}

- (PHCarPlayPhoneCallGalleryView)galleryView
{
  return (PHCarPlayPhoneCallGalleryView *)objc_getProperty(self, a2, 64, 1);
}

- (void)setGalleryView:(id)a3
{
}

- (PHCarPlayInCallButtonsView)buttonsView
{
  return (PHCarPlayInCallButtonsView *)objc_getProperty(self, a2, 72, 1);
}

- (void)setButtonsView:(id)a3
{
}

- (PHCarPlayInCallHardPauseButton)hardPauseButton
{
  return (PHCarPlayInCallHardPauseButton *)objc_getProperty(self, a2, 80, 1);
}

- (void)setHardPauseButton:(id)a3
{
}

- (NSTimer)viewUpdateClockTickTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 88, 1);
}

- (void)setViewUpdateClockTickTimer:(id)a3
{
}

- (TUCall)callToDecline
{
  return (TUCall *)objc_getProperty(self, a2, 96, 1);
}

- (void)setCallToDecline:(id)a3
{
}

- (unsigned)currentMode
{
  return self->_currentMode;
}

- (void)setCurrentMode:(unsigned __int16)a3
{
  self->_currentMode = a3;
}

- (TUCall)failedCall
{
  return (TUCall *)objc_getProperty(self, a2, 104, 1);
}

- (void)setFailedCall:(id)a3
{
}

- (CARSessionStatus)carSessionStatus
{
  return (CARSessionStatus *)objc_getProperty(self, a2, 112, 1);
}

- (void)setCarSessionStatus:(id)a3
{
}

- (NSString)redialedCallUUID
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setRedialedCallUUID:(id)a3
{
}

- (_TtP13InCallService24AlertCoordinatorProtocol_)alertCoordinator
{
  return self->_alertCoordinator;
}

- (void)setAlertCoordinator:(id)a3
{
}

- (NFMPlayCommands)nfmPlayCommands
{
  return self->_nfmPlayCommands;
}

- (void)setNfmPlayCommands:(id)a3
{
}

- (BOOL)shouldPresentAlertButton
{
  return self->_shouldPresentAlertButton;
}

- (BOOL)isShowingStickyAlert
{
  return self->_showingStickyAlert;
}

- (TUCall)emergencyCallBeforePresentingStickyAlert
{
  return self->_emergencyCallBeforePresentingStickyAlert;
}

- (void)setEmergencyCallBeforePresentingStickyAlert:(id)a3
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

- (id)canSendTextMessagesBlock
{
  return self->_canSendTextMessagesBlock;
}

- (void)setCanSendTextMessagesBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_canSendTextMessagesBlock, 0);
  objc_storeStrong((id *)&self->_callContainer, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_emergencyCallBeforePresentingStickyAlert, 0);
  objc_storeStrong((id *)&self->_nfmPlayCommands, 0);
  objc_storeStrong((id *)&self->_alertCoordinator, 0);
  objc_storeStrong((id *)&self->_redialedCallUUID, 0);
  objc_storeStrong((id *)&self->_carSessionStatus, 0);
  objc_storeStrong((id *)&self->_failedCall, 0);
  objc_storeStrong((id *)&self->_callToDecline, 0);
  objc_storeStrong((id *)&self->_viewUpdateClockTickTimer, 0);
  objc_storeStrong((id *)&self->_hardPauseButton, 0);
  objc_storeStrong((id *)&self->_buttonsView, 0);
  objc_storeStrong((id *)&self->_galleryView, 0);
  objc_storeStrong((id *)&self->_flippyView, 0);
  objc_storeStrong((id *)&self->_incomingCall, 0);
  objc_storeStrong((id *)&self->_conferenceParticipants, 0);
  objc_storeStrong((id *)&self->_primaryCalls, 0);

  objc_storeStrong((id *)&self->_replyWithMessageStore, 0);
}

@end