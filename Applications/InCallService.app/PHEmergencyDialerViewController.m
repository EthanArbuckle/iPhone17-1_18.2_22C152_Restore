@interface PHEmergencyDialerViewController
+ (BOOL)_isSecureForRemoteViewService;
+ (BOOL)isEmergencyNumber:(id)a3;
- (BOOL)_canShowWhileLocked;
- (BOOL)_disableAutomaticKeyboardUI;
- (BOOL)callEnding;
- (BOOL)shouldPresentAlertButton;
- (BOOL)shouldSetPresenceToken;
- (BOOL)shouldShowAirplaneEmergencyCallAlertForDialRequest:(id)a3;
- (BOOL)shouldShowRTTAlertForDialRequest:(id)a3;
- (BOOL)shouldShowUseRTTButton;
- (HKHealthStore)healthStore;
- (NSLayoutConstraint)endButtonHorizontalConstraint;
- (NSTimer)callDurationTimer;
- (PHEmergencyDialerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PHEmergencyHandsetDialerView)dialerView;
- (TUSenderIdentityClient)senderIdentityClient;
- (UIButton)backButton;
- (UIButton)endButton;
- (UIButton)medicalIDButton;
- (UIButton)stewieAlertButton;
- (UIButton)stewieEndCallButton;
- (UIButton)useRTTButton;
- (UINotificationFeedbackGenerator)alertFeedbackGenerator;
- (UIViewController)medicalIDViewController;
- (double)bottomToCancelBaselineOffset;
- (double)bottomToCancelBaselineOffsetForDxDevices;
- (id)currentCallStatusStringForDisplay;
- (id)digits;
- (signed)currentState;
- (void)alertWillInvoke;
- (void)attemptToDialEmergencyCall;
- (void)backButtonTapped:(id)a3;
- (void)callButtonTapped:(id)a3;
- (void)callStatusChangedNotification:(id)a3;
- (void)continueCyclingEmergencyTitleLabel;
- (void)dealloc;
- (void)deleteButtonTapped:(id)a3;
- (void)dialEmergencyCallForDialRequest:(id)a3;
- (void)dismissMedicalIDViewControllerIfNecessary;
- (void)emergencyCallbackModeChangedNotification:(id)a3;
- (void)endButtonTapped:(id)a3;
- (void)handleAlertInvokedNotification:(id)a3;
- (void)handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3;
- (void)handleTUCallTTYTypeChangedNotification:(id)a3;
- (void)handleUseRTTActionForButtonSender:(id)a3 event:(id)a4;
- (void)loadConstraints;
- (void)loadView;
- (void)medicalIDButtonTapped:(id)a3;
- (void)noteTintColorForBackgroundStyleChanged:(id)a3;
- (void)noteViewMovedOffscreenTemporarily;
- (void)phonePad:(id)a3 appendString:(id)a4;
- (void)phonePad:(id)a3 keyDown:(char)a4;
- (void)phonePadDeleteLastDigit:(id)a3;
- (void)refreshUseRTTButton;
- (void)setAlertFeedbackGenerator:(id)a3;
- (void)setBackButton:(id)a3;
- (void)setCallDurationTimer:(id)a3;
- (void)setCallEnding:(BOOL)a3;
- (void)setCurrentState:(signed __int16)a3;
- (void)setCurrentState:(signed __int16)a3 animated:(BOOL)a4;
- (void)setDialerView:(id)a3;
- (void)setEndButton:(id)a3;
- (void)setEndButtonHorizontalConstraint:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setMedicalIDButton:(id)a3;
- (void)setMedicalIDViewController:(id)a3;
- (void)setShouldPresentAlertButton:(BOOL)a3;
- (void)setShouldSetPresenceToken:(BOOL)a3;
- (void)setStewieAlertButton:(id)a3;
- (void)setStewieEndCallButton:(id)a3;
- (void)stewieAlertButtonTapped:(id)a3;
- (void)updateCurrentState;
- (void)updateEmergencyTitleLabelForCallDuration;
- (void)updatePresentationStateWithAllowed:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PHEmergencyDialerViewController

- (PHEmergencyDialerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)PHEmergencyDialerViewController;
  v4 = [(PHEmergencyDialerViewController *)&v9 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(PHEmergencyDialerViewController *)v4 setCurrentState:0];
    v6 = (HKHealthStore *)objc_alloc_init((Class)CUTWeakLinkClass());
    healthStore = v5->_healthStore;
    v5->_healthStore = v6;

    [(PHEmergencyDialerViewController *)v5 setShouldSetPresenceToken:1];
  }
  return v5;
}

