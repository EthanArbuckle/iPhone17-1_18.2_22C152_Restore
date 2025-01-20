@interface ICSApplicationDelegate
+ (BOOL)callConnected:(id)a3;
+ (BOOL)hasCarKitRoute;
+ (BOOL)isExpanseMessagesJoinRequest:(id)a3;
+ (id)configurationForCall:(id)a3 preferredPresentationMode:(int64_t)a4;
- (AlertCoordinatorProtocol)alertCoordinator;
- (BKSProcessAssertion)processAssertion;
- (BOOL)allowsCarPlayBanners;
- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5;
- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4;
- (BOOL)application:(id)a3 openJoinConversationRequestForConversationLink:(id)a4 webpageURL:(id)a5;
- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5;
- (BOOL)bannerPresentationManagerDismissSBBannerIfNeeded;
- (BOOL)bannerPresentationManagerWantsSpringBoardIsLockedStatus;
- (BOOL)canModifyCallsForProcessHandle:(id)a3;
- (BOOL)didDeepLinkToCallDetailsView;
- (BOOL)didDeepLinkToPTTCallDetailsView;
- (BOOL)handleBackgroundLaunchURL:(id)a3;
- (BOOL)hasActiveOrPendingInCallPresentation;
- (BOOL)hasActiveOrPendingVideoMessagePresentation;
- (BOOL)hasExistingDismissedInCallScene;
- (BOOL)hasExistingFullScreenInCallScene;
- (BOOL)hasOngoingEmergencyCall;
- (BOOL)hasPresentedFullScreenCallUI;
- (BOOL)isAlertAvailable;
- (BOOL)isAnsweringMachineAvailable;
- (BOOL)isAppBlockedFromBypassingPrompt:(id)a3;
- (BOOL)isClarityBoardActive;
- (BOOL)isDefaultCallingApp:(id)a3;
- (BOOL)isFaceTimeLoggedIn;
- (BOOL)isPresentingAmbient;
- (BOOL)isPresentingFullScreenCallUI;
- (BOOL)isPresentingFullScreenOverlayCallUI;
- (BOOL)isSOSCall:(id)a3;
- (BOOL)isShowingIncomingNameUpdate;
- (BOOL)openDialRequest:(id)a3 forProcessHandle:(id)a4;
- (BOOL)openDialRequest:(id)a3 forProcessHandle:(id)a4 bypassUIPromptIfDefaultProvider:(BOOL)a5;
- (BOOL)openJoinConversationRequest:(id)a3;
- (BOOL)openSystemProviderDialRequest:(id)a3;
- (BOOL)openThirdPartyDialRequest:(id)a3;
- (BOOL)openUserInterfaceURL:(id)a3;
- (BOOL)openVideoMessagePlaybackURL:(id)a3;
- (BOOL)refreshShareableContentURL:(id)a3;
- (BOOL)shouldActivateSOS;
- (BOOL)shouldActivateSpringBoardRemoteAlertForCall:(id)a3;
- (BOOL)shouldAttemptRePresentationOfBannerOnConversationUpdate;
- (BOOL)shouldHandleBluetoothCommand;
- (BOOL)shouldIgnoreCarPlayAssertionInvalidations;
- (BOOL)shouldPresentDismissedForCall:(id)a3;
- (BOOL)shouldShowAirplaneEmergencyCallAlertForDialRequest:(id)a3;
- (BOOL)shouldShowEmergencyCallbackModeAlertForDialRequest:(id)a3;
- (BOOL)shouldShowPromptForProcessHandle:(id)a3;
- (BOOL)shouldShowRTTAlertForDialRequest:(id)a3;
- (BOOL)shouldShowScreenTimeAlertForDialRequest:(id)a3;
- (BOOL)shouldShowScreenTimeAlertForJoinConversationRequest:(id)a3;
- (BOOL)shouldShowTelephonyAccountUnavailableAlertForDialRequest:(id)a3;
- (BOOL)showScreenSharingURL:(id)a3;
- (BOOL)showSystemCallControlsURL:(id)a3;
- (BOOL)updateForegroundAppURL:(id)a3;
- (BOOL)updateForegroundAppURL:(id)a3 using:(id)a4;
- (CARSessionStatus)carKitSessionStatus;
- (CNKAnsweringMachine)answeringMachine;
- (CNKBannerPresentationManager)bannerPresentationManager;
- (CNKScreenSharingInteractionControllerFactory)screenSharingInteractionControllerFactory;
- (CNKScreenSharingStateMonitorFactory)screenSharingMonitorFactory;
- (ICSActivationContext)activationContext;
- (ICSAmbientActivityController)ambientActivityController;
- (ICSApplicationDelegateHelper)applicationDelegateHelper;
- (ICSCameraStateMonitor)cameraStateMonitor;
- (ICSCarPlayServicesController)carPlayServicesController;
- (ICSFaceTimeAvailabilityHelper)faceTimeAvailabilityHelper;
- (ICSMessageStoreClient)messageStoreClient;
- (ICSPillStateMonitor)pillStateMonitor;
- (ICSSceneManager)sceneManager;
- (NSMutableDictionary)backgroundPIPAuthorizationForSceneType;
- (NSMutableSet)allInCallScenes;
- (NSMutableSet)connectedCallIdentifiers;
- (NSMutableSet)connectedSceneSessionIdentifiers;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)inCallSceneSessionIdentifier;
- (NSTimer)bannerPresentationRequestTimer;
- (NSTimer)processAssertionTimer;
- (NSUUID)avUpgradedCallUUIDForDismissedScene;
- (NSUUID)callUUIDWaitingToPresentBanner;
- (PHAudioRoutingMenuController)routeListController;
- (PHInCallRemoteAlertShellViewController)inCallShellViewController;
- (SBSUIInCallWindowScene)currentInCallScene;
- (TTRBannerControllerProtocol)TTRBannerViewController;
- (TUCall)mostRecentlyDisconnectedAudioCall;
- (TUCall)mostRecentlyDisconnectedVideoCall;
- (TUJoinConversationRequest)currentJoinConversationRequest;
- (TURTCCallReporter)callReporter;
- (TUSenderIdentityClient)senderIdentityClient;
- (TUUIXPCHost)xpcHost;
- (UIImage)audioRouteGlyphForDevice;
- (id)audioRouteGlyphFor:(id)a3;
- (id)audioRouteMenu;
- (id)configurationForCall:(id)a3;
- (id)configurationForCallDetailsViewWithFullScreenRequest:(BOOL)a3;
- (id)configurationForGreenTea3P;
- (id)configurationForPTTSessionWithCall:(id)a3 preferredPresentationMode:(int64_t)a4;
- (id)configurationForSOS;
- (id)configurationForScreenShareBroadcast;
- (id)configurationForScreenSharingInitiallyInPiP:(BOOL)a3;
- (id)configurationForScreenTime;
- (id)currentVideoCallUsingCallContainer:(id)a3;
- (id)getEvolvedSubscriptionLabelID:(id)a3 error:(id *)a4;
- (id)incomingVideoCallUsingCallContainer:(id)a3;
- (id)isAppBlockedFromBypassingPrompt;
- (id)isDefaultCallingAppBlock;
- (id)isHandleAvailableForFaceTimeBlock;
- (id)makeAnsweringMachineWithPrivateSelf:(id)a3;
- (id)processAssertionCompletion;
- (id)remoteAlertShellViewControllerForWindowScene:(id)a3;
- (id)routesForAudioRoutingMenuController:(id)a3;
- (id)screenSharingRootViewController;
- (id)springBoardRemoteAlertOptionsForCall:(id)a3 dialRequest:(id)a4;
- (id)springBoardRemoteAlertOptionsForSOSCall;
- (id)swiftui_rootViewForSimplifiedApplicationProvider;
- (void)acquireLongPreventSuspensionAssertion;
- (void)acquirePreventSuspensionAssertion;
- (void)acquirePreventSuspensionAssertionForDuration:(double)a3;
- (void)activateSpringBoardRemoteAlertForSOSCall;
- (void)addNotificationObservers;
- (void)audioCallStatusChanged:(id)a3;
- (void)audioRoutingMenuController:(id)a3 didSelectLagunaActionForHandle:(id)a4 conversation:(id)a5;
- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4;
- (void)bannerPresentationManagerAVDowngradedGroupUUID:(id)a3;
- (void)bannerPresentationManagerBannerPresentationManagerAVUpgradedCallUUID:(id)a3;
- (void)bannerPresentationManagerDidDismissBanner;
- (void)bannerPresentationManagerRequestToPresentBanner:(id)a3;
- (void)bannerPresentationManagerShowFullscreenCallDetailsView;
- (void)bannerPresentationManagerShowFullscreenPTTCallDetailsView;
- (void)bannerPresentationManagerShowFullscreenUI;
- (void)bannerPresentationManagerUpdatedControlsManagerCallUUID:(id)a3;
- (void)callDisplayContextChangedNotification:(id)a3;
- (void)callStatusChanged:(id)a3;
- (void)cleanupTTRBanner;
- (void)configureDialRequest:(id)a3 forProcessHandle:(id)a4;
- (void)configureDialRequest:(id)a3 forProcessHandle:(id)a4 bypassUIPromptIfDefaultProvider:(BOOL)a5;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4 fromOldConversation:(id)a5;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4;
- (void)conversationManager:(id)a3 sharePlayAvailableChanged:(BOOL)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)dialRequestForDefaultCallingConfiguredDialRequest:(id)a3 completion:(id)a4;
- (void)dismissAnsweredCallBannerIfNeeded;
- (void)dismissClarityUIScene;
- (void)dismissInCallSceneOfType:(unint64_t)a3;
- (void)dismissInCallSceneSession;
- (void)dismissPTTSessionPresentation;
- (void)dismissScreenSharingBroadcasterSession;
- (void)dismissScreenSharingSceneSession;
- (void)dismissVideoMessageSceneSession;
- (void)fetchInCallUIState:(id)a3;
- (void)fetchRemoteControlStatus:(id)a3;
- (void)handleAlertInvokedNotification:(id)a3;
- (void)handleCallStatusChangedNotification:(id)a3;
- (void)handleHeadsetButtonPressForCall:(id)a3 sourceIdentifier:(id)a4;
- (void)handleHeadsetButtonPressForCall:(id)a3 sourceIdentifier:(id)a4 urlOptions:(id)a5;
- (void)handleLockScreenStatusChangedNotification:(id)a3;
- (void)handleRedialCommandWhileScreening:(id)a3;
- (void)handleStateChangeForAVLessConversation:(id)a3 fromConversation:(id)a4;
- (void)handleSupportsEmergencyFallbackChangedForCall:(id)a3;
- (void)handleSupportsEmergencyFallbackChangedNotification:(id)a3;
- (void)handleTUCallTTYTypeChangedNotification:(id)a3;
- (void)hideCarPlayUI;
- (void)initiateCallForConversationRequest:(id)a3;
- (void)initiateCallForDialRequest:(id)a3 completionHandler:(id)a4;
- (void)installCameraStateMonitor;
- (void)installPillStateMonitor;
- (void)invalidatePreventSuspensionAssertion;
- (void)isHandleAvailableForFaceTime:(id)a3 completion:(id)a4;
- (void)performDismissedPresentationForCallDetailsView;
- (void)performFullScreenPresentationForCallDetailsView;
- (void)performPersentationForScreenSharingObserver;
- (void)performPresentationForSOS;
- (void)performPresentationForScreenSharingInitiallyInPiP:(BOOL)a3;
- (void)performPresentationForScreenTime;
- (void)performPresentationForVideoMessage;
- (void)performPresentationWithConfiguration:(id)a3 forSceneType:(unint64_t)a4;
- (void)prepareForAmbientScene:(id)a3;
- (void)presentDismissedPTTSceneForCall:(id)a3;
- (void)prewarmBannerPresentationManager;
- (void)requestBackgroundPiPAuthorizationForSceneType:(unint64_t)a3 withConfiguration:(id)a4;
- (void)requestBackgroundPiPAuthorizationOfDismissedInCallSceneForCall:(id)a3;
- (void)requestClarityBoardPresentationForCall:(id)a3 dialRequest:(id)a4;
- (void)requestClarityBoardPresentationForSOS;
- (void)requestFullScreenSpringBoardPresentationForCallDetailsView;
- (void)requestGreenTea3PPresentationForCall:(id)a3;
- (void)requestHandoffEligibleConversationPresentation;
- (void)requestLagunaPullConversationPresentation;
- (void)requestPTTPresentation:(int64_t)a3 forCall:(id)a4;
- (void)requestPresentationForCall:(id)a3 dialRequest:(id)a4;
- (void)requestPresentationForCall:(id)a3 dialRequest:(id)a4 tappedPill:(BOOL)a5;
- (void)requestSpringBoardPresentationForCall:(id)a3 dialRequest:(id)a4 tappedPill:(BOOL)a5;
- (void)requestSpringBoardPresentationForCallDetailsView;
- (void)requestSpringBoardPresentationForSOS;
- (void)requestSpringBoardPresentationForScreenSharingAsPiP:(BOOL)a3;
- (void)requestSpringBoardPresentationForScreenSharingBroadcaster:(id)a3;
- (void)requestSpringBoardPresentationForScreenTime;
- (void)revokeAndRemoveBackgroundPiPAuthorizationForSceneTypeIfNeeded:(unint64_t)a3;
- (void)routesChangedForRouteController:(id)a3;
- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4;
- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingBroadcastingState:(BOOL)a4;
- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingState:(BOOL)a4;
- (void)setActivationContext:(id)a3;
- (void)setAlertCoordinator:(id)a3;
- (void)setAllInCallScenes:(id)a3;
- (void)setAllowsCarPlayBanners:(BOOL)a3;
- (void)setApplicationDelegateHelper:(id)a3;
- (void)setAvUpgradedCallUUIDForDismissedScene:(id)a3;
- (void)setBackgroundPIPAuthorizationForSceneType:(id)a3;
- (void)setBannerPresentationManager:(id)a3;
- (void)setBannerPresentationRequestTimer:(id)a3;
- (void)setCallReporter:(id)a3;
- (void)setCallUUIDWaitingToPresentBanner:(id)a3;
- (void)setCameraStateMonitor:(id)a3;
- (void)setCarKitSessionStatus:(id)a3;
- (void)setConnectedCallIdentifiers:(id)a3;
- (void)setConnectedSceneSessionIdentifiers:(id)a3;
- (void)setCurrentJoinConversationRequest:(id)a3;
- (void)setDidDeepLinkToCallDetailsView:(BOOL)a3;
- (void)setDidDeepLinkToPTTCallDetailsView:(BOOL)a3;
- (void)setFaceTimeAvailabilityHelper:(id)a3;
- (void)setIsAppBlockedFromBypassingPrompt:(id)a3;
- (void)setIsDefaultCallingAppBlock:(id)a3;
- (void)setIsHandleAvailableForFaceTimeBlock:(id)a3;
- (void)setIsPresentingAmbient:(BOOL)a3;
- (void)setIsShowingIncomingNameUpdate:(BOOL)a3;
- (void)setMessageStoreClient:(id)a3;
- (void)setMostRecentlyDisconnectedAudioCall:(id)a3;
- (void)setMostRecentlyDisconnectedVideoCall:(id)a3;
- (void)setPillStateMonitor:(id)a3;
- (void)setProcessAssertion:(id)a3;
- (void)setProcessAssertionCompletion:(id)a3;
- (void)setProcessAssertionTimer:(id)a3;
- (void)setRouteListController:(id)a3;
- (void)setSceneManager:(id)a3;
- (void)setScreenSharingMonitorFactory:(id)a3;
- (void)setShouldAttemptRePresentationOfBannerOnConversationUpdate:(BOOL)a3;
- (void)setShouldIgnoreCarPlayAssertionInvalidations:(BOOL)a3;
- (void)setTTRBannerViewController:(id)a3;
- (void)setXpcHost:(id)a3;
- (void)shouldHandleMRCommand:(unsigned int)a3 completion:(id)a4;
- (void)shouldHandleMRCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5;
- (void)showBannerIfNecessaryForHandoffEligibleConversation;
- (void)showCallControlsForCurrentContext;
- (void)showCarPlayUIWithActivation:(BOOL)a3;
- (void)showOrCreateCallForConversationRequest:(id)a3;
- (void)startOrResetTimerForDuration:(double)a3;
- (void)startSOSFlowWithActivationReason:(id)a3;
- (void)startScreenTimeFlowWithURL:(id)a3;
- (void)transitionFromAmbientScene;
- (void)transitionSceneToOverlayForSOS;
- (void)transitionSceneToOverlayForScreenTime;
- (void)transitionScenetoOverlayAndDismissCMASAlerts:(BOOL)a3;
- (void)updateDialRequestAccountIfNecessary:(id)a3;
- (void)updatePrefersBannersHiddenFromClonedDisplay;
- (void)updatePresentationIfNecessaryForGreenTea3PCall:(id)a3;
- (void)updateRemoteAlertStateIfNecessaryForCall:(id)a3;
- (void)videoCallStatusChanged:(id)a3;
@end

@implementation ICSApplicationDelegate

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICSApplicationDelegate;
  [(ICSApplicationDelegate *)&v4 dealloc];
}

- (BOOL)application:(id)a3 didFinishLaunchingWithOptions:(id)a4
{
  id v81 = a3;
  id v6 = a4;
  v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v96 = v81;
    __int16 v97 = 2112;
    id v98 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@, didFinishLaunchingWithOptions: %@", buf, 0x16u);
  }

  v92.receiver = self;
  v92.super_class = (Class)ICSApplicationDelegate;
  BOOL v80 = [(PHApplicationDelegate *)&v92 application:v81 didFinishLaunchingWithOptions:v6];
  if (v80)
  {
    v8 = (CNKScreenSharingStateMonitorFactory *)objc_opt_new();
    screenSharingMonitorFactory = self->_screenSharingMonitorFactory;
    self->_screenSharingMonitorFactory = v8;

    v10 = (CNKScreenSharingInteractionControllerFactory *)objc_opt_new();
    screenSharingInteractionControllerFactory = self->_screenSharingInteractionControllerFactory;
    self->_screenSharingInteractionControllerFactory = v10;

    [(ICSApplicationDelegate *)self addNotificationObservers];
    [(ICSApplicationDelegate *)self installCameraStateMonitor];
    [(ICSApplicationDelegate *)self installPillStateMonitor];
    id v12 = objc_alloc((Class)TURTCCallReporter);
    v13 = +[TUCallCenter sharedInstance];
    v14 = (TURTCCallReporter *)[v12 initWithCallCenter:v13];
    callReporter = self->_callReporter;
    self->_callReporter = v14;

    answeringMachine = [(PHApplicationDelegate *)self featureFlags];
    if (TUCallScreeningActivatable())
    {
      v17 = [(ICSApplicationDelegate *)self answeringMachine];
      BOOL v18 = v17 == 0;

      if (!v18)
      {
LABEL_8:
        TURegisterIDSAvailabilityListener();
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1002CE3E8);
        id v20 = objc_alloc_init((Class)NSMutableSet);
        [(ICSApplicationDelegate *)self setAllInCallScenes:v20];

        id v21 = objc_alloc_init((Class)NSMutableSet);
        [(ICSApplicationDelegate *)self setConnectedSceneSessionIdentifiers:v21];

        id v22 = objc_alloc_init((Class)NSMutableSet);
        [(ICSApplicationDelegate *)self setConnectedCallIdentifiers:v22];

        v23 = objc_alloc_init(ICSSceneManager);
        [(ICSApplicationDelegate *)self setSceneManager:v23];

        v24 = +[NSMutableDictionary dictionaryWithCapacity:2];
        [(ICSApplicationDelegate *)self setBackgroundPIPAuthorizationForSceneType:v24];

        id v25 = objc_alloc_init((Class)CARSessionStatus);
        [(ICSApplicationDelegate *)self setCarKitSessionStatus:v25];

        v26 = [ICSAmbientActivityController alloc];
        v27 = +[TUCallCenter sharedInstance];
        v28 = +[NSNotificationCenter defaultCenter];
        v29 = [(ICSApplicationDelegate *)self sceneManager];
        v30 = [(ICSAmbientActivityController *)v26 initWithCallCenter:v27 notificationCenter:v28 sceneManager:v29];
        ambientActivityController = self->_ambientActivityController;
        self->_ambientActivityController = v30;

        v32 = +[TUCallCenter sharedInstance];
        uint64_t v78 = [v32 frontmostAudioOrVideoCall];

        [(ICSApplicationDelegate *)self updateRemoteAlertStateIfNecessaryForCall:v78];
        if (!v78) {
          [(ICSApplicationDelegate *)self showBannerIfNecessaryForHandoffEligibleConversation];
        }
        v33 = +[TUCallCenter sharedInstance];
        v34 = [v33 callServicesClientCapabilities];
        [v34 setWantsCallStopStreamingOnInvalidation:1];

        v35 = +[TUCallCenter sharedInstance];
        v36 = [v35 callServicesClientCapabilities];
        [v36 setWantsCallNotificationsDisabledWhileSuspended:1];

        v37 = +[TUCallCenter sharedInstance];
        v38 = [v37 callServicesClientCapabilities];
        [v38 save];

        v39 = +[TUCallCenter sharedInstance];
        v40 = [v39 routeController];
        [v40 addDelegate:self];

        v41 = [(PHApplicationDelegate *)self featureFlags];
        if ([v41 conversationOneToOneModeEnabled]) {
          uint64_t v42 = 2;
        }
        else {
          uint64_t v42 = 0;
        }
        v43 = +[TUCallCenter sharedInstance];
        v44 = [v43 conversationManager];
        [v44 setNonSessionBackedConversationCreationMode:v42];

        v45 = +[TUCallCenter sharedInstance];
        v46 = [v45 conversationManager];
        [v46 setNonSessionBackedConversationCreationQueue:&_dispatch_main_q];

        id v47 = [objc_alloc((Class)TUUIXPCHost) initWithDelegate:self delegateQueue:&_dispatch_main_q];
        [(ICSApplicationDelegate *)self setXpcHost:v47];

        v48 = +[TUCallCenter sharedInstance];
        v49 = [(ICSApplicationDelegate *)self xpcHost];
        v50 = [v49 endpoint];
        [v48 registerAnonymousXPCEndpoint:v50];

        long long v90 = 0u;
        long long v91 = 0u;
        long long v88 = 0u;
        long long v89 = 0u;
        v51 = +[TUCallCenter sharedInstance];
        v52 = [v51 currentVideoCalls];

        id v53 = [v52 countByEnumeratingWithState:&v88 objects:v94 count:16];
        if (v53)
        {
          uint64_t v54 = *(void *)v89;
          do
          {
            for (i = 0; i != v53; i = (char *)i + 1)
            {
              if (*(void *)v89 != v54) {
                objc_enumerationMutation(v52);
              }
              v56 = *(void **)(*((void *)&v88 + 1) + 8 * i);
              if (([v56 isConversation] & 1) == 0)
              {
                v57 = +[TUCallCenter sharedInstance];
                v58 = [v57 conversationManager];
                [v58 updateConversationsNotBackedByGroupSessionWithCall:v56];
              }
            }
            id v53 = [v52 countByEnumeratingWithState:&v88 objects:v94 count:16];
          }
          while (v53);
        }

        v59 = +[TUCallCenter sharedInstance];
        v60 = [v59 conversationManager];
        [v60 addDelegate:self queue:&_dispatch_main_q];

        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        v61 = +[TUCallCenter sharedInstance];
        v62 = [v61 conversationManager];
        v63 = [v62 activeConversations];

        id v64 = [v63 countByEnumeratingWithState:&v84 objects:v93 count:16];
        if (v64)
        {
          uint64_t v65 = *(void *)v85;
          do
          {
            for (j = 0; j != v64; j = (char *)j + 1)
            {
              if (*(void *)v85 != v65) {
                objc_enumerationMutation(v63);
              }
              uint64_t v67 = *(void *)(*((void *)&v84 + 1) + 8 * (void)j);
              v68 = +[TUCallCenter sharedInstance];
              v69 = [v68 conversationManager];
              [(ICSApplicationDelegate *)self conversationManager:v69 addedActiveConversation:v67];
            }
            id v64 = [v63 countByEnumeratingWithState:&v84 objects:v93 count:16];
          }
          while (v64);
        }

        [(ICSApplicationDelegate *)self prewarmBannerPresentationManager];
        v70 = [(PHApplicationDelegate *)self featureFlags];
        unsigned int v71 = [v70 nameAndPhotoEnabled];

        if (v71)
        {
          v72 = +[IMDaemonController sharedInstance];
          [v72 addListenerID:TUBundleIdentifierInCallServiceApplication capabilities:kFZListenerCapAccounts];
        }
        v73 = objc_alloc_init(ICSApplicationDelegateHelper);
        applicationDelegateHelper = self->_applicationDelegateHelper;
        self->_applicationDelegateHelper = v73;

        v75 = objc_alloc_init(ICSFaceTimeAvailabilityHelper);
        faceTimeAvailabilityHelper = self->_faceTimeAvailabilityHelper;
        self->_faceTimeAvailabilityHelper = v75;

        objc_initWeak((id *)buf, self);
        v82[0] = _NSConcreteStackBlock;
        v82[1] = 3221225472;
        v82[2] = sub_10004EB6C;
        v82[3] = &unk_1002CE410;
        objc_copyWeak(&v83, (id *)buf);
        [(ICSApplicationDelegateHelper *)self->_applicationDelegateHelper setOpenDialRequestBlock:v82];
        +[CNKNameAndPhotoUtilities prewarm];
        objc_destroyWeak(&v83);
        objc_destroyWeak((id *)buf);

        goto LABEL_32;
      }
      v19 = [(ICSApplicationDelegate *)self makeAnsweringMachineWithPrivateSelf:self];
      answeringMachine = self->_answeringMachine;
      self->_answeringMachine = v19;
    }

    goto LABEL_8;
  }
LABEL_32:

  return v80;
}

