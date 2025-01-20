@interface PHCarPlayInCallViewController
- (BOOL)activePhoneCallExists;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (PHCarPlayInCallViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHCarPlayMainInCallViewController)mainInCallViewController;
- (TUHardwareControlsBroadcaster)hardwareControlBroadcaster;
- (UIView)flippyViewContainer;
- (id)incomingCall;
- (id)preferredFocusEnvironments;
- (void)animateOutIfNecessary;
- (void)backPressed:(id)a3;
- (void)callStatusChangedNotification:(id)a3;
- (void)cancelAddCallViewController:(id)a3;
- (void)conferencedCallsChangedNotification:(id)a3;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)hardwareControlEventNotification:(id)a3;
- (void)loadView;
- (void)muteStateChangedNotification:(id)a3;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presentAddCallViewControllerRequestedFromInCallViewController:(id)a3;
- (void)presentKeypadViewControllerRequestedFromInCallViewController:(id)a3;
- (void)screenDidDisconnectNotification:(id)a3;
- (void)setFlippyViewContainer:(id)a3;
- (void)setHardwareControlBroadcaster:(id)a3;
- (void)setMainInCallViewController:(id)a3;
- (void)updateMainInCallControllerCalls;
- (void)updateTPInCallControllerPhoneCalls;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation PHCarPlayInCallViewController

- (PHCarPlayInCallViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayInCallViewController;
  v4 = [(PHCarPlayInCallViewController *)&v7 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:v4 selector:"screenDidDisconnectNotification:" name:UIScreenDidDisconnectNotification object:0];
  }
  return v4;
}