- (void)loadView
{
  v3 = +[PHInCallUtilities sharedInstance];
  unsigned int v4 = [v3 isSetupAssistantRunning];

  if (v4) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 3;
  }
  [(PHEmergencyDialerViewController *)self setBackgroundStyle:v5];
  id v6 = objc_alloc((Class)UIView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v10 = [v6 initWithFrame:CGRectZero.origin.x, y, width, height];
  v11 = +[UIColor clearColor];
  [v10 setBackgroundColor:v11];

  [v10 setOpaque:0];
  [(PHEmergencyDialerViewController *)self setView:v10];
  v12 = -[PHEmergencyHandsetDialerView initWithFrame:]([PHEmergencyHandsetDialerView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  dialerView = self->_dialerView;
  self->_dialerView = v12;

  v14 = [(PHAbstractDialerView *)self->_dialerView phonePadView];
  [v14 setPlaysSounds:1];

  [(PHEmergencyHandsetDialerView *)self->_dialerView setAutoresizingMask:18];
  [(PHAbstractDialerView *)self->_dialerView setDelegate:self];
  [(PHEmergencyHandsetDialerView *)self->_dialerView bounds];
  [v10 setFrame:];
  v57 = v10;
  [v10 addSubview:self->_dialerView];
  v15 = [(PHAbstractDialerView *)self->_dialerView callButton];
  [v15 addTarget:self action:"callButtonTapped:" forEvents:64];

  v16 = [(PHAbstractDialerView *)self->_dialerView deleteButton];
  [v16 addTarget:self action:"deleteButtonTapped:" forEvents:64];

  v17 = [(PHAbstractDialerView *)self->_dialerView phonePadView];
  [v17 setDelegate:self];

  v18 = +[PHEdgeInsetButton buttonWithType:1];
  [v18 setTouchAreaEdgeInsets:-15.0, -15.0, -15.0, -15.0];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v18 addTarget:self action:"backButtonTapped:" forControlEvents:64];
  v19 = +[NSBundle mainBundle];
  v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"EmergencyCallStrings"];
  [v18 setTitle:v20 forState:0];

  v21 = +[UIColor blackColor];
  [v18 setTitleColor:v21 forState:0];

  v22 = [v18 titleLabel];
  if (+[PHUIConfiguration handsetDialerSpacing]) {
    double v23 = 16.0;
  }
  else {
    double v23 = 14.0;
  }
  v24 = +[UIFont systemFontOfSize:v23];
  [v22 setFont:v24];

  v25 = [v18 titleLabel];
  [v25 setTextAlignment:1];

  v26 = [(PHEmergencyDialerViewController *)self view];
  [v26 addSubview:v18];

  [(PHEmergencyDialerViewController *)self setBackButton:v18];
  v27 = [(PHEmergencyDialerViewController *)self view];
  v28 = [(PHEmergencyDialerViewController *)self useRTTButton];
  [v27 addSubview:v28];

  [(PHEmergencyDialerViewController *)self refreshUseRTTButton];
  v29 = +[PHEdgeInsetButton buttonWithType:1];
  [v29 setTouchAreaEdgeInsets:-15.0, -15.0, -15.0, -15.0];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v29 addTarget:self action:"medicalIDButtonTapped:" forControlEvents:64];
  v30 = +[NSBundle mainBundle];
  v31 = [v30 localizedStringForKey:@"MEDICAL_ID" value:&stru_1002D6110 table:@"EmergencyCallStrings"];
  [v29 setTitle:v31 forState:0];

  v32 = +[UIColor systemRedColor];
  [v29 setTitleColor:v32 forState:0];

  v33 = [v29 titleLabel];
  if (+[PHUIConfiguration handsetDialerSpacing]) {
    double v34 = 16.0;
  }
  else {
    double v34 = 14.0;
  }
  v35 = +[UIFont systemFontOfSize:v34];
  [v33 setFont:v35];

  v36 = +[UIImage tpImageForSymbolType:38 pointSize:10.0];
  [v29 setImage:v36 forState:0];

  v37 = +[UIColor systemRedColor];
  [v29 _setImageColor:v37 forState:0];

  v38 = +[UIApplication sharedApplication];
  id v39 = [v38 userInterfaceLayoutDirection];

  if (v39 == (id)1) {
    double v40 = -3.0;
  }
  else {
    double v40 = 3.0;
  }
  if (v39 == (id)1) {
    double v41 = 3.0;
  }
  else {
    double v41 = -3.0;
  }
  [v29 setTitleEdgeInsets:0.0, v40, 0.0, v41];
  [v29 setImageEdgeInsets:-0.5, v41, 0.5, v40];
  [v29 setHidden:1];
  v42 = [(PHEmergencyDialerViewController *)self view];
  [v42 addSubview:v29];

  [(PHEmergencyDialerViewController *)self setMedicalIDButton:v29];
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = sub_10009FE68;
  v60[4] = sub_10009FE78;
  id v61 = 0;
  v43 = [(PHEmergencyDialerViewController *)self healthStore];
  v59[0] = _NSConcreteStackBlock;
  v59[1] = 3221225472;
  v59[2] = sub_10009FE80;
  v59[3] = &unk_1002CFAA8;
  v59[4] = self;
  v59[5] = v60;
  [v43 fetchMedicalIDDataWithCompletion:v59];

  v58 = [[PHBottomBarButtonConfiguration alloc] initWithAction:15];
  v44 = [[PHBottomBarButton alloc] initWithConfiguration:v58];
  [(PHBottomBarButton *)v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHBottomBarButton *)v44 addTarget:self action:"endButtonTapped:" forControlEvents:64];
  [(PHBottomBarButton *)v44 setAlpha:0.0];
  v45 = [(PHEmergencyDialerViewController *)self view];
  [v45 addSubview:v44];

  [(PHEmergencyDialerViewController *)self setEndButton:v44];
  v46 = [[PHBottomBarButtonConfiguration alloc] initWithAction:36];
  v47 = [[PHBottomBarButton alloc] initWithConfiguration:v46];
  [(PHBottomBarButton *)v47 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHBottomBarButton *)v47 addTarget:self action:"stewieAlertButtonTapped:" forControlEvents:64];
  [(PHBottomBarButton *)v47 setAlpha:0.0];
  v48 = [(PHEmergencyDialerViewController *)self view];
  [v48 addSubview:v47];

  [(PHEmergencyDialerViewController *)self setStewieAlertButton:v47];
  v49 = [(PHEmergencyDialerViewController *)self stewieAlertButton];
  v50 = +[UIColor blackColor];
  [v49 setTitleColor:v50 forState:0];

  v51 = [[PHBottomBarButtonConfiguration alloc] initWithAction:37];
  v52 = [[PHBottomBarButton alloc] initWithConfiguration:v51];
  [(PHBottomBarButton *)v52 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PHBottomBarButton *)v52 addTarget:self action:"endButtonTapped:" forControlEvents:64];
  [(PHBottomBarButton *)v52 setAlpha:0.0];
  v53 = [(PHEmergencyDialerViewController *)self view];
  [v53 addSubview:v52];

  [(PHEmergencyDialerViewController *)self setStewieEndCallButton:v52];
  v54 = [(PHEmergencyDialerViewController *)self stewieEndCallButton];
  v55 = +[UIColor blackColor];
  [v54 setTitleColor:v55 forState:0];

  id v56 = objc_alloc_init((Class)UINotificationFeedbackGenerator);
  [(PHEmergencyDialerViewController *)self setAlertFeedbackGenerator:v56];

  [(PHEmergencyDialerViewController *)self loadConstraints];
  [(PHEmergencyDialerViewController *)self updateCurrentState];

  _Block_object_dispose(v60, 8);
}

- (void)loadConstraints
{
  v3 = [(PHEmergencyDialerViewController *)self dialerView];
  unsigned int v4 = [v3 phonePadView];
  uint64_t v5 = [v4 centerXAnchor];
  id v6 = [(PHEmergencyDialerViewController *)self medicalIDButton];
  v7 = [v6 centerXAnchor];
  +[TPNumberPadLightStyleButton defaultSize];
  v8 = [v5 constraintEqualToAnchor:v7];

  LODWORD(v9) = 1144750080;
  [v8 setPriority:v9];
  [v8 setActive:1];
  id v10 = [(PHEmergencyDialerViewController *)self medicalIDButton];
  v11 = [v10 leadingAnchor];
  v12 = [(PHEmergencyDialerViewController *)self dialerView];
  v13 = [v12 leadingAnchor];
  v14 = [v11 constraintGreaterThanOrEqualToAnchor:v13 constant:15.0];

  [v14 setActive:1];
  v15 = [(PHEmergencyDialerViewController *)self medicalIDButton];
  v16 = [v15 centerYAnchor];
  v17 = [(PHEmergencyDialerViewController *)self backButton];
  v18 = [v17 centerYAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];

  [v19 setActive:1];
  v20 = [(PHEmergencyDialerViewController *)self endButton];
  v21 = [v20 centerXAnchor];
  v22 = [(PHEmergencyDialerViewController *)self dialerView];
  double v23 = [v22 callButton];
  v24 = [v23 centerXAnchor];
  v25 = [v21 constraintEqualToAnchor:v24];

  [v25 setActive:1];
  v26 = [(PHEmergencyDialerViewController *)self endButton];
  v27 = [v26 centerYAnchor];
  v28 = [(PHEmergencyDialerViewController *)self dialerView];
  v29 = [v28 callButton];
  v30 = [v29 centerYAnchor];
  v31 = [v27 constraintEqualToAnchor:v30];

  [v31 setActive:1];
  v32 = [(PHEmergencyDialerViewController *)self stewieAlertButton];
  v33 = [v32 centerYAnchor];
  double v34 = [(PHEmergencyDialerViewController *)self dialerView];
  v35 = [v34 callButton];
  v36 = [v35 centerYAnchor];
  v37 = [v33 constraintEqualToAnchor:v36];

  [v37 setActive:1];
  v38 = [(PHEmergencyDialerViewController *)self stewieAlertButton];
  id v39 = [v38 leadingAnchor];
  double v40 = [(PHEmergencyDialerViewController *)self dialerView];
  double v41 = [v40 callButton];
  v42 = [v41 trailingAnchor];
  v43 = [v39 constraintEqualToAnchor:v42];

  [v43 setActive:1];
  v44 = [(PHEmergencyDialerViewController *)self stewieEndCallButton];
  v45 = [v44 centerYAnchor];
  v46 = [(PHEmergencyDialerViewController *)self dialerView];
  v47 = [v46 callButton];
  v48 = [v47 centerYAnchor];
  v49 = [v45 constraintEqualToAnchor:v48];

  [v49 setActive:1];
  v50 = [(PHEmergencyDialerViewController *)self stewieEndCallButton];
  v51 = [v50 trailingAnchor];
  v52 = [(PHEmergencyDialerViewController *)self dialerView];
  v53 = [v52 callButton];
  v54 = [v53 leadingAnchor];
  v55 = [v51 constraintEqualToAnchor:v54];

  [v55 setActive:1];
  id v56 = [(PHEmergencyDialerViewController *)self backButton];
  v57 = [v56 centerXAnchor];
  v58 = [(PHEmergencyDialerViewController *)self dialerView];
  v59 = [v58 phonePadView];
  v60 = [v59 centerXAnchor];
  +[TPNumberPadLightStyleButton defaultSize];
  id v61 = [v57 constraintEqualToAnchor:v60];

  [v61 setActive:1];
  v62 = [(PHEmergencyDialerViewController *)self view];
  v63 = [v62 bottomAnchor];
  v64 = [(PHEmergencyDialerViewController *)self backButton];
  v65 = [v64 lastBaselineAnchor];
  [(PHEmergencyDialerViewController *)self bottomToCancelBaselineOffset];
  v66 = [v63 constraintEqualToAnchor:v65];

  [v66 setActive:1];
  v67 = [(PHEmergencyDialerViewController *)self useRTTButton];
  v68 = [v67 centerXAnchor];
  v69 = [(PHEmergencyDialerViewController *)self dialerView];
  v70 = [v69 phonePadView];
  v71 = [v70 centerXAnchor];
  +[TPNumberPadLightStyleButton defaultSize];
  v72 = [v68 constraintEqualToAnchor:v71];

  [v72 setActive:1];
  v73 = [(PHEmergencyDialerViewController *)self view];
  v74 = [v73 bottomAnchor];
  v75 = [(PHEmergencyDialerViewController *)self useRTTButton];
  v76 = [v75 lastBaselineAnchor];
  [(PHEmergencyDialerViewController *)self bottomToCancelBaselineOffset];
  [v74 constraintEqualToAnchor:v76];
  id v77 = (id)objc_claimAutoreleasedReturnValue();

  [v77 setActive:1];
}