- (BOOL)application:(id)a3 openURL:(id)a4 options:(id)a5
{
  v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_1000D5130();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v61 = v8;
    __int16 v62 = 2112;
    id v63 = v9;
    __int16 v64 = 2112;
    id v65 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@, url: %@ options: %@", buf, 0x20u);
  }

  id v12 = sub_1000D5130();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v13 = [v9 isLaunchForScreeningURL];
    CFStringRef v14 = @"NO";
    if (v13) {
      CFStringRef v14 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v61 = v14;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Are we launched for screening: %@", buf, 0xCu);
  }

  v15 = +[TUCallCenter sharedInstance];
  [v15 fetchCurrentCalls];

  if ([(ICSApplicationDelegate *)self isSOSCall:v9])
  {
    v16 = sub_1000D5130();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "SOS url detected", buf, 2u);
    }

    v17 = [v9 sos_urlActivationReason];
    [(ICSApplicationDelegate *)self startSOSFlowWithActivationReason:v17];

    goto LABEL_14;
  }
  if ([v9 isShowInCallUIURL] || objc_msgSend(v9, "isShowKeypadURL")) {
    goto LABEL_13;
  }
  if ([v9 isShowSystemCallControlsURL])
  {
    if (!TUCallScreeningEnabled()
      || (+[TUCallCenter sharedInstance],
          v19 = objc_claimAutoreleasedReturnValue(),
          [v19 frontmostCall],
          id v20 = objc_claimAutoreleasedReturnValue(),
          unsigned int v21 = [v20 isScreening],
          v20,
          v19,
          !v21))
    {
      if ([(ICSApplicationDelegate *)self showSystemCallControlsURL:v9]) {
        goto LABEL_14;
      }
      goto LABEL_19;
    }
LABEL_13:
    if ([(ICSApplicationDelegate *)self openUserInterfaceURL:v9])
    {
LABEL_14:
      BOOL v18 = 1;
      goto LABEL_20;
    }
LABEL_19:
    v53.receiver = self;
    v53.super_class = (Class)ICSApplicationDelegate;
    BOOL v18 = [(PHApplicationDelegate *)&v53 application:v8 openURL:v9 options:v10];
    goto LABEL_20;
  }
  if ([v9 isShowHandoffEligibleNearbyURL]
    || [v9 isShowLagunaPullConversationURL])
  {
    goto LABEL_13;
  }
  if ([v9 isShowScreenSharingURL])
  {
    if ([(ICSApplicationDelegate *)self showScreenSharingURL:v9]) {
      goto LABEL_14;
    }
    goto LABEL_19;
  }
  if ([v9 isShowIncomingTransmissionNoticeURL]
    || [v9 isShowAccessoryButtonEventsNoticeURL])
  {
    goto LABEL_13;
  }
  if ([v9 isUpdateForegroundAppURL])
  {
    if ([(ICSApplicationDelegate *)self updateForegroundAppURL:v9]) {
      goto LABEL_14;
    }
    goto LABEL_19;
  }
  if ([v9 isRefreshShareableContentURL])
  {
    if ([(ICSApplicationDelegate *)self refreshShareableContentURL:v9]) {
      goto LABEL_14;
    }
    goto LABEL_19;
  }
  if ([v9 isFaceTimeMultiwayURL])
  {
    id v23 = [objc_alloc((Class)TUJoinConversationRequest) initWithURL:v9];
    if (!v23) {
      goto LABEL_19;
    }
    v24 = v23;
    id v25 = [v10 objectForKey:_UIApplicationOpenURLOptionsSourceProcessHandleKey];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v26 = ([v24 showUIPrompt] & 1) != 0
         || [(ICSApplicationDelegate *)self shouldShowPromptForProcessHandle:v25];
      [v24 setShowUIPrompt:v26];
      unsigned __int8 v27 = [(ICSApplicationDelegate *)self openJoinConversationRequest:v24];
LABEL_49:
      unsigned __int8 v29 = v27;

      if (v29) {
        goto LABEL_14;
      }
      goto LABEL_19;
    }
    v28 = sub_1000D5130();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1001E9A08((uint64_t)v25);
    }
LABEL_46:

    goto LABEL_19;
  }
  if ([v9 isFaceTimeOpenLinkURL])
  {
    v24 = [v9 conversationLinkURLForOpenLinkURL];
    id v25 = +[TUConversationLink conversationLinkForURL:v24];
    unsigned __int8 v27 = [(ICSApplicationDelegate *)self application:v8 openJoinConversationRequestForConversationLink:v25 webpageURL:v9];
    goto LABEL_49;
  }
  if ([v9 isLaunchForIncomingCallURL]) {
    goto LABEL_13;
  }
  if ([v9 isAnswerRequestURL])
  {
    v24 = +[TUCallCenter sharedInstance];
    id v25 = [(ICSApplicationDelegate *)self incomingVideoCallUsingCallContainer:v24];
    v28 = [v9 answerRequestSourceIdentifier];
    [(ICSApplicationDelegate *)self handleHeadsetButtonPressForCall:v25 sourceIdentifier:v28 urlOptions:v10];
    goto LABEL_46;
  }
  if ([v9 isFaceTimeNeedsBackgroundLaunchURL])
  {
    if ([(ICSApplicationDelegate *)self handleBackgroundLaunchURL:v9]) {
      goto LABEL_14;
    }
    goto LABEL_19;
  }
  if ([v9 isVideoMessagePlaybackURL])
  {
    if ([(ICSApplicationDelegate *)self openVideoMessagePlaybackURL:v9]) {
      goto LABEL_14;
    }
    goto LABEL_19;
  }
  if ([v9 isLaunchForScreeningURL])
  {
    v30 = sub_1000D5130();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(ICSApplicationDelegate *)self answeringMachine];
      *(_DWORD *)buf = 138412290;
      CFStringRef v61 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Launched for screening %@", buf, 0xCu);
    }
    v32 = [(ICSApplicationDelegate *)self answeringMachine];
    [v32 openURL:v9 completion:&stru_1002CE430];

    goto LABEL_14;
  }
  v33 = +[UIApplication sharedApplication];
  if ([v33 isRunningTest:@"PlaceOutgoingCall"])
  {

    goto LABEL_64;
  }
  v34 = +[UIApplication sharedApplication];
  unsigned int v35 = [v34 isRunningTest:@"FaceTimePlaceOutgoingCall"];

  if (v35)
  {
LABEL_64:
    v36 = +[UIApplication sharedApplication];
    [v36 finishedSubTest:@"applicationOpenURL" forTest:qword_10032CBD0];

    v37 = +[UIApplication sharedApplication];
    uint64_t v38 = qword_10032CBD0;
    CFStringRef v59 = @"time";
    v39 = +[NSArray arrayWithObjects:&v59 count:1];
    [v37 startedSubTest:@"CreateDialRequest" forTest:v38 withMetrics:v39];

    v40 = (__CFString *)[objc_alloc((Class)TUDialRequest) initWithURL:v9];
    v41 = sub_1000D5130();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v61 = v40;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Running test, made dial request: %@", buf, 0xCu);
    }

    uint64_t v42 = +[UIApplication sharedApplication];
    [v42 finishedSubTest:@"CreateDialRequest" forTest:qword_10032CBD0];

    v43 = [(ICSApplicationDelegate *)self applicationDelegateHelper];
    v44 = [(ICSApplicationDelegate *)self applicationDelegateHelper];
    unsigned __int8 v45 = [v43 openDialRequestIfNecessary:v40 options:v10 bypassUIPromptIfDefaultProvider:[v44 isDefaultOrTelephonyScheme:v9]];

    if (v45) {
      goto LABEL_14;
    }
    goto LABEL_19;
  }
  v46 = (__CFString *)[objc_alloc((Class)TUDialRequest) initWithURL:v9];
  id v47 = sub_1000D5130();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v61 = v46;
    _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Not running test, made dial request: %@", buf, 0xCu);
  }

  v48 = [(PHApplicationDelegate *)self featureFlags];
  unsigned int v49 = [v48 defaultCallingAppsGracefulFallbackEnabled];

  if (v49)
  {
    if (v46)
    {
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_10004F540;
      v55[3] = &unk_1002CE458;
      v55[4] = self;
      id v56 = v10;
      id v57 = v9;
      [(ICSApplicationDelegate *)self dialRequestForDefaultCallingConfiguredDialRequest:v46 completion:v55];

      BOOL v18 = 1;
    }
    else
    {
      v58.receiver = self;
      v58.super_class = (Class)ICSApplicationDelegate;
      BOOL v18 = [(PHApplicationDelegate *)&v58 application:v8 openURL:v9 options:v10];
    }
  }
  else
  {
    uint64_t v50 = [(__CFString *)v46 dialRequestWithURLStripping];

    v51 = [(ICSApplicationDelegate *)self applicationDelegateHelper];
    int v52 = [v51 configureAndOpenDialRequestForDualSIMIfNecessary:v50 options:v10 url:v9];

    if (v52)
    {
      BOOL v18 = 1;
    }
    else
    {
      v54.receiver = self;
      v54.super_class = (Class)ICSApplicationDelegate;
      BOOL v18 = [(PHApplicationDelegate *)&v54 application:v8 openURL:v9 options:v10];
    }
    v46 = (__CFString *)v50;
  }

LABEL_20:
  return v18;
}

- (BOOL)application:(id)a3 continueUserActivity:(id)a4 restorationHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v55 = v7;
    __int16 v56 = 2112;
    id v57 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@, continueUserActivity: %@", buf, 0x16u);
  }

  id v10 = +[TUCallCenter sharedInstance];
  [v10 fetchCurrentCalls];

  v11 = [v8 activityType];
  if ([v11 isEqual:NSUserActivityTypeBrowsingWeb])
  {
    id v12 = [v8 webpageURL];

    if (v12)
    {
      unsigned int v13 = [v8 webpageURL];
      CFStringRef v14 = +[TUConversationLink conversationLinkForURL:v13];

      id v15 = [v8 webpageURL];
      BOOL v16 = [(ICSApplicationDelegate *)self application:v7 openJoinConversationRequestForConversationLink:v14 webpageURL:v15];
LABEL_58:

      goto LABEL_59;
    }
  }
  else
  {
  }
  v17 = [(PHApplicationDelegate *)self featureFlags];
  if ([v17 conversationHandoffEnabled])
  {
    BOOL v18 = [v8 activityType];
    unsigned int v19 = [v18 isEqualToString:TUUserActivityTypeConversationHandoff];

    if (v19)
    {
      CFStringRef v14 = +[TUCallCenter sharedInstance];
      [v14 continueHandoffEligibleConversation];
      BOOL v16 = 1;
      goto LABEL_59;
    }
  }
  else
  {
  }
  id v20 = [v8 activityType];
  unsigned int v21 = [v20 isEqualToString:TUUserActivityTypeJoinConversationRequest];

  if (!v21)
  {
    id v25 = [v8 interaction];
    CFStringRef v14 = [v25 intentResponse];

    BOOL v26 = [v8 dialRequestAttachment];
    unsigned __int8 v27 = v26;
    if (v26)
    {
      id v15 = v26;
    }
    else
    {
      unsigned __int8 v29 = [v14 userActivity];
      id v15 = [v29 dialRequestAttachment];
    }
    v30 = [v8 joinRequestAttachment];
    v31 = v30;
    if (v30)
    {
      id v32 = v30;
    }
    else
    {
      v33 = [v14 userActivity];
      id v32 = [v33 joinRequestAttachment];
    }
    if (v15)
    {
      v34 = sub_1000D5130();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v15;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Opening TUDialRequest from NSUserActivity attachment: %@", buf, 0xCu);
      }

      if (![v15 originatingUIType])
      {
        unsigned int v35 = sub_1000D5130();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Setting dialRequest originatingUIType to Siri", buf, 2u);
        }

        [v15 setOriginatingUIType:11];
      }
      unsigned int v36 = [v15 originatingUIType];
      v37 = +[BSProcessHandle processHandle];
      BOOL v16 = [(ICSApplicationDelegate *)self openDialRequest:v15 forProcessHandle:v37];

LABEL_40:
      if (v36 == 11) {
        +[TPTipsHelper donateEventOriginatedCallWithSiri];
      }
      goto LABEL_57;
    }
    if (v32)
    {
      uint64_t v38 = sub_1000D5130();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v32;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Opening TUJoinConversationRequest from NSUserActivity attachment: %@", buf, 0xCu);
      }

      if (![v32 originatingUIType])
      {
        v39 = sub_1000D5130();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Setting joinRequest originatingUIType to Siri", buf, 2u);
        }

        [v32 setOriginatingUIType:11];
      }
      unsigned int v36 = [v32 originatingUIType];
      BOOL v16 = [(ICSApplicationDelegate *)self openJoinConversationRequest:v32];
      goto LABEL_40;
    }
    id v40 = [objc_alloc((Class)TUJoinConversationRequest) initWithUserActivity:v8];
    v41 = v40;
    if (v40)
    {
      uint64_t v42 = [v40 remoteMembers];
      id v43 = [v42 count];

      if ((unint64_t)v43 >= 2)
      {
        v44 = sub_1000D5130();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v55 = v41;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "More than one valid contact found. Making a group facetime call with joinRequest: %@", buf, 0xCu);
        }

        BOOL v16 = [(ICSApplicationDelegate *)self openJoinConversationRequest:v41];
        goto LABEL_56;
      }
    }
    unsigned __int8 v45 = [v8 activityType];
    if (([v45 isEqualToString:TUDialRequestUserActivityTypeCall] & 1) == 0)
    {
      v46 = [v8 activityType];
      if (![v46 isEqualToString:TUDialRequestUserActivityTypeAudioCall])
      {
        v51 = [v8 activityType];
        unsigned __int8 v52 = [v51 isEqualToString:TUDialRequestUserActivityTypeVideoCall];

        if ((v52 & 1) == 0)
        {
          BOOL v16 = 0;
LABEL_56:

LABEL_57:
          goto LABEL_58;
        }
LABEL_51:
        id v47 = [objc_alloc((Class)TUDialRequest) initWithUserActivity:v8];
        v48 = v47;
        if (v47 && [v47 isValid])
        {
          unsigned int v49 = +[BSProcessHandle processHandle];
          BOOL v16 = [(ICSApplicationDelegate *)self openDialRequest:v48 forProcessHandle:v49];
        }
        else
        {
          BOOL v16 = 0;
        }

        goto LABEL_56;
      }
    }
    goto LABEL_51;
  }
  id v22 = [v8 userInfo];
  CFStringRef v14 = [v22 objectForKeyedSubscript:TUUserActivityJoinConversationRequestUserInfoKey];

  id v53 = 0;
  id v23 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v14 error:&v53];
  id v24 = v53;
  if (v23)
  {
    BOOL v16 = [(ICSApplicationDelegate *)self openJoinConversationRequest:v23];
  }
  else
  {
    v28 = sub_1000D5130();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1001E9A78();
    }

    BOOL v16 = 0;
  }

LABEL_59:
  return v16;
}

- (BOOL)application:(id)a3 openJoinConversationRequestForConversationLink:(id)a4 webpageURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    objc_initWeak(&location, self);
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_100050194;
    v38[3] = &unk_1002CE480;
    objc_copyWeak(&v41, &location);
    id v39 = v9;
    id v40 = self;
    v11 = objc_retainBlock(v38);
    id v12 = +[FTDeviceSupport sharedInstance];
    unsigned __int8 v13 = [v12 faceTimeAvailable];

    if (v13)
    {
      CFStringRef v14 = [(PHApplicationDelegate *)self featureFlags];
      if ([v14 greenTeaLinksEnabled])
      {

        goto LABEL_12;
      }
      unsigned __int8 v18 = +[TUConversationManager supportsConversations];

      if (v18)
      {
LABEL_12:
        if ([(ICSApplicationDelegate *)self isFaceTimeLoggedIn])
        {
          unsigned int v19 = +[TUCallCenter sharedInstance];
          unsigned int v20 = [v19 hasCurrentCalls];

          if (!v20)
          {
            LODWORD(v16) = ((unsigned __int8 (*)(void *))v11[2])(v11);
LABEL_33:

            objc_destroyWeak(&v41);
            objc_destroyWeak(&location);
            goto LABEL_34;
          }
          unsigned int v21 = [ICSInterruptCallAlert alloc];
          v34[0] = _NSConcreteStackBlock;
          v34[1] = 3221225472;
          v34[2] = sub_100050334;
          v34[3] = &unk_1002CDA98;
          unsigned int v35 = v11;
          id v22 = [(ICSInterruptCallAlert *)v21 initWithCallback:v34];
          [(ICSInterruptCallAlert *)v22 show];

          LOBYTE(v16) = 0;
          v17 = v35;
        }
        else
        {
          id v23 = sub_1000D5130();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Cannot open FaceTime link since the user is not logged into FaceTime", buf, 2u);
          }

          id v24 = objc_alloc((Class)LSApplicationRecord);
          id v25 = TUPreferredFaceTimeBundleIdentifier();
          id v37 = 0;
          id v16 = [v24 initWithBundleIdentifier:v25 allowPlaceholder:0 error:&v37];
          v17 = v37;

          if (!v16)
          {
            BOOL v26 = sub_1000D5130();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
            {
              unsigned __int8 v27 = TUPreferredFaceTimeBundleIdentifier();
              sub_1001E9B48(v27, (uint64_t)v17, buf, v26);
            }
          }
          v28 = [v16 applicationState];
          unsigned int v29 = [v28 isInstalled];

          if (v29)
          {
            v30 = sub_1000D5130();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)unsigned int v36 = 0;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Opening FaceTime application to login screen", v36, 2u);
            }

            TUOpenFaceTimeAppWithCompletion();
          }
          else
          {
            v31 = sub_1000D5130();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)unsigned int v36 = 0;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Opening Settings application to allow user to sign into FaceTime since the FaceTime application is not installed", v36, 2u);
            }

            id v32 = +[NSURL URLWithString:@"prefs:root=FaceTime"];
            TUOpenSensitiveURL();
          }
          LOBYTE(v16) = 1;
        }
LABEL_32:

        goto LABEL_33;
      }
      v17 = sub_1000D5130();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1001E9BB0();
      }
    }
    else
    {
      v17 = sub_1000D5130();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1001E9BE4();
      }
    }
    LOBYTE(v16) = 0;
    goto LABEL_32;
  }
  id v15 = sub_1000D5130();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1001E9AE0();
  }

  LOBYTE(v16) = 0;
LABEL_34:

  return (char)v16;
}

- (BOOL)isFaceTimeLoggedIn
{
  if (TUIsIDSAvailableForFaceTime())
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    v3 = +[IMAccountController sharedInstance];
    objc_super v4 = +[IMService facetimeService];
    v5 = [v3 accountsForService:v4];

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v6 = v5;
    id v2 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v2)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (i = 0; i != v2; i = (char *)i + 1)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v6);
          }
          if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "registrationStatus", (void)v10) == (id)5)
          {
            LOBYTE(v2) = 1;
            goto LABEL_13;
          }
        }
        id v2 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v2) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return (char)v2;
}

- (BOOL)isSOSCall:(id)a3
{
  return [a3 isSOS];
}

- (BOOL)isAnsweringMachineAvailable
{
  id v2 = [(ICSApplicationDelegate *)self answeringMachine];
  unsigned __int8 v3 = [v2 isEnabled];

  return v3;
}

- (void)setMostRecentlyDisconnectedAudioCall:(id)a3
{
  v5 = (TUCall *)a3;
  p_mostRecentlyDisconnectedAudioCall = &self->_mostRecentlyDisconnectedAudioCall;
  mostRecentlyDisconnectedAudioCall = self->_mostRecentlyDisconnectedAudioCall;
  if (mostRecentlyDisconnectedAudioCall != v5)
  {
    long long v10 = v5;
    id v8 = mostRecentlyDisconnectedAudioCall;
    objc_storeStrong((id *)p_mostRecentlyDisconnectedAudioCall, a3);
    if (!v10)
    {
      id v9 = +[NSNotificationCenter defaultCenter];
      [v9 postNotificationName:@"ICSApplicationDelegateMostRecentlyDisconnectedAudioCallDidClearNotification" object:v8];
    }
    v5 = v10;
  }
}

- (TUSenderIdentityClient)senderIdentityClient
{
  senderIdentityClient = self->_senderIdentityClient;
  if (!senderIdentityClient)
  {
    objc_super v4 = (TUSenderIdentityClient *)objc_alloc_init((Class)TUSenderIdentityClient);
    v5 = self->_senderIdentityClient;
    self->_senderIdentityClient = v4;

    senderIdentityClient = self->_senderIdentityClient;
  }

  return senderIdentityClient;
}

- (id)getEvolvedSubscriptionLabelID:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() telephonyClient];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(id)objc_opt_class() telephonyClient];
    id v9 = [v8 getEvolvedSubscriptionLabelID:v5 error:a4];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (ICSCarPlayServicesController)carPlayServicesController
{
  carPlayServicesController = self->_carPlayServicesController;
  if (!carPlayServicesController)
  {
    objc_super v4 = objc_alloc_init(ICSCarPlayServicesController);
    id v5 = self->_carPlayServicesController;
    self->_carPlayServicesController = v4;

    carPlayServicesController = self->_carPlayServicesController;
  }

  return carPlayServicesController;
}

- (void)showCarPlayUIWithActivation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "", v7, 2u);
  }

  id v6 = [(ICSApplicationDelegate *)self carPlayServicesController];
  [v6 acquireAssertionWithActivation:v3];
}

- (void)hideCarPlayUI
{
  BOOL v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "", buf, 2u);
  }

  if ([(ICSApplicationDelegate *)self shouldIgnoreCarPlayAssertionInvalidations])
  {
    objc_super v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Ignoring CarPlay assertion invalidation request", v5, 2u);
    }
  }
  else
  {
    objc_super v4 = [(ICSApplicationDelegate *)self carPlayServicesController];
    [v4 invalidateAssertion];
  }
}

- (void)setAllowsCarPlayBanners:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(ICSApplicationDelegate *)self carPlayServicesController];
  [v4 setAllowsBanners:v3];
}

- (void)setActivationContext:(id)a3
{
  id v5 = (ICSActivationContext *)a3;
  id v6 = sub_1000D5130();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Updated activation context: %@", (uint8_t *)&v8, 0xCu);
  }

  if (self->_activationContext != v5)
  {
    objc_storeStrong((id *)&self->_activationContext, a3);
    char v7 = +[NSNotificationCenter defaultCenter];
    [v7 postNotificationName:@"ICSActivationContextDidChangeNotification" object:0];
  }
}

- (SBSUIInCallWindowScene)currentInCallScene
{
  id v2 = [(ICSApplicationDelegate *)self sceneManager];
  BOOL v3 = [v2 callScene];

  return (SBSUIInCallWindowScene *)v3;
}

- (void)prewarmBannerPresentationManager
{
  id v2 = [(ICSApplicationDelegate *)self bannerPresentationManager];
}

- (CNKBannerPresentationManager)bannerPresentationManager
{
  bannerPresentationManager = self->_bannerPresentationManager;
  if (!bannerPresentationManager)
  {
    id v4 = (CNKBannerPresentationManager *)[objc_alloc((Class)CNKBannerPresentationManager) initWithDelegate:self];
    id v5 = self->_bannerPresentationManager;
    self->_bannerPresentationManager = v4;

    [(CNKBannerPresentationManager *)self->_bannerPresentationManager setAudioRoutingDelegate:self];
    bannerPresentationManager = self->_bannerPresentationManager;
  }

  return bannerPresentationManager;
}

- (id)screenSharingRootViewController
{
  BOOL v3 = [(ICSApplicationDelegate *)self sceneManager];
  id v4 = [v3 sceneOfType:1];

  if (v4)
  {
    id v5 = [(ICSApplicationDelegate *)self remoteAlertShellViewControllerForWindowScene:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)initiateCallForDialRequest:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  char v7 = (void (**)(id, uint64_t))a4;
  int v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)unsigned int v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "'%@'", buf, 0xCu);
  }

  id v9 = sub_1000D5130();
  long long v10 = v9;
  if (!v6)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001E9C18();
    }
    goto LABEL_20;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)unsigned int v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "dialing call with dial request %@", buf, 0xCu);
  }

  long long v11 = +[PHInCallRootViewController dismissalAssertions];
  id v12 = [v11 count];

  if (!v12)
  {
    long long v13 = +[PHInCallUtilities sharedInstance];
    [v13 startSuppressingInCallStatusBarForReason:@"PHSuppressInCallStatusBarForDialReason"];
  }
  CFStringRef v14 = +[UIApplication sharedApplication];
  if ([v14 isRunningTest:@"PlaceOutgoingCall"])
  {

    goto LABEL_13;
  }
  id v15 = +[UIApplication sharedApplication];
  unsigned int v16 = [v15 isRunningTest:@"FaceTimePlaceOutgoingCall"];

  if (v16)
  {
LABEL_13:
    unsigned __int8 v18 = +[UIApplication sharedApplication];
    uint64_t v19 = qword_10032CBD0;
    CFStringRef v30 = @"time";
    unsigned int v20 = +[NSArray arrayWithObjects:&v30 count:1];
    [v18 startedSubTest:@"CreateCall" forTest:v19 withMetrics:v20];

    long long v10 = sub_100050EE8(v21, v6);
    id v22 = +[UIApplication sharedApplication];
    [v22 finishedSubTest:@"CreateCall" forTest:qword_10032CBD0];

    id v23 = +[UIApplication sharedApplication];
    [v23 startedSubTest:@"sbRemoteAlert" forTest:qword_10032CBD0];

    if (!v10) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  long long v10 = sub_100050EE8(v17, v6);
  if (!v10)
  {
LABEL_17:
    id v24 = sub_1000D5130();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v25 = [v10 status];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)unsigned int v29 = v10 == 0;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v25 == 6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[WARN] cannot dial call, the call we received was nil (%d) or in the disconnected state (%d)", buf, 0xEu);
    }

    BOOL v26 = +[PHInCallUtilities sharedInstance];
    [v26 stopSuppressingInCallStatusBarForReason:@"PHSuppressInCallStatusBarForDialReason"];

LABEL_20:
    uint64_t v27 = 0;
    goto LABEL_21;
  }
LABEL_16:
  if ([v10 status] == 6) {
    goto LABEL_17;
  }
  if ([(ICSApplicationDelegate *)self shouldActivateSpringBoardRemoteAlertForCall:v10])
  {
    [(ICSApplicationDelegate *)self requestPresentationForCall:v10 dialRequest:v6];
  }
  uint64_t v27 = 1;
LABEL_21:

  if (v7) {
    v7[2](v7, v27);
  }
}

- (void)showOrCreateCallForConversationRequest:(id)a3
{
  id v9 = a3;
  id v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 callMatchingConversationRequest:v9];

  id v6 = +[TUCallCenter sharedInstance];
  char v7 = [v6 activeConversationForCall:v5];

  if (v5
    && [v7 resolvedAudioVideoMode] == (id)2
    && ![(ICSApplicationDelegate *)self isPresentingFullScreenCallUI])
  {
    int v8 = [(ICSApplicationDelegate *)self currentInCallScene];
    [v8 ics_requestTransitionToPresentationMode:2];
  }
  else
  {
    [(ICSApplicationDelegate *)self initiateCallForConversationRequest:v9];
  }
}

- (void)initiateCallForConversationRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 UUID];
    *(_DWORD *)buf = 138412290;
    v28[0] = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "conversationRequestUUID=%@", buf, 0xCu);
  }
  char v7 = [v4 UUID];
  int v8 = [v7 debugDescription];

  id v9 = [v4 debugDescription];
  long long v10 = sub_10008360C();
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 3221225472;
  id v23 = sub_100051460;
  id v24 = &unk_1002CDDE0;
  id v25 = v8;
  id v26 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(v10, &v21);

  long long v13 = +[PHInCallRootViewController dismissalAssertions];
  id v14 = [v13 count];

  if (!v14)
  {
    id v15 = +[PHInCallUtilities sharedInstance];
    [v15 startSuppressingInCallStatusBarForReason:@"PHSuppressInCallStatusBarForDialReason"];
  }
  [(ICSApplicationDelegate *)self setCurrentJoinConversationRequest:v4];
  unsigned int v16 = +[TUCallCenter sharedInstance];
  uint64_t v17 = [v16 joinConversationWithConversationRequest:v4];

  if ([v17 status] == 6)
  {
    unsigned __int8 v18 = sub_1000D5130();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = [v17 status];
      *(_DWORD *)buf = 67109376;
      LODWORD(v28[0]) = v17 == 0;
      WORD2(v28[0]) = 1024;
      *(_DWORD *)((char *)v28 + 6) = v19 == 6;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[WARN] Could not join multiway call, the call we received was nil (%d) or in the disconnected state (%d)", buf, 0xEu);
    }

    unsigned int v20 = +[PHInCallUtilities sharedInstance];
    [v20 stopSuppressingInCallStatusBarForReason:@"PHSuppressInCallStatusBarForDialReason"];
  }
  else if ([(ICSApplicationDelegate *)self shouldActivateSpringBoardRemoteAlertForCall:v17])
  {
    [(ICSApplicationDelegate *)self requestPresentationForCall:v17 dialRequest:0];
  }
  [(ICSApplicationDelegate *)self setCurrentJoinConversationRequest:0];
}