- (void)dealloc
{
  [(PHCarPlayMainInCallViewController *)self->_mainInCallViewController setDelegate:0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayInCallViewController;
  [(PHCarPlayInCallViewController *)&v4 dealloc];
}

- (void)loadView
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController loading view", buf, 2u);
  }

  id v48 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  objc_super v4 = +[UIColor dynamicBackgroundColor];
  [v48 setBackgroundColor:v4];

  [(PHCarPlayInCallViewController *)self setView:v48];
  id v5 = objc_alloc_init((Class)UIView);
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setOpaque:0];
  v6 = +[UIColor clearColor];
  [v5 setBackgroundColor:v6];

  [(PHCarPlayInCallViewController *)self setFlippyViewContainer:v5];
  objc_super v7 = [(PHCarPlayInCallViewController *)self view];
  v8 = [(PHCarPlayInCallViewController *)self flippyViewContainer];
  [v7 addSubview:v8];

  v9 = [(PHCarPlayInCallViewController *)self view];
  CFStringRef v56 = @"view";
  v10 = [(PHCarPlayInCallViewController *)self flippyViewContainer];
  v57 = v10;
  v11 = +[NSDictionary dictionaryWithObjects:&v57 forKeys:&v56 count:1];
  v12 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:0 views:v11];
  [v9 addConstraints:v12];

  v13 = [(PHCarPlayInCallViewController *)self view];
  CFStringRef v54 = @"view";
  v14 = [(PHCarPlayInCallViewController *)self flippyViewContainer];
  v55 = v14;
  v15 = +[NSDictionary dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  v16 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:v15];
  [v13 addConstraints:v16];

  v17 = objc_alloc_init(PHCarPlayMainInCallViewController);
  v18 = [(PHCarPlayMainInCallViewController *)v17 view];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(PHCarPlayInCallViewController *)self view];
  [v19 bounds];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [(PHCarPlayMainInCallViewController *)v17 view];
  [v28 setFrame:v21, v23, v25, v27];

  [(PHCarPlayInCallViewController *)self addChildViewController:v17];
  v29 = [(PHCarPlayInCallViewController *)self flippyViewContainer];
  v30 = [(PHCarPlayMainInCallViewController *)v17 view];
  [v29 addSubview:v30];

  [(PHCarPlayMainInCallViewController *)v17 setDelegate:self];
  [(PHCarPlayInCallViewController *)self setMainInCallViewController:v17];
  [(PHCarPlayInCallViewController *)self updateMainInCallControllerCalls];
  v31 = [(PHCarPlayInCallViewController *)self flippyViewContainer];
  CFStringRef v52 = @"view";
  v32 = [(PHCarPlayInCallViewController *)self mainInCallViewController];
  v33 = [v32 view];
  v53 = v33;
  v34 = +[NSDictionary dictionaryWithObjects:&v53 forKeys:&v52 count:1];
  v35 = +[NSLayoutConstraint constraintsWithVisualFormat:@"|[view]|" options:0 metrics:0 views:v34];
  [v31 addConstraints:v35];

  v36 = [(PHCarPlayInCallViewController *)self flippyViewContainer];
  CFStringRef v50 = @"view";
  v37 = [(PHCarPlayInCallViewController *)self mainInCallViewController];
  v38 = [v37 view];
  v51 = v38;
  v39 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
  v40 = +[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[view]|" options:0 metrics:0 views:v39];
  [v36 addConstraints:v40];

  v41 = [(PHCarPlayInCallViewController *)self view];
  [v41 setNeedsLayout];

  v42 = [(PHCarPlayInCallViewController *)self view];
  [v42 layoutIfNeeded];

  v43 = +[NSNotificationCenter defaultCenter];
  [v43 addObserver:self selector:"callStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
  [v43 addObserver:self selector:"callStatusChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
  [v43 addObserver:self selector:"conferencedCallsChangedNotification:" name:TUCallCenterConferenceParticipantsChangedNotification object:0];
  v44 = +[TUCallCenter sharedInstance];
  v45 = [v44 conversationManager];
  [v45 addDelegate:self queue:&_dispatch_main_q];

  v46 = (TUHardwareControlsBroadcaster *)objc_alloc_init((Class)TUHardwareControlsBroadcaster);
  hardwareControlBroadcaster = self->_hardwareControlBroadcaster;
  self->_hardwareControlBroadcaster = v46;
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController viewDidAppear:", buf, 2u);
  }

  v15.receiver = self;
  v15.super_class = (Class)PHCarPlayInCallViewController;
  [(PHCarPlayInCallViewController *)&v15 viewDidAppear:v3];
  CGAffineTransformMakeScale(&v14, 1.5, 1.5);
  v6 = [(PHCarPlayInCallViewController *)self view];
  CGAffineTransform v13 = v14;
  [v6 setTransform:&v13];

  objc_super v7 = [(PHCarPlayInCallViewController *)self view];
  [v7 setAlpha:0.0];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100029E94;
  v12[3] = &unk_1002CD518;
  v12[4] = self;
  +[UIView animateWithDuration:v12 animations:&stru_1002CDEE8 completion:0.349999994];
  v8 = +[NSNotificationCenter defaultCenter];
  [v8 addObserver:self selector:"hardwareControlEventNotification:" name:TUCarPlayHardwareControlEventNotification object:0];

  v9 = +[TUCallCenter sharedInstance];
  id v10 = [v9 currentAudioAndVideoCallCount];

  if (!v10)
  {
    v11 = sub_1000D5130();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController: appeared with no current calls, will call animateOutIfNecessary", buf, 2u);
    }

    [(PHCarPlayInCallViewController *)self animateOutIfNecessary];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController viewDidDisappear:", buf, 2u);
  }

  v7.receiver = self;
  v7.super_class = (Class)PHCarPlayInCallViewController;
  [(PHCarPlayInCallViewController *)&v7 viewDidDisappear:v3];
  [(PHCarPlayInCallViewController *)self dismissViewControllerAnimated:0 completion:0];
  v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:TUCarPlayHardwareControlEventNotification object:0];
}

- (void)muteStateChangedNotification:(id)a3
{
  objc_super v4 = +[TUCallCenter sharedInstance];
  id v6 = [v4 frontmostAudioOrVideoCall];

  id v5 = [(PHCarPlayInCallViewController *)self mainInCallViewController];
  [v5 setIsMuted:[v6 isUplinkMuted]];
}

- (void)callStatusChangedNotification:(id)a3
{
}

- (void)conferencedCallsChangedNotification:(id)a3
{
}

- (void)updateTPInCallControllerPhoneCalls
{
  [(PHCarPlayInCallViewController *)self updateMainInCallControllerCalls];
  id v8 = [(PHCarPlayInCallViewController *)self incomingCall];
  BOOL v3 = [(PHCarPlayInCallViewController *)self _remoteViewControllerProxy];
  [v3 setAllowsBanners:v8 == 0];

  objc_super v4 = +[UIApplication sharedApplication];
  id v5 = [v4 delegate];
  [v5 setAllowsCarPlayBanners:v8 == 0];

  id v6 = [(PHCarPlayInCallViewController *)self mainInCallViewController];
  unsigned int v7 = [v6 isDismissable];

  if (v7)
  {
    [(PHCarPlayInCallViewController *)self dismissViewControllerAnimated:1 completion:0];
    [(PHCarPlayInCallViewController *)self animateOutIfNecessary];
  }
}

