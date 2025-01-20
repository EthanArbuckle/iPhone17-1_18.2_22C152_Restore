@interface PHSOSViewController
+ (BOOL)isCallBufferDismissalAssertionActive;
+ (BOOL)isSOSDismissalAssertionActive;
+ (BOOL)shouldShowMedicalID:(id)a3;
+ (id)getSetOfCallBufferDismissalAssertions;
+ (id)getSetOfSOSDismissalAssertions;
+ (void)releaseAllCallBufferDismissalAssertions;
- (BOOL)_canShowWhileLocked;
- (BOOL)allowsBanners;
- (BOOL)allowsMenuButtonDismissal;
- (BOOL)allowsOrientationChangeEvents;
- (BOOL)allowsOtherAlertsToStackOnTop;
- (BOOL)alreadyVisitedRestingScreen;
- (BOOL)callAutoDialled;
- (BOOL)clawButtonPressGapWithinThreshold;
- (BOOL)clawSwipeAfterRTCTimeout;
- (BOOL)desiresLockButtonEvents;
- (BOOL)isPendingAudioSessionActivation;
- (BOOL)isUserResponsive;
- (BOOL)requestedCallActive;
- (BOOL)shouldAllowLockButtonPressesToDismissSOS;
- (BOOL)shouldDropBioAuthTokenOnDismiss;
- (BOOL)shouldHandleAlertCallDisconnection;
- (BOOL)volumeHUDHiddenCurrently;
- (BOOL)volumeHUDHiddenPending;
- (BOOL)volumeMaxedCurrently;
- (BOOL)volumeMaxedPending;
- (BOOL)wasCallCancelled;
- (CNKCoreAnalyticsReporter)analyticsReporter;
- (CTStewieState)stewieState;
- (CTStewieStateMonitor)stewieStateMonitor;
- (CoreTelephonyClient)coreTelephonyClient;
- (HKHealthStore)healthStore;
- (NSArray)sosHandles;
- (NSDate)dateOfCall;
- (NSString)launchedForAssertionReason;
- (NSString)sessionId;
- (NSString)sosCallUUID;
- (NSTimer)confirmationTimeoutTimer;
- (NSTimer)statusHeartbeatTimer;
- (PHAudioDeviceController)audioDeviceController;
- (PHBottomBarButton)cancelButton;
- (PHCheckInView)checkInView;
- (PHCountdownView)countdownView;
- (PHSOSAlertRestingView)alertRestingView;
- (PHSOSNumbersViewController)sosNumbersViewController;
- (PHSOSRestingView)restingView;
- (PHSOSViewController)initWithSOSHandles:(id)a3;
- (PHSlidingView)slidingView;
- (SOSButtonPressState)currentButtonPressState;
- (SOSCoreAnalyticsReporting)coreAnalyticsReporter;
- (SPBeaconManager)beaconManager;
- (TUAudioRoute)priorSystemAudioRoute;
- (UILabel)infoLabel;
- (UINavigationController)medicalIDNavigationController;
- (UIView)currentView;
- (double)callConnectTimeSinceSessionStart;
- (double)callDialStartTime;
- (double)countdownPausedTime;
- (double)countdownStartedTime;
- (double)interactiveStartTime;
- (double)marginPadding;
- (double)sessionStartTime;
- (double)sliderProgressDuration;
- (double)timeTillActive;
- (double)timeTillCancelCall;
- (float)priorSystemVolume;
- (id)getCheckInViewModel;
- (id)getSOSDialCountdownViewModel;
- (id)nameForSOSMode:(int64_t)a3;
- (int)callDisconnectReason;
- (int64_t)currentInteractiveState;
- (int64_t)sosMode;
- (int64_t)sosTrigger;
- (unint64_t)clawResolution;
- (unint64_t)desiredButtonEvents;
- (unint64_t)desiredSceneButtonEvents;
- (unint64_t)slidingViewEntryReason;
- (unint64_t)slidingViewExitReason;
- (void)addDismissalAssertionReleasedObserver;
- (void)addObservers;
- (void)buttonPressStateChangedNotification:(id)a3;
- (void)buttonPressed:(id)a3;
- (void)callStateChangedNotification:(id)a3;
- (void)clearStatusHeartbeatTimer;
- (void)deactivateSOS;
- (void)deactivateSOSWithSOSDismissalType:(int64_t)a3;
- (void)dialEmergencyCall;
- (void)dialSOSNumberAtIndex:(int64_t)a3;
- (void)didReceiveMemoryWarning;
- (void)didTapFindMy;
- (void)didTapTemporarilyDisableFindMy;
- (void)dismissMedicalIDViewController;
- (void)dismissSOSNotification:(id)a3;
- (void)dismissalAssertionReleasedNotification:(id)a3;
- (void)emergencyCallbackModeChangedNotification:(id)a3;
- (void)fetchMedicalIDWithCompletion:(id)a3;
- (void)handleAlertDisconnectingCallsNotification:(id)a3;
- (void)handleAnimationSlidingCompletionResponse;
- (void)handleCallBufferCompletionNotification:(id)a3;
- (void)handleNetworkUnavailableAlertDidFinishNotification:(id)a3;
- (void)handleVolumeChanges;
- (void)handleVolumeHUDEnablement;
- (void)hideMedicalIDWithCompletion:(id)a3;
- (void)interactiveStart;
- (void)interactiveStateChangedNotification:(id)a3;
- (void)interactiveStop:(BOOL)a3;
- (void)loadMedicalIDWithCompletion:(id)a3;
- (void)medicalIDViewControllerDidFinish:(id)a3;
- (void)notifyEmergencyContacts;
- (void)presentMedicalID;
- (void)raiseAccidentalSOSNotification;
- (void)removeDismissalAssertionReleasedObserver;
- (void)restoreSystemVolumeLevel;
- (void)sendFlowStateUpdateForCurrentSOSMode;
- (void)setAlertRestingView:(id)a3;
- (void)setAlreadyVisitedRestingScreen:(BOOL)a3;
- (void)setAnalyticsReporter:(id)a3;
- (void)setAudioDeviceController:(id)a3;
- (void)setBeaconManager:(id)a3;
- (void)setCallAutoDialled:(BOOL)a3;
- (void)setCallConnectTimeSinceSessionStart:(double)a3;
- (void)setCallDialStartTime:(double)a3;
- (void)setCallDisconnectReason:(int)a3;
- (void)setCancelButton:(id)a3;
- (void)setCheckInView:(id)a3;
- (void)setClawResolution:(unint64_t)a3;
- (void)setClawSwipeAfterRTCTimeout:(BOOL)a3;
- (void)setConfirmationTimeoutTimer:(id)a3;
- (void)setCoreAnalyticsReporter:(id)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setCountdownPausedTime:(double)a3;
- (void)setCountdownStartedTime:(double)a3;
- (void)setCountdownView:(id)a3;
- (void)setCurrentButtonPressState:(id)a3;
- (void)setCurrentInteractiveState:(int64_t)a3;
- (void)setCurrentView:(id)a3;
- (void)setDateOfCall:(id)a3;
- (void)setHealthStore:(id)a3;
- (void)setInfoLabel:(id)a3;
- (void)setInteractiveStartTime:(double)a3;
- (void)setIsPendingAudioSessionActivation:(BOOL)a3;
- (void)setIsUserResponsive:(BOOL)a3;
- (void)setLaunchedForAssertionReason:(id)a3;
- (void)setMedicalIDNavigationController:(id)a3;
- (void)setPostCallMode;
- (void)setPostContactNotificationMode;
- (void)setPriorSystemAudioRoute:(id)a3;
- (void)setPriorSystemVolume:(float)a3;
- (void)setRequestedCallActive:(BOOL)a3;
- (void)setRestingView:(id)a3;
- (void)setSessionId:(id)a3;
- (void)setSessionStartTime:(double)a3;
- (void)setShouldDropBioAuthTokenOnDismiss:(BOOL)a3;
- (void)setShouldHandleAlertCallDisconnection:(BOOL)a3;
- (void)setSliderProgressDuration:(double)a3;
- (void)setSlidingView:(id)a3;
- (void)setSlidingViewEntryReason:(unint64_t)a3;
- (void)setSlidingViewExitReason:(unint64_t)a3;
- (void)setSosCallUUID:(id)a3;
- (void)setSosHandles:(id)a3;
- (void)setSosMode:(int64_t)a3;
- (void)setSosNumbersViewController:(id)a3;
- (void)setSosTrigger:(int64_t)a3;
- (void)setStatusHeartbeatTimer:(id)a3;
- (void)setStewieState:(id)a3;
- (void)setStewieStateMonitor:(id)a3;
- (void)setSystemVolumeToMax;
- (void)setTimeTillActive:(double)a3;
- (void)setTimeTillCancelCall:(double)a3;
- (void)setUpAlertRestingViewConstraints;
- (void)setUpCancelButtonConstraints;
- (void)setUpCheckInViewConstraints;
- (void)setUpCountdownViewConstraints;
- (void)setUpInfoLabelConstraints;
- (void)setUpRestingViewConstraints;
- (void)setUpSOSNumbersListViewConstraints;
- (void)setUpSlidingViewConstraints;
- (void)setVolumeHUDHiddenCurrently:(BOOL)a3;
- (void)setVolumeHUDHiddenPending:(BOOL)a3;
- (void)setVolumeMaxedCurrently:(BOOL)a3;
- (void)setVolumeMaxedPending:(BOOL)a3;
- (void)setWasCallCancelled:(BOOL)a3;
- (void)showAlertRestingView;
- (void)showCheckInView;
- (void)showConfirmationAlert;
- (void)showPowerDownFindMyAlert;
- (void)showPowerDownFindMyInfoAlertWithProceed:(id)a3 cancelCompletion:(id)a4;
- (void)showRestingView;
- (void)showSOSDialCanceled;
- (void)showSOSDialCountdown;
- (void)showSOSDialSliding;
- (void)showSOSNotificationCanceled;
- (void)showSOSNotificationCountdown;
- (void)showSOSNotified;
- (void)showSOSNumbersList;
- (void)sosNumbersViewController:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)startSOSNotificationCountdown;
- (void)startStatusHeartbeatTimer;
- (void)stateChanged:(id)a3;
- (void)submitSOSResolutionMetric:(BOOL)a3;
- (void)submitSOSUserActivityMetric;
- (void)transitionToView:(id)a3 animated:(BOOL)a4;
- (void)updateInteractiveState;
- (void)updateSOSHandles:(id)a3;
- (void)userAcknowledgedFindMyInfo;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willStartSendingLocationUpdate;
@end

@implementation PHSOSViewController

+ (id)getSetOfSOSDismissalAssertions
{
  return +[NSSet setWithObjects:@"PHSOSCallAssertionReason", @"PHAlertRestingScreenAssertionReason", 0];
}

+ (BOOL)isSOSDismissalAssertionActive
{
  v2 = +[PHSOSViewController getSetOfSOSDismissalAssertions];
  v3 = +[PHInCallRootViewController dismissalAssertions];
  unsigned __int8 v4 = [v2 intersectsSet:v3];

  return v4;
}

+ (id)getSetOfCallBufferDismissalAssertions
{
  return +[NSSet setWithObjects:@"PHCallBufferScreenAssertionReason", @"PHSliderSwipeCallBufferScreenAssertionReason", 0];
}

+ (BOOL)isCallBufferDismissalAssertionActive
{
  v2 = +[PHSOSViewController getSetOfCallBufferDismissalAssertions];
  v3 = +[PHInCallRootViewController dismissalAssertions];
  unsigned __int8 v4 = [v2 intersectsSet:v3];

  return v4;
}

+ (void)releaseAllCallBufferDismissalAssertions
{
  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHCallBufferScreenAssertionReason"];

  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHSliderSwipeCallBufferScreenAssertionReason"];
}

- (PHSOSViewController)initWithSOSHandles:(id)a3
{
  id v5 = a3;
  v43.receiver = self;
  v43.super_class = (Class)PHSOSViewController;
  v6 = [(PHSOSViewController *)&v43 init];
  if (v6)
  {
    v7 = (CoreTelephonyClient *)[objc_alloc((Class)CoreTelephonyClient) initWithQueue:&_dispatch_main_q];
    coreTelephonyClient = v6->_coreTelephonyClient;
    v6->_coreTelephonyClient = v7;

    uint64_t v9 = objc_opt_new();
    analyticsReporter = v6->_analyticsReporter;
    v6->_analyticsReporter = (CNKCoreAnalyticsReporter *)v9;

    objc_storeStrong((id *)&v6->_sosHandles, a3);
    v6->_sosTrigger = (int64_t)+[SOSUtilities mostRecentlyUsedSOSTriggerMechanism];
    v6->_isPendingAudioSessionActivation = 1;
    v11 = objc_alloc_init(PHAudioDeviceController);
    audioDeviceController = v6->_audioDeviceController;
    v6->_audioDeviceController = v11;

    [(PHAudioDeviceController *)v6->_audioDeviceController setDelegate:v6];
    uint64_t v13 = +[SOSCoreAnalyticsReporter sharedInstance];
    coreAnalyticsReporter = v6->_coreAnalyticsReporter;
    v6->_coreAnalyticsReporter = (SOSCoreAnalyticsReporting *)v13;

    v6->_priorSystemVolume = -1.0;
    uint64_t v15 = [(PHAudioDeviceController *)v6->_audioDeviceController currentRoute];
    priorSystemAudioRoute = v6->_priorSystemAudioRoute;
    v6->_priorSystemAudioRoute = (TUAudioRoute *)v15;

    v6->_callDialStartTime = -1.0;
    v6->_timeTillActive = -1.0;
    v6->_callAutoDialled = 0;
    v17 = +[NSUUID UUID];
    uint64_t v18 = [v17 UUIDString];
    sessionId = v6->_sessionId;
    v6->_sessionId = (NSString *)v18;

    v6->_sessionStartTime = CFAbsoluteTimeGetCurrent();
    v20 = +[PHInCallRootViewController dismissalAssertions];
    unsigned int v21 = [v20 containsObject:@"PHSOSCallAssertionReason"];

    if (v21)
    {
      objc_storeStrong((id *)&v6->_launchedForAssertionReason, @"PHSOSCallAssertionReason");
      switch(v6->_sosTrigger)
      {
        case 0:
          v22 = sub_1000D5130();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_1001EA3E0();
          }

          goto LABEL_7;
        case 1:
        case 2:
LABEL_7:
          if (+[SOSUtilities isCallWithSideButtonPressesEnabled](SOSUtilities, "isCallWithSideButtonPressesEnabled")&& sub_100061D88()&& ([(PHSOSViewController *)v6 coreTelephonyClient], v23 = objc_claimAutoreleasedReturnValue(), unsigned int v24 = +[SOSUtilities shouldForceDisableAutoCallForClient:v23], v23, !v24))
          {
            uint64_t v25 = 1;
          }
          else
          {
            uint64_t v25 = 2;
          }
          v6->_int64_t sosMode = v25;
          int v26 = 352;
          uint64_t v27 = 2;
          break;
        case 3:
          v6->_int64_t sosMode = 2;
          int v26 = 352;
          uint64_t v27 = 1;
          break;
        case 7:
          int v26 = 32;
          uint64_t v27 = 8;
          break;
        default:
          v37 = sub_1000D5130();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
            sub_1001EA364(&v6->_sosTrigger, v37);
          }

          int v26 = 32;
          uint64_t v27 = 2;
          break;
      }
      *(Class *)((char *)&v6->super.super.super.isa + v26) = (Class)v27;
      v6->_shouldDropBioAuthTokenOnDismiss = 1;
    }
    else
    {
      v28 = +[PHInCallRootViewController dismissalAssertions];
      unsigned int v29 = [v28 containsObject:@"PHAlertRestingScreenAssertionReason"];

      if (v29)
      {
        objc_storeStrong((id *)&v6->_launchedForAssertionReason, @"PHAlertRestingScreenAssertionReason");
        v6->_int64_t sosMode = 10;
        v30 = (CTStewieStateMonitor *)[objc_alloc((Class)CTStewieStateMonitor) initWithDelegate:v6 queue:&_dispatch_main_q];
        stewieStateMonitor = v6->_stewieStateMonitor;
        v6->_stewieStateMonitor = v30;

        [(CTStewieStateMonitor *)v6->_stewieStateMonitor start];
        uint64_t v32 = [(CTStewieStateMonitor *)v6->_stewieStateMonitor getState];
        stewieState = v6->_stewieState;
        v6->_stewieState = (CTStewieState *)v32;

        v34 = sub_1000D5130();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = v6->_stewieState;
          *(_DWORD *)buf = 138412290;
          v45 = v35;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,Stewie state on launch: %@", buf, 0xCu);
        }
      }
      else
      {
        v36 = sub_1000D5130();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
          sub_1001EA414();
        }

        v6->_int64_t sosMode = 2;
      }
    }
    v38 = sub_1000D5130();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      sosHandles = v6->_sosHandles;
      int64_t sosMode = v6->_sosMode;
      *(_DWORD *)buf = 138412546;
      v45 = sosHandles;
      __int16 v46 = 2048;
      int64_t v47 = sosMode;
      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Initialized PHSOSViewController with sosHandles: %@ sosMode: %ld", buf, 0x16u);
    }

    [(PHSOSViewController *)v6 addObservers];
    id v41 = objc_alloc_init((Class)SPBeaconManager);
    [(PHSOSViewController *)v6 setBeaconManager:v41];
  }
  return v6;
}