- (void)dealloc
{
  if ([(PHEmergencyDialerViewController *)self shouldSetPresenceToken]) {
    sub_100092938(0);
  }
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"continueCyclingEmergencyTitleLabel" object:0];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  [(NSTimer *)self->_callDurationTimer invalidate];
  callDurationTimer = self->_callDurationTimer;
  self->_callDurationTimer = 0;

  v5.receiver = self;
  v5.super_class = (Class)PHEmergencyDialerViewController;
  [(PHEmergencyDialerViewController *)&v5 dealloc];
}

- (TUSenderIdentityClient)senderIdentityClient
{
  senderIdentityClient = self->_senderIdentityClient;
  if (!senderIdentityClient)
  {
    unsigned int v4 = (TUSenderIdentityClient *)objc_alloc_init((Class)TUSenderIdentityClient);
    objc_super v5 = self->_senderIdentityClient;
    self->_senderIdentityClient = v4;

    senderIdentityClient = self->_senderIdentityClient;
  }

  return senderIdentityClient;
}

- (BOOL)_disableAutomaticKeyboardUI
{
  return 1;
}

- (void)deleteButtonTapped:(id)a3
{
}

- (void)endButtonTapped:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v21 = [(PHEmergencyDialerViewController *)self currentState];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController endButtonTapped:] current state is %d", buf, 8u);
  }

  [(PHEmergencyDialerViewController *)self setCallEnding:1];
  id v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController endButtonTapped:] endbutton setEnabled:NO", buf, 2u);
  }

  [v4 setEnabled:0];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v7 = +[TUCallCenter sharedInstance];
  v8 = [v7 currentAudioAndVideoCalls];

  id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v12);
        v14 = +[TUCallCenter sharedInstance];
        [v14 disconnectCall:v13];

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  [(PHEmergencyDialerViewController *)self updateEmergencyTitleLabelForCallDuration];
}

- (void)callButtonTapped:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = [(PHEmergencyDialerViewController *)self currentState];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController callButtonTapped:] current state is %d", (uint8_t *)v6, 8u);
  }

  if (![(PHEmergencyDialerViewController *)self currentState]
    || [(PHEmergencyDialerViewController *)self currentState] == 3)
  {
    objc_super v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Will attempt to dial emergency call", (uint8_t *)v6, 2u);
    }

    [(PHEmergencyDialerViewController *)self attemptToDialEmergencyCall];
  }
}

- (void)backButtonTapped:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ending emergency callback mode due to back button tap", v6, 2u);
  }

  +[TUCallCapabilities endEmergencyCallbackMode];
  objc_super v5 = [(PHEmergencyDialerViewController *)self _remoteViewControllerProxy];
  [v5 dismiss];
}

- (void)medicalIDButtonTapped:(id)a3
{
  id v4 = objc_alloc((Class)UINavigationController);
  objc_super v5 = [(PHEmergencyDialerViewController *)self medicalIDViewController];
  id v10 = [v4 initWithRootViewController:v5];

  id v6 = [v10 navigationBar];
  [v6 setPrefersLargeTitles:1];

  [v10 setModalPresentationStyle:6];
  if (_os_feature_enabled_impl())
  {
    id v7 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"dismissMedicalIDViewControllerIfNecessary"];
    v8 = [(PHEmergencyDialerViewController *)self medicalIDViewController];
    id v9 = [v8 navigationItem];
    [v9 setRightBarButtonItem:v7];
  }
  [(PHEmergencyDialerViewController *)self presentViewController:v10 animated:1 completion:0];
}