- (id)isAppBlockedFromBypassingPrompt
{
  id isAppBlockedFromBypassingPrompt = self->_isAppBlockedFromBypassingPrompt;
  if (!isAppBlockedFromBypassingPrompt)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000515F0;
    v8[3] = &unk_1002CE4F0;
    objc_copyWeak(&v9, &location);
    id v4 = objc_retainBlock(v8);
    id v5 = self->_isAppBlockedFromBypassingPrompt;
    self->_id isAppBlockedFromBypassingPrompt = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id isAppBlockedFromBypassingPrompt = self->_isAppBlockedFromBypassingPrompt;
  }
  id v6 = objc_retainBlock(isAppBlockedFromBypassingPrompt);

  return v6;
}

- (BOOL)isAppBlockedFromBypassingPrompt:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSApplicationDelegate *)self isAppBlockedFromBypassingPrompt];
  char v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (id)isDefaultCallingAppBlock
{
  id isDefaultCallingAppBlock = self->_isDefaultCallingAppBlock;
  if (!isDefaultCallingAppBlock)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000517E8;
    v8[3] = &unk_1002CE4F0;
    objc_copyWeak(&v9, &location);
    id v4 = objc_retainBlock(v8);
    id v5 = self->_isDefaultCallingAppBlock;
    self->_id isDefaultCallingAppBlock = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id isDefaultCallingAppBlock = self->_isDefaultCallingAppBlock;
  }
  id v6 = objc_retainBlock(isDefaultCallingAppBlock);

  return v6;
}

- (BOOL)isDefaultCallingApp:(id)a3
{
  id v4 = a3;
  id v5 = [(ICSApplicationDelegate *)self isDefaultCallingAppBlock];
  char v6 = ((uint64_t (**)(void, id))v5)[2](v5, v4);

  return v6;
}

- (void)configureDialRequest:(id)a3 forProcessHandle:(id)a4
{
}

- (void)configureDialRequest:(id)a3 forProcessHandle:(id)a4 bypassUIPromptIfDefaultProvider:(BOOL)a5
{
  BOOL v5 = a5;
  id v13 = a3;
  id v8 = a4;
  id v9 = [v8 bundleIdentifier];
  if ([v9 containsString:@"com.apple.mobilesafari"])
  {

LABEL_9:
    BOOL v12 = 1;
    goto LABEL_10;
  }
  long long v10 = [v8 bundleIdentifier];
  unsigned __int8 v11 = [v10 containsString:@"com.apple.SafariViewService"];

  if ((v11 & 1) != 0
    || [(ICSApplicationDelegate *)self isAppBlockedFromBypassingPrompt:v8])
  {
    goto LABEL_9;
  }
  if (v5 && [(ICSApplicationDelegate *)self isDefaultCallingApp:v8])
  {
    BOOL v12 = 0;
    goto LABEL_10;
  }
  if ([v13 showUIPrompt]) {
    goto LABEL_9;
  }
  BOOL v12 = [(ICSApplicationDelegate *)self shouldShowPromptForProcessHandle:v8];
LABEL_10:
  [v13 setShowUIPrompt:v12];
  [v13 setProcessHandle:v8];
}

- (id)isHandleAvailableForFaceTimeBlock
{
  id isHandleAvailableForFaceTimeBlock = self->_isHandleAvailableForFaceTimeBlock;
  if (!isHandleAvailableForFaceTimeBlock)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100051AD8;
    v8[3] = &unk_1002CE518;
    objc_copyWeak(&v9, &location);
    id v4 = objc_retainBlock(v8);
    id v5 = self->_isHandleAvailableForFaceTimeBlock;
    self->_id isHandleAvailableForFaceTimeBlock = v4;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    id isHandleAvailableForFaceTimeBlock = self->_isHandleAvailableForFaceTimeBlock;
  }
  id v6 = objc_retainBlock(isHandleAvailableForFaceTimeBlock);

  return v6;
}

- (void)isHandleAvailableForFaceTime:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(ICSApplicationDelegate *)self isHandleAvailableForFaceTimeBlock];
  v8[2](v8, v7, v6);
}

- (void)dialRequestForDefaultCallingConfiguredDialRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 allowProviderFallback]
    && ([v6 provider],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unsigned int v9 = [v8 isFaceTimeProvider],
        v8,
        v9))
  {
    long long v10 = [v6 dialRequestWithURLStripping];
    unsigned __int8 v11 = [v10 handle];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100051DD8;
    v16[3] = &unk_1002CE568;
    id v17 = v10;
    id v19 = v7;
    id v18 = v6;
    id v12 = v10;
    [(ICSApplicationDelegate *)self isHandleAvailableForFaceTime:v11 completion:v16];
  }
  else
  {
    id v13 = sub_1000D5130();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v14 = [v6 allowProviderFallback];
      CFStringRef v15 = @"NO";
      if (v14) {
        CFStringRef v15 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v21 = v15;
      __int16 v22 = 2112;
      id v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Dial request does not allowProviderFallback (%@) or provider is not FaceTime. Returning untouched dialRequest %@", buf, 0x16u);
    }

    (*((void (**)(id, id))v7 + 2))(v7, v6);
  }
}

- (BOOL)shouldShowPromptForProcessHandle:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }

  v19[0] = @"com.apple.springboard.allowallcallurls";
  v19[1] = @"com.apple.springboard.opensensitiveurl";
  +[NSArray arrayWithObjects:v19 count:2];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(v3, "hasEntitlement:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14))
        {
          char v10 = 0;
          goto LABEL_13;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  char v10 = 1;
LABEL_13:

  unsigned __int8 v11 = [v3 bundleIdentifier];
  unsigned __int8 v12 = [v11 isEqualToString:@"com.apple.InCallService.RemotePeoplePicker"];

  return v10 & (v12 ^ 1);
}

- (BOOL)canModifyCallsForProcessHandle:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v11, 0xCu);
  }

  id v5 = [v3 valueForEntitlement:TUBundleIdentifierCallServicesDaemon];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    unsigned __int8 v6 = [v5 containsObject:@"modify-calls"];
  }
  else {
    unsigned __int8 v6 = 0;
  }
  id v7 = [v3 bundleIdentifier];
  if (v7)
  {
    uint64_t v8 = [v3 bundleIdentifier];
    unsigned __int8 v9 = [v8 isEqual:TUBundleIdentifierTelephonyUtilitiesFramework];

    v6 |= v9;
  }

  return v6;
}

- (void)addNotificationObservers
{
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"audioCallStatusChanged:" name:TUCallCenterCallStatusChangedNotification object:0];
  [v6 addObserver:self selector:"videoCallStatusChanged:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
  [v6 addObserver:self selector:"handleTUCallTTYTypeChangedNotification:" name:TUCallTTYTypeChangedNotification object:0];
  [v6 addObserver:self selector:"callDisplayContextChangedNotification:" name:TUCallDisplayContextChangedNotification object:0];
  [v6 addObserver:self selector:"handleSupportsEmergencyFallbackChangedNotification:" name:TUCallCenterSupportsEmergencyFallbackChangedNotification object:0];
  id v3 = +[NSNotification PHAlertInvoked];
  [v6 addObserver:self selector:"handleAlertInvokedNotification:" name:v3 object:0];

  [v6 addObserver:self selector:"handleLockScreenStatusChangedNotification:" name:@"PHLockScreenStatusChangedNotification" object:0];
  id v4 = [(CNKScreenSharingStateMonitorFactory *)self->_screenSharingMonitorFactory sharedMonitor];
  [v4 addObserver:self];

  id v5 = [(CNKScreenSharingInteractionControllerFactory *)self->_screenSharingInteractionControllerFactory sharedController];
  [v5 addDelegate:self];
}

- (void)installCameraStateMonitor
{
  id v3 = objc_alloc_init(ICSCameraStateMonitor);
  [(ICSApplicationDelegate *)self setCameraStateMonitor:v3];

  objc_initWeak(&location, self);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000526BC;
  v11[3] = &unk_1002CE590;
  objc_copyWeak(&v12, &location);
  id v4 = [(ICSApplicationDelegate *)self cameraStateMonitor];
  [v4 setIsDisplayedInBanner:v11];

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100052724;
  v9[3] = &unk_1002CE590;
  objc_copyWeak(&v10, &location);
  id v5 = [(ICSApplicationDelegate *)self cameraStateMonitor];
  [v5 setIsDisplayedInMiniWindow:v9];

  objc_copyWeak(&v8, &location);
  id v6 = [(ICSApplicationDelegate *)self cameraStateMonitor];
  [v6 setIsDismissed:&v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)installPillStateMonitor
{
  id v3 = objc_alloc_init(ICSPillStateMonitor);
  [(ICSApplicationDelegate *)self setPillStateMonitor:v3];

  objc_initWeak(&location, self);
  objc_copyWeak(&v9, &location);
  id v4 = [(ICSApplicationDelegate *)self pillStateMonitor];
  [v4 setIsDismissedWithoutPictureInPicture:&v8];

  id v5 = [(ICSApplicationDelegate *)self pillStateMonitor];
  [v5 setIsActiveAndHiddenPictureInPicture:&stru_1002CE5D0];

  id v6 = [(ICSApplicationDelegate *)self pillStateMonitor];
  [v6 setHasCurrentCalls:&stru_1002CE5F0];

  uint64_t v7 = [(ICSApplicationDelegate *)self pillStateMonitor];
  [v7 setHasOutstandingPillAssertions:&stru_1002CE610];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)callDisplayContextChangedNotification:(id)a3
{
  id v10 = [a3 object];
  id v4 = [v10 provider];
  if ([v4 supportsDynamicSystemUI])
  {
    id v5 = [(PHApplicationDelegate *)self featureFlags];
    if ([v5 groupConversations]) {
      int HasChinaSKU = TUDeviceHasChinaSKU();
    }
    else {
      int HasChinaSKU = 0;
    }
  }
  else
  {
    int HasChinaSKU = 0;
  }

  uint64_t v7 = [(ICSApplicationDelegate *)self sceneManager];
  uint64_t v8 = [v7 callScene];

  if ((v8 || HasChinaSKU)
    && [v10 status] == 4
    && ![(ICSApplicationDelegate *)self hasExistingFullScreenInCallScene])
  {
    id v9 = [(ICSApplicationDelegate *)self bannerPresentationManager];
    [v9 presentHUDForCurrentContext];
  }
}

- (void)audioCallStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  [(ICSApplicationDelegate *)self handleCallStatusChangedNotification:v4];
}

- (void)videoCallStatusChanged:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v6, 0xCu);
  }

  [(ICSApplicationDelegate *)self handleCallStatusChangedNotification:v4];
}

- (void)handleCallStatusChangedNotification:(id)a3
{
  id v4 = [a3 object];
  if (v4)
  {
    id v5 = v4;
    [(ICSApplicationDelegate *)self callStatusChanged:v4];
    id v4 = v5;
  }
}

- (void)callStatusChanged:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(id)objc_opt_class() callConnected:v4];
  int v6 = +[TUCallCenter sharedInstance];
  id v7 = [v6 callsPassingTest:&stru_1002CE630];
  id v8 = [v7 count];

  id v9 = [v4 provider];
  if (([v9 supportsDynamicSystemUI] & 1) == 0) {
    goto LABEL_6;
  }
  id v10 = [(PHApplicationDelegate *)self featureFlags];
  if (([v10 groupConversations] & 1) == 0)
  {

LABEL_6:
    goto LABEL_7;
  }
  int HasChinaSKU = TUDeviceHasChinaSKU();

  if (HasChinaSKU) {
    [(ICSApplicationDelegate *)self updatePresentationIfNecessaryForGreenTea3PCall:v4];
  }
LABEL_7:
  id v12 = [(ICSApplicationDelegate *)self connectedCallIdentifiers];
  id v13 = [v4 uniqueProxyIdentifierUUID];
  unsigned int v14 = [v12 containsObject:v13];

  if (v5)
  {
    if ((v14 & 1) == 0)
    {
      long long v15 = [(ICSApplicationDelegate *)self connectedCallIdentifiers];
      long long v16 = [v4 uniqueProxyIdentifierUUID];
      [v15 addObject:v16];
    }
    long long v17 = [(CNKScreenSharingStateMonitorFactory *)self->_screenSharingMonitorFactory sharedMonitor];
    id v18 = [v17 call];
    unsigned __int8 v19 = [v4 isEqual:v18];

    if ((v19 & 1) == 0)
    {
      unsigned int v20 = [(CNKScreenSharingStateMonitorFactory *)self->_screenSharingMonitorFactory sharedMonitor];
      id v21 = v20;
      id v22 = v4;
LABEL_18:
      [v20 setCall:v22];

      goto LABEL_19;
    }
  }
  else if (v14)
  {
    id v23 = [(ICSApplicationDelegate *)self connectedCallIdentifiers];
    id v24 = [v4 uniqueProxyIdentifierUUID];
    [v23 removeObject:v24];
  }
  if ([v4 status] == 5 || objc_msgSend(v4, "status") == 6)
  {
    id v25 = [(CNKScreenSharingStateMonitorFactory *)self->_screenSharingMonitorFactory sharedMonitor];
    id v26 = [v25 call];
    unsigned int v27 = [v4 isEqual:v26];

    if (v27)
    {
      unsigned int v20 = [(CNKScreenSharingStateMonitorFactory *)self->_screenSharingMonitorFactory sharedMonitor];
      id v21 = v20;
      id v22 = 0;
      goto LABEL_18;
    }
  }
LABEL_19:
  v28 = [(ICSApplicationDelegate *)self currentInCallScene];

  if (v28)
  {
    unsigned int v29 = [(ICSApplicationDelegate *)self connectedCallIdentifiers];
    id v30 = [v29 count];

    v31 = sub_1000D5130();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      id v32 = [(ICSApplicationDelegate *)self connectedCallIdentifiers];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)long long v87 = v30 != 0;
      *(_WORD *)&v87[4] = 2112;
      *(void *)&v87[6] = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Setting scene callConnected: %d connectedCallIdentifiers: %@", buf, 0x12u);
    }
    v33 = [(ICSApplicationDelegate *)self currentInCallScene];
    [v33 setCallConnected:v30 != 0];

    v34 = [(PHApplicationDelegate *)self features];
    LODWORD(v33) = [v34 lvm_allowLockScreenSleepEnabled];

    if (v33)
    {
      id v35 = [v4 isScreening];
      unsigned int v36 = [(ICSApplicationDelegate *)self currentInCallScene];
      [v36 setPrefersLockedIdleDurationOnCoversheet:v35];
    }
  }
  if (!v8)
  {
    uint64_t v37 = [(ICSApplicationDelegate *)self alertCoordinator];
    if (v37)
    {
      uint64_t v38 = (void *)v37;
      id v39 = [(ICSApplicationDelegate *)self alertCoordinator];
      if (([v39 isAlertRequestPending] & 1) != 0
        || [v4 disconnectedReason] == 34)
      {
      }
      else
      {
        unsigned __int8 v47 = [v4 disconnectedReasonRequiresCallBackUI];

        if ((v47 & 1) == 0)
        {
          v48 = sub_1000D5130();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "No calls remaining, nil-ing out AlertCoordinator", buf, 2u);
          }

          [(ICSApplicationDelegate *)self setAlertCoordinator:0];
        }
      }
    }
  }
  id v40 = [(PHApplicationDelegate *)self featureFlags];
  if ([v40 FTUserScore]) {
    goto LABEL_37;
  }
  id v41 = [(PHApplicationDelegate *)self featureFlags];
  if (([v41 TTRBannerEnabled] & 1) == 0)
  {
LABEL_36:

LABEL_37:
    goto LABEL_38;
  }
  uint64_t v42 = [v4 provider];
  if (([v42 isFaceTimeProvider] & 1) == 0)
  {

    goto LABEL_36;
  }
  unsigned int v43 = [v4 disconnectedReason];

  if (v43 == 7) {
    goto LABEL_38;
  }
  if ([v4 status] == 1)
  {
    v44 = +[TTRBannerControllerFactory makeBannerController];
    [(ICSApplicationDelegate *)self setTTRBannerViewController:v44];

    unsigned __int8 v45 = [(ICSApplicationDelegate *)self TTRBannerViewController];
    [v45 setDelegate:self];
LABEL_58:

    goto LABEL_59;
  }
  if ([v4 status] == 6)
  {
    unsigned int v49 = [(ICSApplicationDelegate *)self TTRBannerViewController];

    if (v49)
    {
      id v79 = v8;
      uint64_t v50 = +[TUCallCenter sharedInstance];
      BOOL v80 = v4;
      v51 = [v50 activeConversationForCall:v4];

      v77 = [v51 messagesGroupUUID];
      unsigned __int8 v52 = [v51 activeRemoteParticipants];
      id v53 = +[NSMutableSet setWithCapacity:](NSMutableSet, "setWithCapacity:", [v52 count]);

      long long v83 = 0u;
      long long v84 = 0u;
      long long v81 = 0u;
      long long v82 = 0u;
      uint64_t v78 = v51;
      objc_super v54 = [v51 remoteMembers];
      id v55 = [v54 countByEnumeratingWithState:&v81 objects:v85 count:16];
      if (v55)
      {
        id v56 = v55;
        uint64_t v57 = *(void *)v82;
        do
        {
          for (i = 0; i != v56; i = (char *)i + 1)
          {
            if (*(void *)v82 != v57) {
              objc_enumerationMutation(v54);
            }
            CFStringRef v59 = *(void **)(*((void *)&v81 + 1) + 8 * i);
            v60 = [v59 handle];
            CFStringRef v61 = [v60 value];
            id v62 = [v61 length];

            if (v62)
            {
              id v63 = [v59 handle];
              __int16 v64 = [v63 value];
              [v53 addObject:v64];
            }
          }
          id v56 = [v54 countByEnumeratingWithState:&v81 objects:v85 count:16];
        }
        while (v56);
      }

      id v65 = [(ICSApplicationDelegate *)self TTRBannerViewController];
      v66 = [v77 UUIDString];
      [v65 buildTTRMessageBubbleRecipientsListWithGroupMessageUUID:v66 with:v53];

      id v4 = v80;
      [v80 callDuration];
      if (v67 >= 900.0)
      {
        BOOL v69 = 1;
      }
      else
      {
        v68 = [v80 remoteParticipantHandles];
        BOOL v69 = (unint64_t)[v68 count] > 0xE;
      }
      v70 = [(ICSApplicationDelegate *)self TTRBannerViewController];
      [v70 showTTRBannerWithFullLogArchive:v69];

      unsigned __int8 v45 = v78;
      id v8 = v79;
      goto LABEL_58;
    }
  }
LABEL_59:
  if (!v8)
  {
    unsigned int v71 = [(ICSApplicationDelegate *)self bannerPresentationManager];
    if ([v71 wantsBannerWithoutScene])
    {
      v72 = +[PHInCallRootViewController dismissalAssertions];
      unsigned __int8 v73 = [v72 containsObject:@"PHAVLessConversationDetailsViewAssertionReason"];

      if ((v73 & 1) == 0)
      {
        v74 = sub_1000D52D8();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          v75 = v74;
          v76 = [v4 uniqueProxyIdentifier];
          *(_DWORD *)buf = 138412290;
          *(void *)long long v87 = v76;
          _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_DEFAULT, "Call %@ disconnected, no calls remaining, still have placeholderCall that wants banner without scene in HUD, requesting scene dismissal", buf, 0xCu);
        }
        [(ICSApplicationDelegate *)self dismissInCallSceneSession];
      }
    }
    else
    {
    }
  }
LABEL_38:
  [(ICSApplicationDelegate *)self updateRemoteAlertStateIfNecessaryForCall:v4];
  [(ICSApplicationDelegate *)self showBannerIfNecessaryForHandoffEligibleConversation];
  v46 = [(ICSApplicationDelegate *)self routeListController];
  [v46 reload];
}

+ (BOOL)callConnected:(id)a3
{
  unsigned int v3 = [a3 status];
  return (v3 > 6) | (0xEu >> v3) & 1;
}

- (void)updateRemoteAlertStateIfNecessaryForCall:(id)a3
{
  id v6 = a3;
  id v7 = v6;
  if (!v6 || ![v6 isEndpointOnCurrentDevice]) {
    goto LABEL_38;
  }
  unsigned int v8 = [v7 status];
  switch(v8)
  {
    case 3u:
      if (![(ICSApplicationDelegate *)self shouldActivateSpringBoardRemoteAlertForCall:v7])goto LABEL_36; {
      id v13 = [v7 provider];
      }
      unsigned __int8 v14 = [v13 isSystemProvider];
      if (v14)
      {
        int v15 = 0;
        int v16 = 0;
      }
      else
      {
        unsigned int v3 = +[PHInCallUIUtilities sharedInstance];
        if ([v3 isSpringBoardLocked])
        {
          int v15 = 0;
          int v16 = 0;
        }
        else
        {
          uint64_t v22 = +[UIScreen _carScreen];
          if (v22)
          {
            id v4 = (void *)v22;
            int v16 = 0;
            int v15 = 1;
          }
          else
          {
            id v23 = +[TUCallCenter sharedInstance];
            if (([v23 existingCallsHaveMultipleProviders] & 1) == 0)
            {

              goto LABEL_36;
            }
            id v24 = v23;
            id v4 = 0;
            int v15 = 1;
            int v16 = 1;
          }
        }
      }
      long long v17 = [v7 provider];
      if ([v17 isFaceTimeProvider] && (objc_msgSend(v7, "isVideo") & 1) == 0) {
        unsigned int v18 = ![(ICSApplicationDelegate *)self hasExistingDismissedInCallScene];
      }
      else {
        unsigned int v18 = 1;
      }

      if (v16)
      {

        if ((v15 & 1) == 0) {
          goto LABEL_47;
        }
      }
      else if (!v15)
      {
LABEL_47:
        if (v14)
        {

          if (!v18) {
            goto LABEL_36;
          }
        }
        else
        {

          if ((v18 & 1) == 0) {
            goto LABEL_36;
          }
        }
        unsigned int v20 = sub_1000D5130();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v26 = v7;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Heard a call change notification and it was sending, so InCallService will show the alert for %@", buf, 0xCu);
        }
        goto LABEL_33;
      }

      goto LABEL_47;
    case 6u:
      if ([v7 isVideo]) {
        [(ICSApplicationDelegate *)self setMostRecentlyDisconnectedVideoCall:v7];
      }
      else {
        [(ICSApplicationDelegate *)self setMostRecentlyDisconnectedAudioCall:v7];
      }
      if ([v7 isSOS])
      {
        if ([(ICSApplicationDelegate *)self isClarityBoardActive])
        {
          [(ICSApplicationDelegate *)self requestClarityBoardPresentationForSOS];
          break;
        }
        [(ICSApplicationDelegate *)self requestSpringBoardPresentationForSOS];
      }
      if ([v7 disconnectedReason] == 51)
      {
        unsigned __int8 v19 = objc_alloc_init(ICSMirroringToMacAlert);
        [(ICSMirroringToMacAlert *)v19 show];
LABEL_37:
      }
      break;
    case 4u:
      id v9 = sub_1000D5130();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Heard a call change notification and it was ringing, so InCallService will show the alert for %@", buf, 0xCu);
      }

      id v10 = [v7 provider];
      if ([v10 supportsDynamicSystemUI])
      {
        int v11 = [(PHApplicationDelegate *)self featureFlags];
        if ([v11 groupConversations]) {
          int HasChinaSKU = TUDeviceHasChinaSKU();
        }
        else {
          int HasChinaSKU = 0;
        }
      }
      else
      {
        int HasChinaSKU = 0;
      }

      unsigned int v20 = [(PHApplicationDelegate *)self features];
      if (([v20 isSystemApertureEnabled] & 1) == 0 && !HasChinaSKU)
      {
LABEL_33:

LABEL_35:
        [(ICSApplicationDelegate *)self requestPresentationForCall:v7 dialRequest:0];
        goto LABEL_36;
      }
      unsigned __int8 v21 = [(ICSApplicationDelegate *)self isClarityBoardActive];

      if (v21) {
        goto LABEL_35;
      }
LABEL_36:
      unsigned __int8 v19 = [(ICSApplicationDelegate *)self ambientActivityController];
      [(ICSMirroringToMacAlert *)v19 requestActivityForCall:v7];
      goto LABEL_37;
  }
LABEL_38:
}

- (void)showBannerIfNecessaryForHandoffEligibleConversation
{
  unsigned int v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 currentAudioAndVideoCallCount];

  if (!v4)
  {
    unsigned int v5 = +[TUCallCenter sharedInstance];
    id v6 = [v5 conversationManager];
    id v7 = [v6 handoffEligibleConversation];

    if (v7) {
      [(ICSApplicationDelegate *)self requestHandoffEligibleConversationPresentation];
    }
  }
}

- (void)handleTUCallTTYTypeChangedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[PHInCallUIUtilities sharedInstance];
  unsigned int v6 = [v5 isSpringBoardLocked];

  if (v6)
  {
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = objc_opt_class();
      id v9 = v8;
      id v10 = [v4 name];
      int v14 = 138412546;
      int v15 = v8;
      __int16 v16 = 2112;
      long long v17 = v10;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ is handling %@", (uint8_t *)&v14, 0x16u);
    }
    int v11 = [v4 object];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v11;
      if ([v12 isEndpointOnCurrentDevice]
        && [v12 status] == 1
        && [(ICSApplicationDelegate *)self shouldActivateSpringBoardRemoteAlertForCall:v12])
      {
        id v13 = sub_1000D5130();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 138412290;
          int v15 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received a TTY type change notification while SpringBoard is locked; InCallService will present a remote ale"
            "rt for active call %@",
            (uint8_t *)&v14,
            0xCu);
        }

        [(ICSApplicationDelegate *)self requestPresentationForCall:v12 dialRequest:0];
      }
    }
    else
    {
      id v12 = sub_1000D5130();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1001E9C4C();
      }
    }
  }
}

- (void)handleLockScreenStatusChangedNotification:(id)a3
{
  id v3 = [(ICSApplicationDelegate *)self bannerPresentationManager];
  [v3 handleLockScreenStatusChanged];
}