- (void)addObservers
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"callStateChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
  [v3 addObserver:self selector:"emergencyCallbackModeChangedNotification:" name:TUCallCapabilitiesEmergencyCallbackModeChangedNotification object:0];
  [v3 addObserver:self selector:"interactiveStateChangedNotification:" name:SOSInteractiveStateChangedNotification object:0];
  [v3 addObserver:self selector:"buttonPressStateChangedNotification:" name:SOSButtonPressStateChangedNotification object:0];
  [v3 addObserver:self selector:"dismissSOSNotification:" name:SOSDismissSOSNotification object:0];
  [v3 addObserver:self selector:"handleNetworkUnavailableAlertDidFinishNotification:" name:@"PHNetworkUnavailableAlertDidFinishNotification" object:0];
  [v3 addObserver:self selector:"handleAlertDisconnectingCallsNotification:" name:@"PHAlertDisconnectingCallsNotification" object:0];
  [v3 addObserver:self selector:"handleCallBufferCompletionNotification:" name:@"PHCallBufferCompletionNotification" object:0];
}

- (void)updateSOSHandles:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_sosHandles, a3);
  sosNumbersViewController = self->_sosNumbersViewController;
  if (sosNumbersViewController) {
    [(PHSOSNumbersViewController *)sosNumbersViewController updateSOSHandles:self->_sosHandles];
  }
}

- (BOOL)shouldAllowLockButtonPressesToDismissSOS
{
  if ((id)[(PHSOSViewController *)self sosMode] != (id)2
    || self->_currentInteractiveState
    || +[PHSOSViewController isCallBufferDismissalAssertionActive])
  {
    return 0;
  }
  else
  {
    return ![(PHSOSViewController *)self requestedCallActive];
  }
}

- (BOOL)clawButtonPressGapWithinThreshold
{
  +[SOSUtilities clawReleaseToCallSupport];
  if (v2 == 0.0) {
    return 1;
  }
  id v3 = +[SOSManager sharedInstance];
  unsigned __int8 v4 = [v3 currentSOSButtonPressState];
  [v4 getButtonPressGap];
  BOOL v6 = v5 <= 3.0;

  return v6;
}

- (void)interactiveStart
{
  if ((id)[(PHSOSViewController *)self sosMode] != (id)2
    || [(PHSOSViewController *)self requestedCallActive])
  {
    goto LABEL_8;
  }
  id v3 = [(PHSOSViewController *)self slidingView];
  if ([v3 slidingViewState] == (id)1 || !sub_100061D88()) {
    goto LABEL_7;
  }
  unsigned __int8 v4 = [(PHSOSViewController *)self coreTelephonyClient];
  if (+[SOSUtilities shouldForceDisableAutoCallForClient:v4])
  {

LABEL_7:
    goto LABEL_8;
  }
  unsigned int v5 = [(PHSOSViewController *)self clawButtonPressGapWithinThreshold];

  if (!v5)
  {
LABEL_8:
    if (![(PHSOSViewController *)self clawButtonPressGapWithinThreshold])
    {
      [(PHSOSViewController *)self setWasCallCancelled:1];
      [(PHSOSViewController *)self setClawResolution:7];
      [(PHSOSViewController *)self submitSOSResolutionMetric:0];
    }
    return;
  }
  BOOL v6 = [(PHSOSViewController *)self slidingView];
  v7 = objc_alloc_init(PHSOSDialSlidingViewModel);
  [v6 interactiveStartWithCountdownModel:v7];

  +[NSDate timeIntervalSinceReferenceDate];

  -[PHSOSViewController setInteractiveStartTime:](self, "setInteractiveStartTime:");
}

- (void)interactiveStop:(BOOL)a3
{
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100062310;
  v7[3] = &unk_1002CEC38;
  objc_copyWeak(&v8, &location);
  BOOL v9 = a3;
  unsigned int v5 = objc_retainBlock(v7);
  if ((id)[(PHSOSViewController *)self sosMode] == (id)2)
  {
    BOOL v6 = [(PHSOSViewController *)self slidingView];
    [v6 interactiveStop:v5];
  }
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)PHSOSViewController;
  [(PHSOSViewController *)&v2 didReceiveMemoryWarning];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)PHSOSViewController;
  [(PHSOSViewController *)&v14 viewDidLoad];
  if ([(PHAudioDeviceController *)self->_audioDeviceController speakerRouteAvailable])
  {
    [(PHAudioDeviceController *)self->_audioDeviceController pickSpeakerRoute];
    unsigned __int8 v3 = [(PHAudioDeviceController *)self->_audioDeviceController speakerRouteIsPicked];
    unsigned __int8 v4 = sub_1000D5130();
    unsigned int v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,routed audio through speaker", v13, 2u);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      sub_1001EA448();
    }
  }
  else
  {
    unsigned int v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1001EA47C();
    }
  }

  BOOL v6 = [[PHBottomBarButtonConfiguration alloc] initWithAction:19];
  v7 = [[PHBottomBarButton alloc] initWithConfiguration:v6];
  [(PHSOSViewController *)self setCancelButton:v7];

  id v8 = [(PHSOSViewController *)self cancelButton];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v9 = [(PHSOSViewController *)self cancelButton];
  [v9 addTarget:self action:"buttonPressed:" forEvents:64];

  v10 = [(PHSOSViewController *)self view];
  v11 = [(PHSOSViewController *)self cancelButton];
  [v10 addSubview:v11];

  [(PHSOSViewController *)self setUpCancelButtonConstraints];
  [(PHSOSViewController *)self setSosMode:self->_sosMode];
  v12 = +[SOSManager sharedInstance];
  [v12 setCurrentSOSInitiationState:1];

  [(PHSOSViewController *)self updateInteractiveState];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  countdownView = self->_countdownView;
  if (countdownView) {
    [(PHCountdownView *)countdownView pause];
  }
  checkInView = self->_checkInView;
  if (checkInView) {
    [(PHCheckInView *)checkInView pause];
  }
  v7.receiver = self;
  v7.super_class = (Class)PHSOSViewController;
  [(PHSOSViewController *)&v7 viewWillDisappear:v3];
  if (!+[PHSOSViewController isCallBufferDismissalAssertionActive])
  {
    [(PHSOSViewController *)self setVolumeHUDHiddenPending:0];
    [(PHSOSViewController *)self handleVolumeHUDEnablement];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v10.receiver = self;
  v10.super_class = (Class)PHSOSViewController;
  [(PHSOSViewController *)&v10 viewWillAppear:a3];
  countdownView = self->_countdownView;
  if (countdownView) {
    [(PHCountdownView *)countdownView resume];
  }
  checkInView = self->_checkInView;
  if (checkInView) {
    [(PHCheckInView *)checkInView resume];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  -[PHSOSViewController setCountdownStartedTime:](self, "setCountdownStartedTime:");
  [(PHSOSViewController *)self setVolumeHUDHiddenPending:1];
  BOOL v6 = +[UIApplication sharedApplication];
  objc_super v7 = [v6 delegate];
  id v8 = [v7 sceneManager];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006281C;
  v9[3] = &unk_1002CE6E8;
  v9[4] = self;
  [v8 waitForRegistrationOfSceneWithType:0 completion:v9];
}

- (void)handleVolumeHUDEnablement
{
  unsigned int v3 = [(PHSOSViewController *)self volumeHUDHiddenPending];
  unsigned int v4 = [(PHSOSViewController *)self volumeHUDHiddenCurrently];
  unsigned int v5 = sub_1000D5130();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v6)
    {
      int v9 = 67109120;
      unsigned int v10 = ![(PHSOSViewController *)self volumeHUDHiddenCurrently];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,setVolumeHUDEnablement,volume HUD enablement already set to %d", (uint8_t *)&v9, 8u);
    }
  }
  else
  {
    if (v6)
    {
      int v9 = 67109120;
      unsigned int v10 = ![(PHSOSViewController *)self volumeHUDHiddenPending];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,setVolumeHUDEnablement,volume HUD enabled:%d", (uint8_t *)&v9, 8u);
    }

    [(PHSOSViewController *)self setVolumeHUDHiddenCurrently:[(PHSOSViewController *)self volumeHUDHiddenPending]];
    unsigned int v5 = +[UIApplication sharedApplication];
    objc_super v7 = [v5 delegate];
    id v8 = [v7 currentInCallScene];
    [v8 _setSystemVolumeHUDEnabled:[self volumeHUDHiddenPending] ^ 1];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (double)marginPadding
{
  unsigned int v2 = +[PHUIConfiguration shouldUseSOSTightSpacing];
  double result = 24.0;
  if (v2) {
    return 16.0;
  }
  return result;
}

- (void)handleNetworkUnavailableAlertDidFinishNotification:(id)a3
{
  unsigned int v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notified that network unavailable alert finished, so dismissing SOS", v5, 2u);
  }

  [(PHSOSViewController *)self deactivateSOS];
}

- (void)handleAlertDisconnectingCallsNotification:(id)a3
{
  unsigned int v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Notified that SOS should handle alert disconnecting calls", v5, 2u);
  }

  [(PHSOSViewController *)self setShouldHandleAlertCallDisconnection:1];
  [(PHSOSViewController *)self setShouldDropBioAuthTokenOnDismiss:0];
}

- (void)callStateChangedNotification:(id)a3
{
  unsigned int v4 = [a3 object];
  if ([v4 isConnected] && objc_msgSend(v4, "isSOSOrFakeSOS")) {
    [(PHSOSViewController *)self setShouldDropBioAuthTokenOnDismiss:0];
  }
  switch([v4 status])
  {
    case 1u:
      goto LABEL_8;
    case 3u:
      if ([v4 isSOSOrFakeSOS]) {
        [(PHSOSViewController *)self removeDismissalAssertionReleasedObserver];
      }
      goto LABEL_7;
    case 4u:
LABEL_7:
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100062FC4;
      v34[3] = &unk_1002CD518;
      v34[4] = self;
      [(PHSOSViewController *)self hideMedicalIDWithCompletion:v34];
LABEL_8:
      unint64_t v5 = [(PHSOSViewController *)self sosMode];
      if (v5 <= 8 && ((1 << v5) & 0x107) != 0)
      {
        if ([(PHSOSViewController *)self requestedCallActive]
          && [v4 isSOSOrFakeSOS])
        {
          BOOL v6 = [v4 callUUID];
          sosCallUUID = self->_sosCallUUID;
          self->_sosCallUUID = v6;
        }
        if (![(PHSOSViewController *)self requestedCallActive])
        {
          id v8 = self->_sosCallUUID;
          int v9 = [v4 callUUID];
          LOBYTE(v8) = [(NSString *)v8 isEqualToString:v9];

          if ((v8 & 1) == 0)
          {
            unsigned int v10 = [v4 isEmergency];
            v11 = sub_1000D5130();
            v12 = v11;
            if (v10)
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v33 = 0;
                _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,interrupted by other emergency call,deactivating SOS", v33, 2u);
              }

              [(PHSOSViewController *)self setShouldDropBioAuthTokenOnDismiss:0];
              [(PHSOSViewController *)self deactivateSOS];
            }
            else
            {
              if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
                sub_1001EA4B0();
              }
            }
          }
        }
      }
      if ([v4 status] == 1)
      {
        [(PHSOSViewController *)self callDialStartTime];
        if (v23 > 0.0)
        {
          double Current = CFAbsoluteTimeGetCurrent();
          [(PHSOSViewController *)self callDialStartTime];
          [(PHSOSViewController *)self setTimeTillActive:vabdd_f64(Current, v25)];
        }
        double v26 = CFAbsoluteTimeGetCurrent();
        [(PHSOSViewController *)self sessionStartTime];
        [(PHSOSViewController *)self setCallConnectTimeSinceSessionStart:vabdd_f64(v26, v27)];
      }
      goto LABEL_55;
    case 6u:
      if ([v4 isSOSOrFakeSOS])
      {
        [(PHSOSViewController *)self setRequestedCallActive:0];
        -[PHSOSViewController setCallDisconnectReason:](self, "setCallDisconnectReason:", [v4 disconnectedReason]);
      }
      [(PHSOSViewController *)self timeTillActive];
      if (v13 < 0.0)
      {
        [(PHSOSViewController *)self callDialStartTime];
        if (v14 > 0.0)
        {
          double v15 = CFAbsoluteTimeGetCurrent();
          [(PHSOSViewController *)self callDialStartTime];
          [(PHSOSViewController *)self setTimeTillActive:vabdd_f64(v15, v16)];
          double v17 = CFAbsoluteTimeGetCurrent();
          [(PHSOSViewController *)self sessionStartTime];
          [(PHSOSViewController *)self setCallConnectTimeSinceSessionStart:vabdd_f64(v17, v18)];
        }
      }
      unsigned int v19 = [v4 disconnectedReasonRequiresCallFailureUI];
      unsigned int v20 = [v4 isSOSOrFakeSOS];
      if (v19)
      {
        if (v20) {
          [(PHSOSViewController *)self addDismissalAssertionReleasedObserver];
        }
        goto LABEL_53;
      }
      if (!v20)
      {
        int64_t sosMode = self->_sosMode;
        if (sosMode == 2)
        {
          if ([v4 isOutgoing])
          {
            [(PHSOSViewController *)self deactivateSOS];
          }
          else
          {
            slidingView = self->_slidingView;
            self->_slidingView = 0;

            [(PHSOSViewController *)self setSosMode:2];
          }
        }
        else if (sosMode == 4 {
               && (+[TUCallCapabilities isEmergencyCallbackModeEnabled] & 1) == 0)
        }
        {
          [(PHSOSViewController *)self startSOSNotificationCountdown];
        }
        goto LABEL_53;
      }
      [(PHSOSViewController *)self setPostCallMode];
      unint64_t v21 = [(PHSOSViewController *)self sosTrigger];
      if (v21 >= 3)
      {
        if (v21 != 3)
        {
          if (v21 != 7)
          {
            unsigned int v29 = sub_1000D5130();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
              sub_1001EA4E4(self);
            }
          }
          [v4 callDuration];
          -[PHSOSViewController setTimeTillCancelCall:](self, "setTimeTillCancelCall:");
          [(PHSOSViewController *)self setWasCallCancelled:0];
          goto LABEL_52;
        }
        unsigned int v22 = +[SOSUtilities isCallWithVolumeLockHoldEnabled];
      }
      else
      {
        unsigned int v22 = +[SOSUtilities isCallWithSideButtonPressesEnabled];
      }
      unsigned int v30 = v22;
      [v4 callDuration];
      -[PHSOSViewController setTimeTillCancelCall:](self, "setTimeTillCancelCall:");
      [(PHSOSViewController *)self setWasCallCancelled:0];
      if (!v30 || ([v4 callDuration], v31 > 12.0))
      {
LABEL_52:
        [(PHSOSViewController *)self submitSOSResolutionMetric:0];
        goto LABEL_53;
      }
      [(PHSOSViewController *)self raiseAccidentalSOSNotification];
LABEL_53:
      if ([v4 isSOSOrFakeSOS])
      {
        [(PHSOSViewController *)self setSlidingViewExitReason:10];
        [(PHSOSViewController *)self submitSOSUserActivityMetric];
      }