- (void)updateMainInCallControllerCalls
{
  BOOL v3 = +[TUCallCenter sharedInstance];
  id v8 = [v3 displayedAudioAndVideoCalls];

  objc_super v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 conferenceParticipantCalls];

  id v6 = [(PHCarPlayInCallViewController *)self mainInCallViewController];
  unsigned int v7 = [(PHCarPlayInCallViewController *)self incomingCall];
  [v6 setPrimaryCalls:v8 conferencePhoneCalls:v5 incomingCall:v7];
}

- (id)incomingCall
{
  v2 = +[TUCallCenter sharedInstance];
  BOOL v3 = [v2 incomingCall];
  objc_super v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = +[TUCallCenter sharedInstance];
    id v5 = [v6 incomingVideoCall];
  }
  unsigned int v7 = +[TUCallCenter sharedInstance];
  id v8 = [v7 callsPassingTest:&stru_1002CDF08];
  v9 = [v8 firstObject];

  id v10 = +[TUCallCenter sharedInstance];
  v11 = [v10 activeConversationForCall:v9];
  id v12 = [v11 state];

  if (v12 == (id)1)
  {
    id v13 = v9;

    id v5 = v13;
  }

  return v5;
}

- (void)animateOutIfNecessary
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v16 = +[TUCallCenter sharedInstance];
    objc_super v15 = [v16 displayedAudioAndVideoCalls];
    id v4 = [v15 count];
    id v5 = +[TUCallCenter sharedInstance];
    id v6 = [v5 conferenceParticipantCalls];
    id v7 = [v6 count];
    id v8 = +[TUCallCenter sharedInstance];
    v9 = [v8 incomingCall];
    id v10 = +[TUCallCenter sharedInstance];
    *(_DWORD *)buf = 134218752;
    id v19 = v4;
    __int16 v20 = 2048;
    id v21 = v7;
    __int16 v22 = 1024;
    BOOL v23 = v9 != 0;
    __int16 v24 = 2048;
    id v25 = [v10 currentAudioAndVideoCallCount];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController: animateOutIfNecessary [Displayed calls: %lu, Conference calls: %lu, Incoming calls: %d, Audio and Video Calls: %lu]", buf, 0x26u);
  }
  if (![(PHCarPlayInCallViewController *)self activePhoneCallExists])
  {
    v11 = [(PHCarPlayInCallViewController *)self mainInCallViewController];
    unsigned int v12 = [v11 isDismissable];

    if (v12)
    {
      id v13 = sub_1000D5130();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Animating out", buf, 2u);
      }

      dispatch_time_t v14 = dispatch_time(0, 500000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10002A5F8;
      block[3] = &unk_1002CD518;
      block[4] = self;
      dispatch_after(v14, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (BOOL)activePhoneCallExists
{
  v2 = +[TUCallCenter sharedInstance];
  BOOL v3 = [v2 displayedAudioAndVideoCalls];
  id v4 = (char *)[v3 count];

  id v5 = +[TUCallCenter sharedInstance];
  id v6 = [v5 conferenceParticipantCalls];
  id v7 = [v6 count];

  id v8 = +[TUCallCenter sharedInstance];
  v9 = [v8 incomingCalls];
  unint64_t v10 = (unint64_t)[v9 count];

  v11 = +[TUCallCenter sharedInstance];
  unint64_t v12 = (unint64_t)[v11 currentAudioAndVideoCallCount];

  return &v4[(void)v7 + v10 + v12] != 0;
}

- (void)presentAddCallViewControllerRequestedFromInCallViewController:(id)a3
{
  id v4 = (UIViewController *)objc_alloc_init((Class)CNStarkContactsListViewController);
  contactsViewController = self->_contactsViewController;
  self->_contactsViewController = v4;

  id v6 = [objc_alloc((Class)UINavigationController) initWithRootViewController:self->_contactsViewController];
  [v6 setDelegate:self];
  [(PHCarPlayInCallViewController *)self presentViewController:v6 animated:1 completion:0];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  v18 = (UIViewController *)a4;
  id v7 = a3;
  id v8 = [(PHCarPlayInCallViewController *)self view];
  uint64_t v9 = [v8 window];
  unint64_t v10 = [(id)v9 screen];

  v11 = [v10 _capabilityForKey:_UIScreenCapabilityInteractionModelsKey];
  LOBYTE(v9) = [v11 integerValue];

  if (v9)
  {
    unint64_t v12 = [(UIViewController *)v18 navigationItem];
    id v13 = [v12 rightBarButtonItem];

    if (!v13)
    {
      id v14 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelAddCallViewController:"];
      objc_super v15 = [(UIViewController *)v18 navigationItem];
      [v15 setRightBarButtonItem:v14];
    }
  }
  id v16 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"backPressed:"];
  [v16 setAllowedPressTypes:&off_1002DF560];
  [v16 setDelegate:self];
  v17 = [v7 view];

  [v17 addGestureRecognizer:v16];
  self->_nextBackDismissesNavController = self->_contactsViewController == v18;
}

- (void)backPressed:(id)a3
{
  if (self->_nextBackDismissesNavController) {
    [(PHCarPlayInCallViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)cancelAddCallViewController:(id)a3
{
}

- (void)presentKeypadViewControllerRequestedFromInCallViewController:(id)a3
{
  id v4 = objc_alloc_init(PHCarPlayInCallKeypadViewController);
  [(PHCarPlayInCallViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)hardwareControlEventNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController received hardware control event notification: %@", (uint8_t *)&v17, 0xCu);
  }

  uint64_t v6 = [(PHCarPlayInCallViewController *)self presentedViewController];
  if (!v6
    || (id v7 = (void *)v6,
        [(PHCarPlayInCallViewController *)self presentedViewController],
        id v8 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        v7,
        (isKindOfClass & 1) != 0))
  {
    unint64_t v10 = [v4 userInfo];
    v11 = [v10 valueForKey:kTUCarPlayHardwareControlButtonKey];
    unint64_t v12 = (void *)kTUCarPlayHardwareControlButtonKeypad;

    if (v11 == v12)
    {
      id v13 = [v4 userInfo];
      id v14 = [v13 valueForKey:kTUCarPlayHardwareControlKeypadValueKey];
      unsigned __int8 v15 = [v14 characterAtIndex:0];

      id v16 = sub_1000D5130();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Will play DTMF tone because we heard about a hardware key being pressed", (uint8_t *)&v17, 2u);
      }

      +[DialerController playDTMFToneForKey:v15];
    }
  }
}

- (void)screenDidDisconnectNotification:(id)a3
{
  id v4 = [a3 object];
  if ([v4 _userInterfaceIdiom] == (id)3)
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = [(PHCarPlayInCallViewController *)self _remoteViewControllerProxy];
      int v9 = 138412546;
      unint64_t v10 = self;
      __int16 v11 = 2112;
      unint64_t v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCarPlayInCallViewController (%@) heard about a disconnected screen, we'll dismiss outselves from (%@)", (uint8_t *)&v9, 0x16u);
    }
    id v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self];

    [(PHCarPlayInCallViewController *)self dismissViewControllerAnimated:0 completion:0];
    id v8 = [(PHCarPlayInCallViewController *)self _remoteViewControllerProxy];
    [v8 dismiss];
  }
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (id)preferredFocusEnvironments
{
  BOOL v3 = [(PHCarPlayInCallViewController *)self mainInCallViewController];

  if (v3)
  {
    id v4 = [(PHCarPlayInCallViewController *)self mainInCallViewController];
    id v8 = v4;
    id v5 = +[NSArray arrayWithObjects:&v8 count:1];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PHCarPlayInCallViewController;
    id v5 = [(PHCarPlayInCallViewController *)&v7 preferredFocusEnvironments];
  }

  return v5;
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  if (objc_msgSend(a4, "state", a3) == (id)1)
  {
    [(PHCarPlayInCallViewController *)self updateTPInCallControllerPhoneCalls];
  }
}

- (UIView)flippyViewContainer
{
  return (UIView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlippyViewContainer:(id)a3
{
}

- (PHCarPlayMainInCallViewController)mainInCallViewController
{
  return (PHCarPlayMainInCallViewController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setMainInCallViewController:(id)a3
{
}

- (TUHardwareControlsBroadcaster)hardwareControlBroadcaster
{
  return (TUHardwareControlsBroadcaster *)objc_getProperty(self, a2, 40, 1);
}

- (void)setHardwareControlBroadcaster:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareControlBroadcaster, 0);
  objc_storeStrong((id *)&self->_mainInCallViewController, 0);
  objc_storeStrong((id *)&self->_flippyViewContainer, 0);

  objc_storeStrong((id *)&self->_contactsViewController, 0);
}

@end