- (BOOL)shouldPresentDismissedForCall:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    if ([v4 wantsStagingArea])
    {
      char v6 = 0;
    }
    else
    {
      id v7 = [(ICSApplicationDelegate *)self bannerPresentationManager];
      [v7 preloadCallChanges];

      id v8 = [(id)objc_opt_class() isExpanseMessagesJoinRequest:self->_currentJoinConversationRequest];
      id v9 = [(ICSApplicationDelegate *)self avUpgradedCallUUIDForDismissedScene];
      id v10 = [v5 uniqueProxyIdentifierUUID];
      LODWORD(self) = [v9 isEqual:v10];

      if (v8
        && [v5 callStatus] == 3
        && [v5 isOutgoing])
      {
        LODWORD(v11) = [v5 isSendingVideo] ^ 1;
      }
      else
      {
        LOBYTE(v11) = 0;
      }
      id v12 = [v5 provider];
      if ([v12 isSystemProvider]) {
        unsigned int v13 = 0;
      }
      else {
        unsigned int v13 = [v5 isOutgoing];
      }

      int v14 = sub_1000D5130();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        char v23 = v11;
        char v24 = (char)self;
        uint64_t v11 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 callStatus]);
        int v15 = +[NSNumber numberWithBool:v8];
        __int16 v16 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isConversation]);
        long long v17 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 isOutgoing]);
        unsigned int v18 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v5 isSendingVideo] ^ 1);
        unsigned __int8 v19 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v5 wantsStagingArea]);
        unsigned int v20 = +[NSNumber numberWithBool:self];
        self = v20;
        *(_DWORD *)buf = 138414082;
        CFStringRef v21 = @"NO";
        uint64_t v26 = v11;
        if (v13) {
          CFStringRef v21 = @"YES";
        }
        __int16 v27 = 2112;
        v28 = v15;
        __int16 v29 = 2112;
        id v30 = v16;
        __int16 v31 = 2112;
        id v32 = v17;
        __int16 v33 = 2112;
        v34 = v18;
        __int16 v35 = 2112;
        unsigned int v36 = v19;
        __int16 v37 = 2112;
        uint64_t v38 = v20;
        __int16 v39 = 2112;
        CFStringRef v40 = v21;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "shouldPresentDismissedForCall: callStatus:%@, isExpanseMessages:%@, isConversation:%@, isOutgoing:%@, isAudioCall:%@, wantsStagingArea:%@ avLessWantsDismised:%@ callProviderWantsDismissed:%@", buf, 0x52u);

        LOBYTE(self) = v24;
        LOBYTE(v11) = v23;
      }

      char v6 = v13 | v11 | self;
    }
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (void)performPresentationForSOS
{
  id v3 = [(ICSApplicationDelegate *)self configurationForSOS];
  [(ICSApplicationDelegate *)self performPresentationWithConfiguration:v3 forSceneType:0];
}

- (void)performPresentationForScreenTime
{
  id v3 = [(ICSApplicationDelegate *)self configurationForScreenTime];
  [(ICSApplicationDelegate *)self performPresentationWithConfiguration:v3 forSceneType:0];
}

- (void)performPresentationForScreenSharingInitiallyInPiP:(BOOL)a3
{
  id v4 = [(ICSApplicationDelegate *)self configurationForScreenSharingInitiallyInPiP:a3];
  [(ICSApplicationDelegate *)self performPresentationWithConfiguration:v4 forSceneType:1];
}

- (void)performPersentationForScreenSharingObserver
{
  id v3 = [(ICSApplicationDelegate *)self configurationForScreenShareBroadcast];
  [(ICSApplicationDelegate *)self performPresentationWithConfiguration:v3 forSceneType:2];
}

- (void)performDismissedPresentationForCallDetailsView
{
  id v3 = [(ICSApplicationDelegate *)self configurationForCallDetailsViewWithFullScreenRequest:0];
  [(ICSApplicationDelegate *)self performPresentationWithConfiguration:v3 forSceneType:0];
}

- (void)performFullScreenPresentationForCallDetailsView
{
  id v3 = [(ICSApplicationDelegate *)self configurationForCallDetailsViewWithFullScreenRequest:1];
  [(ICSApplicationDelegate *)self performPresentationWithConfiguration:v3 forSceneType:0];
}

- (id)configurationForCall:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[TUCallCenter sharedInstance];
  char v6 = [v5 incomingCall];
  if (v6)
  {
    BOOL v7 = 1;
  }
  else
  {
    id v8 = +[TUCallCenter sharedInstance];
    id v9 = [v8 incomingVideoCall];
    BOOL v7 = v9 != 0;
  }
  id v10 = [(PHApplicationDelegate *)self featureFlags];
  if (![v10 groupConversations])
  {
    BOOL v13 = 0;
    goto LABEL_8;
  }
  int HasChinaSKU = TUDeviceHasChinaSKU();

  if (HasChinaSKU)
  {
    id v10 = +[TUCallCenter sharedInstance];
    id v12 = [v10 callsPassingTest:&stru_1002CE650];
    BOOL v13 = [v12 count] != 0;

LABEL_8:
    goto LABEL_10;
  }
  BOOL v13 = 0;
LABEL_10:
  int v14 = [(PHApplicationDelegate *)self features];
  uint64_t v15 = [v14 isIncomingCallBannerEnabled] ^ 1;

  __int16 v16 = +[ICSPreferences sharedPreferences];
  unsigned int v17 = [v16 hasBannersEnabled];
  if (v13) {
    uint64_t v18 = 2;
  }
  else {
    uint64_t v18 = v15;
  }
  if (v17) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = 2;
  }

  if ([(ICSApplicationDelegate *)self shouldPresentDismissedForCall:v4]) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = 2;
  }
  if (v7) {
    uint64_t v21 = v19;
  }
  else {
    uint64_t v21 = v20;
  }
  uint64_t v22 = +[ICSApplicationDelegate configurationForCall:v4 preferredPresentationMode:v21];

  return v22;
}

+ (id)configurationForCall:(id)a3 preferredPresentationMode:(int64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  id v7 = [v6 initWithSceneBundleIdentifier:TUBundleIdentifierInCallServiceApplication];
  [v7 setShouldDismissCMASAlerts:[v5 isOutgoing]];
  [v7 setPreferredPresentationMode:a4];
  id v8 = [v5 isOutgoing];

  [v7 setShouldPreferContinuityDisplayForFullScreenPresentation:v8];
  uint64_t v9 = MGGetProductType();
  id v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    uint64_t v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Setting preferredBannerHeight based on productType %ld", (uint8_t *)&v13, 0xCu);
  }

  double v11 = 104.0;
  if (v9 == 2487868872) {
    double v11 = 108.0;
  }
  [v7 setPreferredBannerHeight:v11];
  [v7 setSupportsSystemAperture:1];
  [v7 setSupportsAmbient:1];

  return v7;
}

- (id)configurationForSOS
{
  id v2 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  id v3 = [v2 initWithSceneBundleIdentifier:TUBundleIdentifierInCallServiceApplication];
  [v3 setShouldDismissCMASAlerts:1];
  [v3 setShouldPreventBannersWhenPresentedAsOverlay:1];
  [v3 setPreferredPresentationMode:3];
  [v3 setShouldPreferContinuityDisplayForFullScreenPresentation:1];

  return v3;
}

- (id)configurationForScreenTime
{
  id v2 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  id v3 = [v2 initWithSceneBundleIdentifier:TUBundleIdentifierInCallServiceApplication];
  [v3 setShouldDismissCMASAlerts:0];
  [v3 setPreferredPresentationMode:3];
  [v3 setShouldPreferContinuityDisplayForFullScreenPresentation:1];

  return v3;
}

- (id)configurationForScreenShareBroadcast
{
  id v2 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  id v3 = [v2 initWithSceneBundleIdentifier:TUBundleIdentifierInCallServiceApplication];
  [v3 setShouldDismissCMASAlerts:0];
  [v3 setPreferredPresentationMode:3];
  [v3 setShouldPreferContinuityDisplayForFullScreenPresentation:1];

  return v3;
}

- (id)configurationForScreenSharingInitiallyInPiP:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  id v5 = [v4 initWithSceneBundleIdentifier:TUBundleIdentifierInCallServiceApplication];
  [v5 setShouldDismissCMASAlerts:0];
  if (v3) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = 2;
  }
  [v5 setPreferredPresentationMode:v6];
  [v5 setScreenSharingPresentation:1];
  [v5 setShouldPreferContinuityDisplayForFullScreenPresentation:1];

  return v5;
}

- (id)configurationForCallDetailsViewWithFullScreenRequest:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  id v5 = [v4 initWithSceneBundleIdentifier:TUBundleIdentifierInCallServiceApplication];
  [v5 setShouldDismissCMASAlerts:0];
  if (v3) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 0;
  }
  [v5 setPreferredPresentationMode:v6];
  [v5 setShouldPreferContinuityDisplayForFullScreenPresentation:1];
  [v5 setSupportsSystemAperture:1];

  return v5;
}

- (id)configurationForPTTSessionWithCall:(id)a3 preferredPresentationMode:(int64_t)a4
{
  id v5 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  id v6 = [v5 initWithSceneBundleIdentifier:TUBundleIdentifierInCallServiceApplication];
  [v6 setShouldDismissCMASAlerts:0];
  [v6 setPreferredPresentationMode:a4];
  [v6 setSupportsSystemAperture:1];
  [v6 setShouldPreferContinuityDisplayForFullScreenPresentation:1];

  return v6;
}

- (void)performPresentationWithConfiguration:(id)a3 forSceneType:(unint64_t)a4
{
  id v5 = a3;
  id v4 = v5;
  TUDispatchMainIfNecessary();
}

- (void)requestPresentationForCall:(id)a3 dialRequest:(id)a4
{
}

- (void)requestPresentationForCall:(id)a3 dialRequest:(id)a4 tappedPill:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = sub_1000D52D8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for call %@", (uint8_t *)&v11, 0xCu);
  }
  +[ICSAriadne trace:3];
  if ([(ICSApplicationDelegate *)self isClarityBoardActive]) {
    [(ICSApplicationDelegate *)self requestClarityBoardPresentationForCall:v8 dialRequest:v9];
  }
  else {
    [(ICSApplicationDelegate *)self requestSpringBoardPresentationForCall:v8 dialRequest:v9 tappedPill:v5];
  }
}

- (BOOL)isClarityBoardActive
{
  if (qword_100325FE8 != -1) {
    dispatch_once(&qword_100325FE8, &stru_1002CE6C0);
  }
  return byte_100325FE0;
}

- (void)requestSpringBoardPresentationForCall:(id)a3 dialRequest:(id)a4 tappedPill:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[ICSPreferences sharedPreferences];
  unsigned __int8 v11 = [v10 hasAdoptedModernInCallAPI];

  if ((v11 & 1) == 0)
  {
    __int16 v29 = sub_1000D52D8();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Activating a new SpringBoard remote alert", buf, 2u);
    }
    id v12 = [(ICSApplicationDelegate *)self springBoardRemoteAlertOptionsForCall:v8 dialRequest:v9];
    __int16 v27 = +[NSBundle mainBundle];
    [v27 bundleIdentifier];
    SBSUIActivateRemoteAlert();
    goto LABEL_26;
  }
  id v12 = [(ICSApplicationDelegate *)self configurationForCall:v8];
  int v13 = [(ICSApplicationDelegate *)self currentInCallScene];
  id v14 = [v13 presentationMode];

  BOOL v15 = v14 == (id)1 && v5;
  unsigned int v16 = [(ICSApplicationDelegate *)self hasExistingDismissedInCallScene];
  if (([v8 isConnected] & 1) != 0 || objc_msgSend(v12, "preferredPresentationMode"))
  {
    unsigned int v17 = 0;
  }
  else
  {
    __int16 v35 = [(PHApplicationDelegate *)self features];
    unsigned int v17 = [v35 isIncomingCallBannerEnabled];
  }
  int v18 = v16 | v15;
  if ([v12 preferredPresentationMode])
  {
    unsigned int v17 = 1;
    uint64_t v19 = [(ICSApplicationDelegate *)self ambientActivityController];
    [v19 requestActivityForCall:v8];
  }
  if ((v18 & v17) == 1)
  {
    uint64_t v20 = sub_1000D52D8();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Already have a dismissed in-call scene. Requesting transition to full-screen", buf, 2u);
    }
    uint64_t v21 = +[PHPIPController defaultPIPController];
    unsigned int v22 = [v21 isPipped];

    if (!v22)
    {
      id v55 = v8;
      TUDispatchMainIfNecessary();

      goto LABEL_27;
    }
    char v23 = sub_1000D52D8();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "InCallService is currently PIPped. Un-PIPping before going full-screen", buf, 2u);
    }
    char v24 = +[PHPIPController defaultPIPController];
    if ([v24 isPIPProxyInterrupted])
    {
      unsigned int v25 = [v8 status];

      if (v25 != 4)
      {
LABEL_22:
        __int16 v27 = +[NSNotificationCenter defaultCenter];
        v28 = +[PHPIPController defaultPIPController];
        [v27 postNotificationName:@"PHPIPControllerDidRequestReturnToFullScreenNotification" object:v28];

LABEL_26:
        goto LABEL_27;
      }
      uint64_t v26 = sub_1000D52D8();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "InCallService is presenting full-screen for a ringing call during a pip interrupted call", buf, 2u);
      }
      char v24 = +[PHPIPController defaultPIPController];
      [v24 setExpectingSystemInitiatedPIPInterruptionStop:1];
    }

    goto LABEL_22;
  }
  if (![(ICSApplicationDelegate *)self hasExistingFullScreenInCallScene])
  {
    v34 = [(ICSApplicationDelegate *)self currentInCallScene];
    if (v34)
    {
    }
    else if ([(ICSApplicationDelegate *)self hasActiveOrPendingInCallPresentation])
    {
      unsigned int v36 = sub_1000D52D8();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
      }
    }
    if ([v12 preferredPresentationMode] == (id)1)
    {
      __int16 v37 = [(ICSApplicationDelegate *)self bannerPresentationManager];
      uint64_t v38 = [v37 placeholderCallGroupUUID];
      if (v38)
      {
        __int16 v39 = (void *)v38;
        CFStringRef v40 = [v8 callGroupUUID];
        id v41 = [(ICSApplicationDelegate *)self bannerPresentationManager];
        uint64_t v42 = [v41 placeholderCallGroupUUID];
        unsigned int v43 = [v40 isEqual:v42];

        if (!v43) {
          goto LABEL_50;
        }
        v44 = sub_1000D5130();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Presenting banner scene for call that matches systemHUD's AVLess convo. Dismissing HUD.", buf, 2u);
        }

        __int16 v37 = [(ICSApplicationDelegate *)self bannerPresentationManager];
        [v37 dismissPresentedBannerForReason:@"Showing invite for existing AVLess call" animated:1];
      }
    }
LABEL_50:
    [(ICSApplicationDelegate *)self performPresentationWithConfiguration:v12 forSceneType:0];
    unsigned __int8 v45 = [(PHApplicationDelegate *)self featureFlags];
    if ([v45 expanseEnabled])
    {
      id v46 = [v12 preferredPresentationMode];

      if (v46) {
        goto LABEL_27;
      }
      unsigned __int8 v47 = [(ICSApplicationDelegate *)self bannerPresentationManager];
      v48 = [v47 callUUID];
      unsigned int v49 = [v8 uniqueProxyIdentifierUUID];
      unsigned __int8 v50 = [v48 isEqual:v49];

      v51 = sub_1000D52D8();
      BOOL v52 = os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
      if (v50)
      {
        if (v52)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Requested to present scene as dismissed, so requesting to present call controls", buf, 2u);
        }
        [(ICSApplicationDelegate *)self showCallControlsForCurrentContext];
        goto LABEL_27;
      }
      if (v52)
      {
        id v53 = v51;
        objc_super v54 = [v8 uniqueProxyIdentifierUUID];
        *(_DWORD *)buf = 138412290;
        uint64_t v57 = v54;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Waiting to present banner for callUUID %@", buf, 0xCu);
      }
      unsigned __int8 v45 = [v8 uniqueProxyIdentifierUUID];
      [(ICSApplicationDelegate *)self setCallUUIDWaitingToPresentBanner:v45];
    }

    goto LABEL_27;
  }
  id v30 = sub_1000D52D8();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Already have a full-screen scene, assuming the status bar was tapped", buf, 2u);
  }
  __int16 v31 = +[NSNotificationCenter defaultCenter];
  [v31 postNotificationName:@"ICSStatusBarTappedNotification" object:0];

  id v32 = [(PHApplicationDelegate *)self featureFlags];
  LODWORD(v31) = [v32 callManagerEnabled];

  if (v31 && v5)
  {
    __int16 v33 = sub_1000D52D8();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Passing along fullscreen tap", buf, 2u);
    }
    __int16 v27 = +[NSNotificationCenter defaultCenter];
    [v27 postNotificationName:@"ICSStatusBarTapInFullScreenNotification" object:0];
    goto LABEL_26;
  }
LABEL_27:
}

- (void)requestSpringBoardPresentationForScreenSharingBroadcaster:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PHApplicationDelegate *)self featureFlags];
  unsigned int v6 = [v5 screenSharingRemoteControlEnabled];

  id v7 = sub_1000D52D8();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting presentation for screen sharing broadcaster: %@", (uint8_t *)&v14, 0xCu);
    }
    id v9 = [(ICSApplicationDelegate *)self sceneManager];
    [v9 didRequestSceneOfType:2 withIdentifier:0];

    id v10 = objc_opt_new();
    unsigned __int8 v11 = [v10 uiSceneSessionRole];
    id v12 = +[UISceneSessionActivationRequest requestWithRole:v11];

    int v13 = +[UIApplication sharedApplication];
    [v13 activateSceneSessionForRequest:v12 errorHandler:&stru_1002CE728];
  }
  else if (v8)
  {
    LOWORD(v14) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not requesting presentation for screen sharing broadcaster, Essonite features are disabled.", (uint8_t *)&v14, 2u);
  }
}

- (void)requestClarityBoardPresentationForCall:(id)a3 dialRequest:(id)a4
{
  BOOL v5 = [(ICSApplicationDelegate *)self sceneManager];
  unsigned int v6 = [v5 hasPendingSceneOfType:3];

  if (v6)
  {
    id v7 = sub_1000D52D8();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    __int16 v19 = 0;
    BOOL v8 = "Already requested presentation from ClarityBoard, so skipping new request.";
    id v9 = (uint8_t *)&v19;
    id v10 = v7;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    return;
  }
  unsigned __int8 v11 = [(ICSApplicationDelegate *)self sceneManager];
  id v12 = [v11 clarityUIScene];

  int v13 = sub_1000D52D8();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (!v14) {
      return;
    }
    *(_WORD *)buf = 0;
    BOOL v8 = "Already presented by ClarityBoard, so skipping new request.";
    id v9 = buf;
    id v10 = v13;
    goto LABEL_7;
  }
  if (v14)
  {
    *(_WORD *)unsigned int v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Requesting presentation from ClarityBoard.", v17, 2u);
  }
  id v15 = [(ICSApplicationDelegate *)self sceneManager];
  [v15 didRequestSceneOfType:3 withIdentifier:0];

  unsigned int v16 = +[UIApplication sharedApplication];
  [v16 requestSceneSessionActivation:0 userActivity:0 options:0 errorHandler:&stru_1002CE748];
}

- (void)requestPTTPresentation:(int64_t)a3 forCall:(id)a4
{
  id v6 = a4;
  id v7 = sub_1000D52D8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Requesting PTT presentation for call %@", (uint8_t *)&v17, 0xCu);
  }
  switch(a3)
  {
    case 0:
      BOOL v8 = sub_1000D52D8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not activating PTT user interface because presentation was unknown", (uint8_t *)&v17, 2u);
      }
      goto LABEL_18;
    case 1:
      id v9 = sub_1000D52D8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Activating PTT user interface as banner", (uint8_t *)&v17, 2u);
      }
      [(ICSApplicationDelegate *)self presentDismissedPTTSceneForCall:v6];
      id v10 = [(ICSApplicationDelegate *)self bannerPresentationManager];
      [v10 showPTTHUD];
      break;
    case 2:
      unsigned __int8 v11 = +[PHInCallUIUtilities sharedInstance];
      unsigned __int8 v12 = [v11 isSpringBoardLocked];

      if (v12) {
        goto LABEL_18;
      }
      int v13 = sub_1000D52D8();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Activating PTT user interface as notice for incoming transmission if needed", (uint8_t *)&v17, 2u);
      }
      [(ICSApplicationDelegate *)self presentDismissedPTTSceneForCall:v6];
      id v10 = [(ICSApplicationDelegate *)self bannerPresentationManager];
      [v10 showRemoteParticipantNoticeIfNeeded];
      break;
    case 3:
      BOOL v14 = +[PHInCallUIUtilities sharedInstance];
      unsigned __int8 v15 = [v14 isSpringBoardLocked];

      if (v15) {
        goto LABEL_18;
      }
      unsigned int v16 = sub_1000D52D8();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Activating PTT user interface as notice for acessory button events if needed", (uint8_t *)&v17, 2u);
      }
      [(ICSApplicationDelegate *)self presentDismissedPTTSceneForCall:v6];
      id v10 = [(ICSApplicationDelegate *)self bannerPresentationManager];
      [v10 showAccessoryButtonEventsNoticeIfNeeded];
      break;
    default:
      goto LABEL_18;
  }

LABEL_18:
}

- (void)presentDismissedPTTSceneForCall:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000D52D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Activating InCallService PTT user interface as full screen scene in dismissed mode", v7, 2u);
  }
  id v6 = [(ICSApplicationDelegate *)self configurationForPTTSessionWithCall:v4 preferredPresentationMode:0];

  [(ICSApplicationDelegate *)self performPresentationWithConfiguration:v6 forSceneType:0];
}

- (void)dismissPTTSessionPresentation
{
  BOOL v3 = sub_1000D52D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing PTT session presentation", v5, 2u);
  }
  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHInitialPTTFullScreenPresentationAssertionReason"];
  +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHPTTCallDetailsViewAssertionReason"];
  id v4 = [(ICSApplicationDelegate *)self bannerPresentationManager];
  [v4 dismissPresentedBannerForReason:@"Dismissing PTT Banner" animated:1];
}

- (void)bannerPresentationManagerDidDismissBanner
{
  BOOL v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 frontmostBargeCall];

  if (v4 && [v4 isPTT]) {
    [(ICSApplicationDelegate *)self dismissPTTSessionPresentation];
  }
  [(ICSApplicationDelegate *)self setIsShowingIncomingNameUpdate:0];
}

- (BOOL)bannerPresentationManagerWantsSpringBoardIsLockedStatus
{
  id v2 = +[PHInCallUIUtilities sharedInstance];
  unsigned __int8 v3 = [v2 isSpringBoardLocked];

  return v3;
}

- (void)bannerPresentationManagerShowFullscreenPTTCallDetailsView
{
  unsigned __int8 v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deep linking to PushToTalk call details view", v4, 2u);
  }

  [(ICSApplicationDelegate *)self setDidDeepLinkToPTTCallDetailsView:1];
  +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHPTTCallDetailsViewAssertionReason"];
  [(ICSApplicationDelegate *)self requestFullScreenSpringBoardPresentationForCallDetailsView];
}

- (void)requestGreenTea3PPresentationForCall:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000D52D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requesting GreenTea3P presentation for call %@", buf, 0xCu);
  }
  id v6 = [(ICSApplicationDelegate *)self configurationForGreenTea3P];
  [(ICSApplicationDelegate *)self performPresentationWithConfiguration:v6 forSceneType:6];
  uint64_t v7 = [(ICSApplicationDelegate *)self currentInCallScene];
  if (v7
    && (BOOL v8 = (void *)v7,
        [(ICSApplicationDelegate *)self currentInCallScene],
        id v9 = objc_claimAutoreleasedReturnValue(),
        id v10 = [v9 presentationMode],
        v9,
        v8,
        v10))
  {
    unsigned __int8 v11 = [(ICSApplicationDelegate *)self currentInCallScene];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100056110;
    v12[3] = &unk_1002CE6E8;
    v12[4] = self;
    [v11 ics_requestTransitionToPresentationMode:0 shouldDismissCMASAlerts:0 analyticsSource:0 completion:v12];
  }
  else
  {
    unsigned __int8 v11 = [(ICSApplicationDelegate *)self bannerPresentationManager];
    [v11 showGreenTea3PHUD];
  }

  [(ICSApplicationDelegate *)self showCarPlayUIWithActivation:1];
}

- (id)configurationForGreenTea3P
{
  id v2 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  id v3 = [v2 initWithSceneBundleIdentifier:TUBundleIdentifierInCallServiceApplication];
  [v3 setShouldDismissCMASAlerts:0];
  [v3 setPreferredPresentationMode:0];
  [v3 setShouldPreferContinuityDisplayForFullScreenPresentation:1];
  [v3 setSupportsSystemAperture:0];
  if (objc_opt_respondsToSelector())
  {
    char v7 = 1;
    id v4 = [(id)objc_opt_class() instanceMethodSignatureForSelector:"setRequiresDismissedPresentationmode:"];
    BOOL v5 = +[NSInvocation invocationWithMethodSignature:v4];
    [v5 setTarget:v3];
    [v5 setSelector:"setRequiresDismissedPresentationmode:"];
    [v5 setArgument:&v7 atIndex:2];
    [v5 invoke];
  }

  return v3;
}

- (void)updatePresentationIfNecessaryForGreenTea3PCall:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000D52D8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Updating presentation if necessary for GreenTea3P call: %@", (uint8_t *)&v18, 0xCu);
  }
  id v6 = +[TUCallCenter sharedInstance];
  char v7 = [v6 callsPassingTest:&stru_1002CE768];
  id v8 = [v7 count];

  if (!v8) {
    [(ICSApplicationDelegate *)self dismissInCallSceneOfType:6];
  }
  id v9 = +[TUCallCenter sharedInstance];
  id v10 = [v9 frontmostAudioOrVideoCall];
  unsigned __int8 v11 = [v10 provider];
  unsigned __int8 v12 = [v11 supportsDynamicSystemUI];

  int v13 = +[TUCallCenter sharedInstance];
  id v14 = [v13 frontmostAudioOrVideoCall];
  unsigned int v15 = [(ICSApplicationDelegate *)self shouldActivateSpringBoardRemoteAlertForCall:v14];

  if ((v12 & 1) == 0 && v15)
  {
    unsigned int v16 = +[TUCallCenter sharedInstance];
    int v17 = [v16 frontmostAudioOrVideoCall];
    [(ICSApplicationDelegate *)self requestPresentationForCall:v17 dialRequest:0];
  }
}

- (void)requestHandoffEligibleConversationPresentation
{
  id v3 = sub_1000D52D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for handoff-eligible nearby conversation", v5, 2u);
  }
  id v4 = [(ICSApplicationDelegate *)self bannerPresentationManager];
  [v4 showHandoffHUD];
}

- (void)requestLagunaPullConversationPresentation
{
  id v3 = sub_1000D52D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for laguna pull conversation", v5, 2u);
  }
  id v4 = [(ICSApplicationDelegate *)self bannerPresentationManager];
  [v4 showLagunaPullConversationHUD];
}