LABEL_55:

      return;
    default:
      goto LABEL_55;
  }
}

- (void)dismissalAssertionReleasedNotification:(id)a3
{
  unsigned int v4 = +[PHInCallRootViewController dismissalAssertions];
  unsigned __int8 v5 = [v4 containsObject:@"PHAudioCallViewControllerDismissalAssertionHandlingCallFailure"];

  if ((v5 & 1) == 0)
  {
    [(PHSOSViewController *)self setPostCallMode];
    [(PHSOSViewController *)self removeDismissalAssertionReleasedObserver];
  }
}

- (void)removeDismissalAssertionReleasedObserver
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"PHDismissalAssertionReleasedNotification" object:0];
}

- (void)addDismissalAssertionReleasedObserver
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"dismissalAssertionReleasedNotification:" name:@"PHDismissalAssertionReleasedNotification" object:0];
}

- (void)interactiveStateChangedNotification:(id)a3
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000631F4;
  block[3] = &unk_1002CD518;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)updateInteractiveState
{
  id v3 = +[SOSManager sharedInstance];
  id v4 = [v3 currentSOSInteractiveState];

  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134218240;
    int64_t v7 = [(PHSOSViewController *)self currentInteractiveState];
    __int16 v8 = 2048;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController attempting to set currentInteractiveState from %lu to %lu", (uint8_t *)&v6, 0x16u);
  }

  if ((id)[(PHSOSViewController *)self currentInteractiveState] != v4)
  {
    [(PHSOSViewController *)self setCurrentInteractiveState:v4];
    if (v4)
    {
      if (v4 == (id)1) {
        [(PHSOSViewController *)self interactiveStart];
      }
    }
    else
    {
      [(PHSOSViewController *)self interactiveStop:1];
    }
  }
}

- (void)buttonPressStateChangedNotification:(id)a3
{
  id v4 = +[SOSManager sharedInstance];
  unsigned __int8 v5 = [v4 currentSOSButtonPressState];
  [(PHSOSViewController *)self setCurrentButtonPressState:v5];

  int v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v7 = [(PHSOSViewController *)self currentButtonPressState];
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,currentButtonPressState:%{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)dismissSOSNotification:(id)a3
{
  unsigned int v4 = [(PHSOSViewController *)self shouldAllowLockButtonPressesToDismissSOS];
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController attempting to dismiss SOS due to lock button press; shouldAllowLockButtonPressesToDismissSOS: %d",
      (uint8_t *)v6,
      8u);
  }

  if (v4) {
    [(PHSOSViewController *)self deactivateSOSWithSOSDismissalType:1];
  }
}

- (void)setPostCallMode
{
  if ([(PHSOSViewController *)self shouldHandleAlertCallDisconnection])
  {
    [(PHSOSViewController *)self setShouldHandleAlertCallDisconnection:0];
    goto LABEL_3;
  }
  if ((id)[(PHSOSViewController *)self sosTrigger] == (id)7
    && [(PHSOSViewController *)self alreadyVisitedRestingScreen])
  {
LABEL_3:
    [(PHSOSViewController *)self deactivateSOS];
    return;
  }
  id v3 = objc_alloc_init((Class)SOSContactsManager);
  unsigned int v4 = [v3 hasValidContactsToMessage];

  if (v4)
  {
    [(PHSOSViewController *)self setSosMode:4];
  }
  else
  {
    [(PHSOSViewController *)self setPostContactNotificationMode];
  }
}

- (void)setPostContactNotificationMode
{
  if ((id)[(PHSOSViewController *)self sosTrigger] == (id)7)
  {
    if ([(PHSOSViewController *)self isUserResponsive])
    {
      [(PHSOSViewController *)self deactivateSOS];
      return;
    }
    id v3 = self;
    uint64_t v4 = 9;
  }
  else
  {
    id v3 = self;
    uint64_t v4 = 7;
  }

  [(PHSOSViewController *)v3 setSosMode:v4];
}

- (void)setSosMode:(int64_t)a3
{
  unsigned __int8 v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [(PHSOSViewController *)self nameForSOSMode:a3];
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating SOS mode to %@", (uint8_t *)&v7, 0xCu);
  }
  self->_int64_t sosMode = a3;
  switch(a3)
  {
    case 0:
      [(PHSOSViewController *)self showSOSNumbersList];
      break;
    case 1:
      [(PHSOSViewController *)self showSOSDialCountdown];
      break;
    case 2:
      [(PHSOSViewController *)self showSOSDialSliding];
      break;
    case 3:
      [(PHSOSViewController *)self showSOSDialCanceled];
      break;
    case 4:
      [(PHSOSViewController *)self showSOSNotificationCountdown];
      break;
    case 5:
      [(PHSOSViewController *)self showSOSNotified];
      break;
    case 6:
      [(PHSOSViewController *)self showSOSNotificationCanceled];
      break;
    case 7:
      [(PHSOSViewController *)self presentMedicalID];
      break;
    case 8:
      [(PHSOSViewController *)self showCheckInView];
      break;
    case 9:
      [(PHSOSViewController *)self showRestingView];
      break;
    case 10:
      [(PHSOSViewController *)self showAlertRestingView];
      break;
    default:
      break;
  }
  [(PHSOSViewController *)self sendFlowStateUpdateForCurrentSOSMode];
}

- (void)sendFlowStateUpdateForCurrentSOSMode
{
  id v3 = [(PHSOSViewController *)self launchedForAssertionReason];

  if (v3 == @"PHSOSCallAssertionReason")
  {
    switch([(PHSOSViewController *)self sosMode])
    {
      case 0:
      case 5:
      case 6:
        return;
      case 1:
        uint64_t v4 = 2;
        goto LABEL_12;
      case 2:
        uint64_t v4 = 13;
        goto LABEL_12;
      case 3:
        uint64_t v4 = 6;
        goto LABEL_12;
      case 4:
        uint64_t v4 = 5;
        goto LABEL_12;
      case 7:
        uint64_t v4 = 8;
        goto LABEL_12;
      case 8:
        uint64_t v4 = 1;
        goto LABEL_12;
      case 9:
        uint64_t v4 = 9;
        goto LABEL_12;
      case 0xALL:
        uint64_t v4 = 11;
        goto LABEL_12;
      default:
        uint64_t v4 = 0;
LABEL_12:
        id v5 = +[SOSStatusReporter sharedInstance];
        [v5 updateSOSFlowState:v4];

        break;
    }
  }
}

- (id)nameForSOSMode:(int64_t)a3
{
  if ((unint64_t)a3 > 0xA) {
    return &stru_1002D6110;
  }
  else {
    return off_1002CEF10[a3];
  }
}

- (PHSOSNumbersViewController)sosNumbersViewController
{
  sosNumbersViewController = self->_sosNumbersViewController;
  if (!sosNumbersViewController)
  {
    uint64_t v4 = [PHSOSNumbersViewController alloc];
    id v5 = [(PHSOSViewController *)self sosHandles];
    int v6 = [(PHSOSNumbersViewController *)v4 initWithSOSHandles:v5];
    int v7 = self->_sosNumbersViewController;
    self->_sosNumbersViewController = v6;

    int v8 = [(PHSOSNumbersViewController *)self->_sosNumbersViewController view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(PHSOSNumbersViewController *)self->_sosNumbersViewController setDelegate:self];
    sosNumbersViewController = self->_sosNumbersViewController;
  }

  return sosNumbersViewController;
}

- (PHCheckInView)checkInView
{
  checkInView = self->_checkInView;
  if (!checkInView)
  {
    uint64_t v4 = objc_alloc_init(PHCheckInView);
    id v5 = self->_checkInView;
    self->_checkInView = v4;

    [(PHCheckInView *)self->_checkInView setTranslatesAutoresizingMaskIntoConstraints:0];
    checkInView = self->_checkInView;
  }

  return checkInView;
}

- (PHSOSRestingView)restingView
{
  restingView = self->_restingView;
  if (!restingView)
  {
    uint64_t v4 = objc_alloc_init(PHSOSRestingView);
    id v5 = self->_restingView;
    self->_restingView = v4;

    [(PHSOSRestingView *)self->_restingView setTranslatesAutoresizingMaskIntoConstraints:0];
    restingView = self->_restingView;
  }

  return restingView;
}

- (PHSOSAlertRestingView)alertRestingView
{
  alertRestingView = self->_alertRestingView;
  if (!alertRestingView)
  {
    uint64_t v4 = objc_alloc_init(PHSOSAlertRestingView);
    id v5 = self->_alertRestingView;
    self->_alertRestingView = v4;

    [(PHSOSAlertRestingView *)self->_alertRestingView setTranslatesAutoresizingMaskIntoConstraints:0];
    alertRestingView = self->_alertRestingView;
  }

  return alertRestingView;
}

- (PHCountdownView)countdownView
{
  countdownView = self->_countdownView;
  if (!countdownView)
  {
    uint64_t v4 = objc_alloc_init(PHCountdownView);
    id v5 = self->_countdownView;
    self->_countdownView = v4;

    [(PHCountdownView *)self->_countdownView setTranslatesAutoresizingMaskIntoConstraints:0];
    countdownView = self->_countdownView;
  }

  return countdownView;
}

- (PHSlidingView)slidingView
{
  slidingView = self->_slidingView;
  if (!slidingView)
  {
    uint64_t v4 = objc_alloc_init(PHSlidingView);
    id v5 = self->_slidingView;
    self->_slidingView = v4;

    [(PHSlidingView *)self->_slidingView setDelegate:self];
    [(PHSlidingView *)self->_slidingView setTranslatesAutoresizingMaskIntoConstraints:0];
    slidingView = self->_slidingView;
  }

  return slidingView;
}

- (UILabel)infoLabel
{
  infoLabel = self->_infoLabel;
  if (!infoLabel)
  {
    uint64_t v4 = (UILabel *)objc_alloc_init((Class)UILabel);
    id v5 = self->_infoLabel;
    self->_infoLabel = v4;

    [(UILabel *)self->_infoLabel setNumberOfLines:0];
    [(UILabel *)self->_infoLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)self->_infoLabel setTextAlignment:1];
    int v6 = +[UIFont boldSystemFontOfSize:34.0];
    [(UILabel *)self->_infoLabel setFont:v6];

    int v7 = +[UIColor whiteColor];
    [(UILabel *)self->_infoLabel setTextColor:v7];

    [(UILabel *)self->_infoLabel setNumberOfLines:0];
    infoLabel = self->_infoLabel;
  }

  return infoLabel;
}

- (HKHealthStore)healthStore
{
  healthStore = self->_healthStore;
  if (!healthStore)
  {
    uint64_t v4 = (HKHealthStore *)objc_alloc_init((Class)CUTWeakLinkClass());
    id v5 = self->_healthStore;
    self->_healthStore = v4;

    healthStore = self->_healthStore;
  }

  return healthStore;
}

- (void)dialEmergencyCall
{
  id v3 = [(PHSOSViewController *)self sosHandles];
  id v4 = [v3 count];

  if ((unint64_t)v4 > 1)
  {
    if ((id)[(PHSOSViewController *)self sosTrigger] == (id)7
      && ![(PHSOSViewController *)self isUserResponsive])
    {
      uint64_t v9 = 0;
      unsigned int v10 = &v9;
      uint64_t v11 = 0x2020000000;
      uint64_t v12 = -1;
      id v5 = [(PHSOSViewController *)self sosHandles];
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_100063EFC;
      v8[3] = &unk_1002CEC60;
      v8[4] = &v9;
      [v5 enumerateObjectsUsingBlock:v8];

      uint64_t v6 = v10[3];
      if (v6 < 0)
      {
        int v7 = sub_1000D5130();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
          sub_1001EA55C();
        }

        uint64_t v6 = 0;
        v10[3] = 0;
      }
      [(PHSOSViewController *)self dialSOSNumberAtIndex:v6];
      _Block_object_dispose(&v9, 8);
    }
    else
    {
      [(PHSOSViewController *)self setSosMode:0];
    }
  }
  else
  {
    [(PHSOSViewController *)self dialSOSNumberAtIndex:0];
  }
}

- (void)dialSOSNumberAtIndex:(int64_t)a3
{
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PHSOSViewController *)self sosHandles];
    *(_DWORD *)buf = 134218242;
    int64_t v36 = a3;
    __int16 v37 = 2112;
    v38 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "index: %ld self.sosHandles: %@", buf, 0x16u);
  }
  int v7 = +[NSDate date];
  [(PHSOSViewController *)self setDateOfCall:v7];

  unsigned int v8 = +[TUCall shouldMakeFakeSOSCall];
  id v9 = objc_alloc((Class)TUDialRequest);
  unsigned int v10 = +[TUCallCenter sharedInstance];
  uint64_t v11 = [v10 providerManager];
  uint64_t v12 = v11;
  if (v8)
  {
    double v13 = [v11 telephonyProvider];
    id v14 = [v9 initWithProvider:v13];

    double v15 = +[TUHandle handleWithDestinationID:@"+14089619342"];
    [v14 setHandle:v15];
  }
  else
  {
    double v16 = [v11 emergencyProvider];
    id v14 = [v9 initWithProvider:v16];

    [v14 setDialType:1];
    [v14 setSOS:1];
  }
  int64_t v17 = [(PHSOSViewController *)self sosTrigger];
  uint64_t v18 = 3;
  uint64_t v19 = 3;
  switch(v17)
  {
    case 0:
    case 1:
    case 2:
      goto LABEL_19;
    case 3:
      goto LABEL_17;
    case 5:
      uint64_t v18 = 13;
      goto LABEL_18;
    case 7:
      unsigned int v20 = [(PHSOSViewController *)self isUserResponsive];
      if (v20) {
        uint64_t v18 = 12;
      }
      else {
        uint64_t v18 = 10;
      }
      if (v20) {
        uint64_t v19 = 3;
      }
      else {
        uint64_t v19 = 4;
      }
      goto LABEL_19;
    default:
      unint64_t v21 = sub_1000D5130();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        sub_1001EA590(self);
      }

LABEL_17:
      uint64_t v18 = 4;
LABEL_18:
      uint64_t v19 = 3;
LABEL_19:
      [v14 setOriginatingUIType:v18];
      unsigned int v22 = [(PHSOSViewController *)self launchedForAssertionReason];
      BOOL v23 = v22 == @"PHSOSCallAssertionReason";

      if (v23)
      {
        unsigned int v24 = +[SOSStatusReporter sharedInstance];
        [v24 updateSOSFlowState:v19];
      }
      if (([v14 isRTTAvailable] & 1) != 0
        || [v14 isTTYAvailable])
      {
        [v14 setTtyType:2];
      }
      double v25 = [(PHSOSViewController *)self sosHandles];
      if ((unint64_t)[v25 count] <= a3)
      {
      }
      else
      {
        unsigned __int8 v26 = +[TUCall shouldMakeFakeSOSCall];

        if ((v26 & 1) == 0)
        {
          double v27 = [(PHSOSViewController *)self sosHandles];
          v28 = [v27 objectAtIndexedSubscript:a3];
          unsigned int v29 = [v28 handle];
          [v14 setHandle:v29];

          if (([v14 isValid] & 1) == 0)
          {
            unsigned int v30 = sub_1000D5130();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              int64_t v36 = (int64_t)v14;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[WARN] Dial request %@ is invalid using the chosen handle. Falling back to using a default emergency number", buf, 0xCu);
            }

            [v14 setHandle:0];
          }
        }
      }
      double v31 = sub_1000D5130();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v36 = (int64_t)v14;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "SOSViewController is launching dial request for SOS call: %@", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      [(PHSOSViewController *)self setRequestedCallActive:1];
      [(PHSOSViewController *)self setCallDialStartTime:CFAbsoluteTimeGetCurrent()];
      uint64_t v32 = +[TUCallCenter sharedInstance];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_100064518;
      v33[3] = &unk_1002CEC88;
      objc_copyWeak(&v34, (id *)buf);
      [v32 launchAppForDialRequest:v14 completion:v33];

      objc_destroyWeak(&v34);
      objc_destroyWeak((id *)buf);

      return;
  }
}