- (void)dismissMedicalIDViewControllerIfNecessary
{
  v3 = [(PHEmergencyDialerViewController *)self presentedViewController];
  id v4 = [(PHEmergencyDialerViewController *)self medicalIDViewController];
  objc_super v5 = [v4 navigationController];

  if (v3 == v5)
  {
    [(PHEmergencyDialerViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHEmergencyDialerViewController;
  [(PHEmergencyDialerViewController *)&v6 viewWillAppear:a3];
  if ([(PHEmergencyDialerViewController *)self shouldSetPresenceToken]) {
    sub_100092938(1uLL);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"callStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
  [v4 addObserver:self selector:"emergencyCallbackModeChangedNotification:" name:TUCallCapabilitiesEmergencyCallbackModeChangedNotification object:0];
  [v4 addObserver:self selector:"handleTUCallSupportsTTYWithVoiceChangedNotification:" name:TUCallSupportsTTYWithVoiceChangedNotification object:0];
  [v4 addObserver:self selector:"handleTUCallTTYTypeChangedNotification:" name:TUCallTTYTypeChangedNotification object:0];
  objc_super v5 = +[NSNotification PHAlertInvoked];
  [v4 addObserver:self selector:"handleAlertInvokedNotification:" name:v5 object:0];

  [(PHEmergencyDialerViewController *)self updateCurrentState];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PHEmergencyDialerViewController;
  [(PHEmergencyDialerViewController *)&v12 viewDidDisappear:a3];
  if ([(PHEmergencyDialerViewController *)self shouldSetPresenceToken]) {
    sub_100092938(0);
  }
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:TUCallCenterCallStatusChangedNotification object:0];
  [v4 removeObserver:self name:TUCallCapabilitiesEmergencyCallbackModeChangedNotification object:0];
  [v4 removeObserver:self name:TUCallSupportsTTYWithVoiceChangedNotification object:0];
  [v4 removeObserver:self name:TUCallTTYTypeChangedNotification object:0];
  objc_super v5 = +[NSNotification PHAlertInvoked];
  [v4 removeObserver:self name:v5 object:0];

  objc_super v6 = [(PHEmergencyDialerViewController *)self callDurationTimer];
  [v6 invalidate];

  [(PHEmergencyDialerViewController *)self setCallDurationTimer:0];
  [(PHEmergencyDialerViewController *)self setCurrentState:0];
  id v7 = +[TUCallCenter sharedInstance];
  id v8 = [v7 currentCallCount];

  if (!v8)
  {
    id v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Ending emergency callback mode due because the emergency dialer is disappearing with no current calls", v11, 2u);
    }

    +[TUCallCapabilities endEmergencyCallbackMode];
  }
  sub_1000A1148();
  id v10 = +[PHInCallUtilities sharedInstance];
  [v10 stopSuppressingInCallStatusBarForReason:@"PHSuppressInCallStatusBarForBuddyEmergencyCallReason"];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)PHEmergencyDialerViewController;
  [(PHEmergencyDialerViewController *)&v4 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updateCurrentState
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = +[TUCallCenter sharedInstance];
    objc_super v5 = [v4 currentCalls];
    objc_super v6 = +[TUCallCenter sharedInstance];
    int v16 = 138412546;
    long long v17 = v5;
    __int16 v18 = 2048;
    id v19 = [v6 currentCallCount];
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "updateCurrentState: Calls are: %@. Count is %lu.", (uint8_t *)&v16, 0x16u);
  }
  id v7 = +[TUCallCenter sharedInstance];
  id v8 = [v7 currentCallCount];

  if (v8)
  {
    id v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "updateCurrentState: There are current calls, so setting state to PHEmergencyDialerStateInCall", (uint8_t *)&v16, 2u);
    }

    id v10 = +[TUCallCenter sharedInstance];
    uint64_t v11 = [v10 frontmostCall];

    if ([v11 canDisplayAlertUI:[(PHEmergencyDialerViewController *)self shouldPresentAlertButton]])
    {
      objc_super v12 = sub_1000D5130();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "UpdateCurrentState: There are current calls and we need to show alertUI, so setting state to PHEmergencyDialerAlertModeNeededIfAvailable", (uint8_t *)&v16, 2u);
      }

      uint64_t v13 = 2;
    }
    else
    {
      uint64_t v13 = 1;
    }
  }
  else
  {
    unsigned int v14 = +[TUCallCapabilities isEmergencyCallbackModeEnabled];
    uint64_t v11 = sub_1000D5130();
    BOOL v15 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v15)
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "updateCurrentState: emergency callback mode is active, so setting state to PHEmergencyDialerStateEmergencyCallBackMode", (uint8_t *)&v16, 2u);
      }
      uint64_t v13 = 3;
    }
    else
    {
      if (v15)
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "updateCurrentState: setting state to PHEmergencyDialerStateIdle", (uint8_t *)&v16, 2u);
      }
      uint64_t v13 = 0;
    }
  }

  [(PHEmergencyDialerViewController *)self setCurrentState:v13];
}

- (void)setCurrentState:(signed __int16)a3
{
}

- (void)setCurrentState:(signed __int16)a3 animated:(BOOL)a4
{
  int v4 = a3;
  if (self->_currentState != a3)
  {
    BOOL v6 = a4;
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Set Current State %d", buf, 8u);
    }

    switch(v4)
    {
      case 0:
        sub_1000A1148();
        id v8 = +[PHInCallUtilities sharedInstance];
        [v8 stopSuppressingInCallStatusBarForReason:@"PHSuppressInCallStatusBarForBuddyEmergencyCallReason"];

        id v9 = [(PHEmergencyDialerViewController *)self callDurationTimer];
        [v9 invalidate];

        [(PHEmergencyDialerViewController *)self setCallDurationTimer:0];
        [(PHEmergencyDialerViewController *)self continueCyclingEmergencyTitleLabel];
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_1000A1DB0;
        v52[3] = &unk_1002CD518;
        v52[4] = self;
        id v10 = objc_retainBlock(v52);
        uint64_t v11 = v10;
        if (v6) {
          +[UIView animateWithDuration:v10 animations:0 completion:0.5];
        }
        else {
          ((void (*)(void *))v10[2])(v10);
        }

        break;
      case 1:
        uint64_t v53 = 0;
        v54 = &v53;
        uint64_t v55 = 0x2020000000;
        v33 = (void (*)(const char *))off_100326218;
        id v56 = off_100326218;
        if (!off_100326218)
        {
          *(void *)buf = _NSConcreteStackBlock;
          uint64_t v58 = 3221225472;
          v59 = sub_1000A4B1C;
          v60 = &unk_1002CE2D8;
          id v61 = &v53;
          double v34 = (void *)sub_1000A49A8();
          v35 = dlsym(v34, "MSNMonitorBeginException");
          *(void *)(v61[1] + 24) = v35;
          off_100326218 = *(_UNKNOWN **)(v61[1] + 24);
          v33 = (void (*)(const char *))v54[3];
        }
        _Block_object_dispose(&v53, 8);
        if (!v33)
        {
          sub_1001E99E4();
          __break(1u);
        }
        v33("emergency");
        v36 = +[PHInCallUtilities sharedInstance];
        [v36 startSuppressingInCallStatusBarForReason:@"PHSuppressInCallStatusBarForBuddyEmergencyCallReason"];

        v37 = +[TUCallCenter sharedInstance];
        v38 = [v37 displayedCall];

        if (v38 && [v38 isEmergency])
        {
          id v39 = [(PHEmergencyDialerViewController *)self dialerView];
          double v40 = [v39 lcdView];
          double v41 = [v38 handle];
          v42 = [v41 value];
          [v40 setText:v42 needsFormat:1];
        }
        [(PHEmergencyDialerViewController *)self updateEmergencyTitleLabelForCallDuration];
        v43 = [(PHEmergencyDialerViewController *)self callDurationTimer];
        [v43 invalidate];

        [(PHEmergencyDialerViewController *)self setCallDurationTimer:0];
        v44 = +[NSTimer scheduledTimerWithTimeInterval:self target:"updateEmergencyTitleLabelForCallDuration" selector:0 userInfo:1 repeats:1.0];
        [(PHEmergencyDialerViewController *)self setCallDurationTimer:v44];

        +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"continueCyclingEmergencyTitleLabel" object:0];
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_1000A1ED0;
        v51[3] = &unk_1002CD518;
        v51[4] = self;
        v45 = objc_retainBlock(v51);
        v46 = v45;
        if (v6)
        {
          v47 = sub_1000D5130();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController setCurrentState:] self.endButton.enabled = YES", buf, 2u);
          }

          +[UIView animateWithDuration:v46 animations:0.5];
        }
        else
        {
          ((void (*)(void *))v45[2])(v45);
        }

        break;
      case 2:
        objc_super v12 = [(PHEmergencyDialerViewController *)self alertFeedbackGenerator];
        [v12 notificationOccurred:0];

        uint64_t v13 = +[NSBundle mainBundle];
        uint64_t v14 = [v13 localizedStringForKey:@"ALERT_ERROR_LABEL" value:&stru_1002D6110 table:@"Localizable-Stewie"];
        BOOL v15 = [(PHEmergencyDialerViewController *)self dialerView];
        int v16 = [v15 emergencyTitleLabel];
        [v16 setText:v14];

        long long v17 = [(PHEmergencyDialerViewController *)self dialerView];
        objc_opt_class();
        LOBYTE(v14) = objc_opt_isKindOfClass();

        if (v14)
        {
          __int16 v18 = [(PHEmergencyDialerViewController *)self dialerView];
          if ((uint64_t)[v18 numberOfLinesInEmergencyTitleLabel] >= 3)
          {
            id v19 = +[NSBundle mainBundle];
            v20 = [v19 localizedStringForKey:@"ALERT_ERROR_LABEL_NO_LINE_BREAK" value:&stru_1002D6110 table:@"Localizable-Stewie"];
            unsigned int v21 = [(PHEmergencyDialerViewController *)self dialerView];
            v22 = [v21 emergencyTitleLabel];
            [v22 setText:v20];
          }
        }
        if ([(PHEmergencyDialerViewController *)self shouldPresentAlertButton])
        {
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_1000A212C;
          v49[3] = &unk_1002CD518;
          v49[4] = self;
          double v23 = objc_retainBlock(v49);
          v24 = v23;
          if (v6)
          {
            v25 = sub_1000D5130();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController setCurrentState:] self.stewieEndCallButton.enabled = YES", buf, 2u);
            }

            +[UIView animateWithDuration:v24 animations:0 completion:0.5];
          }
          else
          {
            ((void (*)(void *))v23[2])(v23);
          }
        }
        else
        {
          v48 = sub_1000D5130();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "shouldPresentAlertButton is false, skipping update stewie button", buf, 2u);
          }
        }
        break;
      case 3:
        v26 = [(PHEmergencyDialerViewController *)self callDurationTimer];
        [v26 invalidate];

        [(PHEmergencyDialerViewController *)self setCallDurationTimer:0];
        +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"continueCyclingEmergencyTitleLabel" object:0];
        v27 = +[NSBundle mainBundle];
        v28 = [v27 localizedStringForKey:@"EMERGENCY_CALL_MODE" value:&stru_1002D6110 table:@"EmergencyCallStrings"];
        v29 = [(PHEmergencyDialerViewController *)self dialerView];
        v30 = [v29 emergencyTitleLabel];
        [v30 setText:v28];

        v50[0] = _NSConcreteStackBlock;
        v50[1] = 3221225472;
        v50[2] = sub_1000A200C;
        v50[3] = &unk_1002CD518;
        v50[4] = self;
        v31 = objc_retainBlock(v50);
        v32 = v31;
        if (v6) {
          +[UIView animateWithDuration:v31 animations:0 completion:0.5];
        }
        else {
          ((void (*)(void *))v31[2])(v31);
        }

        break;
      default:
        break;
    }
  }
  self->_currentState = v4;
}