- (void)requestSpringBoardPresentationForScreenSharingAsPiP:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PHApplicationDelegate *)self featureFlags];
  unsigned __int8 v6 = [v5 supportsScreenSharing];

  char v7 = sub_1000D52D8();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v3;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for Screen Sharing with initially PiPped: %i", (uint8_t *)v10, 8u);
    }
    if (v3)
    {
      id v9 = [(ICSApplicationDelegate *)self configurationForScreenSharingInitiallyInPiP:1];
      [(ICSApplicationDelegate *)self requestBackgroundPiPAuthorizationForSceneType:1 withConfiguration:v9];
    }
    else
    {
      [(ICSApplicationDelegate *)self performPresentationForScreenSharingInitiallyInPiP:0];
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    sub_1001E9D84();
  }
}

- (void)requestBackgroundPiPAuthorizationOfDismissedInCallSceneForCall:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ICSApplicationDelegate *)self hasExistingDismissedInCallScene];
  unsigned __int8 v6 = [(ICSApplicationDelegate *)self sceneManager];
  unsigned int v7 = [v6 hasPendingCompletionForSceneType:0 presentationMode:2];

  int v8 = v5 ^ 1;
  id v9 = sub_1000D52D8();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((v8 & 1) != 0 || v7)
  {
    if (v10)
    {
      v12[0] = 67109376;
      v12[1] = v8;
      __int16 v13 = 1024;
      unsigned int v14 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Not requesting background PiP authorization since there isn't a dismissed in-call scene (%d) or we're in the midst of presenting a fullscreen scene (%d)", (uint8_t *)v12, 0xEu);
    }
  }
  else
  {
    if (v10)
    {
      LOWORD(v12[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Requesting background PiP authorization for dismissed in-call scene", (uint8_t *)v12, 2u);
    }
    unsigned __int8 v11 = +[ICSApplicationDelegate configurationForCall:v4 preferredPresentationMode:0];
    [(ICSApplicationDelegate *)self requestBackgroundPiPAuthorizationForSceneType:0 withConfiguration:v11];
  }
}

- (void)requestBackgroundPiPAuthorizationForSceneType:(unint64_t)a3 withConfiguration:(id)a4
{
  id v6 = a4;
  if (a3 == 1)
  {
    unsigned int v7 = +[NSUUID UUID];
    id v8 = [v7 UUIDString];
  }
  else
  {
    id v8 = TUBundleIdentifierInCallServiceApplication;
  }
  id v9 = [(ICSApplicationDelegate *)self backgroundPIPAuthorizationForSceneType];
  BOOL v10 = +[NSNumber numberWithUnsignedInteger:a3];
  unsigned __int8 v11 = [v9 objectForKeyedSubscript:v10];

  if (v11)
  {
    unsigned __int8 v12 = sub_1000D52D8();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = v12;
      unsigned int v14 = sub_100011694(a3);
      *(_DWORD *)buf = 138543362;
      __int16 v35 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Already have existing background authorization request for scene of type %{public}@; removing old request",
        buf,
        0xCu);
    }
    [(ICSApplicationDelegate *)self revokeAndRemoveBackgroundPiPAuthorizationForSceneTypeIfNeeded:a3];
  }
  unsigned int v15 = sub_1000D52D8();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = v15;
    int v17 = sub_100011694(a3);
    *(_DWORD *)buf = 138543618;
    __int16 v35 = v17;
    __int16 v36 = 2114;
    id v37 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Requesting background PiP authorization for %{public}@ scene with activity session identifier '%{public}@'", buf, 0x16u);
  }
  int v18 = [(ICSApplicationDelegate *)self sceneManager];
  id v19 = [v6 identifier];
  [v18 didRequestSceneOfType:a3 withIdentifier:v19];

  objc_initWeak((id *)buf, self);
  id v20 = objc_alloc((Class)PGBackgroundPIPAuthorization);
  __int16 v27 = _NSConcreteStackBlock;
  uint64_t v28 = 3221225472;
  __int16 v29 = sub_100056B6C;
  id v30 = &unk_1002CE7B8;
  objc_copyWeak(v33, (id *)buf);
  uint64_t v21 = TUBundleIdentifierInCallServiceApplication;
  v33[1] = (id)a3;
  id v22 = v8;
  id v31 = v22;
  id v23 = v6;
  id v32 = v23;
  id v24 = [v20 initWithActivitySessionIdentifier:v22 appBundleIdentifier:v21 stateTransitionHandler:&v27];
  unsigned int v25 = [(ICSApplicationDelegate *)self backgroundPIPAuthorizationForSceneType];
  uint64_t v26 = +[NSNumber numberWithUnsignedInteger:a3];
  [v25 setObject:v24 forKeyedSubscript:v26];

  objc_destroyWeak(v33);
  objc_destroyWeak((id *)buf);
}

- (void)revokeAndRemoveBackgroundPiPAuthorizationForSceneTypeIfNeeded:(unint64_t)a3
{
  unsigned int v5 = [(ICSApplicationDelegate *)self backgroundPIPAuthorizationForSceneType];
  id v6 = +[NSNumber numberWithUnsignedInteger:a3];
  unsigned int v7 = [v5 objectForKeyedSubscript:v6];

  if (v7)
  {
    id v8 = sub_1000D52D8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = v8;
      BOOL v10 = sub_100011694(a3);
      int v13 = 138543362;
      unsigned int v14 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Revoking and removing existing background authorization for %{public}@ scene", (uint8_t *)&v13, 0xCu);
    }
  }
  [v7 revoke];
  unsigned __int8 v11 = [(ICSApplicationDelegate *)self backgroundPIPAuthorizationForSceneType];
  unsigned __int8 v12 = +[NSNumber numberWithUnsignedInteger:a3];
  [v11 removeObjectForKey:v12];
}

- (void)dismissInCallSceneSession
{
  if ([(ICSApplicationDelegate *)self isClarityBoardActive])
  {
    [(ICSApplicationDelegate *)self dismissClarityUIScene];
  }
  else
  {
    [(ICSApplicationDelegate *)self dismissInCallSceneOfType:0];
  }
}

- (void)dismissScreenSharingSceneSession
{
  BOOL v3 = [(PHApplicationDelegate *)self featureFlags];
  unsigned __int8 v4 = [v3 supportsScreenSharing];

  if (v4)
  {
    [(ICSApplicationDelegate *)self dismissInCallSceneOfType:1];
  }
  else
  {
    unsigned int v5 = sub_1000D52D8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ignoring request to dismiss Screen Sharing scene since the feature is disabled", v6, 2u);
    }
  }
}

- (void)dismissScreenSharingBroadcasterSession
{
  BOOL v3 = [(PHApplicationDelegate *)self featureFlags];
  unsigned __int8 v4 = [v3 screenSharingDrawToHighlightEnabled];

  if (v4)
  {
    unsigned int v5 = [(ICSApplicationDelegate *)self sceneManager];
    id v6 = [v5 screenSharingBroadcasterScene];

    unsigned int v7 = sub_1000D52D8();
    id v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned __int8 v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dismissing Sharing Broadcasing scene.", v12, 2u);
      }
      id v9 = +[UIApplication sharedApplication];
      BOOL v10 = [v6 session];
      [v9 requestSceneSessionDestruction:v10 options:0 errorHandler:&stru_1002CE7D8];
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      sub_1001E9DB8();
    }
  }
  else
  {
    unsigned __int8 v11 = sub_1000D52D8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ignoring request to dismiss Broadcaster scene since the feature is disabled", buf, 2u);
    }
  }
}

- (void)dismissVideoMessageSceneSession
{
}

- (void)dismissInCallSceneOfType:(unint64_t)a3
{
}

- (void)dismissClarityUIScene
{
  BOOL v3 = [(ICSApplicationDelegate *)self sceneManager];
  unsigned __int8 v4 = [v3 clarityUIScene];

  unsigned int v5 = sub_1000D52D8();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)BOOL v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Dismissing Assistive Access scene.", v10, 2u);
    }
    unsigned int v7 = +[UIApplication sharedApplication];
    id v8 = [v4 session];
    [v7 requestSceneSessionDestruction:v8 options:0 errorHandler:&stru_1002CE7F8];

    id v9 = [(ICSApplicationDelegate *)self sceneManager];
    [v9 didDismissSceneOfType:3];
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Attempted to dismiss Assistive Access scene, but none was showing.", buf, 2u);
  }
}

- (BOOL)hasActiveOrPendingInCallPresentation
{
  id v2 = [(ICSApplicationDelegate *)self sceneManager];
  unsigned __int8 v3 = [v2 hasPendingOrExistingSceneOfType:0];

  return v3;
}

- (BOOL)hasActiveOrPendingVideoMessagePresentation
{
  id v2 = [(ICSApplicationDelegate *)self sceneManager];
  unsigned __int8 v3 = [v2 hasPendingOrExistingSceneOfType:4];

  return v3;
}

- (BOOL)hasExistingDismissedInCallScene
{
  if (![(ICSApplicationDelegate *)self hasActiveOrPendingInCallPresentation]) {
    return 0;
  }
  unsigned __int8 v3 = [(ICSApplicationDelegate *)self currentInCallScene];
  if (v3)
  {
    unsigned __int8 v4 = [(ICSApplicationDelegate *)self currentInCallScene];
    BOOL v5 = [v4 presentationMode] == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)hasExistingFullScreenInCallScene
{
  if (![(ICSApplicationDelegate *)self hasActiveOrPendingInCallPresentation]) {
    return 0;
  }
  unsigned __int8 v3 = [(ICSApplicationDelegate *)self currentInCallScene];
  if (v3)
  {
    unsigned __int8 v4 = [(ICSApplicationDelegate *)self currentInCallScene];
    BOOL v5 = [v4 presentationMode] == (id)2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)requestSpringBoardPresentationForSOS
{
  unsigned __int8 v3 = sub_1000D52D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for SOS", buf, 2u);
  }
  unsigned __int8 v4 = +[ICSPreferences sharedPreferences];
  unsigned int v5 = [v4 hasAdoptedModernInCallAPI];

  if (v5)
  {
    if ([(ICSApplicationDelegate *)self hasActiveOrPendingInCallPresentation])
    {
      BOOL v6 = [(ICSApplicationDelegate *)self currentInCallScene];

      if (v6)
      {
        unsigned int v7 = +[PHPIPController defaultPIPController];
        unsigned int v8 = [v7 isPipped];

        id v9 = sub_1000D52D8();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        if (v8)
        {
          if (v10)
          {
            *(_WORD *)unsigned int v15 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "InCallService is currently PIPped. Un-PIPping now, then the scene should transition to full-screen overlay after the call disconnects.", v15, 2u);
          }
          unsigned __int8 v11 = +[NSNotificationCenter defaultCenter];
          unsigned __int8 v12 = +[PHPIPController defaultPIPController];
          [v11 postNotificationName:@"PHPIPControllerDidRequestReturnToFullScreenNotification" object:v12];
        }
        else
        {
          if (v10)
          {
            *(_WORD *)unsigned int v14 = 0;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "There's an existing in-call scene, transitioning to full-screen overlay for SOS", v14, 2u);
          }
          [(ICSApplicationDelegate *)self transitionSceneToOverlayForSOS];
        }
      }
      else
      {
        int v13 = sub_1000D52D8();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned int v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "While requesting a new scene for SOS, hasActiveOrPendingInCallPresentation is YES but currentInCallScene is nil. This is likely because we already requested a scene, but it hasn't been created yet. The new scene should transition to full-screen overlay as soon as it connects.", v16, 2u);
        }
      }
    }
    else
    {
      [(ICSApplicationDelegate *)self performPresentationForSOS];
    }
  }
  else
  {
    [(ICSApplicationDelegate *)self activateSpringBoardRemoteAlertForSOSCall];
  }
}

- (void)requestClarityBoardPresentationForSOS
{
  unsigned __int8 v3 = sub_1000D52D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Requesting presentation from ClarityBoard.", v6, 2u);
  }
  unsigned __int8 v4 = [(ICSApplicationDelegate *)self sceneManager];
  [v4 didRequestSceneOfType:3 withIdentifier:0];

  unsigned int v5 = +[UIApplication sharedApplication];
  [v5 requestSceneSessionActivation:0 userActivity:0 options:0 errorHandler:&stru_1002CE818];
}

- (void)requestSpringBoardPresentationForScreenTime
{
  unsigned __int8 v3 = sub_1000D52D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for ScreenTime", buf, 2u);
  }
  if ([(ICSApplicationDelegate *)self hasActiveOrPendingInCallPresentation])
  {
    unsigned __int8 v4 = [(ICSApplicationDelegate *)self currentInCallScene];

    unsigned int v5 = sub_1000D52D8();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        *(_WORD *)unsigned int v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "There's an existing in-call scene, transitioning to full-screen overlay for ScreenTime", v8, 2u);
      }
      unsigned int v7 = [(ICSApplicationDelegate *)self currentInCallScene];
      [v7 requestTransitionToPresentationMode:2 shouldDismissCMASAlerts:0];
    }
    else if (v6)
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "While requesting a new scene for ScreenTime, hasActiveOrPendingInCallPresentation is YES but currentInCallScene is nil. This is likely because we already requested a scene, but it hasn't been created yet. The new scene should transition to full-screen overlay as soon as it connects.", v9, 2u);
    }
  }
  else
  {
    [(ICSApplicationDelegate *)self performPresentationForScreenTime];
  }
}

- (void)requestSpringBoardPresentationForCallDetailsView
{
  unsigned __int8 v3 = sub_1000D52D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for call details view", v4, 2u);
  }
  if (![(ICSApplicationDelegate *)self hasActiveOrPendingInCallPresentation]) {
    [(ICSApplicationDelegate *)self performDismissedPresentationForCallDetailsView];
  }
}

- (void)requestFullScreenSpringBoardPresentationForCallDetailsView
{
  unsigned __int8 v3 = sub_1000D52D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface, in fullscreen, for call details view", buf, 2u);
  }
  if ([(ICSApplicationDelegate *)self hasActiveOrPendingInCallPresentation])
  {
    unsigned __int8 v4 = sub_1000D52D8();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Already have a scene, requesting scene to be presented FullScreen", v6, 2u);
    }
    unsigned int v5 = [(ICSApplicationDelegate *)self currentInCallScene];
    [v5 requestTransitionToPresentationMode:2 shouldDismissCMASAlerts:0];
  }
  else
  {
    [(ICSApplicationDelegate *)self performFullScreenPresentationForCallDetailsView];
  }
}

- (void)transitionSceneToOverlayForSOS
{
}

- (void)transitionSceneToOverlayForScreenTime
{
}

- (void)transitionScenetoOverlayAndDismissCMASAlerts:(BOOL)a3
{
  unsigned __int8 v3 = [(ICSApplicationDelegate *)self currentInCallScene];
  id v4 = [v3 presentationMode];

  if (v4 != (id)3) {
    TUDispatchMainIfNecessary();
  }
}

- (void)activateSpringBoardRemoteAlertForSOSCall
{
  unsigned __int8 v3 = sub_1000D52D8();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Activating InCallService user interface for SOS call", v6, 2u);
  }
  id v4 = [(ICSApplicationDelegate *)self springBoardRemoteAlertOptionsForSOSCall];
  unsigned int v5 = +[NSBundle mainBundle];
  [v5 bundleIdentifier];
  SBSUIActivateRemoteAlert();
}

- (BOOL)shouldActivateSpringBoardRemoteAlertForCall:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(PHApplicationDelegate *)self featureFlags];
  unsigned int v6 = [v5 avLessSharePlayEnabled];
  if (v4) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = v6;
  }

  if (v7 == 1)
  {
    unsigned int v8 = sub_1000D52D8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Suppressing showing scene for nil call", (uint8_t *)&v12, 2u);
    }
  }
  char v9 = v7 ^ 1;
  if ([v4 isEmergency])
  {
    if (sub_1000928BC()
      && ([v4 isRTT] & 1) == 0
      && ([v4 isTTY] & 1) == 0)
    {
      BOOL v10 = sub_1000D52D8();
      char v9 = 0;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "suppressing showing alert for call because it's an emergency call, the emergency dialer presence token is set, and call is not RTT/TTY: %@", (uint8_t *)&v12, 0xCu);
        char v9 = 0;
      }
    }
  }

  return v9;
}

- (id)springBoardRemoteAlertOptionsForCall:(id)a3 dialRequest:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = +[NSMutableDictionary dictionary];
  unsigned int v8 = TUInCallRemoteAlertViewControllerClassName();
  [v7 setObject:v8 forKeyedSubscript:SBSUIRemoteAlertOptionViewControllerClass];

  [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:SBSUIRemoteAlertOptionDismissWithHomeButton];
  if ([v5 status] != 4) {
    [v7 setObject:&off_1002DEE80 forKeyedSubscript:SBSUIRemoteAlertOptionSwipeDismissalStyle];
  }
  if ([v5 isVideo])
  {
    char v9 = (_UNKNOWN **)&__kCFBooleanFalse;
    [v7 setObject:&__kCFBooleanFalse forKeyedSubscript:SBSUIRemoteAlertOptionWantsWallpaperTunnel];
    BOOL v10 = &SBSUIRemoteAlertOptionHasTranslucentBackground;
  }
  else
  {
    [v7 setObject:&__kCFBooleanTrue forKeyedSubscript:SBSUIRemoteAlertOptionWantsWallpaperTunnel];
    if (v6) {
      BOOL v11 = [v6 originatingUIType] == 1;
    }
    else {
      BOOL v11 = 0;
    }
    int v12 = +[NSNumber numberWithInt:v11];
    [v7 setObject:v12 forKeyedSubscript:SBSUIRemoteAlertOptionDisableFadeInAnimation];

    [v7 setObject:&off_1002DEE80 forKeyedSubscript:SBSUIRemoteAlertOptionDismissalAnimationStyle];
    char v9 = &off_1002DEE98;
    BOOL v10 = &SBSUIRemoteAlertOptionInitialBackgroundStyle;
  }
  [v7 setObject:v9 forKeyedSubscript:*v10];
  id v13 = [v7 copy];

  return v13;
}

- (id)springBoardRemoteAlertOptionsForSOSCall
{
  id v2 = +[NSMutableDictionary dictionary];
  unsigned __int8 v3 = TUInCallRemoteAlertViewControllerClassName();
  [v2 setObject:v3 forKeyedSubscript:SBSUIRemoteAlertOptionViewControllerClass];

  [v2 setObject:&__kCFBooleanFalse forKeyedSubscript:SBSUIRemoteAlertOptionDismissWithHomeButton];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:SBSUIRemoteAlertOptionWantsWallpaperTunnel];
  [v2 setObject:&off_1002DEE80 forKeyedSubscript:SBSUIRemoteAlertOptionDismissalAnimationStyle];
  [v2 setObject:&off_1002DEE98 forKeyedSubscript:SBSUIRemoteAlertOptionInitialBackgroundStyle];
  [v2 setObject:&off_1002DEE80 forKeyedSubscript:SBSUIRemoteAlertOptionSwipeDismissalStyle];
  id v4 = [v2 copy];

  return v4;
}

- (BOOL)shouldShowAirplaneEmergencyCallAlertForDialRequest:(id)a3
{
  id v3 = a3;
  if (sub_100092880()
    && [v3 isValid]
    && ([v3 isSOS] & 1) == 0)
  {
    id v6 = [v3 localSenderIdentityUUID];
    if (+[TUCallCapabilities canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:](TUCallCapabilities, "canAttemptEmergencyCallsWithoutCellularConnectionWithUUID:", v6))unsigned __int8 v4 = +[TUCallCapabilities supportsPrimaryCalling]; {
    else
    }
      unsigned __int8 v4 = 0;
  }
  else
  {
    unsigned __int8 v4 = 0;
  }

  return v4;
}

- (BOOL)shouldShowEmergencyCallbackModeAlertForDialRequest:(id)a3
{
  id v4 = a3;
  if (+[PHDevice isGeminiCapable]
    && [v4 isValid]
    && ([v4 isSOS] & 1) == 0
    && [v4 dialType] != (id)1)
  {
    unsigned int v7 = [v4 handle];
    unsigned int v8 = [v7 value];
    if ([v8 length])
    {
      char v9 = [v4 provider];
      if ([v9 isTelephonyProvider])
      {
        BOOL v10 = [(ICSApplicationDelegate *)self senderIdentityClient];
        BOOL v11 = [v4 localSenderIdentityUUID];
        unsigned __int8 v5 = [v10 shouldShowEmergencyCallbackModeAlertForSenderIdentityUUID:v11];
      }
      else
      {
        unsigned __int8 v5 = 0;
      }
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowTelephonyAccountUnavailableAlertForDialRequest:(id)a3
{
  id v3 = a3;
  if (+[PHDevice isGeminiCapable]
    && [v3 isValid]
    && ([v3 isSOS] & 1) == 0
    && ![v3 dialType])
  {
    id v6 = [v3 provider];
    if ([v6 isTelephonyProvider])
    {
      unsigned int v7 = [v3 provider];
      unsigned int v8 = [v7 prioritizedSenderIdentities];
      if ([v8 count])
      {
        char v9 = [v3 localSenderIdentityAccountUUID];
        if (v9)
        {
          BOOL v10 = [v3 localSenderIdentity];
          BOOL v11 = [v10 accountUUID];
          int v12 = [v3 localSenderIdentityAccountUUID];
          unsigned int v4 = [v11 isEqual:v12] ^ 1;
        }
        else
        {
          LOBYTE(v4) = 0;
        }
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)shouldShowRTTAlertForDialRequest:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[TUCallCenter sharedInstance];
  if ([v4 currentCallCount]
    || ![v3 isValid]
    || ([v3 isSOS] & 1) != 0)
  {
    unsigned __int8 v5 = 0;
  }
  else
  {
    unsigned int v7 = [v3 handle];
    unsigned int v8 = [v7 value];
    if ([v8 length])
    {
      char v9 = [v3 provider];
      if ([v9 isTelephonyProvider] && !objc_msgSend(v3, "ttyType"))
      {
        if ([v3 isRTTAvailable]) {
          unsigned __int8 v5 = 1;
        }
        else {
          unsigned __int8 v5 = [v3 isTTYAvailable];
        }
      }
      else
      {
        unsigned __int8 v5 = 0;
      }
    }
    else
    {
      unsigned __int8 v5 = 0;
    }
  }
  return v5;
}

- (BOOL)shouldShowScreenTimeAlertForDialRequest:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[TUCallCenter sharedInstance];
  unsigned __int8 v5 = [v4 callFilterController];
  unsigned __int8 v6 = [v5 shouldRestrictDialRequest:v3];

  return v6;
}

- (BOOL)shouldShowScreenTimeAlertForJoinConversationRequest:(id)a3
{
  id v3 = a3;
  unsigned int v4 = +[TUCallCenter sharedInstance];
  unsigned __int8 v5 = [v4 conversationManager];
  unsigned __int8 v6 = [v3 remoteMembers];
  unsigned int v7 = [v3 conversationLink];
  unsigned int v8 = [v5 activeConversationWithRemoteMembers:v6 andLink:v7];

  char v9 = [v8 activeRemoteParticipants];
  id v10 = [v9 count];

  BOOL v11 = +[TUCallCenter sharedInstance];
  int v12 = [v11 callFilterController];
  id v13 = v12;
  if (v10) {
    unsigned __int8 v14 = [v12 shouldRestrictConversation:v8 performSynchronously:0];
  }
  else {
    unsigned __int8 v14 = [v12 shouldRestrictJoinConversationRequest:v3 performSynchronously:0];
  }
  BOOL v15 = v14;

  return v15;
}

- (BOOL)shouldActivateSOS
{
  id v3 = [(ICSApplicationDelegate *)self activationContext];
  if (v3)
  {
    unsigned int v4 = [(ICSApplicationDelegate *)self activationContext];
    unsigned __int8 v5 = [v4 reason];
    if ([v5 isEqualToString:SOSRemoteAlertActivationReasonActivatingForSOSWithClicks])
    {
      unsigned __int8 v6 = 1;
    }
    else
    {
      unsigned int v7 = [(ICSApplicationDelegate *)self activationContext];
      unsigned int v8 = [v7 reason];
      if ([v8 isEqualToString:SOSRemoteAlertActivationReasonActivatingForSOSWithKappa])
      {
        unsigned __int8 v6 = 1;
      }
      else
      {
        char v9 = [(ICSApplicationDelegate *)self activationContext];
        id v10 = [v9 reason];
        if ([v10 isEqualToString:SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen])
        {
          unsigned __int8 v6 = 1;
        }
        else
        {
          BOOL v11 = [(ICSApplicationDelegate *)self activationContext];
          int v12 = [v11 reason];
          unsigned __int8 v6 = [v12 isEqualToString:SOSRemoteAlertActivationReasonActivatingForSOSWithVolumeLockHold];
        }
      }
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (void)startSOSFlowWithActivationReason:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = sub_1000D5470();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting SOS flow with activation reason %@", (uint8_t *)&v11, 0xCu);
  }
  unsigned __int8 v6 = [[ICSActivationContext alloc] initWithReason:v4 userInfo:0];
  [(ICSApplicationDelegate *)self setActivationContext:v6];

  if ([v4 isEqualToString:SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen])
  {
    unsigned int v7 = +[TUCallCenter sharedInstance];
    [v7 disconnectAllCallsWithNoPreflight];
    unsigned int v8 = off_1002CFE50;
    goto LABEL_10;
  }
  if (![(ICSApplicationDelegate *)self hasOngoingEmergencyCall])
  {
    unsigned int v7 = +[TUCallCenter sharedInstance];
    [v7 disconnectAllCalls];
    unsigned int v8 = off_1002CFE08;
LABEL_10:

    +[PHInCallRootViewController obtainDismissalAssertionForReason:*v8];
    if ([(ICSApplicationDelegate *)self isClarityBoardActive])
    {
      [(ICSApplicationDelegate *)self requestClarityBoardPresentationForSOS];
    }
    else
    {
      [(ICSApplicationDelegate *)self requestSpringBoardPresentationForSOS];
      +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHAudioCallViewControllerDismissalAssertionHandlingCallFailure"];
      +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHCallEndedBlockAndReportInProgressAssertionReason"];
      +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHMulitwayCallAssertionReason"];
      +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHAVLessConversationDetailsViewAssertionReason"];
      +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHAVLessConversationAssertionReason"];
      +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHInitialPTTFullScreenPresentationAssertionReason"];
      +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHPTTCallDetailsViewAssertionReason"];
    }
    goto LABEL_13;
  }
  char v9 = sub_1000D5470();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Cancelling SOS due to ongoing emergency call", (uint8_t *)&v11, 2u);
  }
  id v10 = +[SOSStatusReporter sharedInstance];
  [v10 updateSOSFlowState:6];

LABEL_13:
}

- (BOOL)hasOngoingEmergencyCall
{
  id v2 = objc_alloc((Class)NSMutableArray);
  id v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 currentCalls];
  id v5 = [v2 initWithArray:v4];

  unsigned __int8 v6 = +[TUCallCenter sharedInstance];
  unsigned int v7 = [v6 callsOnDefaultPairedDevice];
  [v5 addObjectsFromArray:v7];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v5;
  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v12 && (objc_msgSend(v12, "isEmergency", (void)v14) & 1) != 0)
        {
          LOBYTE(v9) = 1;
          goto LABEL_12;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v9;
}

- (void)startScreenTimeFlowWithURL:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D53E8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting ScreenTime flow with URL %@", buf, 0xCu);
  }
  unsigned __int8 v6 = [ICSActivationContext alloc];
  uint64_t v7 = SOSRemoteAlertActivationReasonActivatingForScreenTime;
  id v8 = [v4 absoluteString:SOSRemoteAlertActivationContextUserInfoRequestURLStringKey];
  id v13 = v8;
  id v9 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  uint64_t v10 = [(ICSActivationContext *)v6 initWithReason:v7 userInfo:v9];

  int v11 = [(ICSActivationContext *)v10 pendingRestrictedScreenTimeRequest];

  if (v11)
  {
    +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHScreenTimeAlertAssertionReason"];
    [(ICSApplicationDelegate *)self setActivationContext:v10];
    [(ICSApplicationDelegate *)self requestSpringBoardPresentationForScreenTime];
  }
}

- (void)updateDialRequestAccountIfNecessary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localSenderIdentityAccountUUID];
  unsigned __int8 v6 = [v5 UUIDString];

  if (v6)
  {
    id v7 = [v4 localSenderIdentity];
    id v8 = [v7 accountUUID];
    id v9 = [v8 UUIDString];
    if ([v6 isEqualToString:v9])
    {

LABEL_15:
      goto LABEL_16;
    }
    uint64_t v10 = [v4 provider];
    unsigned int v11 = [v10 isTelephonyProvider];

    if (v11)
    {
      uint64_t v12 = sub_1000D5130();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[WARN] The localSenderIdentity and localSenderIdentityAccountUUID do not match for a telephony dial request, checking with the core telephony client", buf, 2u);
      }

      id v16 = 0;
      id v13 = [(ICSApplicationDelegate *)self getEvolvedSubscriptionLabelID:v6 error:&v16];
      id v7 = v16;
      if (v13 && ([v13 isEqualToString:v6] & 1) == 0)
      {
        long long v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:v13];
        id v15 = sub_1000D5130();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v18 = v4;
          __int16 v19 = 2112;
          id v20 = v13;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[WARN] Updating dial request %@ with accountUUID: %@", buf, 0x16u);
        }

        [v4 setLocalSenderIdentityAccountUUID:v14];
      }
      else
      {
        long long v14 = sub_1000D5130();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v18 = v6;
          __int16 v19 = 2112;
          id v20 = v7;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "[WARN] Failed to get an updated labelID for %@ with error %@", buf, 0x16u);
        }
      }

      goto LABEL_15;
    }
  }