- (void)notifyEmergencyContacts
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", (uint8_t *)buf, 2u);
  }

  if ((id)[(PHSOSViewController *)self sosTrigger] == (id)7)
  {
    if (+[SOSUtilities isKappaUnmasked]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  objc_initWeak(buf, self);
  id v5 = +[SOSManager sharedInstance];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_1000646F8;
  v6[3] = &unk_1002CECB0;
  objc_copyWeak(&v7, buf);
  [v5 startSendingLocationUpdateForReason:v4 withCompletion:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

- (void)willStartSendingLocationUpdate
{
  id v2 = +[SOSManager sharedInstance];
  [v2 willStartSendingLocationUpdate];
}

- (void)showSOSNumbersList
{
  id v3 = [(PHSOSViewController *)self cancelButton];
  [v3 setHidden:0];

  uint64_t v4 = [(PHSOSViewController *)self sosNumbersViewController];
  id v5 = [v4 view];
  [(PHSOSViewController *)self transitionToView:v5 animated:0];

  [(PHSOSViewController *)self setUpSOSNumbersListViewConstraints];
  uint64_t v6 = [(PHSOSViewController *)self cancelButton];
  id v7 = +[NSBundle mainBundle];
  unsigned int v8 = [v7 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"InCallService"];
  [v6 setTitle:v8 forState:0];

  [(PHSOSViewController *)self willStartSendingLocationUpdate];
}

- (void)showCheckInView
{
  id v3 = [(PHSOSViewController *)self cancelButton];
  [v3 setHidden:0];

  uint64_t v4 = [(PHSOSViewController *)self checkInView];
  [(PHSOSViewController *)self transitionToView:v4 animated:0];

  [(PHSOSViewController *)self setUpCheckInViewConstraints];
  id v5 = [(PHSOSViewController *)self cancelButton];
  uint64_t v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"InCallService"];
  [v5 setTitle:v7 forState:0];

  [(PHSOSViewController *)self willStartSendingLocationUpdate];
  unsigned int v8 = [(PHSOSViewController *)self getCheckInViewModel];
  if ([v8 sosVoiceMessageType])
  {
    [(PHSOSViewController *)self setVolumeMaxedPending:1];
    id v9 = +[UIApplication sharedApplication];
    unsigned int v10 = [v9 delegate];
    uint64_t v11 = [v10 sceneManager];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100064B4C;
    v17[3] = &unk_1002CE6E8;
    v17[4] = self;
    [v11 waitForRegistrationOfSceneWithType:0 completion:v17];
  }
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  objc_initWeak(&location, self);
  double v13 = [(PHSOSViewController *)self checkInView];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100064B88;
  v14[3] = &unk_1002CECD8;
  objc_copyWeak(v15, &location);
  v15[1] = *(id *)&Current;
  v14[4] = self;
  [v13 start:v8 completion:v14];

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (id)getCheckInViewModel
{
  unsigned int v2 = +[SOSUtilities isKappaUnmasked];
  id v3 = off_1002CB928;
  if (!v2) {
    id v3 = off_1002CB930;
  }
  id v4 = objc_alloc_init(*v3);

  return v4;
}

- (void)handleVolumeChanges
{
  unsigned int v3 = [(PHSOSViewController *)self volumeMaxedPending];
  if (v3 == [(PHSOSViewController *)self volumeMaxedCurrently])
  {
    id v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = [(PHSOSViewController *)self volumeMaxedCurrently];
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,handleVolumeChanges,volume level already set,maxed:%d", (uint8_t *)v5, 8u);
    }
  }
  else if ([(PHSOSViewController *)self volumeMaxedPending])
  {
    [(PHSOSViewController *)self setVolumeMaxedCurrently:1];
    [(PHSOSViewController *)self setSystemVolumeToMax];
  }
  else
  {
    [(PHSOSViewController *)self setVolumeMaxedCurrently:0];
    [(PHSOSViewController *)self restoreSystemVolumeLevel];
  }
}

- (void)setSystemVolumeToMax
{
  if (+[SOSUtilities BOOLOverrideForDefaultsKey:@"debug.countdown.subtle" defaultValue:0])float v3 = 0.4; {
  else
  }
    float v3 = 1.0;
  id v4 = +[PHAudioDeviceController sharedSystemController];
  float v11 = 0.0;
  if (([v4 getVolume:&v11 forCategory:@"Audio/Video"] & 1) == 0)
  {
    uint64_t v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001EA640();
    }

    float v11 = -1.0;
  }
  *(float *)&double v5 = v3;
  unsigned int v7 = [v4 setVolumeTo:@"Audio/Video" forCategory:v5];
  unsigned int v8 = sub_1000D5130();
  id v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v13 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,changed volume from %f to max", buf, 0xCu);
    }

    *(float *)&double v10 = v11;
    [(PHSOSViewController *)self setPriorSystemVolume:v10];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1001EA60C();
    }
  }
}

- (void)restoreSystemVolumeLevel
{
  [(PHSOSViewController *)self priorSystemVolume];
  if (v3 >= 0.0)
  {
    id v4 = +[PHAudioDeviceController sharedSystemController];
    [(PHSOSViewController *)self priorSystemVolume];
    [v4 setVolumeTo:@"Audio/Video" forCategory:];
    uint64_t v6 = sub_1000D5130();
    unsigned int v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        [(PHSOSViewController *)self priorSystemVolume];
        int v10 = 134217984;
        double v11 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,set volume back to %f", (uint8_t *)&v10, 0xCu);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      sub_1001EA674(self, v7);
    }

    LODWORD(v9) = -1.0;
    [(PHSOSViewController *)self setPriorSystemVolume:v9];
  }
}

- (id)getSOSDialCountdownViewModel
{
  unint64_t v3 = [(PHSOSViewController *)self sosTrigger];
  if (v3 >= 3)
  {
    if (v3 == 7)
    {
      unsigned int v5 = PHSOSKappaDialCountdownViewModel;
      goto LABEL_12;
    }
    if (v3 == 3)
    {
      id v4 = sub_1000D5130();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_1001EA77C();
      }
    }
    else
    {
      uint64_t v6 = sub_1000D5130();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1001EA704(self);
      }
    }
  }
  unsigned int v5 = PHSOSDialCountdownViewModel;
LABEL_12:
  id v7 = objc_alloc_init(v5);

  return v7;
}

- (void)showSOSDialCountdown
{
  unint64_t v3 = [(PHSOSViewController *)self cancelButton];
  [v3 setHidden:0];

  id v4 = [(PHSOSViewController *)self countdownView];
  [(PHSOSViewController *)self transitionToView:v4 animated:0];

  [(PHSOSViewController *)self setUpCountdownViewConstraints];
  unsigned int v5 = [(PHSOSViewController *)self cancelButton];
  uint64_t v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"STOP" value:&stru_1002D6110 table:@"InCallService"];
  [v5 setTitle:v7 forState:0];

  [(PHSOSViewController *)self willStartSendingLocationUpdate];
  float v8 = [(PHSOSViewController *)self getSOSDialCountdownViewModel];
  objc_initWeak(&location, self);
  double v9 = [(PHSOSViewController *)self countdownView];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10006539C;
  v10[3] = &unk_1002CED00;
  objc_copyWeak(&v11, &location);
  [v9 start:v8 showSlider:1 completion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)showSOSDialSliding
{
  unint64_t v3 = [(PHSOSViewController *)self cancelButton];
  [v3 setHidden:0];

  id v4 = [(PHSOSViewController *)self slidingView];
  [(PHSOSViewController *)self transitionToView:v4 animated:0];

  [(PHSOSViewController *)self setUpSlidingViewConstraints];
  unsigned int v5 = [(PHSOSViewController *)self cancelButton];
  uint64_t v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"InCallService"];
  [v5 setTitle:v7 forState:0];

  [(PHSOSViewController *)self setCallDialStartTime:-1.0];
  [(PHSOSViewController *)self setTimeTillActive:-1.0];
  [(PHSOSViewController *)self setCallAutoDialled:0];
  [(PHSOSViewController *)self setClawSwipeAfterRTCTimeout:0];
  [(PHSOSViewController *)self setWasCallCancelled:1];
  float v8 = +[SOSManager sharedInstance];
  double v9 = [v8 currentSOSButtonPressState];
  [(PHSOSViewController *)self setCurrentButtonPressState:v9];

  objc_initWeak(location, self);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100065900;
  v30[3] = &unk_1002CED00;
  objc_copyWeak(&v31, location);
  int v10 = objc_retainBlock(v30);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100065AAC;
  v28[3] = &unk_1002CED28;
  objc_copyWeak(&v29, location);
  id v11 = objc_retainBlock(v28);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100065B0C;
  v26[3] = &unk_1002CDBE0;
  objc_copyWeak(&v27, location);
  uint64_t v12 = objc_retainBlock(v26);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100065B64;
  v24[3] = &unk_1002CED28;
  objc_copyWeak(&v25, location);
  double v13 = objc_retainBlock(v24);
  id v14 = [(PHSOSViewController *)self slidingView];
  [v14 setAnimatedSlidingButtonCompletionBlock:v10];

  double v15 = [(PHSOSViewController *)self slidingView];
  [v15 setShouldMaxVolumeCompletionBlock:v12];

  double v16 = [(PHSOSViewController *)self slidingView];
  [v16 setPowerDownCompletionBlock:v13];

  uint64_t v18 = _NSConcreteStackBlock;
  uint64_t v19 = 3221225472;
  unsigned int v20 = sub_100065BB0;
  unint64_t v21 = &unk_1002CED70;
  objc_copyWeak(&v23, location);
  int64_t v17 = v11;
  id v22 = v17;
  [(PHSOSViewController *)self fetchMedicalIDWithCompletion:&v18];
  [(PHSOSViewController *)self startStatusHeartbeatTimer];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&v25);

  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v31);
  objc_destroyWeak(location);
}

- (void)showSOSDialCanceled
{
  unint64_t v3 = [(PHSOSViewController *)self cancelButton];
  [v3 setHidden:1];

  id v4 = [(PHSOSViewController *)self infoLabel];
  unsigned int v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"EMERGENCY_CALL_CANCELED" value:&stru_1002D6110 table:@"InCallService"];
  [v4 setText:v6];

  id v7 = [(PHSOSViewController *)self infoLabel];
  [(PHSOSViewController *)self transitionToView:v7 animated:1];

  [(PHSOSViewController *)self setUpInfoLabelConstraints];
  objc_initWeak(&location, self);
  dispatch_time_t v8 = dispatch_time(0, 2500000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100065E28;
  v9[3] = &unk_1002CED28;
  objc_copyWeak(&v10, &location);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)showSOSNotified
{
  unint64_t v3 = [(PHSOSViewController *)self cancelButton];
  [v3 setHidden:1];

  id v4 = [(PHSOSViewController *)self cancelButton];
  unsigned int v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"CLOSE" value:&stru_1002D6110 table:@"InCallService"];
  [v4 setTitle:v6 forState:0];

  id v7 = [(PHSOSViewController *)self infoLabel];
  dispatch_time_t v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"SOS_NOTIFIED" value:&stru_1002D6110 table:@"InCallService"];
  [v7 setText:v9];

  id v10 = [(PHSOSViewController *)self infoLabel];
  [(PHSOSViewController *)self transitionToView:v10 animated:1];

  [(PHSOSViewController *)self setUpInfoLabelConstraints];
  objc_initWeak(&location, self);
  dispatch_time_t v11 = dispatch_time(0, 2000000000);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100066044;
  v12[3] = &unk_1002CED28;
  objc_copyWeak(&v13, &location);
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, v12);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)showSOSNotificationCanceled
{
  unint64_t v3 = [(PHSOSViewController *)self cancelButton];
  [v3 setHidden:1];

  id v4 = [(PHSOSViewController *)self infoLabel];
  unsigned int v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"SOS_NOTIFICATION_CANCELED" value:&stru_1002D6110 table:@"InCallService"];
  [v4 setText:v6];

  id v7 = [(PHSOSViewController *)self infoLabel];
  [(PHSOSViewController *)self transitionToView:v7 animated:1];

  [(PHSOSViewController *)self setUpInfoLabelConstraints];
  objc_initWeak(&location, self);
  dispatch_time_t v8 = dispatch_time(0, 2000000000);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000661F0;
  v9[3] = &unk_1002CED28;
  objc_copyWeak(&v10, &location);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)showSOSNotificationCountdown
{
  unint64_t v3 = [(PHSOSViewController *)self cancelButton];
  [v3 setHidden:0];

  id v4 = [(PHSOSViewController *)self cancelButton];
  unsigned int v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"STOP" value:&stru_1002D6110 table:@"InCallService"];
  [v4 setTitle:v6 forState:0];

  id v7 = [(PHSOSViewController *)self countdownView];
  [(PHSOSViewController *)self transitionToView:v7 animated:0];

  [(PHSOSViewController *)self setUpCountdownViewConstraints];
  if (+[TUCallCapabilities isEmergencyCallbackModeEnabled])
  {
    dispatch_time_t v8 = sub_1000D5130();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not starting notification countdown due to ECBM mode being shown.", v9, 2u);
    }
  }
  else
  {
    [(PHSOSViewController *)self startSOSNotificationCountdown];
  }
}

- (void)startSOSNotificationCountdown
{
  if ((id)[(PHSOSViewController *)self sosTrigger] == (id)7)
  {
    unsigned int v3 = +[SOSUtilities isKappaUnmasked];
    id v4 = off_1002CB938;
    if (v3) {
      id v4 = off_1002CB940;
    }
  }
  else
  {
    id v4 = &off_1002CB948;
  }
  id v5 = objc_alloc_init(*v4);
  objc_initWeak(&location, self);
  uint64_t v6 = [(PHSOSViewController *)self countdownView];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000664BC;
  v7[3] = &unk_1002CED00;
  objc_copyWeak(&v8, &location);
  [v6 start:v5 showSlider:0 completion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)showRestingView
{
  [(PHSOSViewController *)self setAlreadyVisitedRestingScreen:1];
  unsigned int v3 = [(PHSOSViewController *)self cancelButton];
  [v3 setHidden:0];

  id v4 = [(PHSOSViewController *)self cancelButton];
  id v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"CLOSE" value:&stru_1002D6110 table:@"InCallService"];
  [v4 setTitle:v6 forState:0];

  id v7 = [(PHSOSViewController *)self restingView];
  [(PHSOSViewController *)self transitionToView:v7 animated:0];

  [(PHSOSViewController *)self setUpRestingViewConstraints];
  id v8 = +[SOSUtilities mostRecentSOSStatus];
  double v9 = v8;
  if (v8
    && ([v8 timeOfDetection], id v10 = objc_claimAutoreleasedReturnValue(), v10, v10))
  {
    uint64_t v11 = [v9 timeOfDetection];
  }
  else
  {
    uint64_t v12 = [(PHSOSViewController *)self dateOfCall];

    if (!v12) {
      goto LABEL_7;
    }
    uint64_t v11 = [(PHSOSViewController *)self dateOfCall];
  }
  id v13 = (void *)v11;
  id v14 = [(PHSOSViewController *)self restingView];
  [v14 setDateOfSOSEvent:v13];

LABEL_7:
  if ((id)[(PHSOSViewController *)self sosTrigger] == (id)7)
  {
    if (+[SOSUtilities isKappaUnmasked]) {
      double v15 = PHSOSKappaRestingViewModel;
    }
    else {
      double v15 = PHSOSKappaMaskedRestingViewModel;
    }
  }
  else
  {
    double v15 = PHSOSNewtonRestingViewModel;
  }
  id v16 = objc_alloc_init(v15);
  int64_t v17 = [(PHSOSViewController *)self restingView];
  [v17 setViewModel:v16];

  objc_initWeak(&location, self);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100066838;
  v22[3] = &unk_1002CED00;
  objc_copyWeak(&v23, &location);
  uint64_t v18 = [(PHSOSViewController *)self restingView];
  [v18 setCompletionHandler:v22];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100066948;
  v20[3] = &unk_1002CED98;
  objc_copyWeak(&v21, &location);
  [(PHSOSViewController *)self fetchMedicalIDWithCompletion:v20];
  uint64_t v19 = [(PHSOSViewController *)self launchedForAssertionReason];

  if (v19 == @"PHSOSCallAssertionReason") {
    [(PHSOSViewController *)self startStatusHeartbeatTimer];
  }
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

- (void)startStatusHeartbeatTimer
{
  [(PHSOSViewController *)self clearStatusHeartbeatTimer];
  if (((id)[(PHSOSViewController *)self sosMode] == (id)2
     || (id)[(PHSOSViewController *)self sosMode] == (id)9)
    && ([(PHSOSViewController *)self launchedForAssertionReason],
        unsigned int v3 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3 == @"PHSOSCallAssertionReason"))
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,starting status heartbeat timer", (uint8_t *)buf, 2u);
    }

    objc_initWeak(buf, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100066B94;
    v7[3] = &unk_1002CDA48;
    objc_copyWeak(&v8, buf);
    uint64_t v6 = +[NSTimer scheduledTimerWithTimeInterval:1 repeats:v7 block:30.0];
    [(PHSOSViewController *)self setStatusHeartbeatTimer:v6];

    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
  else
  {
    id v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,not starting status heartbeat timer", (uint8_t *)buf, 2u);
    }
  }
}