- (void)continueCyclingEmergencyTitleLabel
{
  id v3 = [(PHEmergencyDialerViewController *)self dialerView];
  v2 = [v3 emergencyTitleLabel];
  [v2 startCyclingStrings];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (void)callStatusChangedNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v25 = 138412546;
    *(void *)&v25[4] = objc_opt_class();
    *(_WORD *)&v25[12] = 2112;
    *(void *)&v25[14] = v4;
    id v6 = *(id *)&v25[4];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", v25, 0x16u);
  }
  [(PHEmergencyDialerViewController *)self setCallEnding:0];
  id v7 = [v4 object];
  if ([v7 status] == 3)
  {
    [(PHEmergencyDialerViewController *)self dismissMedicalIDViewControllerIfNecessary];
    [(PHEmergencyDialerViewController *)self setShouldPresentAlertButton:0];
    id v8 = +[UIApplication sharedApplication];
    id v9 = [v8 delegate];
    id v10 = [v9 alertCoordinator];

    if (!v10)
    {
      uint64_t v11 = objc_alloc_init(_TtC13InCallService16AlertCoordinator);
      objc_super v12 = +[UIApplication sharedApplication];
      uint64_t v13 = [v12 delegate];
      [v13 setAlertCoordinator:v11];
    }
    uint64_t v14 = +[UIApplication sharedApplication];
    BOOL v15 = [v14 delegate];
    int v16 = [v15 alertCoordinator];
    [v16 setDelegate:self];

    long long v17 = +[UIApplication sharedApplication];
    __int16 v18 = [v17 delegate];
    id v19 = [v18 alertCoordinator];
    unsigned int v20 = [v19 isMonitoring];

    unsigned int v21 = +[UIApplication sharedApplication];
    v22 = [v21 delegate];
    double v23 = [v22 alertCoordinator];
    v24 = v23;
    if (v20) {
      [v23 refreshDelegateWithState];
    }
    else {
      [v23 startMonitoring];
    }
  }
  [(PHEmergencyDialerViewController *)self refreshUseRTTButton];
  [(PHEmergencyDialerViewController *)self updateCurrentState];
}

- (void)emergencyCallbackModeChangedNotification:(id)a3
{
  id v4 = a3;
  objc_super v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Emergency callback mode changed notification %@", (uint8_t *)&v6, 0xCu);
  }

  [(PHEmergencyDialerViewController *)self updateCurrentState];
}

- (void)handleAlertInvokedNotification:(id)a3
{
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismiss emergency dialer because we invoke stewie", v6, 2u);
  }

  +[TUCallCapabilities endEmergencyCallbackMode];
  objc_super v5 = [(PHEmergencyDialerViewController *)self _remoteViewControllerProxy];
  [v5 dismiss];
}

- (void)phonePad:(id)a3 appendString:(id)a4
{
  dialerView = self->_dialerView;
  id v6 = a4;
  id v7 = [(PHAbstractDialerView *)dialerView lcdView];
  [v7 insertStringAtCurrentPosition:v6];

  id v8 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  [v8 setName:0 numberLabel:0 suggestion:0];
}

- (void)phonePadDeleteLastDigit:(id)a3
{
  id v4 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  [v4 deleteCharacter];

  id v5 = [(PHAbstractDialerView *)self->_dialerView lcdView];
  [v5 setName:0 numberLabel:0 suggestion:0];
}

- (void)phonePad:(id)a3 keyDown:(char)a4
{
  id v5 = +[TUCallCenter sharedInstance];
  id v6 = [v5 currentCalls];
  id v9 = [v6 firstObject];

  id v7 = v9;
  if (v9)
  {
    unsigned int v8 = [v9 shouldPlayDTMFTone];
    id v7 = v9;
    if (v8)
    {
      [v9 playDTMFToneForKey:a4];
      id v7 = v9;
    }
  }
}

- (id)currentCallStatusStringForDisplay
{
  v2 = +[TUCallCenter sharedInstance];
  id v3 = [v2 displayedCall];

  if (!v3)
  {
    id v10 = &stru_1002D6110;
    goto LABEL_15;
  }
  unsigned int v4 = [v3 status];
  if (v4 == 4)
  {
    id v7 = +[NSBundle conversationKit];
    unsigned int v8 = v7;
    CFStringRef v9 = @"CALLING";
  }
  else
  {
    unsigned int v5 = v4;
    if (v4 == 3)
    {
      unsigned int v6 = [v3 hasBeenRedirected];
      id v7 = +[NSBundle conversationKit];
      unsigned int v8 = v7;
      if (v6) {
        CFStringRef v9 = @"REDIRECTED";
      }
      else {
        CFStringRef v9 = @"CALLING";
      }
    }
    else if ([v3 isOnHold])
    {
      id v7 = +[NSBundle conversationKit];
      unsigned int v8 = v7;
      CFStringRef v9 = @"HOLD_LABEL";
    }
    else
    {
      if (v5 != 6)
      {
        uint64_t v16 = [v3 callDurationString];
        unsigned int v8 = (void *)v16;
        long long v17 = @"00:00";
        if (v16) {
          long long v17 = (__CFString *)v16;
        }
        uint64_t v11 = v17;
        goto LABEL_14;
      }
      id v7 = +[NSBundle conversationKit];
      unsigned int v8 = v7;
      CFStringRef v9 = @"CALL_ENDED";
    }
  }
  uint64_t v11 = [v7 localizedStringForKey:v9 value:&stru_1002D6110 table:@"CallStatus"];
LABEL_14:
  id v10 = v11;

LABEL_15:
  objc_super v12 = +[NSBundle mainBundle];
  uint64_t v13 = [v12 localizedStringForKey:@"EMERGENCY_CALL_%@" value:&stru_1002D6110 table:@"EmergencyCallStrings"];
  uint64_t v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v10);

  return v14;
}