LABEL_16:
}

- (BOOL)openThirdPartyDialRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "openThirdPartyDialRequest %@", buf, 0xCu);
  }

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100059918;
  v17[3] = &unk_1002CD518;
  id v6 = v4;
  id v18 = v6;
  id v7 = objc_retainBlock(v17);
  if (![v6 showUIPrompt]) {
    goto LABEL_8;
  }
  id v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Dial request's showUIPrompt is set to YES, so we will show an alert", buf, 2u);
  }

  id v9 = objc_alloc((Class)TPDialPromptAlert);
  uint64_t v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  long long v14 = sub_100059974;
  id v15 = &unk_1002CE840;
  id v16 = v7;
  id v10 = [v9 initWithDialRequest:v6 dialAction:&v12];

  if (v10)
  {
    [(ICSApplicationDelegate *)self acquireLongPreventSuspensionAssertion];
    [v10 show];
  }
  else
  {
LABEL_8:
    ((void (*)(void *))v7[2])(v7);
  }

  return 1;
}

- (BOOL)openSystemProviderDialRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v161 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "openSystemProviderDialRequest %@", buf, 0xCu);
  }

  +[ICSAriadne trace:2];
  [(ICSApplicationDelegate *)self updateDialRequestAccountIfNecessary:v4];
  v157[0] = _NSConcreteStackBlock;
  v157[1] = 3221225472;
  v157[2] = sub_10005AAB4;
  v157[3] = &unk_1002CD540;
  id v6 = v4;
  id v158 = v6;
  id v7 = objc_retainBlock(v157);
  id v8 = [v6 provider];
  if (![v8 isTelephonyProvider]) {
    goto LABEL_13;
  }
  int v9 = MGGetBoolAnswer();

  if (!v9)
  {
LABEL_14:
    if (+[SOSUtilities shouldBlockNonEmergencyCalls])
    {
      id v18 = +[TUCallCenter sharedInstance];
      unsigned __int8 v19 = [v18 _isEmergencyDialRequest:v6];

      if ((v19 & 1) == 0)
      {
        id v46 = sub_1000D5130();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Dial request rejected due to SOS being active", buf, 2u);
        }

        ((void (*)(void *, void))v7[2])(v7, 0);
        goto LABEL_32;
      }
    }
    id v20 = +[TUCallCenter sharedInstance];
    uint64_t v21 = [v20 frontmostCall];

    if (v21 && [v21 isEmergency])
    {
      id v22 = sub_1000D5130();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Dial request rejected due to active emergency call", buf, 2u);
      }

      goto LABEL_28;
    }
    if (!v6)
    {
LABEL_28:
      ((void (*)(void *, void))v7[2])(v7, 0);
      BOOL v45 = 0;
LABEL_65:

      goto LABEL_66;
    }
    id v23 = [(ICSApplicationDelegate *)self senderIdentityClient];
    id v24 = [v6 dialRequestByResolvingDialTypeUsingSenderIdentityClient:v23];

    v153[0] = _NSConcreteStackBlock;
    v153[1] = 3221225472;
    v153[2] = sub_10005AC28;
    v153[3] = &unk_1002CE868;
    id v25 = v24;
    id v154 = v25;
    v155 = self;
    uint64_t v26 = v7;
    id v156 = v26;
    __int16 v27 = objc_retainBlock(v153);
    v149[0] = _NSConcreteStackBlock;
    v149[1] = 3221225472;
    v149[2] = sub_10005ACBC;
    v149[3] = &unk_1002CE868;
    id v28 = v25;
    id v150 = v28;
    v151 = self;
    __int16 v29 = v26;
    id v152 = v29;
    id v30 = objc_retainBlock(v149);
    v145[0] = _NSConcreteStackBlock;
    v145[1] = 3221225472;
    v145[2] = sub_10005AF20;
    v145[3] = &unk_1002CE8B8;
    id v31 = v28;
    id v146 = v31;
    id v32 = v27;
    id v147 = v32;
    __int16 v33 = v29;
    id v148 = v33;
    v141[0] = _NSConcreteStackBlock;
    v141[1] = 3221225472;
    v141[2] = sub_10005B2E0;
    v141[3] = &unk_1002CE908;
    v141[4] = self;
    v34 = objc_retainBlock(v145);
    id v142 = v34;
    __int16 v35 = v32;
    id v143 = v35;
    __int16 v36 = v33;
    id v144 = v36;
    id v37 = objc_retainBlock(v141);
    v133[0] = _NSConcreteStackBlock;
    v133[1] = 3221225472;
    v133[2] = sub_10005B4D4;
    v133[3] = &unk_1002CE958;
    id v6 = v31;
    id v134 = v6;
    v135 = self;
    v114 = v37;
    id v136 = v114;
    uint64_t v38 = v30;
    id v137 = v38;
    __int16 v39 = v34;
    id v138 = v39;
    CFStringRef v40 = v35;
    id v139 = v40;
    v112 = v36;
    id v140 = v112;
    id v41 = objc_retainBlock(v133);
    if ([v6 dialType] == (id)1
      && [(ICSApplicationDelegate *)self shouldShowAirplaneEmergencyCallAlertForDialRequest:v6])
    {
      uint64_t v42 = sub_1000D5130();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Device is in airplane mode. Showing airplane mode emergency call alert", buf, 2u);
      }

      unsigned int v43 = [PHAirplaneEmergencyCallAlert alloc];
      v128[0] = _NSConcreteStackBlock;
      v128[1] = 3221225472;
      v128[2] = sub_10005B794;
      v128[3] = &unk_1002CE980;
      v128[4] = self;
      id v129 = v6;
      v130 = v39;
      v131 = v40;
      v132 = v112;
      v44 = [(PHAirplaneEmergencyCallAlert *)v43 initWithDialAction:v128];

      if (!v44) {
        goto LABEL_63;
      }
      goto LABEL_53;
    }
    v113 = v41;
    if (sub_10009248C(v6))
    {
      unsigned __int8 v47 = [v6 provider];
      unsigned int v48 = [v47 isFaceTimeProvider];

      id v41 = v113;
      if (v48)
      {
        v105 = v40;
        unsigned int v49 = sub_1000D5130();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Provider is FaceTime. Make sure we can initiate calls", buf, 2u);
        }

        unsigned __int8 v50 = +[IMAccountController sharedInstance];
        v51 = +[IMService facetimeService];
        BOOL v52 = [v50 accountsForService:v51];

        v103 = v52;
        if ([v52 count])
        {
          v109 = v39;
          id v53 = v38;
          long long v126 = 0u;
          long long v127 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          id v54 = v52;
          id v55 = [v54 countByEnumeratingWithState:&v124 objects:v159 count:16];
          if (v55)
          {
            id v56 = v55;
            uint64_t v57 = *(void *)v125;
            while (2)
            {
              for (i = 0; i != v56; i = (char *)i + 1)
              {
                if (*(void *)v125 != v57) {
                  objc_enumerationMutation(v54);
                }
                if ([*(id *)(*((void *)&v124 + 1) + 8 * i) canSendMessages])
                {

                  double v67 = sub_1000D5130();
                  if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "At least one account can initiate calls for open dial request", buf, 2u);
                  }
                  uint64_t v38 = v53;
                  CFStringRef v40 = v105;
                  __int16 v39 = v109;
                  goto LABEL_59;
                }
              }
              id v56 = [v54 countByEnumeratingWithState:&v124 objects:v159 count:16];
              if (v56) {
                continue;
              }
              break;
            }
          }

          CFStringRef v59 = sub_1000D5130();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR)) {
            sub_1001E9E54();
          }

          ((void (*)(void *, void))v112[2])(v112, 0);
          v44 = objc_alloc_init(PHMisconfiguredAccountAlert);

          CFStringRef v40 = v105;
          uint64_t v38 = v53;
LABEL_52:
          __int16 v39 = v109;
          id v41 = v113;
          if (!v44)
          {
LABEL_63:
            v68 = v114;
LABEL_64:

            BOOL v45 = 1;
            goto LABEL_65;
          }
LABEL_53:
          [(ICSApplicationDelegate *)self acquireLongPreventSuspensionAssertion];
          [(PHMisconfiguredAccountAlert *)v44 show];
          goto LABEL_63;
        }
        double v67 = sub_1000D5130();
        CFStringRef v40 = v105;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "No accounts found when attempting to open dial request", buf, 2u);
        }
LABEL_59:
        id v41 = v113;
      }
      if ([(ICSApplicationDelegate *)self shouldShowTelephonyAccountUnavailableAlertForDialRequest:v6])
      {
        [(ICSApplicationDelegate *)self acquireLongPreventSuspensionAssertion];
        ((void (*)(void *))v41[2])(v41);
      }
      else
      {
        if ([(ICSApplicationDelegate *)self shouldShowEmergencyCallbackModeAlertForDialRequest:v6])
        {
          [(ICSApplicationDelegate *)self acquireLongPreventSuspensionAssertion];
          v68 = v114;
          ((void (*)(void *, id))v114[2])(v114, v6);
          v44 = 0;
          goto LABEL_64;
        }
        if ([(ICSApplicationDelegate *)self shouldShowScreenTimeAlertForDialRequest:v6])
        {
          v38[2](v38);
        }
        else if ([(ICSApplicationDelegate *)self shouldShowRTTAlertForDialRequest:v6])
        {
          v39[2](v39);
        }
        else
        {
          if ([v6 showUIPrompt])
          {
            v110 = v39;
            v70 = v38;
            unsigned int v71 = sub_1000D5130();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "Dial request's showUIPrompt is set to YES, so we will show an alert", buf, 2u);
            }

            id v72 = objc_alloc((Class)TPDialPromptAlert);
            v121[0] = _NSConcreteStackBlock;
            v121[1] = 3221225472;
            v121[2] = sub_10005B854;
            v121[3] = &unk_1002CE9A8;
            v122 = v40;
            unsigned __int8 v73 = v112;
            id v123 = v73;
            id v74 = [v72 initWithDialRequest:v6 dialAction:v121];

            if (v74)
            {
              [(ICSApplicationDelegate *)self acquireLongPreventSuspensionAssertion];
              v115[0] = _NSConcreteStackBlock;
              v115[1] = 3221225472;
              v115[2] = sub_10005BA0C;
              v115[3] = &unk_1002CE9D0;
              v44 = (PHMisconfiguredAccountAlert *)v74;
              v116 = v44;
              v117 = v73;
              v75 = objc_retainBlock(v115);
              v76 = +[PHInCallUtilities sharedInstance];
              [v76 requestPasscodeUnlockWithCompletion:v75];
            }
            else
            {
              v44 = 0;
            }
            uint64_t v38 = v70;
            __int16 v39 = v110;
            id v41 = v113;
            v68 = v114;
            goto LABEL_64;
          }
          v77 = [(ICSApplicationDelegate *)self alertCoordinator];

          if (!v77)
          {
            uint64_t v78 = objc_alloc_init(_TtC13InCallService16AlertCoordinator);
            [(ICSApplicationDelegate *)self setAlertCoordinator:v78];

            id v79 = [(ICSApplicationDelegate *)self alertCoordinator];
            [v79 startMonitoring];

            v77 = 0;
          }
          BOOL v80 = [(ICSApplicationDelegate *)self alertCoordinator];
          unsigned int v81 = [v80 isStewieActive];
          if (v81)
          {
            v104 = v77;
            char v102 = v81;
            long long v82 = +[TUCallCenter sharedInstance];
            unsigned int v83 = [v82 _isEmergencyDialRequest:v6];

            if (v83)
            {
              v101 = v38;
              long long v84 = v40;
              long long v85 = [v6 handle];
              long long v86 = [v85 value];
              uint64_t v87 = [v86 formattedDisplayID];

              uint64_t v88 = v87;
              long long v89 = +[NSBundle mainBundle];
              long long v90 = v89;
              v107 = (void *)v87;
              v111 = v39;
              if (v87)
              {
                long long v91 = [v89 localizedStringForKey:@"ALERT_ACTION_END_STEWIE_AND_CALL_%@" value:&stru_1002D6110 table:@"Localizable-Stewie"];
                +[NSString stringWithFormat:](NSString, "stringWithFormat:", v91, v88);
              }
              else
              {
                long long v91 = [v89 localizedStringForKey:@"ALERT_ACTION_END_STEWIE_AND_CALL" value:&stru_1002D6110 table:@"Localizable-Stewie"];
                +[NSString stringWithFormat:](NSString, "stringWithFormat:", v91, v100);
              v93 = };

              v118[0] = _NSConcreteStackBlock;
              v118[1] = 3221225472;
              v118[2] = sub_10005B930;
              v118[3] = &unk_1002CE9A8;
              v94 = v84;
              v119 = v84;
              v120 = v112;
              v95 = +[NSBundle mainBundle];
              id v96 = [v95 localizedStringForKey:@"ALERT_TITLE_END_STEWIE" value:&stru_1002D6110 table:@"Localizable-Stewie"];
              v44 = +[PHEmergencyEndCallAlert alertWithDialRequest:v6 dialAction:v118 title:v96 buttonTitle:v93];

              CFStringRef v40 = v94;
              uint64_t v38 = v101;
              __int16 v39 = v111;
              char v92 = v102;
              v77 = v104;
            }
            else
            {
              v44 = 0;
              char v92 = 0;
              v77 = v104;
            }
          }
          else
          {
            v108 = v80;
            v44 = 0;
            char v92 = 0;
          }
          if (!v77)
          {
            __int16 v97 = [(ICSApplicationDelegate *)self alertCoordinator];

            if (v97)
            {
              char v98 = v92;
              v99 = sub_1000D5130();
              if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl((void *)&_mh_execute_header, v99, OS_LOG_TYPE_DEFAULT, "clean AlertCoordinator", buf, 2u);
              }

              [(ICSApplicationDelegate *)self setAlertCoordinator:0];
              char v92 = v98;
            }
          }
          id v41 = v113;
          if (v44) {
            goto LABEL_53;
          }
          if ((v92 & 1) == 0) {
            v40[2](v40);
          }
        }
      }
      v44 = 0;
      goto LABEL_63;
    }
    v106 = v7;
    v109 = v39;
    v60 = v21;
    CFStringRef v61 = v38;
    id v62 = v40;
    id v63 = sub_1000D5130();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      sub_1001E9E88();
    }

    ((void (*)(void *, void))v112[2])(v112, 0);
    __int16 v64 = [v6 provider];
    id v65 = [v6 dialType];
    v66 = [v6 localSenderIdentityUUID];
    v44 = +[PHNetworkUnavailableAlert alertWithCallProvider:v64 dialType:v65 senderIdentityUUID:v66];

    CFStringRef v40 = v62;
    uint64_t v38 = v61;
    uint64_t v21 = v60;
    id v7 = v106;
    goto LABEL_52;
  }
  id v8 = +[NSCharacterSet pn_verticalServiceCharacterSet];
  id v10 = [v6 handle];
  unsigned int v11 = [v10 value];
  id v12 = [v11 rangeOfCharacterFromSet:v8];

  uint64_t v13 = [v6 processHandle];
  long long v14 = [v6 handle];
  id v15 = [v14 value];
  if (![v15 length] || v12 == (id)0x7FFFFFFFFFFFFFFFLL)
  {

    goto LABEL_12;
  }
  unsigned int v16 = [(ICSApplicationDelegate *)self shouldShowPromptForProcessHandle:v13];

  if (!v16)
  {
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  long long v17 = sub_1000D5130();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v161 = v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Vertical service code cannot be dialed for process handle %@", buf, 0xCu);
  }

  ((void (*)(void *, void))v7[2])(v7, 0);
LABEL_32:
  BOOL v45 = 0;
LABEL_66:

  return v45;
}

- (BOOL)openJoinConversationRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Opening %@", (uint8_t *)&buf, 0xCu);
  }

  +[ICSAriadne trace:1];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x3032000000;
  unsigned __int8 v50 = sub_100050FFC;
  v51 = sub_10005100C;
  id v52 = 0;
  id v6 = +[TUCallCenter sharedInstance];
  id v7 = [v6 providerManager];
  id v8 = [v7 faceTimeProvider];

  unsigned int v9 = [(ICSApplicationDelegate *)self shouldShowScreenTimeAlertForJoinConversationRequest:v4];
  if (v9)
  {
    id v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to initiate a call, restricted by Screen Time.", (uint8_t *)v40, 2u);
    }

    unsigned int v11 = +[ICSPreferences sharedPreferences];
    unsigned int v12 = [v11 hasAdoptedModernInCallAPI];

    if (v12)
    {
      uint64_t v13 = [v4 URL];
      [(ICSApplicationDelegate *)self startScreenTimeFlowWithURL:v13];
    }
    else
    {
      id v28 = +[SOSInCallUILauncher sharedInCallUILauncher];
      __int16 v29 = [v4 URL];
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10005C120;
      v45[3] = &unk_1002CE840;
      id v46 = &stru_1002CE9F0;
      [v28 launchInCallUIForReason:3 withRequestURL:v29 completion:v45];

      uint64_t v13 = v46;
    }
    goto LABEL_36;
  }
  if ((sub_1000926F8() & 1) == 0)
  {
    long long v14 = sub_1000D5130();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1001E9E88();
    }

    uint64_t v15 = +[PHNetworkUnavailableAlert alertWithCallProvider:v8 dialType:0 senderIdentityUUID:0];
    unsigned int v16 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v15;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, TUCallCenterInCallServiceDialRequestFailureNotification, 0, 0, 1u);
  }
  id v18 = +[IMAccountController sharedInstance];
  unsigned __int8 v19 = +[IMService facetimeService];
  uint64_t v13 = [v18 accountsForService:v19];

  if ([v13 count])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v20 = v13;
    id v21 = [v20 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (!v21)
    {
LABEL_21:

      id v24 = sub_1000D5130();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        sub_1001E9EBC();
      }

      id v25 = objc_alloc_init(PHMisconfiguredAccountAlert);
      uint64_t v26 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v25;

      __int16 v27 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(v27, TUCallCenterInCallServiceDialRequestFailureNotification, 0, 0, 1u);
      goto LABEL_28;
    }
    uint64_t v22 = *(void *)v42;
LABEL_15:
    uint64_t v23 = 0;
    while (1)
    {
      if (*(void *)v42 != v22) {
        objc_enumerationMutation(v20);
      }
      if ([*(id *)(*((void *)&v41 + 1) + 8 * v23) canSendMessages]) {
        break;
      }
      if (v21 == (id)++v23)
      {
        id v21 = [v20 countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v21) {
          goto LABEL_15;
        }
        goto LABEL_21;
      }
    }
  }
  else
  {
    id v20 = sub_1000D5130();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No accounts found when attempting to join conversation", (uint8_t *)v40, 2u);
    }
  }

LABEL_28:
  if (!*(void *)(*((void *)&buf + 1) + 40) && [v4 showUIPrompt])
  {
    id v30 = sub_1000D5130();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v40[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Join request's showUIPrompt is set to YES, so we will show an alert", (uint8_t *)v40, 2u);
    }

    objc_initWeak(v40, self);
    id v31 = objc_alloc((Class)TPDialPromptAlert);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_10005C1E0;
    v37[3] = &unk_1002CEA18;
    objc_copyWeak(&v39, v40);
    id v38 = v4;
    id v32 = [v31 initWithJoinRequest:v38 dialAction:v37];
    __int16 v33 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v32;

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10005C2C0;
    v36[3] = &unk_1002CE2D8;
    v36[4] = &buf;
    [(ICSApplicationDelegate *)self setProcessAssertionCompletion:v36];
    [(ICSApplicationDelegate *)self acquireLongPreventSuspensionAssertion];

    objc_destroyWeak(&v39);
    objc_destroyWeak(v40);
  }
  v34 = *(void **)(*((void *)&buf + 1) + 40);
  if (v34)
  {
    [v34 show];
  }
  else
  {
    [(ICSApplicationDelegate *)self setProcessAssertionCompletion:0];
    [(ICSApplicationDelegate *)self showOrCreateCallForConversationRequest:v4];
  }
LABEL_36:

  _Block_object_dispose(&buf, 8);
  return v9 ^ 1;
}

- (BOOL)openDialRequest:(id)a3 forProcessHandle:(id)a4
{
  return [(ICSApplicationDelegate *)self openDialRequest:a3 forProcessHandle:a4 bypassUIPromptIfDefaultProvider:0];
}

- (BOOL)openDialRequest:(id)a3 forProcessHandle:(id)a4 bypassUIPromptIfDefaultProvider:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  [(ICSApplicationDelegate *)self configureDialRequest:v8 forProcessHandle:v9 bypassUIPromptIfDefaultProvider:v5];
  id v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Initiating dial request %@ for process handle %@.", (uint8_t *)&v16, 0x16u);
  }

  unsigned int v11 = [v8 provider];
  unsigned int v12 = [v11 isSystemProvider];

  if (v12) {
    unsigned __int8 v13 = [(ICSApplicationDelegate *)self openSystemProviderDialRequest:v8];
  }
  else {
    unsigned __int8 v13 = [(ICSApplicationDelegate *)self openThirdPartyDialRequest:v8];
  }
  BOOL v14 = v13;

  return v14;
}

- (BOOL)openUserInterfaceURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    id v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "'%@'", (uint8_t *)&v19, 0xCu);
  }

  id v6 = +[TUCallCenter sharedInstance];
  id v7 = [v6 frontmostAudioOrVideoCall];

  id v8 = +[TUCallCenter sharedInstance];
  id v9 = [v8 frontmostBargeCall];

  id v10 = [v7 provider];
  if ([v10 supportsDynamicSystemUI])
  {
    unsigned int v11 = [(PHApplicationDelegate *)self featureFlags];
    if ([v11 groupConversations]) {
      int HasChinaSKU = TUDeviceHasChinaSKU();
    }
    else {
      int HasChinaSKU = 0;
    }
  }
  else
  {
    int HasChinaSKU = 0;
  }

  unsigned int v13 = [(ICSApplicationDelegate *)self shouldActivateSpringBoardRemoteAlertForCall:v7];
  if ([v4 isShowCarPlayInCallUIURL])
  {
    BOOL v14 = 1;
    [(ICSApplicationDelegate *)self showCarPlayUIWithActivation:1];
    goto LABEL_34;
  }
  if (v7 && ((HasChinaSKU ^ 1) & 1) == 0)
  {
    [(ICSApplicationDelegate *)self requestGreenTea3PPresentationForCall:v7];
LABEL_33:
    BOOL v14 = 1;
    goto LABEL_34;
  }
  if (v7 && ((v13 ^ 1) & 1) == 0)
  {
    -[ICSApplicationDelegate requestSpringBoardPresentationForCall:dialRequest:tappedPill:](self, "requestSpringBoardPresentationForCall:dialRequest:tappedPill:", v7, 0, [v4 isShowInCallUIURL]);
    goto LABEL_33;
  }
  if (!v7 && [v4 isShowHandoffEligibleNearbyURL])
  {
    [(ICSApplicationDelegate *)self requestHandoffEligibleConversationPresentation];
    goto LABEL_33;
  }
  if ([v4 isShowLagunaPullConversationURL])
  {
    [(ICSApplicationDelegate *)self requestLagunaPullConversationPresentation];
    goto LABEL_33;
  }
  if (!v7 && v9)
  {
    if ([v4 isShowIncomingTransmissionNoticeURL])
    {
      uint64_t v15 = 2;
    }
    else if ([v4 isShowAccessoryButtonEventsNoticeURL])
    {
      uint64_t v15 = 3;
    }
    else
    {
      uint64_t v15 = 1;
    }
    [(ICSApplicationDelegate *)self requestPTTPresentation:v15 forCall:v9];
    goto LABEL_33;
  }
  int v16 = sub_1000D52D8();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1001E9EF0(v16);
  }
  BOOL v14 = 0;
LABEL_34:
  if ([v4 isShowKeypadURL])
  {
    id v17 = [(ICSApplicationDelegate *)self sceneManager];
    [v17 waitForRegistrationOfSceneWithType:0 completion:&stru_1002CEA58];
  }
  return v14;
}

- (BOOL)openVideoMessagePlaybackURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PHApplicationDelegate *)self featureFlags];
  unsigned __int8 v6 = [v5 videoMessagingEnabled];

  id v7 = sub_1000D5130();
  id v8 = v7;
  if ((v6 & 1) == 0)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1001E9FF8();
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Opening video message playback URL '%@'", buf, 0xCu);
  }

  id v8 = [v4 videoMessageUUID];
  if (!v8)
  {
    uint64_t v15 = sub_1000D5130();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1001E9FC4();
    }