- (void)clearStatusHeartbeatTimer
{
  unsigned int v3 = [(PHSOSViewController *)self statusHeartbeatTimer];

  if (v3)
  {
    id v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,clearing status heartbeat timer", v6, 2u);
    }

    id v5 = [(PHSOSViewController *)self statusHeartbeatTimer];
    [v5 invalidate];

    [(PHSOSViewController *)self setStatusHeartbeatTimer:0];
  }
}

- (void)showAlertRestingView
{
  unsigned int v3 = [(PHSOSViewController *)self cancelButton];
  [v3 setHidden:0];

  id v4 = [(PHSOSViewController *)self cancelButton];
  id v5 = +[NSBundle mainBundle];
  uint64_t v6 = [v5 localizedStringForKey:@"CLOSE" value:&stru_1002D6110 table:@"InCallService"];
  [v4 setTitle:v6 forState:0];

  id v7 = [(PHSOSViewController *)self alertRestingView];
  [(PHSOSViewController *)self transitionToView:v7 animated:0];

  [(PHSOSViewController *)self setUpAlertRestingViewConstraints];
  if ((id)[(PHSOSViewController *)self sosTrigger] == (id)7)
  {
    if (+[SOSUtilities isKappaUnmasked]) {
      id v8 = PHSOSKappaAlertRestingViewModel;
    }
    else {
      id v8 = PHSOSKappaMaskedAlertRestingViewModel;
    }
  }
  else
  {
    id v8 = PHSOSNewtonAlertRestingViewModel;
  }
  id v9 = objc_alloc_init(v8);
  id v10 = [(PHSOSViewController *)self alertRestingView];
  [v10 setViewModel:v9];

  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100066FA0;
  v14[3] = &unk_1002CED00;
  objc_copyWeak(&v15, &location);
  uint64_t v11 = [(PHSOSViewController *)self alertRestingView];
  [v11 setCompletionHandler:v14];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000670E0;
  v12[3] = &unk_1002CED98;
  objc_copyWeak(&v13, &location);
  [(PHSOSViewController *)self fetchMedicalIDWithCompletion:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

+ (BOOL)shouldShowMedicalID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)CUTWeakLinkClass();
  unsigned int v5 = [v3 hasAnyData];

  if (v5)
  {
    uint64_t v6 = [v4 sharedInstance];
    unsigned int v7 = [v6 lostModeIsActive] ^ 1;
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (void)fetchMedicalIDWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PHSOSViewController *)self healthStore];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100067290;
  v7[3] = &unk_1002CEDE8;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchMedicalIDDataWithCompletion:v7];
}

- (void)loadMedicalIDWithCompletion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempting to load medical ID data...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10006748C;
  v7[3] = &unk_1002CEE10;
  objc_copyWeak(&v9, buf);
  void v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(PHSOSViewController *)self fetchMedicalIDWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(buf);
}

- (void)hideMedicalIDWithCompletion:(id)a3
{
  id v5 = a3;
  id v4 = [(UINavigationController *)self->_medicalIDNavigationController presentingViewController];

  if (v4) {
    [(UINavigationController *)self->_medicalIDNavigationController dismissViewControllerAnimated:1 completion:v5];
  }
}

- (void)presentMedicalID
{
  if (+[TUCallCapabilities isEmergencyCallbackModeEnabled])
  {
    id v3 = sub_1000D5130();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Not presenting medical ID because going to present ECBM dialer", (uint8_t *)buf, 2u);
    }
  }
  else
  {
    objc_initWeak(buf, self);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_10006790C;
    v6[3] = &unk_1002CED28;
    objc_copyWeak(&v7, buf);
    id v4 = objc_retainBlock(v6);
    id v5 = [(PHSOSViewController *)self medicalIDNavigationController];

    if (v5) {
      ((void (*)(void *))v4[2])(v4);
    }
    else {
      [(PHSOSViewController *)self loadMedicalIDWithCompletion:v4];
    }

    objc_destroyWeak(&v7);
    objc_destroyWeak(buf);
  }
}

- (void)transitionToView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = v6;
  if (v4)
  {
    [v6 setAlpha:0.0];
    id v8 = [(PHSOSViewController *)self view];
    [v8 addSubview:v7];

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100067C34;
    v13[3] = &unk_1002CDDE0;
    v13[4] = self;
    id v14 = v7;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100067D84;
    v11[3] = &unk_1002CDA70;
    v11[4] = self;
    id v12 = v14;
    +[UIView animateKeyframesWithDuration:4 delay:v13 options:v11 animations:0.600000024 completion:0.0];
  }
  else
  {
    id v9 = [(PHSOSViewController *)self currentView];
    [v9 removeFromSuperview];

    id v10 = [(PHSOSViewController *)self view];
    [v10 addSubview:v7];

    [(PHSOSViewController *)self setCurrentView:v7];
  }
}

- (void)buttonPressed:(id)a3
{
  switch([(PHSOSViewController *)self sosMode])
  {
    case 0:
    case 3:
    case 6:
    case 7:
    case 0xALL:
      goto LABEL_2;
    case 1:
    case 8:
      [(PHSOSViewController *)self setIsUserResponsive:1];
      goto LABEL_6;
    case 2:
      [(PHSOSViewController *)self setWasCallCancelled:1];
      [(PHSOSViewController *)self interactiveStartTime];
      double v6 = v5;
      double v7 = -1.0;
      if (v6 > 0.0)
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v9 = v8;
        [(PHSOSViewController *)self interactiveStartTime];
        double v7 = v9 - v10;
      }
      [(PHSOSViewController *)self setTimeTillCancelCall:v7];
      uint64_t v11 = [(PHSOSViewController *)self slidingView];
      id v12 = [v11 slidingViewState];

      switch((unint64_t)v12)
      {
        case 0uLL:
          [(PHSOSViewController *)self setSlidingViewExitReason:6];
          [(PHSOSViewController *)self submitSOSUserActivityMetric];
          goto LABEL_21;
        case 1uLL:
LABEL_21:
          id v16 = [(PHSOSViewController *)self slidingView];
          id v17 = [v16 slidingViewState];

          if (v17 == (id)1) {
            [(PHSOSViewController *)self setSlidingViewExitReason:7];
          }
          goto LABEL_23;
        case 2uLL:
          [(PHSOSViewController *)self setSlidingViewExitReason:8];
          [(PHSOSViewController *)self submitSOSUserActivityMetric];
          [(PHSOSViewController *)self setVolumeMaxedPending:0];
          [(PHSOSViewController *)self handleVolumeChanges];
          [(PHSOSViewController *)self setClawResolution:1];
          [(PHSOSViewController *)self raiseAccidentalSOSNotification];
          unsigned int v20 = [(PHSOSViewController *)self slidingView];
          [v20 clearReleaseToCallState];

          [(PHSOSViewController *)self setSosMode:3];
          return;
        case 3uLL:
LABEL_23:
          uint64_t v18 = [(PHSOSViewController *)self slidingView];
          id v19 = [v18 slidingViewState];

          if (v19 == (id)3)
          {
            [(PHSOSViewController *)self setSlidingViewExitReason:6];
            [(PHSOSViewController *)self submitSOSUserActivityMetric];
          }
          [(PHSOSViewController *)self setClawResolution:2];
          [(PHSOSViewController *)self interactiveStop:0];
          goto LABEL_2;
        case 4uLL:
        case 5uLL:
          [(PHSOSViewController *)self setClawResolution:2];
          goto LABEL_2;
        default:
          return;
      }
    case 4:
LABEL_6:
      +[NSDate timeIntervalSinceReferenceDate];
      -[PHSOSViewController setCountdownPausedTime:](self, "setCountdownPausedTime:");
      if ((id)[(PHSOSViewController *)self sosMode] == (id)8) {
        [(PHSOSViewController *)self checkInView];
      }
      else {
      BOOL v4 = [(PHSOSViewController *)self countdownView];
      }
      [v4 pause];

      [(PHSOSViewController *)self showConfirmationAlert];
      break;
    case 5:
      [(PHSOSViewController *)self setPostContactNotificationMode];
      break;
    case 9:
      id v13 = [(PHSOSViewController *)self coreAnalyticsReporter];
      int64_t v14 = [(PHSOSViewController *)self sosTrigger];
      id v15 = [(PHSOSViewController *)self restingView];
      [v13 reportSOSRestingResponse:v14 restingResponse:2 hasMedicalID:[v15 hasMedicalIDSlider]];

LABEL_2:
      [(PHSOSViewController *)self deactivateSOS];
      break;
    default:
      return;
  }
}

- (void)showConfirmationAlert
{
  if ((id)[(PHSOSViewController *)self sosMode] == (id)1
    || (id)[(PHSOSViewController *)self sosMode] == (id)8
    || (id)[(PHSOSViewController *)self sosMode] == (id)2)
  {
    id v3 = +[NSBundle mainBundle];
    BOOL v4 = v3;
    CFStringRef v5 = @"STOP_CALLING";
  }
  else
  {
    id v3 = +[NSBundle mainBundle];
    BOOL v4 = v3;
    CFStringRef v5 = @"STOP_NOTIFYING_EMERGENCY_CONTACTS";
  }
  double v6 = [v3 localizedStringForKey:v5 value:&stru_1002D6110 table:@"InCallService"];

  double v7 = +[UIAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  double v8 = +[NSBundle mainBundle];
  double v9 = [v8 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"InCallService"];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10006843C;
  v19[3] = &unk_1002CEE38;
  v19[4] = self;
  double v10 = +[UIAlertAction actionWithTitle:v9 style:1 handler:v19];
  [v7 addAction:v10];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000684F4;
  v18[3] = &unk_1002CEE38;
  v18[4] = self;
  uint64_t v11 = +[UIAlertAction actionWithTitle:v6 style:2 handler:v18];
  [v7 addAction:v11];

  [(PHSOSViewController *)self presentViewController:v7 animated:1 completion:0];
  objc_initWeak(&location, self);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000687AC;
  v14[3] = &unk_1002CEE60;
  id v12 = v7;
  id v15 = v12;
  objc_copyWeak(&v16, &location);
  id v13 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v14 block:5.0];
  [(PHSOSViewController *)self setConfirmationTimeoutTimer:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)deactivateSOS
{
}

- (void)deactivateSOSWithSOSDismissalType:(int64_t)a3
{
  CFStringRef v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,Releasing SOS Dismissal Assertion", buf, 2u);
  }

  [(PHSOSViewController *)self clearStatusHeartbeatTimer];
  [(PHSOSViewController *)self setVolumeMaxedPending:0];
  [(PHSOSViewController *)self handleVolumeChanges];
  +[PHSOSViewController releaseAllCallBufferDismissalAssertions];
  if ([(PHSOSViewController *)self shouldDropBioAuthTokenOnDismiss])
  {
    double v6 = +[SOSManager sharedInstance];
    [v6 didDismissSOSBeforeSOSCall:a3];

    uint64_t v7 = 6;
  }
  else
  {
    uint64_t v7 = 10;
  }
  double v8 = [(PHSOSViewController *)self launchedForAssertionReason];

  if (v8 == @"PHSOSCallAssertionReason")
  {
    double v9 = +[SOSStatusReporter sharedInstance];
    [v9 updateSOSFlowState:v7];
  }
  double v10 = [(PHSOSViewController *)self launchedForAssertionReason];
  +[PHInCallRootViewController releaseDismissalAssertionForReason:v10];

  if (!+[PHSOSViewController isSOSDismissalAssertionActive])
  {
    uint64_t v11 = sub_1000D5130();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,setting SOSInitiationState to Idle", v19, 2u);
    }

    id v12 = +[SOSManager sharedInstance];
    [v12 setCurrentSOSInitiationState:0];

    id v13 = +[UIApplication sharedApplication];
    int64_t v14 = [v13 delegate];
    [v14 setActivationContext:0];
  }
  if (!+[PHSOSViewController isSOSDismissalAssertionActive]&& self->_priorSystemAudioRoute)
  {
    id v15 = sub_1000D5130();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,restoring audio route", v18, 2u);
    }

    audioDeviceController = self->_audioDeviceController;
    id v17 = [(TUAudioRoute *)self->_priorSystemAudioRoute uniqueIdentifier];
    [(PHAudioDeviceController *)audioDeviceController pickRouteWithUID:v17];
  }
}

- (void)emergencyCallbackModeChangedNotification:(id)a3
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100068C3C;
  v3[3] = &unk_1002CED28;
  objc_copyWeak(&v4, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)raiseAccidentalSOSNotification
{
  id v3 = [(PHSOSViewController *)self launchedForAssertionReason];

  if (v3 == @"PHSOSCallAssertionReason"
    && ((id)[(PHSOSViewController *)self sosTrigger] == (id)1
     || (id)[(PHSOSViewController *)self sosTrigger] == (id)2
     || (id)[(PHSOSViewController *)self sosTrigger] == (id)3))
  {
    id v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Raising possible accidental SOS notification", buf, 2u);
    }

    id v5 = objc_alloc_init((Class)UNMutableNotificationContent);
    double v6 = +[SOSUtilities accidentalCallNotificationTitle];
    [v5 setTitle:v6];

    uint64_t v7 = +[SOSUtilities accidentalCallNotificationBody];
    [v5 setBody:v7];

    double v8 = (void *)SOSSettingsURLBaseString;
    id v9 = [SOSSettingsURLSourceKey UTF8String];
    double v10 = [v8 stringByAppendingFormat:@"&%s=%s", v9, [SOSSettingsURLSourceAccCallNotification UTF8String]];
    uint64_t v11 = +[NSURL URLWithString:v10];
    [v5 setDefaultActionURL:v11];

    [v5 setCategoryIdentifier:@"com.apple.SOSNotification"];
    id v12 = +[UNNotificationRequest requestWithIdentifier:@"com.apple.SOSNotificationId" content:v5 trigger:0 destinations:6];
    id v13 = sub_1000D5130();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Created SOS notification request:%@", buf, 0xCu);
    }

    id v14 = [objc_alloc((Class)UNUserNotificationCenter) initWithBundleIdentifier:@"com.apple.Preferences"];
    id v15 = +[NSArray array];
    id v16 = +[NSArray array];
    id v17 = +[UNNotificationCategory categoryWithIdentifier:@"com.apple.SOSNotification" actions:v15 intentIdentifiers:v16 options:0x20000];

    uint64_t v18 = +[NSSet setWithObject:v17];
    [v14 setNotificationCategories:v18];

    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100069060;
    v19[3] = &unk_1002CEE88;
    v19[4] = self;
    [v14 addNotificationRequest:v12 withCompletionHandler:v19];
  }
}