- (void)updateEmergencyTitleLabelForCallDuration
{
  if ([(PHEmergencyDialerViewController *)self currentState] == 1)
  {
    id v5 = [(PHEmergencyDialerViewController *)self currentCallStatusStringForDisplay];
    id v3 = [(PHEmergencyDialerViewController *)self dialerView];
    unsigned int v4 = [v3 emergencyTitleLabel];
    [v4 setText:v5];
  }
}

- (void)noteTintColorForBackgroundStyleChanged:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHEmergencyDialerViewController;
  [(PHEmergencyDialerViewController *)&v8 noteTintColorForBackgroundStyleChanged:v4];
  id v5 = +[PHInCallUtilities sharedInstance];
  unsigned int v6 = [v5 isSetupAssistantRunning];

  if (v6)
  {
    id v7 = [(PHEmergencyDialerViewController *)self view];
    [v7 setBackgroundColor:v4];
  }
}

- (void)noteViewMovedOffscreenTemporarily
{
  v5.receiver = self;
  v5.super_class = (Class)PHEmergencyDialerViewController;
  [(PHEmergencyDialerViewController *)&v5 noteViewMovedOffscreenTemporarily];
  id v3 = [(PHEmergencyDialerViewController *)self dialerView];
  id v4 = [v3 lcdView];
  [v4 setText:&stru_1002D6110 needsFormat:0];

  [(PHEmergencyDialerViewController *)self dismissMedicalIDViewControllerIfNecessary];
}

- (double)bottomToCancelBaselineOffset
{
  if (+[PHUIConfiguration shouldUseExplicitLayoutDimensions])
  {
    [(PHEmergencyDialerViewController *)self bottomToCancelBaselineOffsetForDxDevices];
  }
  else
  {
    unint64_t v3 = +[PHUIConfiguration handsetDialerSpacing];
    double result = 26.0;
    if (v3 - 3 <= 3) {
      return dbl_100285010[v3 - 3];
    }
  }
  return result;
}

- (double)bottomToCancelBaselineOffsetForDxDevices
{
  unint64_t v2 = +[PHUIConfiguration screenSize];
  if (v2 - 11 > 4) {
    return 52.0;
  }
  else {
    return dbl_100285030[v2 - 11];
  }
}

- (id)digits
{
  unint64_t v2 = [(PHEmergencyDialerViewController *)self dialerView];
  unint64_t v3 = [v2 lcdView];
  id v4 = [v3 text];

  objc_super v5 = [v4 stringByApplyingTransform:NSStringTransformToLatin reverse:0];
  if (v5)
  {
    unsigned int v6 = TUNetworkCountryCode();
    id v7 = +[TUPhoneNumber phoneNumberWithDigits:v5 countryCode:v6];

    objc_super v8 = [v7 digits];

    if (![v8 length])
    {
      id v9 = v5;

      objc_super v8 = v9;
    }

    id v4 = v8;
  }

  return v4;
}

+ (BOOL)isEmergencyNumber:(id)a3
{
  id v3 = a3;
  id v4 = +[PHApplicationServices sharedInstance];
  objc_super v5 = [v4 callProviderManager];
  unsigned int v6 = [v5 emergencyProvider];

  id v7 = objc_alloc_init((Class)TUSenderIdentityClient);
  objc_super v8 = [v6 prioritizedSenderIdentities];
  id v9 = [v8 count];
  id v10 = sub_1000D5130();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Checking whether the digits %@ are an emergency telephone number.", buf, 0xCu);
    }

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v13)
    {
      unsigned int v20 = v6;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (i = 0; i != v13; i = ((char *)i + 1))
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v17 = [v16 UUID];
          unsigned int v18 = [v7 isEmergencyNumberForDigits:v3 senderIdentityUUID:v17];

          if (v18)
          {
            uint64_t v13 = sub_1000D5130();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              id v26 = v3;
              __int16 v27 = 2112;
              v28 = v16;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Digits %@ are an emergency telephone number for sender identity %@.", buf, 0x16u);
            }

            LOBYTE(v13) = 1;
            goto LABEL_16;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v13) {
          continue;
        }
        break;
      }
LABEL_16:
      unsigned int v6 = v20;
    }
  }
  else
  {
    if (v11)
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Checking whether the digits %@ is an emergency telephone number for nil sender identity.", buf, 0xCu);
    }

    LOBYTE(v13) = [v7 isEmergencyNumberForDigits:v3 senderIdentityUUID:0];
  }

  return (char)v13;
}

- (BOOL)shouldShowAirplaneEmergencyCallAlertForDialRequest:(id)a3
{
  id v3 = a3;
  if (sub_100092880()
    && [v3 isValid]
    && [v3 dialType] == (id)1
    && ([v3 isSOS] & 1) == 0)
  {
    unsigned int v6 = [v3 localSenderIdentityUUID];
    if (v6)
    {
      id v7 = [v3 localSenderIdentityUUID];
      if (+[TUCallCapabilities canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:](TUCallCapabilities, "canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:", v7))unsigned __int8 v4 = +[TUCallCapabilities supportsPrimaryCalling]; {
      else
      }
        unsigned __int8 v4 = 0;
    }
    else
    {
      unsigned __int8 v4 = 0;
    }
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (void)attemptToDialEmergencyCall
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"continueCyclingEmergencyTitleLabel" object:0];
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v4 = +[TUCallCenter sharedInstance];
    id v5 = [v4 currentCallCount];
    CFStringRef v6 = @"NO";
    if (!v5) {
      CFStringRef v6 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v39 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "[PHEmergencyDialerViewController dialEmergencyCall]: current call count is 0: %@", buf, 0xCu);
  }
  id v7 = +[TUCallCenter sharedInstance];
  id v8 = [v7 currentCallCount];

  if (!v8)
  {
    id v9 = [(PHEmergencyDialerViewController *)self digits];
    id v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v39 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "dialEmergencyCall: digits to dial is %@", buf, 0xCu);
    }

    if ([(__CFString *)v9 length])
    {
      BOOL v11 = +[ICSApplicationServices sharedInstance];
      id v12 = [v11 callProviderManager];

      uint64_t v13 = [v12 emergencyProvider];
      uint64_t v14 = sub_1000D5130();
      BOOL v15 = v14;
      if (v13)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "dialEmergencyCall: dialing non-TTY emergency call", buf, 2u);
        }

        id v16 = [objc_alloc((Class)TUDialRequest) initWithProvider:v13];
        long long v17 = +[TUHandle handleWithDestinationID:v9];
        [v16 setHandle:v17];

        [v16 setPerformDialAssist:0];
        [v16 setOriginatingUIType:1];
        unsigned int v18 = [v13 prioritizedSenderIdentities];
        id v19 = [v18 firstObject];
        unsigned int v20 = [v19 UUID];
        [v16 setLocalSenderIdentityUUID:v20];

        long long v21 = [v13 prioritizedSenderIdentities];
        long long v22 = [v21 firstObject];
        long long v23 = [v22 accountUUID];
        [v16 setLocalSenderIdentityAccountUUID:v23];

        long long v24 = [(PHEmergencyDialerViewController *)self senderIdentityClient];
        BOOL v15 = [v16 dialRequestByResolvingDialTypeUsingSenderIdentityClient:v24];

        if ([(PHEmergencyDialerViewController *)self shouldShowAirplaneEmergencyCallAlertForDialRequest:v15])
        {
          v25 = sub_1000D5130();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "An emergency call is being attempted with airplane mode enabled but Wi-Fi calling is available.", buf, 2u);
          }

          id v26 = [PHAirplaneEmergencyCallAlert alloc];
          v32 = _NSConcreteStackBlock;
          uint64_t v33 = 3221225472;
          double v34 = sub_1000A35F0;
          v35 = &unk_1002CDA70;
          v36 = self;
          BOOL v15 = v15;
          v37 = v15;
          __int16 v27 = [(PHAirplaneEmergencyCallAlert *)v26 initWithDialAction:&v32];
          -[PHAirplaneEmergencyCallAlert showOnViewController:](v27, "showOnViewController:", self, v32, v33, v34, v35, v36);
        }
        else
        {
          char v28 = sub_10009248C(v15);
          v29 = sub_1000D5130();
          v30 = v29;
          if (v28)
          {
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Attempting an emergency call using a cellular network.", buf, 2u);
            }

            [(PHEmergencyDialerViewController *)self dialEmergencyCallForDialRequest:v15];
          }
          else
          {
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_1001EB748(v30);
            }

            v31 = +[UIAlertController networkUnavailableAlertControllerWithCallProvider:v13 dialType:1 senderIdentityUUID:0];
            if (v31) {
              [(PHEmergencyDialerViewController *)self presentViewController:v31 animated:1 completion:0];
            }
          }
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        sub_1001EB6D0((uint64_t)v12, v15);
      }
    }
  }
}