LABEL_13:
    BOOL v14 = 0;
    goto LABEL_14;
  }
  id v9 = [(ICSApplicationDelegate *)self messageStoreClient];
  BOOL v10 = v9 == 0;

  if (v10)
  {
    unsigned int v11 = objc_alloc_init(ICSMessageStoreClient);
    [(ICSApplicationDelegate *)self setMessageStoreClient:v11];
  }
  objc_initWeak((id *)buf, self);
  unsigned int v12 = [(ICSApplicationDelegate *)self messageStoreClient];
  unsigned int v13 = [v4 videoMessageUUID];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005CA14;
  v17[3] = &unk_1002CEA80;
  objc_copyWeak(&v19, (id *)buf);
  id v8 = v8;
  __int16 v18 = v8;
  [v12 urlForVideoMessageWithUUID:v13 completionHandler:v17];

  objc_destroyWeak(&v19);
  objc_destroyWeak((id *)buf);
  BOOL v14 = 1;
LABEL_14:

  return v14;
}

- (void)performPresentationForVideoMessage
{
  id v3 = objc_alloc((Class)SBSInCallPresentationConfiguration);
  id v4 = [v3 initWithSceneBundleIdentifier:TUBundleIdentifierInCallServiceApplication];
  [v4 setShouldDismissCMASAlerts:0];
  [v4 setPreferredPresentationMode:2];
  [v4 setShouldPreferContinuityDisplayForFullScreenPresentation:1];
  [(ICSApplicationDelegate *)self performPresentationWithConfiguration:v4 forSceneType:4];
}

- (void)acquirePreventSuspensionAssertion
{
}

- (void)acquireLongPreventSuspensionAssertion
{
}

- (void)acquirePreventSuspensionAssertionForDuration:(double)a3
{
  BOOL v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to acquire temporary prevent suspension assertion", (uint8_t *)&v16, 2u);
  }

  unsigned __int8 v6 = [(ICSApplicationDelegate *)self processAssertion];

  if (v6)
  {
    id v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(ICSApplicationDelegate *)self processAssertion];
      int v16 = 138412290;
      id v17 = v8;
      id v9 = "There's already an existing temporary prevent suspension assertion: %@";
LABEL_9:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, 0xCu);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  id v10 = objc_alloc((Class)BKSProcessAssertion);
  id v11 = [v10 initWithBundleIdentifier:TUBundleIdentifierInCallServiceApplication flags:15 reason:4 name:@"InCallServicePreventSuspensionAssertion"];
  [(ICSApplicationDelegate *)self setProcessAssertion:v11];

  unsigned int v12 = [(ICSApplicationDelegate *)self processAssertion];
  [v12 acquire];

  unsigned int v13 = [(ICSApplicationDelegate *)self processAssertion];
  unsigned int v14 = [v13 valid];

  uint64_t v15 = sub_1000D5130();
  id v7 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(ICSApplicationDelegate *)self processAssertion];
      int v16 = 138412290;
      id v17 = v8;
      id v9 = "Acquired temporary prevent suspension assertion: %@";
      goto LABEL_9;
    }
LABEL_10:

    [(ICSApplicationDelegate *)self startOrResetTimerForDuration:a3];
    return;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1001EA0A8(self, v7);
  }
}

- (void)invalidatePreventSuspensionAssertion
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(ICSApplicationDelegate *)self processAssertion];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Invalidating temporary prevent suspension assertion: %@", (uint8_t *)&v6, 0xCu);
  }
  BOOL v5 = [(ICSApplicationDelegate *)self processAssertion];
  [v5 invalidate];

  [(ICSApplicationDelegate *)self setProcessAssertion:0];
}

- (void)startOrResetTimerForDuration:(double)a3
{
  BOOL v5 = [(ICSApplicationDelegate *)self processAssertionTimer];

  if (v5)
  {
    int v6 = sub_1000D5130();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "We have an existing timer -- invalidate and reschedule the invalidation", buf, 2u);
    }

    id v7 = [(ICSApplicationDelegate *)self processAssertionTimer];
    [v7 invalidate];
  }
  objc_initWeak(&location, self);
  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  unsigned int v13 = sub_10005D064;
  unsigned int v14 = &unk_1002CDA48;
  objc_copyWeak(&v15, &location);
  id v8 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v11 block:a3];
  -[ICSApplicationDelegate setProcessAssertionTimer:](self, "setProcessAssertionTimer:", v8, v11, v12, v13, v14);

  id v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(ICSApplicationDelegate *)self processAssertionTimer];
    *(_DWORD *)long long buf = 138412290;
    __int16 v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Scheduled prevent suspension invalidation timer: %@", buf, 0xCu);
  }
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (BOOL)showSystemCallControlsURL:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000D51C8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v27 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Requested system call controls with URL: '%{public}@'", buf, 0xCu);
  }
  int v6 = [(ICSApplicationDelegate *)self sceneManager];
  id v7 = [v6 callScene];

  if (v7)
  {
    if ([(ICSApplicationDelegate *)self hasExistingFullScreenInCallScene])
    {
      id v8 = sub_1000D52D8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "System call controls requested via URL while a call is full-screen, assuming the status bar was tapped", buf, 2u);
      }
      id v9 = +[NSNotificationCenter defaultCenter];
      [v9 postNotificationName:@"ICSStatusBarTappedNotification" object:0];

      goto LABEL_22;
    }
LABEL_14:
    [(ICSApplicationDelegate *)self showCallControlsForCurrentContext];
LABEL_22:
    BOOL v17 = 1;
    goto LABEL_23;
  }
  id v10 = sub_1000D51C8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Requested to show system call controls using URL scheme; callScene is nil, will request new call scene",
      buf,
      2u);
  }
  id v11 = [(ICSApplicationDelegate *)self bannerPresentationManager];
  unsigned __int8 v12 = [v11 hasAssociatedCall];

  if (v12)
  {
    unsigned int v13 = [(ICSApplicationDelegate *)self bannerPresentationManager];
    unsigned int v14 = [v13 wantsBannerWithoutScene];

    if (!v14)
    {
      objc_initWeak((id *)buf, self);
      __int16 v18 = sub_1000D51C8();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v25 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Presenting system call controls by creating call scene since one didn't exist before", v25, 2u);
      }
      id v19 = [(ICSApplicationDelegate *)self bannerPresentationManager];
      id v20 = [v19 activeCall];
      [(ICSApplicationDelegate *)self requestPresentationForCall:v20 dialRequest:0];

      id v21 = [(ICSApplicationDelegate *)self sceneManager];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10005D4BC;
      v23[3] = &unk_1002CEAA8;
      objc_copyWeak(&v24, (id *)buf);
      [v21 waitForRegistrationOfSceneWithType:0 completion:v23];

      objc_destroyWeak(&v24);
      objc_destroyWeak((id *)buf);
      goto LABEL_22;
    }
    id v15 = sub_1000D51C8();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Banner tracking placeholder call for conversation, do not create scene", buf, 2u);
    }
    goto LABEL_14;
  }
  int v16 = sub_1000D51C8();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1001EA13C();
  }
  BOOL v17 = 0;
LABEL_23:

  return v17;
}

- (void)showCallControlsForCurrentContext
{
  id v3 = [(ICSApplicationDelegate *)self sceneManager];
  id v4 = [v3 callScene];

  unsigned int v5 = [v4 systemControlsShouldPresentAsEmbedded];
  id v6 = [v4 presentationMode];
  id v7 = sub_1000D51C8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = v7;
    uint64_t v9 = SBSInCallPresentationModeDescription();
    id v10 = (void *)v9;
    CFStringRef v11 = @"NO";
    *(_DWORD *)long long buf = 138543874;
    v34 = v4;
    if (v5) {
      CFStringRef v11 = @"YES";
    }
    __int16 v35 = 2114;
    uint64_t v36 = v9;
    __int16 v37 = 2112;
    CFStringRef v38 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Requested to show system call controls for the current context; callScene=%{public}@ presentationMode=%{public}@; "
      "shouldShowInCallControls:%@",
      buf,
      0x20u);
  }
  if (v5)
  {
    if (v6 == (id)2)
    {
      unsigned __int8 v12 = [(ICSApplicationDelegate *)self bannerPresentationManager];
      [v12 showInCallHUD];
    }
    else
    {
      int v16 = sub_1000D51C8();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Presenting call controls by taking Call scene full-screen since the scene wants embedded controls and the scene isn't full-screen", buf, 2u);
      }
      objc_initWeak((id *)buf, self);
      id v27 = _NSConcreteStackBlock;
      uint64_t v28 = 3221225472;
      __int16 v29 = sub_10005D94C;
      id v30 = &unk_1002CEAD0;
      id v31 = v4;
      objc_copyWeak(&v32, (id *)buf);
      BOOL v17 = objc_retainBlock(&v27);
      __int16 v18 = +[PHPIPController defaultPIPController];
      BOOL v19 = [v18 pipState] == (id)2;

      if (v19)
      {
        id v20 = +[PHPIPController defaultPIPController];
        [v20 manuallyStopPIPWithCompletion:v17];
      }
      else
      {
        ((void (*)(void ***))v17[2])(v17);
      }

      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    unsigned int v13 = [(PHApplicationDelegate *)self features];
    unsigned int v14 = [v13 isSystemApertureEnabled];

    if (v14)
    {
      id v15 = sub_1000D5130();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Ignoring request to show system HUD, because the HUD lifecycle on this device is managed by SpringBoard", buf, 2u);
      }
    }
    else
    {
      id v21 = [(PHApplicationDelegate *)self features];
      unsigned int v22 = [v21 isIncomingCallBannerEnabled];

      uint64_t v23 = sub_1000D51C8();
      BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
      if (v22)
      {
        if (v24)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Presenting call controls banner for current context", buf, 2u);
        }
        id v25 = [(ICSApplicationDelegate *)self bannerPresentationManager];
        [v25 presentHUDForCurrentContext];
      }
      else
      {
        if (v24)
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Presenting system call controls banner", buf, 2u);
        }
        uint64_t v26 = [(ICSApplicationDelegate *)self bannerPresentationManager];
        [v26 presentSystemHUD];
      }
    }
  }
}

- (BOOL)showScreenSharingURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5360();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "User requested launching Screen Sharing full screen after potential unlock with URL: %@", (uint8_t *)&v16, 0xCu);
  }
  id v6 = [(PHApplicationDelegate *)self featureFlags];
  unsigned __int8 v7 = [v6 supportsScreenSharing];

  if ((v7 & 1) == 0)
  {
    unsigned __int8 v12 = sub_1000D5360();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001EA170();
    }
    goto LABEL_9;
  }
  id v8 = [(CNKScreenSharingStateMonitorFactory *)self->_screenSharingMonitorFactory sharedMonitor];
  unsigned int v9 = [v8 isBroadcastingScreenSharing];

  if (v9)
  {
    id v10 = sub_1000D5360();
    BOOL v11 = 0;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Not presenting screen sharing scene because this device is the one sharing its screen", (uint8_t *)&v16, 2u);
LABEL_9:
      BOOL v11 = 0;
    }
  }
  else
  {
    unsigned int v13 = [(ICSApplicationDelegate *)self sceneManager];
    unsigned int v14 = [v13 screenSharingScene];

    if (v14) {
      [v14 requestTransitionToPresentationMode:2 isUserInitiated:1 analyticsSource:0];
    }
    else {
      [(ICSApplicationDelegate *)self requestSpringBoardPresentationForScreenSharingAsPiP:0];
    }

    BOOL v11 = 1;
  }

  return v11;
}

- (BOOL)updateForegroundAppURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "'%@'", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [(ICSApplicationDelegate *)self bannerPresentationManager];
  BOOL v7 = [(ICSApplicationDelegate *)self updateForegroundAppURL:v4 using:v6];

  return v7;
}

- (BOOL)handleBackgroundLaunchURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "'%@'", (uint8_t *)&v9, 0xCu);
  }

  id v6 = +[TUCallCenter sharedInstance];
  BOOL v7 = [v6 frontmostCall];

  if ([v7 isEmergency] && objc_msgSend(v7, "supportsEmergencyFallback")) {
    [(ICSApplicationDelegate *)self handleSupportsEmergencyFallbackChangedForCall:v7];
  }

  return 1;
}

- (BOOL)refreshShareableContentURL:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "'%@'", (uint8_t *)&v9, 0xCu);
  }

  id v6 = [v4 foregroundAppBundleIdentifier];
  BOOL v7 = [(ICSApplicationDelegate *)self bannerPresentationManager];
  [v7 refreshShareableContentWithBundleIdentifier:v6];

  return 1;
}

- (void)handleHeadsetButtonPressForCall:(id)a3 sourceIdentifier:(id)a4 urlOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [v10 objectForKey:_UIApplicationOpenURLOptionsSourceProcessHandleKey];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [(ICSApplicationDelegate *)self canModifyCallsForProcessHandle:v11])
  {
    [(ICSApplicationDelegate *)self handleHeadsetButtonPressForCall:v8 sourceIdentifier:v9];
  }
  else
  {
    unsigned __int8 v12 = sub_1000D5130();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1001EA1A4((uint64_t)v10);
    }
  }
}

- (void)handleHeadsetButtonPressForCall:(id)a3 sourceIdentifier:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  if (v14
    && [v14 isIncoming]
    && [v14 isVideo]
    && ([(ICSApplicationDelegate *)self currentInCallScene],
        BOOL v7 = objc_claimAutoreleasedReturnValue(),
        id v8 = [v7 presentationMode],
        v7,
        v8 == (id)1))
  {
    id v9 = [(ICSApplicationDelegate *)self currentInCallScene];
    [v9 requestTransitionToPresentationMode:2 shouldDismissCMASAlerts:0 analyticsSource:@"SBSUIInCallTransitionAnalyticsSourceHeadsetButtonPress"];
  }
  else
  {
    id v10 = [(ICSApplicationDelegate *)self currentInCallScene];
    BOOL v11 = [v10 delegate];
    unsigned int v12 = [v11 isAttachedToWindowedAccessoryWithValidFrameForCurrentScene];

    id v9 = +[TUCallCenter sharedInstance];
    if (v12 && [v14 isConversation]) {
      id v13 = [v14 isIncoming];
    }
    else {
      id v13 = 0;
    }
    [v9 handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:v6 allowBluetoothAnswerWithoutDowngrade:1 shouldForceDowngradeToAudio:v13];
  }
}

- (id)incomingVideoCallUsingCallContainer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 callPassingTest:&stru_1002CEAF0];
  if (!v4)
  {
    id v4 = [v3 callPassingTest:&stru_1002CEB10];
    if (!v4)
    {
      id v4 = [v3 incomingVideoCall];
    }
  }

  return v4;
}

- (id)currentVideoCallUsingCallContainer:(id)a3
{
  id v3 = a3;
  id v4 = [v3 callPassingTest:&stru_1002CEB30];
  if (!v4)
  {
    id v4 = [v3 callPassingTest:&stru_1002CEB50];
    if (!v4)
    {
      id v4 = [v3 currentVideoCall];
    }
  }

  return v4;
}

- (id)remoteAlertShellViewControllerForWindowScene:(id)a3
{
  id v3 = a3;
  id v4 = [v3 delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v3 delegate];
    BOOL v7 = [v6 windowSceneToWindowMap];
    id v8 = [v7 objectForKey:v3];

    id v9 = [v8 rootViewController];
    objc_opt_class();
    char v10 = objc_opt_isKindOfClass();

    if (v10)
    {
      BOOL v11 = [v8 rootViewController];
    }
    else
    {
      BOOL v11 = 0;
    }
    id v12 = v11;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (PHInCallRemoteAlertShellViewController)inCallShellViewController
{
  id v3 = [(ICSApplicationDelegate *)self currentInCallScene];
  id v4 = [(ICSApplicationDelegate *)self remoteAlertShellViewControllerForWindowScene:v3];

  return (PHInCallRemoteAlertShellViewController *)v4;
}

- (void)updatePrefersBannersHiddenFromClonedDisplay
{
  id v3 = [(ICSApplicationDelegate *)self screenSharingMonitorFactory];
  id v4 = [v3 sharedMonitor];
  unsigned int v5 = [v4 isBroadcastingScreenSharing];

  id v6 = [(ICSApplicationDelegate *)self screenSharingInteractionControllerFactory];
  BOOL v7 = [v6 sharedController];
  id v8 = [v7 remoteControlStatus];

  if (v8 == (id)2) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v5;
  }
  char v10 = sub_1000D5360();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v9) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    if (v5) {
      CFStringRef v13 = @"YES";
    }
    else {
      CFStringRef v13 = @"NO";
    }
    *(_DWORD *)int v16 = 138543874;
    *(void *)&void v16[4] = v12;
    *(_WORD *)&v16[12] = 2114;
    *(void *)&v16[14] = v13;
    if (v8 == (id)2) {
      CFStringRef v11 = @"YES";
    }
    *(_WORD *)&v16[22] = 2114;
    CFStringRef v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Screen sharing callScene setPrefersBannersHiddenFromClonedDisplay: %{public}@ (isBroadcastingScreenSharing: %{public}@ isUnderRemoteControl: %{public}@)", v16, 0x20u);
  }
  id v14 = [(ICSApplicationDelegate *)self sceneManager];
  id v15 = [v14 callScene];
  [v15 setPrefersBannersHiddenFromClonedDisplay:v9];
}

- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingState:(BOOL)a4
{
  if (a4)
  {
    unsigned int v5 = [a3 call];
    unsigned __int8 v6 = [v5 isConnected];

    if ((v6 & 1) == 0)
    {
      BOOL v7 = +[NSString stringWithFormat:@"Attempting to show screen sharing for a call that isn't connected yet"];
      NSLog(@"** TUAssertion failure: %@", v7);

      _TUAssertShouldCrashApplication();
    }
    id v8 = [(ICSApplicationDelegate *)self sceneManager];
    unsigned int v9 = [v8 hasPendingOrExistingSceneOfType:1];

    if (v9)
    {
      char v10 = sub_1000D5360();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_1001EA214();
      }
    }
    else
    {
      [(ICSApplicationDelegate *)self requestSpringBoardPresentationForScreenSharingAsPiP:1];
    }
  }
  else
  {
    [(ICSApplicationDelegate *)self dismissScreenSharingSceneSession];
  }
}

- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingBroadcastingState:(BOOL)a4
{
  BOOL v4 = a4;
  [(ICSApplicationDelegate *)self updatePrefersBannersHiddenFromClonedDisplay];
  unsigned __int8 v6 = [(PHApplicationDelegate *)self featureFlags];
  unsigned int v7 = [v6 screenSharingDrawToHighlightEnabled];

  if (v7)
  {
    if (v4)
    {
      id v9 = +[TUCallCenter sharedInstance];
      id v8 = [v9 frontmostCall];
      [(ICSApplicationDelegate *)self requestSpringBoardPresentationForScreenSharingBroadcaster:v8];
    }
    else
    {
      [(ICSApplicationDelegate *)self dismissScreenSharingBroadcasterSession];
    }
  }
}

- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4
{
  unsigned int v5 = [(PHApplicationDelegate *)self featureFlags];
  unsigned int v6 = [v5 screenSharingRemoteControlEnabled];

  if (v6)
  {
    [(ICSApplicationDelegate *)self updatePrefersBannersHiddenFromClonedDisplay];
  }
  else
  {
    unsigned int v7 = sub_1000D5360();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Not updating banner state for remote control, screen sharing remote control feature flag is disabled", v8, 2u);
    }
  }
}

- (void)routesChangedForRouteController:(id)a3
{
  id v3 = [(ICSApplicationDelegate *)self routeListController];
  [v3 reload];
}

- (void)bannerPresentationManagerRequestToPresentBanner:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ICSApplicationDelegate *)self bannerPresentationRequestTimer];

  if (v5)
  {
    unsigned int v6 = sub_1000D51C8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "requestToPresentBanner already pending, ignoring this request", buf, 2u);
    }
  }
  else
  {
    objc_initWeak(&location, self);
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10005EC80;
    v29[3] = &unk_1002CEB78;
    objc_copyWeak(&v31, &location);
    id v7 = v4;
    id v30 = v7;
    id v8 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v29 block:3.0];
    [(ICSApplicationDelegate *)self setBannerPresentationRequestTimer:v8];

    id v9 = [(ICSApplicationDelegate *)self bannerPresentationManager];
    unsigned int v10 = [v9 wantsBannerWithoutScene];

    if (v10)
    {
      CFStringRef v11 = [(ICSApplicationDelegate *)self bannerPresentationRequestTimer];
      [v11 invalidate];

      [(ICSApplicationDelegate *)self setBannerPresentationRequestTimer:0];
      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    else
    {
      *(void *)long long buf = 0;
      uint64_t v26 = buf;
      uint64_t v27 = 0x2020000000;
      char v28 = 0;
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_10005ED24;
      v22[3] = &unk_1002CEBA0;
      BOOL v24 = buf;
      v22[4] = self;
      id v23 = v7;
      CFStringRef v12 = objc_retainBlock(v22);
      CFStringRef v13 = [(ICSApplicationDelegate *)self sceneManager];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10005EE34;
      v20[3] = &unk_1002CEBC8;
      id v14 = v12;
      id v21 = v14;
      [v13 waitForRegistrationOfSceneWithType:0 completion:v20];

      id v15 = [(PHApplicationDelegate *)self features];
      unsigned int v16 = [v15 isDominoEnabled];

      if (v16)
      {
        CFStringRef v17 = [(ICSApplicationDelegate *)self sceneManager];
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10005EF24;
        v18[3] = &unk_1002CD810;
        BOOL v19 = v14;
        [v17 waitForRegistrationOfGenericSceneWithType:5 completion:v18];
      }
      _Block_object_dispose(buf, 8);
    }

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
}

- (void)bannerPresentationManagerUpdatedControlsManagerCallUUID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ICSApplicationDelegate *)self callUUIDWaitingToPresentBanner];
  unsigned int v6 = [v5 isEqual:v4];

  if (v6)
  {
    [(ICSApplicationDelegate *)self setCallUUIDWaitingToPresentBanner:0];
    id v7 = [(ICSApplicationDelegate *)self currentInCallScene];
    id v8 = [v7 presentationMode];

    if (!v8)
    {
      id v9 = sub_1000D51C8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543362;
        id v11 = v4;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Banner presentation manager updated call UUID to %{public}@ and scene is still dismissed, requesting to show controls", (uint8_t *)&v10, 0xCu);
      }
      [(ICSApplicationDelegate *)self showCallControlsForCurrentContext];
    }
  }
}

- (void)bannerPresentationManagerBannerPresentationManagerAVUpgradedCallUUID:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(ICSApplicationDelegate *)self currentInCallScene];

  if (!v5)
  {
    unsigned int v6 = +[TUCallCenter sharedInstance];
    id v7 = [v4 UUIDString];
    id v8 = [v6 callWithCallUUID:v7];

    if (!v8 || [v8 status] != 4)
    {
      id v9 = sub_1000D51C8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v12 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Banner presentation manager detected AVLess -> AV upgrade, requesting to present scene", v12, 2u);
      }
      [(ICSApplicationDelegate *)self setAvUpgradedCallUUIDForDismissedScene:v4];
      int v10 = [(ICSApplicationDelegate *)self bannerPresentationManager];
      id v11 = [v10 activeCall];
      [(ICSApplicationDelegate *)self requestPresentationForCall:v11 dialRequest:0];

      [(ICSApplicationDelegate *)self setAvUpgradedCallUUIDForDismissedScene:0];
    }
  }
}

- (void)bannerPresentationManagerAVDowngradedGroupUUID:(id)a3
{
  id v4 = sub_1000D51C8();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Banner presentation manager detected AV -> AVLess downgrade, dismissing scene", v9, 2u);
  }
  unsigned int v5 = [(PHApplicationDelegate *)self features];
  unsigned int v6 = [v5 isSystemApertureEnabled];

  if (v6)
  {
    +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHAVLessConversationAssertionReason"];
    id v7 = [(ICSApplicationDelegate *)self currentInCallScene];

    if (v7)
    {
      id v8 = [(ICSApplicationDelegate *)self currentInCallScene];
      [v8 requestTransitionToPresentationMode:0 shouldDismissCMASAlerts:0];
    }
    else
    {
      [(ICSApplicationDelegate *)self requestSpringBoardPresentationForCallDetailsView];
    }
  }
}

- (void)bannerPresentationManagerShowFullscreenUI
{
  id v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 frontmostAudioOrVideoCall];

  [(ICSApplicationDelegate *)self requestSpringBoardPresentationForCall:v4 dialRequest:0 tappedPill:1];
}

- (BOOL)bannerPresentationManagerDismissSBBannerIfNeeded
{
  id v2 = [(ICSApplicationDelegate *)self currentInCallScene];
  id v3 = v2;
  if (!v2) {
    goto LABEL_5;
  }
  if ([v2 presentationMode] != (id)1) {
    goto LABEL_5;
  }
  id v4 = [v3 keyWindow];
  unsigned int v5 = [v4 rootViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v3 keyWindow];
    id v8 = [v7 rootViewController];

    unsigned __int8 v9 = [v8 transitionFromBannerToDismissedIfNecessary];
  }
  else
  {
LABEL_5:
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (void)bannerPresentationManagerShowFullscreenCallDetailsView
{
  id v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Deep linking to call details view", v4, 2u);
  }

  [(ICSApplicationDelegate *)self setDidDeepLinkToCallDetailsView:1];
  +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHAVLessConversationDetailsViewAssertionReason"];
  [(ICSApplicationDelegate *)self requestFullScreenSpringBoardPresentationForCallDetailsView];
}

- (NSString)inCallSceneSessionIdentifier
{
  id v2 = [(ICSApplicationDelegate *)self sceneManager];
  id v3 = [v2 callScene];
  id v4 = [v3 session];
  unsigned int v5 = [v4 persistentIdentifier];

  return (NSString *)v5;
}

- (NSSet)backgroundActivitiesToSuppress
{
  return (NSSet *)sub_1000B0B34(0);
}

- (BOOL)hasPresentedFullScreenCallUI
{
  id v2 = [(ICSApplicationDelegate *)self sceneManager];
  unsigned __int8 v3 = [v2 callSceneHasPresentedFullScreen];

  return v3;
}

- (BOOL)isPresentingFullScreenCallUI
{
  id v2 = [(ICSApplicationDelegate *)self currentInCallScene];
  BOOL v3 = [v2 presentationMode] == (id)2;

  return v3;
}

- (BOOL)isPresentingFullScreenOverlayCallUI
{
  id v2 = [(ICSApplicationDelegate *)self currentInCallScene];
  BOOL v3 = [v2 presentationMode] == (id)3;

  return v3;
}

- (BOOL)isAlertAvailable
{
  id v2 = [(ICSApplicationDelegate *)self alertCoordinator];
  unsigned __int8 v3 = [v2 isAvailable];

  return v3;
}

- (id)audioRouteMenu
{
  unsigned __int8 v3 = [(ICSApplicationDelegate *)self routeListController];

  if (v3)
  {
    id v4 = [(ICSApplicationDelegate *)self routeListController];
    [v4 reload];
  }
  else
  {
    id v4 = +[PHAudioRoutingMenuController menuControllerWithCallStyle:1 dataSource:self delegate:self];
    [(ICSApplicationDelegate *)self setRouteListController:v4];
  }

  unsigned int v5 = [(ICSApplicationDelegate *)self routeListController];
  unsigned int v6 = [v5 menu];

  return v6;
}