- (void)handleCallBufferCompletionNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,handleCallBufferCompletionNotification,entered", buf, 2u);
  }

  [(PHSOSViewController *)self setVolumeMaxedPending:0];
  [(PHSOSViewController *)self handleVolumeChanges];
  double v6 = [v4 userInfo];

  if (v6)
  {
    [(PHSOSViewController *)self setSlidingViewEntryReason:5];
    uint64_t v7 = [v6 objectForKeyedSubscript:@"PHCallBufferCompletionReasonKey"];
    id v8 = [v7 integerValue];

    if (v8 == (id)1)
    {
      uint64_t v11 = sub_1000D5130();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v18 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,handleInCallCallBufferNotification,PHCallBufferCompletionReasonCancelled", v18, 2u);
      }

      [(PHSOSViewController *)self interactiveStartTime];
      double v13 = v12;
      double v14 = -1.0;
      if (v13 > 0.0)
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v16 = v15;
        [(PHSOSViewController *)self interactiveStartTime];
        double v14 = v16 - v17;
      }
      [(PHSOSViewController *)self setTimeTillCancelCall:v14];
      [(PHSOSViewController *)self setWasCallCancelled:1];
      [(PHSOSViewController *)self setClawResolution:6];
      [(PHSOSViewController *)self setSosMode:3];
      [(PHSOSViewController *)self raiseAccidentalSOSNotification];
      [(PHSOSViewController *)self setSlidingViewExitReason:9];
      [(PHSOSViewController *)self submitSOSUserActivityMetric];
    }
    else if (!v8)
    {
      id v9 = sub_1000D5130();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,handleInCallCallBufferNotification,PHCallBufferCompletionReasonTimeout", v19, 2u);
      }

      [(PHSOSViewController *)self clearStatusHeartbeatTimer];
      [(PHSOSViewController *)self willStartSendingLocationUpdate];
      [(PHSOSViewController *)self dialEmergencyCall];
    }
  }
  else
  {
    double v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v20 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,handleInCallCallBufferNotification,nil userInfo,Early return", v20, 2u);
    }
  }
}

- (void)handleAnimationSlidingCompletionResponse
{
  +[SOSUtilities clawReleaseToCallSupport];
  if (v3 == 0.0)
  {
LABEL_2:
    [(PHSOSViewController *)self clearStatusHeartbeatTimer];
    [(PHSOSViewController *)self willStartSendingLocationUpdate];
    [(PHSOSViewController *)self dialEmergencyCall];
    return;
  }
  id v4 = [(PHSOSViewController *)self sosHandles];

  if (v4)
  {
    id v5 = [(PHSOSViewController *)self sosHandles];
    id v6 = [v5 count];

    if ((unint64_t)v6 > 1)
    {
      [(PHSOSViewController *)self setVolumeMaxedPending:0];
      [(PHSOSViewController *)self handleVolumeChanges];
      goto LABEL_2;
    }
    [(PHSOSViewController *)self setVolumeMaxedPending:1];
    [(PHSOSViewController *)self handleVolumeChanges];
    unsigned int v7 = [(PHSOSViewController *)self callAutoDialled];
    id v8 = off_1002CFE40;
    if (!v7) {
      id v8 = off_1002CFE48;
    }
    +[PHInCallRootViewController obtainDismissalAssertionForReason:*v8];
    id v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"PHCallBufferNotification" object:0 userInfo:0];
  }
  else
  {
    id v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[WARN] PHSOSViewController,animatedSliderCompletion,no SOS handles.Unexpected.return", buf, 2u);
    }

    [(PHSOSViewController *)self setVolumeMaxedPending:0];
    [(PHSOSViewController *)self handleVolumeChanges];
  }
}

- (void)sosNumbersViewController:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = [a4 row:a3];

  [(PHSOSViewController *)self dialSOSNumberAtIndex:v5];
}

- (void)dismissMedicalIDViewController
{
  double v3 = [(PHSOSViewController *)self medicalIDNavigationController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100069648;
  v4[3] = &unk_1002CD518;
  v4[4] = self;
  [v3 dismissViewControllerAnimated:1 completion:v4];
}

- (void)medicalIDViewControllerDidFinish:(id)a3
{
}

- (void)showPowerDownFindMyInfoAlertWithProceed:(id)a3 cancelCompletion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"POWER_DOWN_FIND_MY_TITLE" value:&stru_1002D6110 table:@"InCallService"];

  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"POWER_DOWN_FIND_MY" value:&stru_1002D6110 table:@"InCallService"];

  uint64_t v11 = +[NSBundle mainBundle];
  double v12 = [v11 localizedStringForKey:@"OK" value:&stru_1002D6110 table:@"InCallService"];

  double v13 = +[NSBundle mainBundle];
  double v14 = [v13 localizedStringForKey:@"CANCEL" value:&stru_1002D6110 table:@"InCallService"];

  double v15 = +[UIAlertController alertControllerWithTitle:v8 message:v10 preferredStyle:1];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000698E0;
  v23[3] = &unk_1002CEEB0;
  id v24 = v5;
  id v16 = v5;
  double v17 = +[UIAlertAction actionWithTitle:v12 style:0 handler:v23];
  [v15 addAction:v17];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000698F8;
  v21[3] = &unk_1002CEEB0;
  id v22 = v6;
  id v18 = v6;
  id v19 = +[UIAlertAction actionWithTitle:v14 style:0 handler:v21];
  [v15 addAction:v19];

  [(PHSOSViewController *)self presentViewController:v15 animated:1 completion:0];
}

- (void)didTapFindMy
{
}

- (void)showPowerDownFindMyAlert
{
  double v3 = +[NSBundle mainBundle];
  id v4 = [v3 localizedStringForKey:@"POWER_DOWN_FIND_MY_TITLE" value:&stru_1002D6110 table:@"InCallService"];

  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"POWER_DOWN_FIND_MY_DISABLE" value:&stru_1002D6110 table:@"InCallService"];

  unsigned int v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"POWER_DOWN_FIND_MY_DISABLE_BUTTON" value:&stru_1002D6110 table:@"InCallService"];

  id v9 = +[NSBundle mainBundle];
  id v10 = [v9 localizedStringForKey:@"OK" value:&stru_1002D6110 table:@"InCallService"];

  uint64_t v11 = +[UIAlertController alertControllerWithTitle:v4 message:v6 preferredStyle:1];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  id v15[2] = sub_100069B5C;
  v15[3] = &unk_1002CEE38;
  v15[4] = self;
  double v12 = +[UIAlertAction actionWithTitle:v10 style:0 handler:v15];
  [v11 addAction:v12];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100069B64;
  v14[3] = &unk_1002CEE38;
  void v14[4] = self;
  double v13 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v14];
  [v11 addAction:v13];

  [(PHSOSViewController *)self presentViewController:v11 animated:1 completion:0];
}

- (void)userAcknowledgedFindMyInfo
{
  double v3 = [(PHSOSViewController *)self beaconManager];
  [v3 setUserHasAcknowledgedFindMy:1 completion:&stru_1002CEED0];

  id v4 = [(PHSOSViewController *)self slidingView];
  [v4 didAcknowledgeFindMyInfo];
}

- (void)didTapTemporarilyDisableFindMy
{
  [(PHSOSViewController *)self userAcknowledgedFindMyInfo];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100069D44;
  v10[3] = &unk_1002CD540;
  void v10[4] = self;
  double v3 = objc_retainBlock(v10);
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Requesting passcode for FindMy temp disable", v9, 2u);
  }

  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"POWER_DOWN_FIND_MY_DISABLE_PASSCODE_TITLE" value:&stru_1002D6110 table:@"InCallService"];

  unsigned int v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"POWER_DOWN_FIND_MY_DISABLE_PASSCODE_SUBTITLE" value:&stru_1002D6110 table:@"InCallService"];

  SBSRequestPasscodeCheckUI();
}

- (BOOL)allowsMenuButtonDismissal
{
  unsigned int v2 = +[TUCallCenter sharedInstance];
  double v3 = [v2 callPassingTest:&stru_1002CEEF0];
  BOOL v4 = v3 != 0;

  return v4;
}

- (BOOL)allowsOtherAlertsToStackOnTop
{
  return 1;
}

- (BOOL)allowsBanners
{
  return 1;
}

- (BOOL)allowsOrientationChangeEvents
{
  return 0;
}

- (unint64_t)desiredButtonEvents
{
  return 1;
}

- (unint64_t)desiredSceneButtonEvents
{
  return 0;
}

- (BOOL)desiresLockButtonEvents
{
  return 1;
}

- (void)stateChanged:(id)a3
{
  id v4 = a3;
  id v5 = [(PHSOSViewController *)self launchedForAssertionReason];

  id v6 = sub_1000D5130();
  unsigned int v7 = v6;
  if (v5 == @"PHAlertRestingScreenAssertionReason")
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,Stewie state changed: %@", (uint8_t *)&v10, 0xCu);
    }

    if ((id)[(PHSOSViewController *)self sosMode] == (id)10)
    {
      id v8 = [(PHSOSViewController *)self stewieState];
      if ([v8 activeServices])
      {
        unsigned __int8 v9 = [v4 activeServices];

        if ((v9 & 1) == 0) {
          [(PHSOSViewController *)self setSosMode:9];
        }
      }
      else
      {
      }
    }
    [(PHSOSViewController *)self setStewieState:v4];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001EA890();
    }
  }
}

- (void)setUpCancelButtonConstraints
{
  double v3 = [(PHSOSViewController *)self cancelButton];
  id v4 = [v3 centerXAnchor];
  id v5 = [(PHSOSViewController *)self view];
  id v6 = [v5 centerXAnchor];
  unsigned int v7 = [v4 constraintEqualToAnchor:v6];

  id v8 = [(PHSOSViewController *)self cancelButton];
  unsigned __int8 v9 = [v8 bottomAnchor];
  int v10 = [(PHSOSViewController *)self view];
  id v11 = [v10 bottomAnchor];
  double v12 = [(PHSOSViewController *)self view];
  +[PHCallViewController _bottomBarBottomMarginForView:v12];
  double v14 = [v9 constraintEqualToAnchor:v11 constant:-v13];

  v16[0] = v7;
  v16[1] = v14;
  double v15 = +[NSArray arrayWithObjects:v16 count:2];
  +[NSLayoutConstraint activateConstraints:v15];
}

- (void)setUpCheckInViewConstraints
{
  id v30 = objc_alloc_init((Class)NSMutableArray);
  [(PHSOSViewController *)self marginPadding];
  double v4 = v3;
  id v5 = [(PHSOSViewController *)self checkInView];
  id v6 = [v5 leadingAnchor];
  unsigned int v7 = [(PHSOSViewController *)self view];
  id v8 = [v7 leadingAnchor];
  unsigned __int8 v9 = [v6 constraintEqualToAnchor:v8 constant:v4];
  [v30 addObject:v9];

  int v10 = [(PHSOSViewController *)self checkInView];
  id v11 = [v10 trailingAnchor];
  double v12 = [(PHSOSViewController *)self view];
  double v13 = [v12 trailingAnchor];
  double v14 = [v11 constraintEqualToAnchor:v13 constant:-v4];
  [v30 addObject:v14];

  double v15 = [(PHSOSViewController *)self checkInView];
  id v16 = [v15 centerXAnchor];
  double v17 = [(PHSOSViewController *)self view];
  id v18 = [v17 centerXAnchor];
  id v19 = [v16 constraintEqualToAnchor:v18];
  [v30 addObject:v19];

  unsigned int v20 = [(PHSOSViewController *)self checkInView];
  id v21 = [v20 topAnchor];
  id v22 = [(PHSOSViewController *)self view];
  id v23 = [v22 topAnchor];
  id v24 = [v21 constraintEqualToAnchor:v23];
  [v30 addObject:v24];

  id v25 = [(PHSOSViewController *)self checkInView];
  unsigned __int8 v26 = [v25 bottomAnchor];
  id v27 = [(PHSOSViewController *)self cancelButton];
  v28 = [v27 topAnchor];
  id v29 = [v26 constraintEqualToAnchor:v28];
  [v30 addObject:v29];

  +[NSLayoutConstraint activateConstraints:v30];
}

- (void)setUpRestingViewConstraints
{
  id v30 = objc_alloc_init((Class)NSMutableArray);
  [(PHSOSViewController *)self marginPadding];
  double v4 = v3;
  id v5 = [(PHSOSViewController *)self restingView];
  id v6 = [v5 leadingAnchor];
  unsigned int v7 = [(PHSOSViewController *)self view];
  id v8 = [v7 leadingAnchor];
  unsigned __int8 v9 = [v6 constraintEqualToAnchor:v8 constant:v4];
  [v30 addObject:v9];

  int v10 = [(PHSOSViewController *)self restingView];
  id v11 = [v10 trailingAnchor];
  double v12 = [(PHSOSViewController *)self view];
  double v13 = [v12 trailingAnchor];
  double v14 = [v11 constraintEqualToAnchor:v13 constant:-v4];
  [v30 addObject:v14];

  double v15 = [(PHSOSViewController *)self restingView];
  id v16 = [v15 centerXAnchor];
  double v17 = [(PHSOSViewController *)self view];
  id v18 = [v17 centerXAnchor];
  id v19 = [v16 constraintEqualToAnchor:v18];
  [v30 addObject:v19];

  unsigned int v20 = [(PHSOSViewController *)self restingView];
  id v21 = [v20 topAnchor];
  id v22 = [(PHSOSViewController *)self view];
  id v23 = [v22 topAnchor];
  id v24 = [v21 constraintEqualToAnchor:v23];
  [v30 addObject:v24];

  id v25 = [(PHSOSViewController *)self restingView];
  unsigned __int8 v26 = [v25 bottomAnchor];
  id v27 = [(PHSOSViewController *)self cancelButton];
  v28 = [v27 topAnchor];
  id v29 = [v26 constraintEqualToAnchor:v28];
  [v30 addObject:v29];

  +[NSLayoutConstraint activateConstraints:v30];
}

- (void)setUpAlertRestingViewConstraints
{
  id v30 = objc_alloc_init((Class)NSMutableArray);
  [(PHSOSViewController *)self marginPadding];
  double v4 = v3;
  id v5 = [(PHSOSViewController *)self alertRestingView];
  id v6 = [v5 leadingAnchor];
  unsigned int v7 = [(PHSOSViewController *)self view];
  id v8 = [v7 leadingAnchor];
  unsigned __int8 v9 = [v6 constraintEqualToAnchor:v8 constant:v4];
  [v30 addObject:v9];

  int v10 = [(PHSOSViewController *)self alertRestingView];
  id v11 = [v10 trailingAnchor];
  double v12 = [(PHSOSViewController *)self view];
  double v13 = [v12 trailingAnchor];
  double v14 = [v11 constraintEqualToAnchor:v13 constant:-v4];
  [v30 addObject:v14];

  double v15 = [(PHSOSViewController *)self alertRestingView];
  id v16 = [v15 centerXAnchor];
  double v17 = [(PHSOSViewController *)self view];
  id v18 = [v17 centerXAnchor];
  id v19 = [v16 constraintEqualToAnchor:v18];
  [v30 addObject:v19];

  unsigned int v20 = [(PHSOSViewController *)self alertRestingView];
  id v21 = [v20 topAnchor];
  id v22 = [(PHSOSViewController *)self view];
  id v23 = [v22 topAnchor];
  id v24 = [v21 constraintEqualToAnchor:v23];
  [v30 addObject:v24];

  id v25 = [(PHSOSViewController *)self alertRestingView];
  unsigned __int8 v26 = [v25 bottomAnchor];
  id v27 = [(PHSOSViewController *)self cancelButton];
  v28 = [v27 topAnchor];
  id v29 = [v26 constraintEqualToAnchor:v28];
  [v30 addObject:v29];

  +[NSLayoutConstraint activateConstraints:v30];
}

- (void)setUpCountdownViewConstraints
{
  [(PHSOSViewController *)self marginPadding];
  double v4 = v3;
  id v5 = [(PHSOSViewController *)self countdownView];
  id v6 = [v5 leadingAnchor];
  unsigned int v7 = [(PHSOSViewController *)self view];
  id v8 = [v7 leadingAnchor];
  unsigned __int8 v9 = [v6 constraintEqualToAnchor:v8 constant:v4];

  int v10 = [(PHSOSViewController *)self countdownView];
  id v11 = [v10 trailingAnchor];
  double v12 = [(PHSOSViewController *)self view];
  double v13 = [v12 trailingAnchor];
  double v14 = [v11 constraintEqualToAnchor:v13 constant:-v4];

  double v15 = [(PHSOSViewController *)self countdownView];
  id v16 = [v15 centerXAnchor];
  double v17 = [(PHSOSViewController *)self view];
  id v18 = [v17 centerXAnchor];
  id v19 = [v16 constraintEqualToAnchor:v18];

  unsigned int v20 = [(PHSOSViewController *)self countdownView];
  id v21 = [v20 topAnchor];
  id v22 = [(PHSOSViewController *)self view];
  id v23 = [v22 topAnchor];
  id v24 = [v21 constraintEqualToAnchor:v23];

  id v25 = [(PHSOSViewController *)self countdownView];
  unsigned __int8 v26 = [v25 bottomAnchor];
  id v27 = [(PHSOSViewController *)self cancelButton];
  v28 = [v27 topAnchor];
  id v29 = [v26 constraintEqualToAnchor:v28];

  v31[0] = v9;
  v31[1] = v14;
  v31[2] = v19;
  v31[3] = v24;
  v31[4] = v29;
  id v30 = +[NSArray arrayWithObjects:v31 count:5];
  +[NSLayoutConstraint activateConstraints:v30];
}