- (void)dialEmergencyCallForDialRequest:(id)a3
{
  id v4 = a3;
  if (![(PHEmergencyDialerViewController *)self shouldShowRTTAlertForDialRequest:v4])goto LABEL_6; {
  id v5 = sub_10010C7DC();
  }
  if (!v5) {
    goto LABEL_6;
  }
  CFStringRef v6 = v5;
  id v7 = [v4 handle];
  id v8 = [v7 value];

  if ([v8 destinationIdIsPhoneNumber])
  {
    id v9 = TUHomeCountryCode();
    uint64_t v10 = TUFormattedPhoneNumber();

    id v8 = (void *)v10;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x2020000000;
  char v57 = 1;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  v51[0] = _NSConcreteStackBlock;
  v51[1] = 3221225472;
  v51[2] = sub_1000A3CF8;
  v51[3] = &unk_1002CFAD0;
  id v52 = v4;
  p_long long buf = &buf;
  id v12 = v11;
  uint64_t v53 = v12;
  [v6 displayCallPromptForContact:v8 withCompletion:v51];
  dispatch_time_t v13 = dispatch_time(0, 15000000000);
  dispatch_semaphore_wait(v12, v13);
  [v6 cancelCallPromptDisplay];
  BOOL v14 = *(unsigned char *)(*((void *)&buf + 1) + 24) == 0;

  _Block_object_dispose(&buf, 8);
  if (!v14)
  {
LABEL_6:
    BOOL v15 = [v4 handle];
    id v16 = [v15 value];
    int v17 = TUIsMMIOrUSSDNumber();

    if (v17)
    {
      unsigned int v18 = sub_1000D5130();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "dialEmergencyCall: Digits to dial are MMI/USSD, so dialing directly as a normal dial request", (uint8_t *)&buf, 2u);
      }

      v46 = _NSConcreteStackBlock;
      uint64_t v47 = 3221225472;
      v48 = sub_1000A3D78;
      v49 = &unk_1002CD540;
      id v19 = v4;
      id v50 = v19;
      unsigned int v20 = objc_retainBlock(&v46);
      long long v21 = [v19 handle:v46, v47, v48, v49];
      long long v22 = [v21 value];
      unsigned int v23 = +[PHInCallUIUtilities shouldRequestPasscodeUnlockForMMICode:v22];

      if (v23)
      {
        long long v24 = +[PHInCallUtilities sharedInstance];
        [v24 requestPasscodeUnlockWithCompletion:v20];
      }
      else
      {
        ((void (*)(void ***, uint64_t))v20[2])(v20, 1);
      }

      uint64_t v33 = v50;
    }
    else
    {
      v25 = +[PHInCallUtilities sharedInstance];
      unsigned int v26 = [v25 isSetupAssistantRunning];

      __int16 v27 = +[UIApplication sharedApplication];
      unsigned int v28 = [v27 isPasscodeRequiredToUnlock];

      v29 = sub_10000FA3C(@"EmergencyDialerAllowsAllCalls", TUBundleIdentifierInCallServiceApplication);
      LODWORD(v27) = [v29 BOOLValue];

      if ((((v26 | v28 | +[APApplication isPhoneAppLocked]) ^ 1 | v27) & 1) == 0)
      {
        [v4 setDialType:1];
        if (v28) {
          uint64_t v30 = 2;
        }
        else {
          uint64_t v30 = 0;
        }
        [v4 setOriginatingUIType:v30];
      }
      v31 = sub_1000D5130();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v4;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "dialEmergencyCall: preparing to dial request %@", (uint8_t *)&buf, 0xCu);
      }

      v32 = +[TUCallCenter sharedInstance];
      uint64_t v33 = [v32 dialWithRequest:v4];

      double v34 = sub_1000D5130();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v33;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "dialEmergencyCall: emergency call from request is %@", (uint8_t *)&buf, 0xCu);
      }

      if (!v33) {
        goto LABEL_28;
      }
      if (_os_feature_enabled_impl())
      {
        v35 = sub_1000D5130();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: request full screen presentation for call from lock screen", (uint8_t *)&buf, 2u);
        }

        v36 = +[UIApplication sharedApplication];
        v37 = [v36 delegate];
        [v37 requestPresentationForCall:v33 dialRequest:v4];

        v38 = sub_1000D5130();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "EnhancedEmergency: dismiss emergency dialer due to ICS launch", (uint8_t *)&buf, 2u);
        }

        +[TUCallCapabilities endEmergencyCallbackMode];
        CFStringRef v39 = [(PHEmergencyDialerViewController *)self _remoteViewControllerProxy];
        [v39 dismiss];
      }
      if ([v33 status] == 6)
      {
LABEL_28:
        double v40 = +[NSBundle mainBundle];
        double v41 = [v40 localizedStringForKey:@"EMERGENCY_CALLS_ONLY" value:&stru_1002D6110 table:@"EmergencyCallStrings"];
        v42 = [(PHEmergencyDialerViewController *)self dialerView];
        v43 = [v42 emergencyTitleLabel];
        [v43 setText:v41];

        v44 = [(PHEmergencyDialerViewController *)self dialerView];
        v45 = [v44 lcdView];
        [v45 setText:&stru_1002D6110 needsFormat:0];

        [(PHEmergencyDialerViewController *)self performSelector:"continueCyclingEmergencyTitleLabel" withObject:0 afterDelay:3.0];
      }
    }
  }
}

- (void)handleUseRTTActionForButtonSender:(id)a3 event:(id)a4
{
  id v5 = a3;
  id v6 = [(PHEmergencyDialerViewController *)self useRTTButton];

  if (v6 == v5)
  {
    id v9 = +[TUCallCenter sharedInstance];
    id v7 = +[TUCallCenter sharedInstance];
    id v8 = [v7 frontmostCall];
    [v9 setTTYType:1 forCall:v8];
  }
}

- (void)refreshUseRTTButton
{
  double v3 = (double)[(PHEmergencyDialerViewController *)self shouldShowUseRTTButton];
  id v4 = [(PHEmergencyDialerViewController *)self useRTTButton];
  [v4 setAlpha:v3];

  BOOL v5 = [(PHEmergencyDialerViewController *)self shouldShowUseRTTButton];
  id v6 = [(PHEmergencyDialerViewController *)self useRTTButton];
  [v6 setEnabled:v5];
}