- (id)audioRouteGlyphFor:(id)a3
{
  return [a3 audioRouteGlyphForDisplayStyle:4];
}

- (UIImage)audioRouteGlyphForDevice
{
  id v2 = +[PHDevice currentDevice];
  unsigned __int8 v3 = [v2 audioRouteGlyphImage];

  return (UIImage *)v3;
}

- (id)routesForAudioRoutingMenuController:(id)a3
{
  unsigned __int8 v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 routeController];
  unsigned int v5 = [v4 sortedRoutes];

  return v5;
}

- (void)audioRoutingMenuController:(id)a3 didSelectRoute:(id)a4
{
  id v4 = a4;
  id v6 = +[TUCallCenter sharedInstance];
  unsigned int v5 = [v6 routeController];
  [v5 pickRoute:v4];
}

- (void)audioRoutingMenuController:(id)a3 didSelectLagunaActionForHandle:(id)a4 conversation:(id)a5
{
  id v6 = a4;
  id v7 = a5;
  id v8 = +[TUCallCenter sharedInstance];
  unsigned __int8 v9 = [v8 neighborhoodActivityConduit];
  int v10 = [v7 UUID];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  _DWORD v12[2] = sub_10005F938;
  v12[3] = &unk_1002CEBF0;
  id v13 = v6;
  id v11 = v6;
  [v9 handoffConversation:v10 toTVDevice:v11 completion:v12];
}

- (void)cleanupTTRBanner
{
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
  [(ICSApplicationDelegate *)self handleStateChangeForAVLessConversation:a4 fromConversation:0];
  unsigned int v5 = +[TUCallCenter sharedInstance];
  id v6 = [v5 frontmostAudioOrVideoCall];

  if ([(ICSApplicationDelegate *)self shouldAttemptRePresentationOfBannerOnConversationUpdate]&& v6)
  {
    id v7 = +[TUCallCenter sharedInstance];
    uint64_t v8 = [v7 activeConversationForCall:v6];
    if (!v8)
    {
LABEL_7:

      goto LABEL_8;
    }
    unsigned __int8 v9 = (void *)v8;
    int v10 = [(ICSApplicationDelegate *)self currentInCallScene];
    if ([v10 presentationMode] || objc_msgSend(v6, "status") == 5)
    {

      goto LABEL_7;
    }
    unsigned int v11 = [v6 status];

    if (v11 != 6)
    {
      CFStringRef v12 = sub_1000D51C8();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "New conversation has been added that matches frontmost call, requesting HUD to be presented", v13, 2u);
      }
      [(ICSApplicationDelegate *)self setShouldAttemptRePresentationOfBannerOnConversationUpdate:0];
      [(ICSApplicationDelegate *)self showCallControlsForCurrentContext];
    }
  }
LABEL_8:
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
}

- (void)conversationManager:(id)a3 avModeChangedForConversation:(id)a4 fromOldConversation:(id)a5
{
}

- (void)handleStateChangeForAVLessConversation:(id)a3 fromConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 avMode] || objc_msgSend(v6, "state") == (id)4 || !objc_msgSend(v6, "state")) {
    goto LABEL_13;
  }
  uint64_t v8 = [(ICSApplicationDelegate *)self bannerPresentationManager];
  if ([v8 wantsBannerWithoutScene])
  {

LABEL_13:
    +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHAVLessConversationAssertionReason"];
    goto LABEL_14;
  }
  unsigned __int8 v9 = [(ICSApplicationDelegate *)self bannerPresentationManager];
  int v10 = [v9 placeholderCallGroupUUID];
  unsigned int v11 = [v6 groupUUID];
  unsigned int v12 = [v10 isEqual:v11];

  if (!v12) {
    goto LABEL_13;
  }
  if (v7 && [v7 avMode])
  {
    id v13 = sub_1000D51C8();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = v13;
      id v15 = [(ICSApplicationDelegate *)self currentInCallScene];
      int v22 = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      id v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Detected transition from AV -> AVLess for conversation: %@. Dismissing currentInCallScene: %@", (uint8_t *)&v22, 0x16u);
    }
    unsigned int v16 = [(ICSApplicationDelegate *)self currentInCallScene];
    [v16 requestTransitionToPresentationMode:0 shouldDismissCMASAlerts:0];
  }
  +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHAVLessConversationAssertionReason"];
  [(ICSApplicationDelegate *)self requestSpringBoardPresentationForCallDetailsView];
LABEL_14:
  CFStringRef v17 = +[TUCallCenter sharedInstance];
  __int16 v18 = [v17 conversationManager];
  BOOL v19 = [v18 avLessConversation];

  if (v19)
  {
    id v20 = +[PHPIPController defaultPIPController];
    [v20 updatePipSharePlaySessionWithConversation:v6];
  }
  else
  {
    id v21 = sub_1000D52D8();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v22) = 0;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "No AVLess conversations remaining. Removing dismissal assertion.", (uint8_t *)&v22, 2u);
    }
    +[PHInCallRootViewController releaseDismissalAssertionForReason:@"PHAVLessConversationDetailsViewAssertionReason"];
  }
}

- (void)conversationManager:(id)a3 sharePlayAvailableChanged:(BOOL)a4
{
  id v4 = [(ICSApplicationDelegate *)self routeListController];
  [v4 reload];
}

- (void)conversationManager:(id)a3 screenSharingAvailableChanged:(BOOL)a4
{
  id v4 = [(ICSApplicationDelegate *)self routeListController];
  [v4 reload];
}

- (void)handleSupportsEmergencyFallbackChangedNotification:(id)a3
{
  id v7 = a3;
  id v4 = [v7 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v6 = [v7 object];
  }
  else
  {
    id v6 = 0;
  }
  [(ICSApplicationDelegate *)self handleSupportsEmergencyFallbackChangedForCall:v6];
}

- (void)handleAlertInvokedNotification:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "alert was invoked, nil-ing out AlertCoordinator", v10, 2u);
  }

  [(ICSApplicationDelegate *)self setAlertCoordinator:0];
  id v6 = [v4 userInfo];

  id v7 = +[AlertCoordinator automaticallyInvokedKey];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  unsigned int v9 = [v8 BOOLValue];

  if (v9) {
    [(ICSApplicationDelegate *)self startSOSFlowWithActivationReason:SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen];
  }
}

- (void)handleSupportsEmergencyFallbackChangedForCall:(id)a3
{
  id v4 = a3;
  unsigned int v5 = v4;
  if (v4)
  {
    if ([v4 isEmergency])
    {
      if ([v5 supportsEmergencyFallback])
      {
        [(ICSApplicationDelegate *)self acquirePreventSuspensionAssertion];
        id v6 = [(ICSApplicationDelegate *)self alertCoordinator];

        if (!v6)
        {
          id v7 = sub_1000D5130();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)int v10 = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Emergency fallback changed and alertCoordinator not initialized. Starting monitoring to start background countdown if necessary", v10, 2u);
          }

          uint64_t v8 = objc_alloc_init(_TtC13InCallService16AlertCoordinator);
          [(ICSApplicationDelegate *)self setAlertCoordinator:v8];

          unsigned int v9 = [(ICSApplicationDelegate *)self alertCoordinator];
          [v9 startMonitoring];
        }
      }
    }
  }
}

- (void)prepareForAmbientScene:(id)a3
{
  id v4 = a3;
  unsigned int v5 = sub_1000D54F8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preparing for ambient scene: %@", (uint8_t *)&v7, 0xCu);
  }
  id v6 = [(ICSApplicationDelegate *)self sceneManager];
  [v6 registerGenericScene:v4 ofType:5];
}

- (void)transitionFromAmbientScene
{
  [(ICSApplicationDelegate *)self setIsPresentingAmbient:0];
  unsigned __int8 v3 = [(ICSApplicationDelegate *)self sceneManager];
  id v4 = [v3 ambientScene];

  if (v4)
  {
    unsigned int v5 = [(ICSApplicationDelegate *)self sceneManager];
    [v5 didDismissSceneOfType:5];
  }
  else
  {
    id v6 = sub_1000D54F8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1001EA2C8();
    }
  }
}

+ (BOOL)hasCarKitRoute
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = +[TUCallCenter sharedInstance];
  unsigned __int8 v3 = [v2 routeController];
  id v4 = [v3 sortedRoutes];

  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) isCarKitRoute])
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (char)v5;
}

- (BOOL)shouldHandleBluetoothCommand
{
  unsigned __int8 v3 = [(ICSApplicationDelegate *)self carKitSessionStatus];
  id v4 = [v3 currentSession];

  if (v4)
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = 0;
      uint64_t v6 = "Not handling command because we are connected to carplay";
      int v7 = (uint8_t *)&v14;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
    }
  }
  else if ([(ICSApplicationDelegate *)self isPresentingFullScreenCallUI])
  {
    id v8 = +[PHInCallUIUtilities sharedInstance];
    unsigned int v9 = [v8 isSpringBoardLocked];

    if (v9)
    {
      id v5 = sub_1000D5130();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        uint64_t v6 = "Not handling command because springboard is locked";
        int v7 = (uint8_t *)&v12;
        goto LABEL_13;
      }
    }
    else
    {
      if (!+[ICSApplicationDelegate hasCarKitRoute]) {
        return 1;
      }
      id v5 = sub_1000D5130();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v11 = 0;
        uint64_t v6 = "Not handling command because we are connected to a carkit route";
        int v7 = (uint8_t *)&v11;
        goto LABEL_13;
      }
    }
  }
  else
  {
    id v5 = sub_1000D5130();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v13 = 0;
      uint64_t v6 = "Not handling command because we are not showing screening UI";
      int v7 = (uint8_t *)&v13;
      goto LABEL_13;
    }
  }

  return 0;
}

- (void)shouldHandleMRCommand:(unsigned int)a3 completion:(id)a4
{
  uint64_t v6 = (void (**)(id, BOOL, void))a4;
  int v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Asked to handle MRCommand %u", (uint8_t *)v11, 8u);
  }

  BOOL v8 = [(ICSApplicationDelegate *)self shouldHandleBluetoothCommand];
  unsigned int v9 = sub_1000D5130();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received a MediaRemoteCommand for a screening call and we are presenting screening UI, so treating this as a regular button press and hijacking command from MR", (uint8_t *)v11, 2u);
    }

    unsigned int v9 = +[TUCallCenter sharedInstance];
    [v9 handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:0 allowBluetoothAnswerWithoutDowngrade:0 shouldForceDowngradeToAudio:1];
  }
  else if (v10)
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received a MediaRemoteCommand for a screening call but we are NOT presenting screening UI, so returning the command back to MR", (uint8_t *)v11, 2u);
  }

  v6[2](v6, v8, 0);
}

- (void)shouldHandleMRCommand:(unsigned int)a3 sourceIdentifier:(id)a4 completion:(id)a5
{
  id v8 = a4;
  unsigned int v9 = (void (**)(id, BOOL, void))a5;
  BOOL v10 = sub_1000D5130();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14[0] = 67109378;
    v14[1] = a3;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Asked to handle MRCommand %u from routeUID: %@", (uint8_t *)v14, 0x12u);
  }

  BOOL v11 = [(ICSApplicationDelegate *)self shouldHandleBluetoothCommand];
  __int16 v12 = sub_1000D5130();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v11)
  {
    if (v13)
    {
      LOWORD(v14[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received a MediaRemoteCommand for a screening call and we are presenting screening UI, so treating this as a regular button press and hijacking command from MR", (uint8_t *)v14, 2u);
    }

    __int16 v12 = +[TUCallCenter sharedInstance];
    [v12 handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:v8 allowBluetoothAnswerWithoutDowngrade:0 shouldForceDowngradeToAudio:1];
  }
  else if (v13)
  {
    LOWORD(v14[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Received a MediaRemoteCommand for a screening call but we are NOT presenting screening UI, so returning the command back to MR", (uint8_t *)v14, 2u);
  }

  v9[2](v9, v11, 0);
}

- (void)handleRedialCommandWhileScreening:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412290;
    id v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to handle redial %@", (uint8_t *)&v24, 0xCu);
  }

  uint64_t v6 = +[TUCallCenter sharedInstance];
  int v7 = [v6 screeningCall];

  if (v7)
  {
    [v4 setPreferDefaultApp:0];
    id v8 = [v7 handle];
    unsigned int v9 = [v8 value];
    BOOL v10 = +[TUHandle normalizedHandleWithDestinationID:v9];

    BOOL v11 = [v7 handle];
    __int16 v12 = [v11 value];
    BOOL v13 = +[TUHandle normalizedHandleWithDestinationID:v12];

    unsigned int v14 = [(__CFString *)v13 isEqualToHandle:v10];
    unsigned int v15 = [(ICSApplicationDelegate *)self shouldHandleBluetoothCommand];
    id v16 = sub_1000D5130();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v24 = 138412546;
      id v25 = v10;
      __int16 v26 = 2112;
      CFStringRef v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Normalized handle from screening call %@ redial %@", (uint8_t *)&v24, 0x16u);
    }

    CFStringRef v17 = sub_1000D5130();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    if ((v15 | v14) == 1)
    {
      if (v18)
      {
        CFStringRef v19 = @"NO";
        if (v15) {
          CFStringRef v20 = @"YES";
        }
        else {
          CFStringRef v20 = @"NO";
        }
        if (v14) {
          CFStringRef v19 = @"YES";
        }
        int v24 = 138412546;
        id v25 = (id)v20;
        __int16 v26 = 2112;
        CFStringRef v27 = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Answering call for redial since ICS is presenting screening UI: %@ or is trying to call the same person we are screening %@", (uint8_t *)&v24, 0x16u);
      }

      id v21 = +[TUCallCenter sharedInstance];
      int v22 = [v4 audioSourceIdentifier];
      [v21 handleActionForWiredHeadsetMiddleButtonPressWithSourceIdentifier:v22 allowBluetoothAnswerWithoutDowngrade:0 shouldForceDowngradeToAudio:1];
    }
    else
    {
      if (v18)
      {
        LOWORD(v24) = 0;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Not presenting screening UI so dialing for redial", (uint8_t *)&v24, 2u);
      }

      id v21 = +[TUCallCenter sharedInstance];
      id v23 = [v21 dialWithRequest:v4];
    }
  }
  else
  {
    BOOL v10 = sub_1000D5130();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1001EA2FC();
    }
  }
}

- (void)fetchInCallUIState:(id)a3
{
  id v4 = (void (**)(id, id, void))a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Asked to fetch UI state", (uint8_t *)&v13, 2u);
  }

  unsigned int v6 = [(ICSApplicationDelegate *)self isPresentingFullScreenCallUI];
  if (v6) {
    [(ICSApplicationDelegate *)self inCallShellViewController];
  }
  else {
  int v7 = [(ICSApplicationDelegate *)self bannerPresentationManager];
  }
  unsigned int v8 = [v7 isMicIndicatorVisible];

  uint64_t v9 = 2;
  if (!v8) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = v9 | v6;
  id v11 = [objc_alloc((Class)TUUIContext) initWithState:v10];
  __int16 v12 = sub_1000D5130();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 134217984;
    uint64_t v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "UIState is %lu", (uint8_t *)&v13, 0xCu);
  }

  v4[2](v4, v11, 0);
}

- (void)fetchRemoteControlStatus:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = [(ICSApplicationDelegate *)self screenSharingInteractionControllerFactory];
  unsigned int v6 = [v5 sharedController];
  uint64_t v7 = (uint64_t)[v6 remoteControlStatus];

  unsigned int v8 = [(ICSApplicationDelegate *)self screenSharingInteractionControllerFactory];
  uint64_t v9 = [v8 sharedController];
  uint64_t v10 = [v9 latestRemoteControlDate];

  if (v7 != 2)
  {
    id v11 = +[NSDate date];
    [v11 timeIntervalSinceDate:v10];
    double v13 = v12;

    if (v13 < 3.0) {
      uint64_t v7 = 2;
    }
  }
  uint64_t v14 = sub_1000D5130();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 134217984;
    uint64_t v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Returning remote control status: %ld", (uint8_t *)&v15, 0xCu);
  }

  v4[2](v4, v7, 0);
}

- (CNKAnsweringMachine)answeringMachine
{
  return self->_answeringMachine;
}

- (CARSessionStatus)carKitSessionStatus
{
  return self->_carKitSessionStatus;
}

- (void)setCarKitSessionStatus:(id)a3
{
}

- (void)setIsAppBlockedFromBypassingPrompt:(id)a3
{
}

- (void)setIsDefaultCallingAppBlock:(id)a3
{
}

- (void)setIsHandleAvailableForFaceTimeBlock:(id)a3
{
}

- (TUCall)mostRecentlyDisconnectedAudioCall
{
  return self->_mostRecentlyDisconnectedAudioCall;
}

- (TUCall)mostRecentlyDisconnectedVideoCall
{
  return self->_mostRecentlyDisconnectedVideoCall;
}

- (void)setMostRecentlyDisconnectedVideoCall:(id)a3
{
}

- (BOOL)allowsCarPlayBanners
{
  return self->_allowsCarPlayBanners;
}

- (BOOL)shouldIgnoreCarPlayAssertionInvalidations
{
  return self->_shouldIgnoreCarPlayAssertionInvalidations;
}

- (void)setShouldIgnoreCarPlayAssertionInvalidations:(BOOL)a3
{
  self->_shouldIgnoreCarPlayAssertionInvalidations = a3;
}

- (ICSActivationContext)activationContext
{
  return self->_activationContext;
}

- (BOOL)didDeepLinkToCallDetailsView
{
  return self->_didDeepLinkToCallDetailsView;
}

- (void)setDidDeepLinkToCallDetailsView:(BOOL)a3
{
  self->_didDeepLinkToCallDetailsView = a3;
}

- (AlertCoordinatorProtocol)alertCoordinator
{
  return self->_alertCoordinator;
}

- (void)setAlertCoordinator:(id)a3
{
}

- (NSMutableSet)allInCallScenes
{
  return self->_allInCallScenes;
}

- (void)setAllInCallScenes:(id)a3
{
}

- (NSMutableSet)connectedSceneSessionIdentifiers
{
  return self->_connectedSceneSessionIdentifiers;
}

- (void)setConnectedSceneSessionIdentifiers:(id)a3
{
}

- (ICSSceneManager)sceneManager
{
  return self->_sceneManager;
}

- (void)setSceneManager:(id)a3
{
}

- (void)setBannerPresentationManager:(id)a3
{
}

- (ICSPillStateMonitor)pillStateMonitor
{
  return self->_pillStateMonitor;
}

- (void)setPillStateMonitor:(id)a3
{
}

- (BOOL)isShowingIncomingNameUpdate
{
  return self->_isShowingIncomingNameUpdate;
}

- (void)setIsShowingIncomingNameUpdate:(BOOL)a3
{
  self->_isShowingIncomingNameUpdate = a3;
}

- (BOOL)didDeepLinkToPTTCallDetailsView
{
  return self->_didDeepLinkToPTTCallDetailsView;
}

- (void)setDidDeepLinkToPTTCallDetailsView:(BOOL)a3
{
  self->_didDeepLinkToPTTCallDetailsView = a3;
}

- (NSUUID)callUUIDWaitingToPresentBanner
{
  return self->_callUUIDWaitingToPresentBanner;
}

- (void)setCallUUIDWaitingToPresentBanner:(id)a3
{
}

- (BOOL)shouldAttemptRePresentationOfBannerOnConversationUpdate
{
  return self->_shouldAttemptRePresentationOfBannerOnConversationUpdate;
}

- (void)setShouldAttemptRePresentationOfBannerOnConversationUpdate:(BOOL)a3
{
  self->_shouldAttemptRePresentationOfBannerOnConversationUpdate = a3;
}

- (BKSProcessAssertion)processAssertion
{
  return self->_processAssertion;
}

- (void)setProcessAssertion:(id)a3
{
}

- (NSTimer)processAssertionTimer
{
  return self->_processAssertionTimer;
}

- (void)setProcessAssertionTimer:(id)a3
{
}

- (NSTimer)bannerPresentationRequestTimer
{
  return self->_bannerPresentationRequestTimer;
}

- (void)setBannerPresentationRequestTimer:(id)a3
{
}

- (PHAudioRoutingMenuController)routeListController
{
  return self->_routeListController;
}

- (void)setRouteListController:(id)a3
{
}

- (NSMutableSet)connectedCallIdentifiers
{
  return self->_connectedCallIdentifiers;
}

- (void)setConnectedCallIdentifiers:(id)a3
{
}

- (ICSCameraStateMonitor)cameraStateMonitor
{
  return self->_cameraStateMonitor;
}

- (void)setCameraStateMonitor:(id)a3
{
}

- (TURTCCallReporter)callReporter
{
  return self->_callReporter;
}

- (void)setCallReporter:(id)a3
{
}

- (TUJoinConversationRequest)currentJoinConversationRequest
{
  return self->_currentJoinConversationRequest;
}

- (void)setCurrentJoinConversationRequest:(id)a3
{
}

- (NSMutableDictionary)backgroundPIPAuthorizationForSceneType
{
  return self->_backgroundPIPAuthorizationForSceneType;
}

- (void)setBackgroundPIPAuthorizationForSceneType:(id)a3
{
}

- (TTRBannerControllerProtocol)TTRBannerViewController
{
  return self->_TTRBannerViewController;
}

- (void)setTTRBannerViewController:(id)a3
{
}

- (NSUUID)avUpgradedCallUUIDForDismissedScene
{
  return self->_avUpgradedCallUUIDForDismissedScene;
}

- (void)setAvUpgradedCallUUIDForDismissedScene:(id)a3
{
  self->_avUpgradedCallUUIDForDismissedScene = (NSUUID *)a3;
}

- (ICSMessageStoreClient)messageStoreClient
{
  return self->_messageStoreClient;
}

- (void)setMessageStoreClient:(id)a3
{
}

- (CNKScreenSharingStateMonitorFactory)screenSharingMonitorFactory
{
  return self->_screenSharingMonitorFactory;
}

- (void)setScreenSharingMonitorFactory:(id)a3
{
}

- (CNKScreenSharingInteractionControllerFactory)screenSharingInteractionControllerFactory
{
  return self->_screenSharingInteractionControllerFactory;
}

- (ICSAmbientActivityController)ambientActivityController
{
  return self->_ambientActivityController;
}

- (TUUIXPCHost)xpcHost
{
  return self->_xpcHost;
}

- (void)setXpcHost:(id)a3
{
}

- (ICSApplicationDelegateHelper)applicationDelegateHelper
{
  return self->_applicationDelegateHelper;
}

- (void)setApplicationDelegateHelper:(id)a3
{
}

- (ICSFaceTimeAvailabilityHelper)faceTimeAvailabilityHelper
{
  return self->_faceTimeAvailabilityHelper;
}

- (void)setFaceTimeAvailabilityHelper:(id)a3
{
}

- (id)processAssertionCompletion
{
  return self->_processAssertionCompletion;
}

- (void)setProcessAssertionCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processAssertionCompletion, 0);
  objc_storeStrong((id *)&self->_faceTimeAvailabilityHelper, 0);
  objc_storeStrong((id *)&self->_applicationDelegateHelper, 0);
  objc_storeStrong((id *)&self->_xpcHost, 0);
  objc_storeStrong((id *)&self->_ambientActivityController, 0);
  objc_storeStrong((id *)&self->_screenSharingInteractionControllerFactory, 0);
  objc_storeStrong((id *)&self->_screenSharingMonitorFactory, 0);
  objc_storeStrong((id *)&self->_messageStoreClient, 0);
  objc_storeStrong((id *)&self->_TTRBannerViewController, 0);
  objc_storeStrong((id *)&self->_backgroundPIPAuthorizationForSceneType, 0);
  objc_storeStrong((id *)&self->_currentJoinConversationRequest, 0);
  objc_storeStrong((id *)&self->_callReporter, 0);
  objc_storeStrong((id *)&self->_cameraStateMonitor, 0);
  objc_storeStrong((id *)&self->_connectedCallIdentifiers, 0);
  objc_storeStrong((id *)&self->_routeListController, 0);
  objc_storeStrong((id *)&self->_bannerPresentationRequestTimer, 0);
  objc_storeStrong((id *)&self->_processAssertionTimer, 0);
  objc_storeStrong((id *)&self->_processAssertion, 0);
  objc_storeStrong((id *)&self->_callUUIDWaitingToPresentBanner, 0);
  objc_storeStrong((id *)&self->_pillStateMonitor, 0);
  objc_storeStrong((id *)&self->_bannerPresentationManager, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_connectedSceneSessionIdentifiers, 0);
  objc_storeStrong((id *)&self->_allInCallScenes, 0);
  objc_storeStrong((id *)&self->_alertCoordinator, 0);
  objc_storeStrong((id *)&self->_activationContext, 0);
  objc_storeStrong((id *)&self->_mostRecentlyDisconnectedVideoCall, 0);
  objc_storeStrong((id *)&self->_mostRecentlyDisconnectedAudioCall, 0);
  objc_storeStrong(&self->_isHandleAvailableForFaceTimeBlock, 0);
  objc_storeStrong(&self->_isDefaultCallingAppBlock, 0);
  objc_storeStrong(&self->_isAppBlockedFromBypassingPrompt, 0);
  objc_storeStrong((id *)&self->_carKitSessionStatus, 0);
  objc_storeStrong((id *)&self->_answeringMachine, 0);
  objc_storeStrong((id *)&self->_carPlayServicesController, 0);

  objc_storeStrong((id *)&self->_senderIdentityClient, 0);
}

- (id)swiftui_rootViewForSimplifiedApplicationProvider
{
  id v2 = self;
  sub_10013FD00(v5);

  sub_10012CB98(v5, (uint64_t)v5[3]);
  unsigned __int8 v3 = (void *)_bridgeAnythingToObjectiveC<A>(_:)();
  sub_100129FFC((uint64_t)v5);

  return v3;
}

- (BOOL)isPresentingAmbient
{
  id v2 = self;
  char v3 = ICSApplicationDelegate.isPresentingAmbient.getter();

  return v3 & 1;
}

- (void)setIsPresentingAmbient:(BOOL)a3
{
  char v3 = self;
  ICSApplicationDelegate.isPresentingAmbient.setter();
}

- (BOOL)updateForegroundAppURL:(id)a3 using:(id)a4
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6, v8);
  uint64_t v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  id v11 = a4;
  double v12 = self;
  LOBYTE(self) = ICSApplicationDelegate.updateForegroundApp(url:using:)((uint64_t)v11, v13);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
  return self & 1;
}

- (void)dismissAnsweredCallBannerIfNeeded
{
  id v2 = self;
  ICSApplicationDelegate.dismissAnsweredCallBannerIfNeeded()();
}

- (id)makeAnsweringMachineWithPrivateSelf:(id)a3
{
  swift_unknownObjectRetain();
  id v4 = self;
  id v5 = (void *)sub_100140710();
  swift_unknownObjectRelease();

  return v5;
}

+ (BOOL)isExpanseMessagesJoinRequest:(id)a3
{
  id v3 = a3;
  char v4 = sub_100141174(v3);

  return v4 & 1;
}

@end