- (void)setUpSlidingViewConstraints
{
  double v3 = [(PHSOSViewController *)self slidingView];
  double v4 = [v3 leadingAnchor];
  id v5 = [(PHSOSViewController *)self view];
  id v6 = [v5 leadingAnchor];
  unsigned int v7 = [v4 constraintEqualToAnchor:v6];

  id v8 = [(PHSOSViewController *)self slidingView];
  unsigned __int8 v9 = [v8 trailingAnchor];
  int v10 = [(PHSOSViewController *)self view];
  id v11 = [v10 trailingAnchor];
  double v12 = [v9 constraintEqualToAnchor:v11];

  double v13 = [(PHSOSViewController *)self slidingView];
  double v14 = [v13 centerXAnchor];
  double v15 = [(PHSOSViewController *)self view];
  id v16 = [v15 centerXAnchor];
  double v17 = [v14 constraintEqualToAnchor:v16];

  id v18 = [(PHSOSViewController *)self slidingView];
  id v19 = [v18 topAnchor];
  unsigned int v20 = [(PHSOSViewController *)self view];
  id v21 = [v20 topAnchor];
  id v22 = [v19 constraintEqualToAnchor:v21];

  id v23 = [(PHSOSViewController *)self slidingView];
  id v24 = [v23 bottomAnchor];
  id v25 = [(PHSOSViewController *)self cancelButton];
  unsigned __int8 v26 = [v25 topAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26];

  v29[0] = v7;
  v29[1] = v12;
  v29[2] = v17;
  v29[3] = v22;
  v29[4] = v27;
  v28 = +[NSArray arrayWithObjects:v29 count:5];
  +[NSLayoutConstraint activateConstraints:v28];
}

- (void)setUpSOSNumbersListViewConstraints
{
  [(PHSOSViewController *)self marginPadding];
  double v4 = v3;
  id v5 = [(PHSOSViewController *)self sosNumbersViewController];
  id v6 = [v5 view];
  unsigned int v7 = [v6 leadingAnchor];
  id v8 = [(PHSOSViewController *)self view];
  unsigned __int8 v9 = [v8 leadingAnchor];
  int64_t v36 = [v7 constraintEqualToAnchor:v9 constant:v4];

  int v10 = [(PHSOSViewController *)self sosNumbersViewController];
  id v11 = [v10 view];
  double v12 = [v11 trailingAnchor];
  double v13 = [(PHSOSViewController *)self view];
  double v14 = [v13 trailingAnchor];
  double v15 = [v12 constraintEqualToAnchor:v14 constant:-v4];

  id v16 = [(PHSOSViewController *)self sosNumbersViewController];
  double v17 = [v16 view];
  id v18 = [v17 centerXAnchor];
  id v19 = [(PHSOSViewController *)self view];
  unsigned int v20 = [v19 centerXAnchor];
  id v21 = [v18 constraintEqualToAnchor:v20];

  id v22 = [(PHSOSViewController *)self sosNumbersViewController];
  id v23 = [v22 view];
  id v24 = [v23 topAnchor];
  id v25 = [(PHSOSViewController *)self view];
  unsigned __int8 v26 = [v25 safeAreaLayoutGuide];
  id v27 = [v26 topAnchor];
  v28 = [v24 constraintEqualToAnchor:v27 constant:52.0];

  id v29 = [(PHSOSViewController *)self sosNumbersViewController];
  id v30 = [v29 view];
  id v31 = [v30 bottomAnchor];
  uint64_t v32 = [(PHSOSViewController *)self cancelButton];
  v33 = [v32 topAnchor];
  id v34 = [v31 constraintEqualToAnchor:v33 constant:-28.0];

  v37[0] = v36;
  v37[1] = v15;
  v37[2] = v21;
  v37[3] = v28;
  v37[4] = v34;
  v35 = +[NSArray arrayWithObjects:v37 count:5];
  +[NSLayoutConstraint activateConstraints:v35];
}

- (void)setUpInfoLabelConstraints
{
  [(PHSOSViewController *)self marginPadding];
  double v4 = v3;
  id v5 = [(PHSOSViewController *)self infoLabel];
  id v6 = [v5 leadingAnchor];
  unsigned int v7 = [(PHSOSViewController *)self view];
  id v8 = [v7 leadingAnchor];
  unsigned __int8 v9 = [v6 constraintEqualToAnchor:v8 constant:v4];

  int v10 = [(PHSOSViewController *)self infoLabel];
  id v11 = [v10 trailingAnchor];
  double v12 = [(PHSOSViewController *)self view];
  double v13 = [v12 trailingAnchor];
  double v14 = [v11 constraintEqualToAnchor:v13 constant:-v4];

  double v15 = [(PHSOSViewController *)self infoLabel];
  id v16 = [v15 centerXAnchor];
  double v17 = [(PHSOSViewController *)self view];
  id v18 = [v17 centerXAnchor];
  id v19 = [v16 constraintEqualToAnchor:v18];

  double v20 = 27.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing])
  {
    id v21 = +[UIScreen mainScreen];
    [v21 bounds];
    double v20 = v22 * 0.0599999987;
  }
  id v23 = [(PHSOSViewController *)self infoLabel];
  id v24 = [v23 topAnchor];
  id v25 = [(PHSOSViewController *)self safeAreaLayoutGuide];
  unsigned __int8 v26 = [v25 topAnchor];
  id v27 = [v24 constraintEqualToAnchor:v26 constant:v20];

  v29[0] = v9;
  v29[1] = v14;
  v29[2] = v19;
  v29[3] = v27;
  v28 = +[NSArray arrayWithObjects:v29 count:4];
  +[NSLayoutConstraint activateConstraints:v28];
}

- (void)submitSOSResolutionMetric:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PHSOSViewController *)self launchedForAssertionReason];

  if (v5 != @"PHSOSCallAssertionReason") {
    return;
  }
  uint64_t v6 = 1;
  switch([(PHSOSViewController *)self sosTrigger])
  {
    case 1:
    case 2:
      id v7 = +[SOSUtilities isCallWithSideButtonPressesEnabled];
      goto LABEL_5;
    case 3:
      id v7 = +[SOSUtilities isCallWithVolumeLockHoldEnabled];
LABEL_5:
      uint64_t v6 = (uint64_t)v7;
      break;
    case 5:
    case 7:
      break;
    default:
      id v8 = sub_1000D5130();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1001EA8C4(self);
      }

      uint64_t v6 = 0;
      break;
  }
  int64_t v9 = [(PHSOSViewController *)self sosTrigger];
  if (+[SOSCoreAnalyticsReporter isSensitiveTrigger:v9])
  {
    int v10 = +[MCProfileConnection sharedConnection];
    unsigned int v11 = [v10 isSafetyDataSubmissionAllowed];

    if (!v11) {
      int64_t v9 = 9;
    }
  }
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  double v13 = +[NSNumber numberWithInteger:v9];
  [v12 setValue:v13 forKey:@"trigger"];

  double v14 = +[NSNumber numberWithBool:[(PHSOSViewController *)self wasCallCancelled]];
  [v12 setValue:v14 forKey:@"callCancelled"];

  [(PHSOSViewController *)self timeTillCancelCall];
  LODWORD(v16) = vcvtpd_s64_f64(v15);
  double v17 = +[NSNumber numberWithInt:v16];
  [v12 setValue:v17 forKey:@"timeTillCancel"];

  id v18 = +[NSNumber numberWithBool:v3];
  [v12 setValue:v18 forKey:@"notificationPosted"];

  id v19 = +[NSNumber numberWithBool:v6];
  [v12 setValue:v19 forKey:@"autoCallEnabled"];

  double v20 = +[NSNumber numberWithInt:[(PHSOSViewController *)self callDisconnectReason]];
  [v12 setValue:v20 forKey:@"callDisconnectReason"];

  [(PHSOSViewController *)self timeTillActive];
  LODWORD(v22) = vcvtpd_s64_f64(v21);
  id v23 = +[NSNumber numberWithInt:v22];
  [v12 setValue:v23 forKey:@"timeTillActive"];

  id v24 = +[NSNumber numberWithBool:[(PHSOSViewController *)self callAutoDialled]];
  [v12 setValue:v24 forKey:@"callAutoDialled"];

  id v25 = [(PHSOSViewController *)self currentButtonPressState];

  if (v25)
  {
    unsigned __int8 v26 = [(PHSOSViewController *)self currentButtonPressState];
    [v26 getButtonPressGap];
    double v28 = v27;

    LODWORD(v29) = vcvtpd_s64_f64(v28);
    id v30 = +[NSNumber numberWithInt:v29];
    [v12 setValue:v30 forKey:@"clawButtonPressGap"];

    id v31 = +[NSNumber numberWithDouble:ceil(v28 * 10.0) / 10.0];
    [v12 setValue:v31 forKey:@"clawButtonPressGapFloat"];
  }
  if ((id)[(PHSOSViewController *)self sosTrigger] == (id)3
    || (+[SOSUtilities isCallWithSideButtonPressesEnabled] & 1) == 0&& ((id)[(PHSOSViewController *)self sosTrigger] == (id)2|| (id)[(PHSOSViewController *)self sosTrigger] == (id)1))
  {
    uint64_t v32 = +[NSNumber numberWithBool:[(PHSOSViewController *)self clawSwipeAfterRTCTimeout]];
    [v12 setValue:v32 forKey:@"clawSwipeAfterRTCTimeout"];

    v33 = +[NSNumber numberWithUnsignedInteger:[(PHSOSViewController *)self clawResolution]];
    [v12 setValue:v33 forKey:@"clawResolution"];

    id v34 = [(PHSOSViewController *)self slidingView];
    v35 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v34 wasMounted]);
    [v12 setValue:v35 forKey:@"wasMounted"];

    int64_t v36 = [(PHSOSViewController *)self slidingView];
    __int16 v37 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v36 wasMountedProbability]);
    [v12 setValue:v37 forKey:@"wasMountedProbability"];

    v38 = [(PHSOSViewController *)self slidingView];
    v39 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v38 numberOfEpochsForMountProbability]);
    [v12 setValue:v39 forKey:@"numberEpochs"];

    v40 = [(PHSOSViewController *)self slidingView];
    if (!v40) {
      goto LABEL_22;
    }
    +[SOSUtilities clawReleaseToCallSupport];
    if (v41 <= 1.0) {
      goto LABEL_22;
    }
    v42 = [(PHSOSViewController *)self slidingView];
    unint64_t v43 = (unint64_t)[v42 timeToReleaseClaw];

    if ((v43 & 0x8000000000000000) == 0)
    {
      v40 = [(PHSOSViewController *)self slidingView];
      v44 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v40 timeToReleaseClaw]);
      [v12 setValue:v44 forKey:@"timeToReleaseClaw"];

LABEL_22:
    }
  }
  v83 = objc_alloc_init(ICSCallAnalyticsLogger);
  [(ICSCallAnalyticsLogger *)v83 submitCAMetric:v12 viewId:@"com.apple.sos.resolution"];
  v45 = sub_1000D5130();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    v81 = [v12 valueForKey:@"trigger"];
    unsigned int v74 = [v81 intValue];
    v79 = [v12 valueForKey:@"callCancelled"];
    unsigned int v72 = [v79 intValue];
    v77 = [v12 valueForKey:@"timeTillCancel"];
    unsigned int v71 = [v77 intValue];
    v76 = [v12 valueForKey:@"notificationPosted"];
    unsigned int v70 = [v76 intValue];
    v75 = [v12 valueForKey:@"autoCallEnabled"];
    unsigned int v69 = [v75 intValue];
    v73 = [v12 valueForKey:@"callDisconnectReason"];
    unsigned int v46 = [v73 intValue];
    int64_t v47 = [v12 valueForKey:@"timeTillActive"];
    unsigned int v48 = [v47 intValue];
    v49 = [v12 valueForKey:@"callAutoDialled"];
    unsigned int v50 = [v49 intValue];
    v51 = [v12 valueForKey:@"clawButtonPressGap"];
    unsigned int v52 = [v51 intValue];
    v53 = [v12 valueForKey:@"clawButtonPressGapFloat"];
    [v53 doubleValue];
    *(_DWORD *)buf = 67111424;
    unsigned int v85 = v74;
    __int16 v86 = 1024;
    unsigned int v87 = v72;
    __int16 v88 = 1024;
    unsigned int v89 = v71;
    __int16 v90 = 1024;
    unsigned int v91 = v70;
    __int16 v92 = 1024;
    unsigned int v93 = v69;
    __int16 v94 = 1024;
    unsigned int v95 = v46;
    __int16 v96 = 1024;
    unsigned int v97 = v48;
    __int16 v98 = 1024;
    unsigned int v99 = v50;
    __int16 v100 = 1024;
    unsigned int v101 = v52;
    __int16 v102 = 2048;
    uint64_t v103 = v54;
    _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,SOS Resolution details,trigger,%d,callCancelled,%d,timeTillCancel,%d,notificationPosted,%d,autoCallEnabled,%d,callDisconnectReason,%d,timeTillActive,%d,callAutoDialled,%d,clawButtonPressGap,%d,clawButtonPressGapFloat,%f", buf, 0x42u);
  }
  v55 = sub_1000D5130();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v82 = [v12 valueForKey:@"clawResolution"];
    unsigned int v78 = [v82 intValue];
    v80 = [v12 valueForKey:@"wasMounted"];
    unsigned int v56 = [v80 intValue];
    v57 = [v12 valueForKey:@"wasMountedProbability"];
    unsigned int v58 = [v57 intValue];
    v59 = [v12 valueForKey:@"numberEpochs"];
    unsigned int v60 = [v59 intValue];
    v61 = [v12 valueForKey:@"timeToReleaseClaw"];
    unsigned int v62 = [v61 intValue];
    v63 = [v12 valueForKey:@"clawSwipeAfterRTCTimeout"];
    unsigned int v64 = [v63 intValue];
    *(_DWORD *)buf = 67110400;
    unsigned int v85 = v78;
    __int16 v86 = 1024;
    unsigned int v87 = v56;
    __int16 v88 = 1024;
    unsigned int v89 = v58;
    __int16 v90 = 1024;
    unsigned int v91 = v60;
    __int16 v92 = 1024;
    unsigned int v93 = v62;
    __int16 v94 = 1024;
    unsigned int v95 = v64;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,SOS Resolution details II,clawResolution,%d,wasMounted,%d,wasMountedProbability,%d,numberEpochs,%d,timeToReleaseClaw,%d, clawSwipeAfterRTCTimeout,%d", buf, 0x26u);
  }
  v65 = sub_1000D5130();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v66 = +[SOSUtilities isCallWithVolumeLockHoldEnabled];
    unsigned int v67 = +[SOSUtilities isCallWithSideButtonPressesEnabled];
    unsigned int v68 = +[SOSUtilities shouldPlayAudioDuringCountdown];
    *(_DWORD *)buf = 67109632;
    unsigned int v85 = v66;
    __int16 v86 = 1024;
    unsigned int v87 = v67;
    __int16 v88 = 1024;
    unsigned int v89 = v68;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,SOS Settings details,isCallWithVolumeLockHoldEnabled:%d,isCallWithSideButtonPressesEnabled:%d,emergencySOSSoundEnabled:%d", buf, 0x14u);
  }
}