- (BOOL)shouldShowRTTAlertForDialRequest:(id)a3
{
  id v3 = a3;
  id v4 = +[TUCallCenter sharedInstance];
  if ([v4 currentCallCount] || !objc_msgSend(v3, "isValid"))
  {
    unsigned __int8 v6 = 0;
  }
  else
  {
    BOOL v5 = [v3 provider];
    if ([v5 isTelephonyProvider])
    {
      if ([v3 isRTTAvailable]) {
        unsigned __int8 v6 = 1;
      }
      else {
        unsigned __int8 v6 = [v3 isTTYAvailable];
      }
    }
    else
    {
      unsigned __int8 v6 = 0;
    }
  }
  return v6;
}

- (BOOL)shouldShowUseRTTButton
{
  unint64_t v2 = +[TUCallCenter sharedInstance];
  id v3 = [v2 frontmostCall];

  if (v3
    && [v3 status] == 1
    && ([v3 isRTT] & 1) == 0
    && ([v3 isTTY] & 1) == 0
    && [v3 supportsTTYWithVoice])
  {
    id v4 = +[TUCallCenter sharedInstance];
    BOOL v5 = [v4 currentCallCount] == (id)1;
  }
  else
  {
    BOOL v5 = 0;
  }
  unsigned __int8 v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"should not";
    if (v5) {
      CFStringRef v7 = @"should";
    }
    int v9 = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Determined that the Use RTT button %@ be presented during the emergency call %@.", (uint8_t *)&v9, 0x16u);
  }

  return v5;
}

- (UIButton)useRTTButton
{
  useRTTButton = self->_useRTTButton;
  if (!useRTTButton)
  {
    id v4 = sub_10010C7DC();
    BOOL v5 = +[TUCallCenter sharedInstance];
    unsigned __int8 v6 = [v5 frontmostCall];

    CFStringRef v7 = +[PHEdgeInsetButton buttonWithType:1];
    -[UIButton setTouchAreaEdgeInsets:](v7, "setTouchAreaEdgeInsets:", -15.0, -15.0, -15.0, -15.0);
    [(UIButton *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)v7 addTarget:self action:"handleUseRTTActionForButtonSender:event:" forControlEvents:64];
    id v8 = [v6 localSenderIdentityUUID];
    int v9 = [v4 rttDisplayName:1 forSubscriptionContextUUID:v8];
    [(UIButton *)v7 setTitle:v9 forState:0];

    CFStringRef v10 = +[UIColor blackColor];
    [(UIButton *)v7 setTitleColor:v10 forState:0];

    unint64_t v11 = +[PHUIConfiguration handsetDialerSpacing];
    double v12 = 16.0;
    if (!v11) {
      double v12 = 14.0;
    }
    dispatch_time_t v13 = +[UIFont systemFontOfSize:v12];
    BOOL v14 = [(UIButton *)v7 titleLabel];
    [v14 setFont:v13];

    BOOL v15 = [(UIButton *)v7 titleLabel];
    [v15 setTextAlignment:1];

    id v16 = self->_useRTTButton;
    self->_useRTTButton = v7;

    useRTTButton = self->_useRTTButton;
  }

  return useRTTButton;
}

- (void)handleTUCallSupportsTTYWithVoiceChangedNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v9 = 138412546;
    CFStringRef v10 = v6;
    __int16 v11 = 2112;
    double v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHEmergencyDialerViewController *)self refreshUseRTTButton];
}

- (void)handleTUCallTTYTypeChangedNotification:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = objc_opt_class();
    id v7 = v6;
    id v8 = [v4 name];
    int v9 = 138412546;
    CFStringRef v10 = v6;
    __int16 v11 = 2112;
    double v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v9, 0x16u);
  }
  [(PHEmergencyDialerViewController *)self refreshUseRTTButton];
}

- (void)stewieAlertButtonTapped:(id)a3
{
  id v5 = +[UIApplication sharedApplication];
  id v3 = [v5 delegate];
  id v4 = [v3 alertCoordinator];
  [v4 invokeAlertWithRequestUnlock:1 automaticallyInvoked:0];
}

- (void)alertWillInvoke
{
  id v2 = +[NSNotificationCenter defaultCenter];
  [v2 postNotificationName:@"PHAlertDisconnectingCallsNotification" object:0];
}

- (void)updatePresentationStateWithAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PHEmergencyDialerViewController *)self shouldPresentAlertButton] != a3)
  {
    [(PHEmergencyDialerViewController *)self setShouldPresentAlertButton:v3];
    [(PHEmergencyDialerViewController *)self updateCurrentState];
  }
}

- (BOOL)shouldSetPresenceToken
{
  return self->_shouldSetPresenceToken;
}

- (void)setShouldSetPresenceToken:(BOOL)a3
{
  self->_shouldSetPresenceToken = a3;
}

- (PHEmergencyHandsetDialerView)dialerView
{
  return (PHEmergencyHandsetDialerView *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDialerView:(id)a3
{
}

- (NSTimer)callDurationTimer
{
  return self->_callDurationTimer;
}

- (void)setCallDurationTimer:(id)a3
{
}

- (UIButton)backButton
{
  return (UIButton *)objc_getProperty(self, a2, 48, 1);
}

- (void)setBackButton:(id)a3
{
}

- (UIButton)medicalIDButton
{
  return (UIButton *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMedicalIDButton:(id)a3
{
}

- (UIButton)endButton
{
  return (UIButton *)objc_getProperty(self, a2, 64, 1);
}

- (void)setEndButton:(id)a3
{
}

- (signed)currentState
{
  return self->_currentState;
}

- (BOOL)callEnding
{
  return self->_callEnding;
}

- (void)setCallEnding:(BOOL)a3
{
  self->_callEnding = a3;
}

- (HKHealthStore)healthStore
{
  return (HKHealthStore *)objc_getProperty(self, a2, 72, 1);
}

- (void)setHealthStore:(id)a3
{
}

- (UIViewController)medicalIDViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 80, 1);
}

- (void)setMedicalIDViewController:(id)a3
{
}

- (NSLayoutConstraint)endButtonHorizontalConstraint
{
  return self->_endButtonHorizontalConstraint;
}

- (void)setEndButtonHorizontalConstraint:(id)a3
{
}

- (UIButton)stewieAlertButton
{
  return (UIButton *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStewieAlertButton:(id)a3
{
}

- (UIButton)stewieEndCallButton
{
  return (UIButton *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStewieEndCallButton:(id)a3
{
}

- (BOOL)shouldPresentAlertButton
{
  return self->_shouldPresentAlertButton;
}

- (void)setShouldPresentAlertButton:(BOOL)a3
{
  self->_shouldPresentAlertButton = a3;
}

- (UINotificationFeedbackGenerator)alertFeedbackGenerator
{
  return self->_alertFeedbackGenerator;
}

- (void)setAlertFeedbackGenerator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_stewieEndCallButton, 0);
  objc_storeStrong((id *)&self->_stewieAlertButton, 0);
  objc_storeStrong((id *)&self->_endButtonHorizontalConstraint, 0);
  objc_storeStrong((id *)&self->_medicalIDViewController, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_endButton, 0);
  objc_storeStrong((id *)&self->_medicalIDButton, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
  objc_storeStrong((id *)&self->_callDurationTimer, 0);
  objc_storeStrong((id *)&self->_dialerView, 0);
  objc_storeStrong((id *)&self->_useRTTButton, 0);

  objc_storeStrong((id *)&self->_senderIdentityClient, 0);
}

@end