- (void)submitSOSUserActivityMetric
{
  BOOL v3 = [(PHSOSViewController *)self launchedForAssertionReason];

  if (v3 == @"PHSOSCallAssertionReason")
  {
    id v4 = objc_alloc_init((Class)NSMutableDictionary);
    id v5 = [(PHSOSViewController *)self sessionId];
    [v4 setValue:v5 forKey:@"sessionId"];

    double Current = CFAbsoluteTimeGetCurrent();
    [(PHSOSViewController *)self sessionStartTime];
    LODWORD(v8) = vcvtpd_s64_f64(vabdd_f64(Current, v7));
    int64_t v9 = +[NSNumber numberWithInt:v8];
    [v4 setValue:v9 forKey:@"timeSinceSessionStart"];

    int v10 = +[NSNumber numberWithUnsignedInteger:[(PHSOSViewController *)self slidingViewEntryReason]];
    [v4 setValue:v10 forKey:@"entryReason"];

    unsigned int v11 = +[NSNumber numberWithUnsignedInteger:[(PHSOSViewController *)self slidingViewExitReason]];
    [v4 setValue:v11 forKey:@"exitReason"];

    +[SOSUtilities clawReleaseToCallSupport];
    if (v12 == 0.0
      || (+[SOSUtilities clawReleaseToCallSupport], v44 != 0.0)
      && (id)[(PHSOSViewController *)self slidingViewEntryReason] == (id)5)
    {
      double v13 = +[NSNumber numberWithInt:[(PHSOSViewController *)self wasCallCancelled] ^ 1];
      [v4 setValue:v13 forKey:@"callConnected"];

      if (![(PHSOSViewController *)self wasCallCancelled])
      {
        [(PHSOSViewController *)self timeTillCancelCall];
        LODWORD(v15) = vcvtpd_s64_f64(v14);
        uint64_t v16 = +[NSNumber numberWithInt:v15];
        [v4 setValue:v16 forKey:@"callDuration"];

        [(PHSOSViewController *)self callConnectTimeSinceSessionStart];
        LODWORD(v18) = vcvtpd_s64_f64(fabs(v17));
        id v19 = +[NSNumber numberWithInt:v18];
        [v4 setValue:v19 forKey:@"callConnectTimeSinceSessionStart"];
      }
      double v20 = +[NSNumber numberWithInt:[(PHSOSViewController *)self callDisconnectReason]];
      [v4 setValue:v20 forKey:@"callDisconnectReason"];
    }
    if ((id)[(PHSOSViewController *)self sosTrigger] == (id)3
      || (+[SOSUtilities isCallWithSideButtonPressesEnabled] & 1) == 0&& ((id)[(PHSOSViewController *)self sosTrigger] == (id)2|| (id)[(PHSOSViewController *)self sosTrigger] == (id)1))
    {
      double v21 = +[SOSManager sharedInstance];
      uint64_t v22 = [v21 currentSOSButtonPressState];
      [v22 getButtonPressGap];
      double v24 = v23;

      id v25 = +[NSNumber numberWithDouble:ceil(v24 * 10.0) / 10.0];
      [v4 setValue:v25 forKey:@"clawButtonPressGapFloat"];

      +[SOSUtilities clawReleaseToCallSupport];
      if (v26 != 0.0)
      {
        double v27 = +[NSNumber numberWithBool:[(PHSOSViewController *)self clawSwipeAfterRTCTimeout]];
        [v4 setValue:v27 forKey:@"clawSwipeAfterRTCTimeout"];
      }
      if ((id)[(PHSOSViewController *)self slidingViewExitReason] == (id)4
        || (id)[(PHSOSViewController *)self slidingViewExitReason] == (id)7)
      {
        [(PHSOSViewController *)self sliderProgressDuration];
        double v29 = v28;
        id v30 = objc_alloc_init(PHSOSDialSlidingViewModel);
        LODWORD(v31) = vcvtpd_s64_f64(v29 * (double)[(PHSOSDialSlidingViewModel *)v30 countdown]);
        uint64_t v32 = +[NSNumber numberWithInt:v31];
        [v4 setValue:v32 forKey:@"sliderProgressDuration"];
      }
    }
    v33 = objc_alloc_init(ICSCallAnalyticsLogger);
    [(ICSCallAnalyticsLogger *)v33 submitCAMetric:v4 viewId:@"com.apple.sos.user_activity"];
    id v34 = sub_1000D5130();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v35 = [v4 valueForKey:@"sessionId"];
      unsigned int v56 = [v4 valueForKey:@"timeSinceSessionStart"];
      unsigned int v51 = [v56 intValue];
      v55 = [v4 valueForKey:@"entryReason"];
      unsigned int v49 = [v55 intValue];
      uint64_t v54 = [v4 valueForKey:@"exitReason"];
      unsigned int v48 = [v54 intValue];
      v53 = [v4 valueForKey:@"callConnected"];
      unsigned int v47 = [v53 intValue];
      unsigned int v52 = [v4 valueForKey:@"callDuration"];
      unsigned int v46 = [v52 intValue];
      unsigned int v50 = [v4 valueForKey:@"callConnectTimeSinceSessionStart"];
      unsigned int v45 = [v50 intValue];
      int64_t v36 = [v4 valueForKey:@"callDisconnectReason"];
      unsigned int v37 = [v36 intValue];
      v38 = [v4 valueForKey:@"clawButtonPressGapFloat"];
      [v38 doubleValue];
      uint64_t v40 = v39;
      double v41 = [v4 valueForKey:@"clawSwipeAfterRTCTimeout"];
      unsigned int v42 = [v41 intValue];
      unint64_t v43 = [v4 valueForKey:@"sliderProgressDuration"];
      *(_DWORD *)buf = 138414850;
      unsigned int v58 = v35;
      __int16 v59 = 1024;
      unsigned int v60 = v51;
      __int16 v61 = 1024;
      unsigned int v62 = v49;
      __int16 v63 = 1024;
      unsigned int v64 = v48;
      __int16 v65 = 1024;
      unsigned int v66 = v47;
      __int16 v67 = 1024;
      unsigned int v68 = v46;
      __int16 v69 = 1024;
      unsigned int v70 = v45;
      __int16 v71 = 1024;
      unsigned int v72 = v37;
      __int16 v73 = 2048;
      uint64_t v74 = v40;
      __int16 v75 = 1024;
      unsigned int v76 = v42;
      __int16 v77 = 1024;
      unsigned int v78 = [v43 intValue];
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "PHSOSViewController,User Activity details,sessionId,%@,timeSinceSessionStart,%d,entryReason,%d,exitReason,%d,callConnected,%d,callDuration,%d,callConnectTimeSinceSessionStart,%d,callDisconnectReason,%d,clawButtonPressGapFloat,%f,clawSwipeAfterRTCTimeout,%d,sliderProgressDuration,%d", buf, 0x4Cu);
    }
  }
}

- (BOOL)isPendingAudioSessionActivation
{
  return self->_isPendingAudioSessionActivation;
}

- (void)setIsPendingAudioSessionActivation:(BOOL)a3
{
  self->_isPendingAudioSessionActivation = a3;
}

- (int64_t)sosMode
{
  return self->_sosMode;
}

- (NSArray)sosHandles
{
  return self->_sosHandles;
}

- (void)setSosHandles:(id)a3
{
}

- (int64_t)sosTrigger
{
  return self->_sosTrigger;
}

- (void)setSosTrigger:(int64_t)a3
{
  self->_sosTrigger = a3;
}

- (PHAudioDeviceController)audioDeviceController
{
  return self->_audioDeviceController;
}

- (void)setAudioDeviceController:(id)a3
{
}

- (PHBottomBarButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (void)setCheckInView:(id)a3
{
}

- (void)setRestingView:(id)a3
{
}

- (void)setAlertRestingView:(id)a3
{
}

- (void)setCountdownView:(id)a3
{
}

- (void)setSlidingView:(id)a3
{
}

- (void)setSosNumbersViewController:(id)a3
{
}

- (UINavigationController)medicalIDNavigationController
{
  return self->_medicalIDNavigationController;
}

- (void)setMedicalIDNavigationController:(id)a3
{
}

- (void)setInfoLabel:(id)a3
{
}

- (UIView)currentView
{
  return self->_currentView;
}

- (void)setCurrentView:(id)a3
{
}

- (void)setHealthStore:(id)a3
{
}

- (int64_t)currentInteractiveState
{
  return self->_currentInteractiveState;
}

- (void)setCurrentInteractiveState:(int64_t)a3
{
  self->_currentInteractiveState = a3;
}

- (SOSButtonPressState)currentButtonPressState
{
  return self->_currentButtonPressState;
}

- (void)setCurrentButtonPressState:(id)a3
{
}

- (BOOL)shouldDropBioAuthTokenOnDismiss
{
  return self->_shouldDropBioAuthTokenOnDismiss;
}

- (void)setShouldDropBioAuthTokenOnDismiss:(BOOL)a3
{
  self->_shouldDropBioAuthTokenOnDismiss = a3;
}

- (BOOL)requestedCallActive
{
  return self->_requestedCallActive;
}

- (void)setRequestedCallActive:(BOOL)a3
{
  self->_requestedCallActive = a3;
}

- (BOOL)volumeHUDHiddenCurrently
{
  return self->_volumeHUDHiddenCurrently;
}

- (void)setVolumeHUDHiddenCurrently:(BOOL)a3
{
  self->_volumeHUDHiddenCurrently = a3;
}

- (BOOL)volumeHUDHiddenPending
{
  return self->_volumeHUDHiddenPending;
}

- (void)setVolumeHUDHiddenPending:(BOOL)a3
{
  self->_volumeHUDHiddenPending = a3;
}

- (BOOL)volumeMaxedCurrently
{
  return self->_volumeMaxedCurrently;
}

- (void)setVolumeMaxedCurrently:(BOOL)a3
{
  self->_volumeMaxedCurrently = a3;
}

- (BOOL)volumeMaxedPending
{
  return self->_volumeMaxedPending;
}

- (void)setVolumeMaxedPending:(BOOL)a3
{
  self->_volumeMaxedPending = a3;
}

- (float)priorSystemVolume
{
  return self->_priorSystemVolume;
}

- (void)setPriorSystemVolume:(float)a3
{
  self->_priorSystemVolume = a3;
}

- (TUAudioRoute)priorSystemAudioRoute
{
  return self->_priorSystemAudioRoute;
}

- (void)setPriorSystemAudioRoute:(id)a3
{
}

- (BOOL)isUserResponsive
{
  return self->_isUserResponsive;
}

- (void)setIsUserResponsive:(BOOL)a3
{
  self->_isUserResponsive = a3;
}

- (BOOL)alreadyVisitedRestingScreen
{
  return self->_alreadyVisitedRestingScreen;
}

- (void)setAlreadyVisitedRestingScreen:(BOOL)a3
{
  self->_alreadyVisitedRestingScreen = a3;
}

- (NSDate)dateOfCall
{
  return self->_dateOfCall;
}

- (void)setDateOfCall:(id)a3
{
}

- (CTStewieStateMonitor)stewieStateMonitor
{
  return self->_stewieStateMonitor;
}

- (void)setStewieStateMonitor:(id)a3
{
}

- (CTStewieState)stewieState
{
  return self->_stewieState;
}

- (void)setStewieState:(id)a3
{
}

- (BOOL)shouldHandleAlertCallDisconnection
{
  return self->_shouldHandleAlertCallDisconnection;
}

- (void)setShouldHandleAlertCallDisconnection:(BOOL)a3
{
  self->_shouldHandleAlertCallDisconnection = a3;
}

- (NSString)launchedForAssertionReason
{
  return self->_launchedForAssertionReason;
}

- (void)setLaunchedForAssertionReason:(id)a3
{
}

- (double)countdownStartedTime
{
  return self->_countdownStartedTime;
}

- (void)setCountdownStartedTime:(double)a3
{
  self->_countdownStartedTime = a3;
}

- (double)countdownPausedTime
{
  return self->_countdownPausedTime;
}

- (void)setCountdownPausedTime:(double)a3
{
  self->_countdownPausedTime = a3;
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
}

- (double)timeTillCancelCall
{
  return self->_timeTillCancelCall;
}

- (void)setTimeTillCancelCall:(double)a3
{
  self->_timeTillCancelCall = a3;
}

- (BOOL)wasCallCancelled
{
  return self->_wasCallCancelled;
}

- (void)setWasCallCancelled:(BOOL)a3
{
  self->_wasCallCancelled = a3;
}

- (double)interactiveStartTime
{
  return self->_interactiveStartTime;
}

- (void)setInteractiveStartTime:(double)a3
{
  self->_interactiveStartTime = a3;
}

- (NSTimer)confirmationTimeoutTimer
{
  return self->_confirmationTimeoutTimer;
}

- (void)setConfirmationTimeoutTimer:(id)a3
{
}

- (NSTimer)statusHeartbeatTimer
{
  return self->_statusHeartbeatTimer;
}

- (void)setStatusHeartbeatTimer:(id)a3
{
}

- (int)callDisconnectReason
{
  return self->_callDisconnectReason;
}

- (void)setCallDisconnectReason:(int)a3
{
  self->_callDisconnectReason = a3;
}

- (double)callDialStartTime
{
  return self->_callDialStartTime;
}

- (void)setCallDialStartTime:(double)a3
{
  self->_callDialStartTime = a3;
}

- (double)timeTillActive
{
  return self->_timeTillActive;
}

- (void)setTimeTillActive:(double)a3
{
  self->_timeTillActive = a3;
}

- (BOOL)callAutoDialled
{
  return self->_callAutoDialled;
}

- (void)setCallAutoDialled:(BOOL)a3
{
  self->_callAutoDialled = a3;
}

- (NSString)sosCallUUID
{
  return self->_sosCallUUID;
}

- (void)setSosCallUUID:(id)a3
{
}

- (BOOL)clawSwipeAfterRTCTimeout
{
  return self->_clawSwipeAfterRTCTimeout;
}

- (void)setClawSwipeAfterRTCTimeout:(BOOL)a3
{
  self->_clawSwipeAfterRTCTimeout = a3;
}

- (unint64_t)clawResolution
{
  return self->_clawResolution;
}

- (void)setClawResolution:(unint64_t)a3
{
  self->_clawResolution = a3;
}

- (SOSCoreAnalyticsReporting)coreAnalyticsReporter
{
  return self->_coreAnalyticsReporter;
}

- (void)setCoreAnalyticsReporter:(id)a3
{
}

- (CNKCoreAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
}

- (double)sliderProgressDuration
{
  return self->_sliderProgressDuration;
}

- (void)setSliderProgressDuration:(double)a3
{
  self->_sliderProgressDuration = a3;
}

- (double)sessionStartTime
{
  return self->_sessionStartTime;
}

- (void)setSessionStartTime:(double)a3
{
  self->_sessionStartTime = a3;
}

- (double)callConnectTimeSinceSessionStart
{
  return self->_callConnectTimeSinceSessionStart;
}

- (void)setCallConnectTimeSinceSessionStart:(double)a3
{
  self->_callConnectTimeSinceSessionStart = a3;
}

- (unint64_t)slidingViewEntryReason
{
  return self->_slidingViewEntryReason;
}

- (void)setSlidingViewEntryReason:(unint64_t)a3
{
  self->_slidingViewEntryReason = a3;
}

- (unint64_t)slidingViewExitReason
{
  return self->_slidingViewExitReason;
}

- (void)setSlidingViewExitReason:(unint64_t)a3
{
  self->_slidingViewExitReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsReporter, 0);
  objc_storeStrong((id *)&self->_sosCallUUID, 0);
  objc_storeStrong((id *)&self->_statusHeartbeatTimer, 0);
  objc_storeStrong((id *)&self->_confirmationTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_launchedForAssertionReason, 0);
  objc_storeStrong((id *)&self->_stewieState, 0);
  objc_storeStrong((id *)&self->_stewieStateMonitor, 0);
  objc_storeStrong((id *)&self->_dateOfCall, 0);
  objc_storeStrong((id *)&self->_priorSystemAudioRoute, 0);
  objc_storeStrong((id *)&self->_currentButtonPressState, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_currentView, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_medicalIDNavigationController, 0);
  objc_storeStrong((id *)&self->_sosNumbersViewController, 0);
  objc_storeStrong((id *)&self->_slidingView, 0);
  objc_storeStrong((id *)&self->_countdownView, 0);
  objc_storeStrong((id *)&self->_alertRestingView, 0);
  objc_storeStrong((id *)&self->_restingView, 0);
  objc_storeStrong((id *)&self->_checkInView, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_audioDeviceController, 0);

  objc_storeStrong((id *)&self->_sosHandles, 0);
}

@end