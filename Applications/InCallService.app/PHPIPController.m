@interface PHPIPController
+ (Class)inCallRootViewControllerClass;
+ (id)defaultPIPController;
+ (id)newScreenSharingPIPController;
- (BOOL)expectingSystemInitiatedPIPInterruptionStop;
- (BOOL)hasParticipantVideoForActiveConversation;
- (BOOL)isBeingRemoteControlled;
- (BOOL)isBroadcastingScreenSharing;
- (BOOL)isPIPProxyActive;
- (BOOL)isPIPProxyActiveAndHidden;
- (BOOL)isPIPProxyInterrupted;
- (BOOL)isPipped;
- (BOOL)isPippedOrStartingPIP;
- (BOOL)isPreparedToAnimateToFullScreen;
- (BOOL)isRotating;
- (BOOL)isUsedForScreenSharing;
- (BOOL)pipIsBeingResized;
- (BOOL)pipStateIsTransitory;
- (BOOL)shouldObtainDismissalAssertions;
- (BOOL)shouldPIPWhenEnteringBackground;
- (BOOL)shouldStartPIPWhenPossible;
- (BOOL)videoWasPausedForInterruption;
- (BOOL)wantsPreferredContentSizeUpdateAfterRotationFinishes;
- (BOOL)wrapperViewControllerShouldReturnRestoreWrappedViewControllerHierarchy:(id)a3;
- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3;
- (CGSize)wrapperViewControllerPreferredContentSize:(id)a3;
- (CNKFaceTimePiPSourceProviding)sourceProvider;
- (CNKScreenSharingInteractionControllerFactory)screenSharingInteractionControllerFactory;
- (CNKScreenSharingStateMonitorFactory)screenSharingMonitorFactory;
- (NSString)description;
- (NSString)pipInterruptedCallIdentifier;
- (PGPictureInPictureProxy)pipProxy;
- (PHPIPWrapperViewController)wrapperViewController;
- (TUFeatureFlags)featureFlags;
- (UIViewController)pipContentViewController;
- (UIWindow)windowForTransitionAnimation;
- (id)initForScreenSharing:(BOOL)a3;
- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3;
- (id)preparedToAnimateToFullScreenCompletionBlock;
- (id)restoreUserInterfaceForPictureInPictureStopCompletionBlock;
- (id)startCompletionBlock;
- (id)stringForPIPState:(int64_t)a3;
- (id)viewControllerToRestoreWhenCancellingPIP;
- (int64_t)pictureInPictureProxyContentType:(id)a3;
- (int64_t)pipDeviceOrientation;
- (int64_t)pipState;
- (unint64_t)currentPIPAnimationStyle;
- (void)callCenterCallStatusChangedNotification:(id)a3;
- (void)callIsSendingVideoChanged:(id)a3;
- (void)cancelPIPIfNeeded;
- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)dealloc;
- (void)handleDisableCameraAction;
- (void)handleEnableCameraAction;
- (void)handleFlipCameraAction;
- (void)handleMuteMicrophoneAction;
- (void)handleShowSystemHUDAction;
- (void)handleUnmuteMicrophoneAction;
- (void)manuallyStopPIPWithCompletion:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pictureInPictureProxy:(id)a3 didRequestFaceTimeAction:(int64_t)a4;
- (void)pictureInPictureProxy:(id)a3 didStartPictureInPictureWithAnimationType:(int64_t)a4;
- (void)pictureInPictureProxy:(id)a3 didStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5;
- (void)pictureInPictureProxy:(id)a3 didUpdateStashedOrUnderLockState:(BOOL)a4;
- (void)pictureInPictureProxy:(id)a3 failedToStartPictureInPictureWithAnimationType:(int64_t)a4 error:(id)a5;
- (void)pictureInPictureProxy:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)pictureInPictureProxy:(id)a3 willStartPictureInPictureWithAnimationType:(int64_t)a4;
- (void)pictureInPictureProxy:(id)a3 willStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5;
- (void)pictureInPictureProxyPictureInPictureInterruptionBegan:(id)a3;
- (void)pictureInPictureProxyPictureInPictureInterruptionEnded:(id)a3;
- (void)pictureInPictureProxyWillSetupPictureInPictureStop:(id)a3;
- (void)resetPipContentViewController;
- (void)rotatePIPDeviceOrientationTo:(int64_t)a3 withCompletion:(id)a4;
- (void)sceneDidUpdate;
- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4;
- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingBroadcastingState:(BOOL)a4;
- (void)setClientSessionIdentifierFromPiPAuthorization:(id)a3;
- (void)setCurrentPIPAnimationStyle:(unint64_t)a3;
- (void)setExpectingSystemInitiatedPIPInterruptionStop:(BOOL)a3;
- (void)setHasParticipantVideoForActiveConversation:(BOOL)a3;
- (void)setIsBeingRemoteControlled:(BOOL)a3;
- (void)setIsBroadcastingScreenSharing:(BOOL)a3;
- (void)setIsUsedForScreenSharing:(BOOL)a3;
- (void)setPipContentViewController:(id)a3;
- (void)setPipDeviceOrientation:(int64_t)a3;
- (void)setPipInterruptedCallIdentifier:(id)a3;
- (void)setPipProxy:(id)a3;
- (void)setPipState:(int64_t)a3;
- (void)setPreparedToAnimateToFullScreenCompletionBlock:(id)a3;
- (void)setRestoreUserInterfaceForPictureInPictureStopCompletionBlock:(id)a3;
- (void)setRotating:(BOOL)a3;
- (void)setScreenSharingTitle:(id)a3 andAvatarIfNeeded:(id)a4;
- (void)setShouldObtainDismissalAssertions:(BOOL)a3;
- (void)setShouldStartPIPWhenPossible:(BOOL)a3;
- (void)setSourceProvider:(id)a3;
- (void)setStartCompletionBlock:(id)a3;
- (void)setVideoWasPausedForInterruption:(BOOL)a3;
- (void)setWantsPreferredContentSizeUpdateAfterRotationFinishes:(BOOL)a3;
- (void)setWindowForTransitionAnimation:(id)a3;
- (void)setWrapperViewController:(id)a3;
- (void)startPIPNow;
- (void)startPIPWithCompletion:(id)a3;
- (void)stopPIPAndStealViewController:(id)a3;
- (void)updatePIPFrame;
- (void)updatePIPProxyCameraControlStates;
- (void)updatePIPProxyControlStates;
- (void)updatePIPProxyLayerCloning;
- (void)updatePIPProxyMicrophoneControlStates;
- (void)updatePIPSize;
- (void)updatePipSharePlaySessionWithConversation:(id)a3;
- (void)updateShouldPIPWhenEnteringBackground;
- (void)wrapperViewControllerNeedsCleanup:(id)a3;
@end

@implementation PHPIPController

+ (id)defaultPIPController
{
  if (qword_100325D90 != -1) {
    dispatch_once(&qword_100325D90, &stru_1002CDB38);
  }
  v2 = (void *)qword_100325D88;

  return v2;
}

+ (id)newScreenSharingPIPController
{
  id v2 = [[PHPIPController alloc] initForScreenSharing:1];
  [v2 setShouldObtainDismissalAssertions:0];
  return v2;
}

- (id)initForScreenSharing:(BOOL)a3
{
  BOOL v3 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PHPIPController;
  v4 = [(PHPIPController *)&v30 init];
  v5 = v4;
  if (v4)
  {
    v4->_pipState = 0;
    v4->_currentPIPAnimationStyle = 0;
    uint64_t v6 = objc_opt_new();
    screenSharingMonitorFactory = v5->_screenSharingMonitorFactory;
    v5->_screenSharingMonitorFactory = (CNKScreenSharingStateMonitorFactory *)v6;

    uint64_t v8 = objc_opt_new();
    screenSharingInteractionControllerFactory = v5->_screenSharingInteractionControllerFactory;
    v5->_screenSharingInteractionControllerFactory = (CNKScreenSharingInteractionControllerFactory *)v8;

    v10 = (TUFeatureFlags *)objc_alloc_init((Class)TUFeatureFlags);
    featureFlags = v5->_featureFlags;
    v5->_featureFlags = v10;

    v12 = objc_alloc_init(PHPIPWrapperViewController);
    [(PHPIPController *)v5 setWrapperViewController:v12];

    v13 = [(PHPIPController *)v5 wrapperViewController];
    [v13 setDelegate:v5];

    v14 = +[PHInCallUtilities sharedInstance];
    if ([v14 isIPadIdiom] & !v3) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 4;
    }

    v16 = [(PHPIPController *)v5 wrapperViewController];
    v17 = +[PGPictureInPictureProxy pictureInPictureProxyWithControlsStyle:v15 viewController:v16];
    [(PHPIPController *)v5 setPipProxy:v17];

    v18 = [(PHPIPController *)v5 pipProxy];
    [v18 setDelegate:v5];

    [(PHPIPController *)v5 setShouldObtainDismissalAssertions:1];
    [(PHPIPController *)v5 setIsUsedForScreenSharing:v3];
    v19 = [(PHPIPController *)v5 pipProxy];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001EA4C;
    v28[3] = &unk_1002CDB58;
    BOOL v29 = v3;
    [v19 updatePlaybackStateUsingBlock:v28];

    v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v5 selector:"callCenterCallStatusChangedNotification:" name:TUCallCenterVideoCallStatusChangedNotification object:0];
    [v20 addObserver:v5 selector:"callCenterCallStatusChangedNotification:" name:TUCallCenterCallStatusChangedNotification object:0];
    [v20 addObserver:v5 selector:"callCenterCallStatusChangedNotification:" name:TUCallCenterCallConnectedNotification object:0];
    [v20 addObserver:v5 selector:"callCenterCallStatusChangedNotification:" name:TUCallUpgradedToVideoNotification object:0];
    [v20 addObserver:v5 selector:"uplinkMuteStatusChangedNotification:" name:TUCallIsUplinkMutedChangedNotification object:0];
    [v20 addObserver:v5 selector:"callIsSendingVideoChanged:" name:TUCallIsSendingVideoChangedNotification object:0];
    v21 = [(PHPIPController *)v5 pipProxy];
    [v21 addObserver:v5 forKeyPath:@"pictureInPictureActive" options:0 context:&off_1002CDB78];

    v22 = [(PHPIPController *)v5 pipProxy];
    [v22 addObserver:v5 forKeyPath:@"pictureInPicturePossible" options:0 context:&off_1002CDB80];

    v23 = +[TUCallCenter sharedInstance];
    v24 = [v23 conversationManager];
    [v24 addDelegate:v5 queue:&_dispatch_main_q];

    v25 = [(CNKScreenSharingStateMonitorFactory *)v5->_screenSharingMonitorFactory sharedMonitor];
    [v25 addObserver:v5];

    v26 = [(CNKScreenSharingInteractionControllerFactory *)v5->_screenSharingInteractionControllerFactory sharedController];
    [v26 addDelegate:v5];
  }
  return v5;
}

- (void)dealloc
{
  BOOL v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4 = [(PHPIPController *)self pipProxy];
  [v4 removeObserver:self forKeyPath:@"pictureInPictureActive" context:&off_1002CDB78];

  v5 = [(PHPIPController *)self pipProxy];
  [v5 removeObserver:self forKeyPath:@"pictureInPicturePossible" context:&off_1002CDB80];

  uint64_t v6 = [(CNKScreenSharingStateMonitorFactory *)self->_screenSharingMonitorFactory sharedMonitor];
  [v6 removeObserver:self];

  v7 = [(CNKScreenSharingInteractionControllerFactory *)self->_screenSharingInteractionControllerFactory sharedController];
  [v7 removeDelegate:self];

  v8.receiver = self;
  v8.super_class = (Class)PHPIPController;
  [(PHPIPController *)&v8 dealloc];
}

+ (Class)inCallRootViewControllerClass
{
  return (Class)objc_opt_class();
}

- (void)setWindowForTransitionAnimation:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowForTransitionAnimation);

  if (WeakRetained != v4)
  {
    uint64_t v6 = sub_1000D5250();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543618;
      objc_super v8 = self;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating PIP with window %@", (uint8_t *)&v7, 0x16u);
    }
    objc_storeWeak((id *)&self->_windowForTransitionAnimation, v4);
    [(PHPIPController *)self updateShouldPIPWhenEnteringBackground];
    [(PHPIPController *)self updatePIPFrame];
  }
}

- (NSString)description
{
  return +[NSString stringWithFormat:@"<%@ %p: isUsedForScreenSharing=%d>", objc_opt_class(), self, [(PHPIPController *)self isUsedForScreenSharing]];
}

- (void)setPipContentViewController:(id)a3
{
  id v4 = a3;
  v5 = [(PHPIPController *)self wrapperViewController];
  [v5 setWrappedViewController:v4];

  [(PHPIPController *)self updatePIPFrame];
}

- (UIViewController)pipContentViewController
{
  id v2 = [(PHPIPController *)self wrapperViewController];
  BOOL v3 = [v2 wrappedViewController];

  return (UIViewController *)v3;
}

- (void)setSourceProvider:(id)a3
{
  p_sourceProvider = &self->_sourceProvider;
  id v5 = a3;
  objc_storeWeak((id *)p_sourceProvider, v5);
  id v6 = [v5 viewControllerForPiP];

  [(PHPIPController *)self setPipContentViewController:v6];
}

- (void)resetPipContentViewController
{
  id v2 = [(PHPIPController *)self wrapperViewController];
  [v2 setWrappedViewController:0];
}

- (void)rotatePIPDeviceOrientationTo:(int64_t)a3 withCompletion:(id)a4
{
  id v6 = (void (**)(void))a4;
  if ([(PHPIPController *)self pipDeviceOrientation] != a3)
  {
    int v7 = sub_1000D5250();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v17 = self;
      __int16 v18 = 2048;
      int64_t v19 = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Rotating pip to device orientation %ld", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10001F180;
    v13[3] = &unk_1002CDB90;
    objc_copyWeak(&v15, (id *)buf);
    v13[4] = self;
    v14 = v6;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10001F2B8;
    v11[3] = &unk_1002CDBB8;
    v11[4] = self;
    objc_super v8 = objc_retainBlock(v13);
    id v12 = v8;
    __int16 v9 = objc_retainBlock(v11);
    switch(a3)
    {
      case 1:
        if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)3) {
          goto LABEL_18;
        }
        if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)4) {
          goto LABEL_16;
        }
        if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)2) {
          goto LABEL_20;
        }
        goto LABEL_24;
      case 2:
        if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)1) {
          goto LABEL_20;
        }
        if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)3) {
          goto LABEL_16;
        }
        if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)4) {
          goto LABEL_18;
        }
        goto LABEL_24;
      case 3:
        if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)1) {
          goto LABEL_16;
        }
        if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)4)
        {
LABEL_20:
          uint64_t v10 = 2;
          goto LABEL_23;
        }
        if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)2) {
          goto LABEL_18;
        }
        goto LABEL_24;
      case 4:
        if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)1)
        {
LABEL_18:
          uint64_t v10 = 0;
        }
        else if ((id)[(PHPIPController *)self pipDeviceOrientation] == (id)3)
        {
          uint64_t v10 = 3;
        }
        else
        {
          if ((id)[(PHPIPController *)self pipDeviceOrientation] != (id)2) {
            goto LABEL_24;
          }
LABEL_16:
          uint64_t v10 = 1;
        }
LABEL_23:
        ((void (*)(void *, uint64_t))v9[2])(v9, v10);
LABEL_24:
        [(PHPIPController *)self setPipDeviceOrientation:a3];

        objc_destroyWeak(&v15);
        objc_destroyWeak((id *)buf);
        goto LABEL_25;
      default:
        goto LABEL_24;
    }
  }
  if (v6) {
    v6[2](v6);
  }
LABEL_25:
}

- (id)viewControllerToRestoreWhenCancellingPIP
{
  BOOL v3 = [(PHPIPController *)self sourceProvider];
  unsigned int v4 = [v3 restoreViewControllerHierarchyWhenExitingPiP];

  if (v4)
  {
    id v5 = [(PHPIPController *)self sourceProvider];
    id v6 = [v5 viewControllerForPiP];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)setScreenSharingTitle:(id)a3 andAvatarIfNeeded:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PHPIPController *)self isUsedForScreenSharing])
  {
    objc_super v8 = [(PHPIPController *)self featureFlags];
    unsigned int v9 = [v8 supportsScreenSharing];

    if (v9)
    {
      uint64_t v10 = sub_1000D5250();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v15 = 138543874;
        *(void *)&v15[4] = self;
        __int16 v16 = 1024;
        BOOL v17 = v6 != 0;
        __int16 v18 = 1024;
        BOOL v19 = v7 != 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating screen sharing title and avatar on PiP Proxy; hasTitle: %i; hasImage: %i",
          v15,
          0x18u);
      }
      v11 = [(PHPIPController *)self pipProxy];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        v13 = [(PHPIPController *)self pipProxy];
        [v13 setScreenSharingTitle:v6 avatar:v7];
      }
      else
      {
        v14 = sub_1000D5250();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          sub_1001E9498((uint64_t)self, v14);
        }
      }
    }
  }
}

- (void)startPIPWithCompletion:(id)a3
{
  p_sourceProvider = &self->_sourceProvider;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_sourceProvider);
  id v8 = [WeakRetained viewControllerForPiP];

  [(PHPIPController *)self setPipContentViewController:v8];
  [(PHPIPController *)self setStartCompletionBlock:v5];

  id v7 = [(PHPIPController *)self pipProxy];
  LODWORD(v5) = [v7 isPictureInPicturePossible];

  if (v5) {
    [(PHPIPController *)self startPIPNow];
  }
  else {
    [(PHPIPController *)self setShouldStartPIPWhenPossible:1];
  }
}

- (void)startPIPNow
{
  [(PHPIPController *)self setShouldStartPIPWhenPossible:0];
  id v3 = [(PHPIPController *)self pipProxy];
  [v3 startPictureInPicture];
}

- (void)stopPIPAndStealViewController:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5250();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    id v7 = [(PHPIPController *)self restoreUserInterfaceForPictureInPictureStopCompletionBlock];
    id v8 = objc_retainBlock(v7);
    *(_DWORD *)buf = 138543618;
    BOOL v19 = self;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: stopPIPAndStealViewController (we have this restore UI block %@)", buf, 0x16u);
  }
  unsigned int v9 = [(PHPIPController *)self pipProxy];

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v16, &location);
    uint64_t v10 = [(PHPIPController *)self wrapperViewController];
    [v10 setWillAnimatePictureInPictureStopCompletionBlock:&v15];

    v11 = [(PHPIPController *)self wrapperViewController];
    [v11 setDidAnimatePictureInPictureStopCompletionBlock:v4];

    char v12 = [(PHPIPController *)self restoreUserInterfaceForPictureInPictureStopCompletionBlock];

    if (v12)
    {
      v13 = sub_1000D5250();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        BOOL v19 = self;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: ... stopPIPAndStealViewController running the restore UI block", buf, 0xCu);
      }
      v14 = [(PHPIPController *)self restoreUserInterfaceForPictureInPictureStopCompletionBlock];
      v14[2](v14, 1);

      [(PHPIPController *)self setRestoreUserInterfaceForPictureInPictureStopCompletionBlock:0];
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)manuallyStopPIPWithCompletion:(id)a3
{
  id v4 = a3;
  if ((id)[(PHPIPController *)self pipState] == (id)2)
  {
    id v5 = sub_1000D5250();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138543362;
      id v8 = self;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Manually calling stop picture in picture", (uint8_t *)&v7, 0xCu);
    }
    [(PHPIPController *)self setPreparedToAnimateToFullScreenCompletionBlock:v4];
    id v6 = [(PHPIPController *)self pipProxy];
    [v6 stopPictureInPictureAndRestoreUserInterface:1];
  }
}

- (void)cancelPIPIfNeeded
{
  if (![(PHPIPController *)self isPippedOrStartingPIP])
  {
    int v7 = sub_1000D5250();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO)) {
      return;
    }
    int v11 = 138543362;
    char v12 = self;
    id v8 = "%{public}@: No need to cancel PiP since it's not starting or active";
    unsigned int v9 = v7;
    os_log_type_t v10 = OS_LOG_TYPE_INFO;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v11, 0xCu);
    return;
  }
  id v3 = [(PHPIPController *)self pipProxy];

  id v4 = sub_1000D5250();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v5) {
      return;
    }
    int v11 = 138543362;
    char v12 = self;
    id v8 = "%{public}@: Not cancelling PiP because pipProxy is nil";
    unsigned int v9 = v4;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    goto LABEL_10;
  }
  if (v5)
  {
    int v11 = 138543362;
    char v12 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: cancelPIP", (uint8_t *)&v11, 0xCu);
  }
  id v6 = [(PHPIPController *)self pipProxy];
  [v6 stopPictureInPictureAndRestoreUserInterface:0];

  [(PHPIPController *)self setPipState:3];
}

- (BOOL)isPreparedToAnimateToFullScreen
{
  id v2 = [(PHPIPController *)self restoreUserInterfaceForPictureInPictureStopCompletionBlock];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)pictureInPictureProxy:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  [(PHPIPController *)self setRestoreUserInterfaceForPictureInPictureStopCompletionBlock:a4];
  BOOL v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"PHPIPControllerDidRequestReturnToFullScreenNotification" object:self];

  id v6 = [(PHPIPController *)self preparedToAnimateToFullScreenCompletionBlock];

  if (v6)
  {
    int v7 = [(PHPIPController *)self preparedToAnimateToFullScreenCompletionBlock];
    v7[2]();

    [(PHPIPController *)self setPreparedToAnimateToFullScreenCompletionBlock:0];
  }
}

- (BOOL)isPipped
{
  return [(PHPIPController *)self pipState] != 0;
}

- (BOOL)isPippedOrStartingPIP
{
  return (id)[(PHPIPController *)self pipState] == (id)2
      || (id)[(PHPIPController *)self pipState] == (id)1;
}

- (BOOL)isPIPProxyActive
{
  id v2 = [(PHPIPController *)self pipProxy];
  unsigned __int8 v3 = [v2 isPictureInPictureActive];

  return v3;
}

- (BOOL)isPIPProxyInterrupted
{
  id v2 = [(PHPIPController *)self pipProxy];
  unsigned __int8 v3 = [v2 isPictureInPictureInterrupted];

  return v3;
}

- (BOOL)isPIPProxyActiveAndHidden
{
  unsigned __int8 v3 = [(PHPIPController *)self pipProxy];
  if ([v3 isPictureInPictureActive])
  {
    id v4 = [(PHPIPController *)self pipProxy];
    unsigned __int8 v5 = [v4 isPictureInPictureStashedOrUnderLock];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)setPipState:(int64_t)a3
{
  if (self->_pipState != a3)
  {
    self->_pipState = a3;
    unsigned __int8 v5 = sub_1000D5250();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = v5;
      int v7 = [(PHPIPController *)self stringForPIPState:a3];
      int v9 = 138543618;
      os_log_type_t v10 = self;
      __int16 v11 = 2112;
      char v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: PIPState changed to %@", (uint8_t *)&v9, 0x16u);
    }
    id v8 = +[NSNotificationCenter defaultCenter];
    [v8 postNotificationName:@"PHPIPControllerStateDidChangeNotification" object:self userInfo:0];
  }
}

- (void)wrapperViewControllerNeedsCleanup:(id)a3
{
  [(PHPIPController *)self setPipState:0];
  UIAnimationDragCoefficient();
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(float)(v4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FF44;
  block[3] = &unk_1002CD518;
  block[4] = self;
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)wrapperViewControllerShouldReturnRestoreWrappedViewControllerHierarchy:(id)a3
{
  unsigned __int8 v3 = [(PHPIPController *)self sourceProvider];
  unsigned __int8 v4 = [v3 restoreViewControllerHierarchyWhenExitingPiP];

  return v4;
}

- (CGSize)wrapperViewControllerPreferredContentSize:(id)a3
{
  unsigned __int8 v3 = [(PHPIPController *)self sourceProvider];
  [v3 preferredPiPContentAspectRatio];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (id)stringForPIPState:(int64_t)a3
{
  if ((unint64_t)a3 > 3) {
    return @"Unknown";
  }
  else {
    return off_1002CDC80[a3];
  }
}

- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3
{
  unsigned __int8 v3 = [(PHPIPController *)self sourceProvider];
  [v3 frameForRestoreAnimation];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3
{
  double v4 = sub_1000D5250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = v4;
    double v6 = [(PHPIPController *)self windowForTransitionAnimation];
    int v9 = 138543618;
    double v10 = self;
    __int16 v11 = 2112;
    double v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP controller checked which ICS window to use for PIP: %@", (uint8_t *)&v9, 0x16u);
  }
  double v7 = [(PHPIPController *)self windowForTransitionAnimation];

  return v7;
}

- (void)pictureInPictureProxy:(id)a3 willStartPictureInPictureWithAnimationType:(int64_t)a4
{
  double v6 = sub_1000D5250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138543618;
    double v10 = self;
    __int16 v11 = 2048;
    int64_t v12 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: willStart animationType: %ld", (uint8_t *)&v9, 0x16u);
  }
  [(PHPIPController *)self setShouldStartPIPWhenPossible:0];
  if (a4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [(PHPIPController *)self setCurrentPIPAnimationStyle:v7];
  double v8 = [(PHPIPController *)self pipProxy];
  [v8 preferredContentSizeDidChangeForViewController];

  [(PHPIPController *)self setPipState:1];
  if ([(PHPIPController *)self shouldObtainDismissalAssertions]) {
    objc_msgSend(objc_msgSend((id)objc_opt_class(), "inCallRootViewControllerClass"), "obtainDismissalAssertionForReason:", @"PHPIPPresenceReason");
  }
}

- (void)pictureInPictureProxy:(id)a3 didStartPictureInPictureWithAnimationType:(int64_t)a4
{
  double v6 = sub_1000D5250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    double v13 = self;
    __int16 v14 = 2048;
    int64_t v15 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: didStart animationType: %ld", (uint8_t *)&v12, 0x16u);
  }
  if (![(PHPIPController *)self shouldPIPWhenEnteringBackground])
  {
    uint64_t v7 = sub_1000D5250();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_1001E9510(v7);
    }
    double v8 = [(PHPIPController *)self pipProxy];
    [v8 stopPictureInPictureAndRestoreUserInterface:0];

    [(PHPIPController *)self setPipState:3];
    [(PHPIPController *)self updateShouldPIPWhenEnteringBackground];
  }
  if (a4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [(PHPIPController *)self setCurrentPIPAnimationStyle:v9];
  [(PHPIPController *)self setPipState:2];
  double v10 = [(PHPIPController *)self startCompletionBlock];

  if (v10)
  {
    __int16 v11 = [(PHPIPController *)self startCompletionBlock];
    v11[2]();

    [(PHPIPController *)self setStartCompletionBlock:0];
  }
}

- (void)pictureInPictureProxy:(id)a3 failedToStartPictureInPictureWithAnimationType:(int64_t)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  double v10 = sub_1000D5250();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543874;
    int v12 = self;
    __int16 v13 = 2048;
    int64_t v14 = a4;
    __int16 v15 = 2112;
    id v16 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: failedToStart animationType: %ld error: %@", (uint8_t *)&v11, 0x20u);
  }
  [(PHPIPController *)self setCurrentPIPAnimationStyle:0];
  [v9 stopPictureInPictureAndRestoreUserInterface:1];

  [(PHPIPController *)self setPipState:0];
  if ([(PHPIPController *)self shouldObtainDismissalAssertions]) {
    objc_msgSend(objc_msgSend((id)objc_opt_class(), "inCallRootViewControllerClass"), "releaseDismissalAssertionForReason:", @"PHPIPPresenceReason");
  }
}

- (void)pictureInPictureProxy:(id)a3 willStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  id v8 = sub_1000D5250();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543874;
    int v12 = self;
    __int16 v13 = 2048;
    int64_t v14 = a4;
    __int16 v15 = 2048;
    int64_t v16 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: willStop animationType: %ld reason: %ld", (uint8_t *)&v11, 0x20u);
  }
  if (a4) {
    uint64_t v9 = 1;
  }
  else {
    uint64_t v9 = 2;
  }
  [(PHPIPController *)self setCurrentPIPAnimationStyle:v9];
  if (a5 == 1)
  {
    double v10 = +[NSNotificationCenter defaultCenter];
    [v10 postNotificationName:@"PHPIPControllerWillCancelNotification" object:self];
  }
}

- (void)pictureInPictureProxy:(id)a3 didStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  id v8 = sub_1000D5250();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138543874;
    int v11 = self;
    __int16 v12 = 2048;
    int64_t v13 = a4;
    __int16 v14 = 2048;
    int64_t v15 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: didStop animationType: %ld reason: %ld", (uint8_t *)&v10, 0x20u);
  }
  [(PHPIPController *)self setCurrentPIPAnimationStyle:0];
  [(PHPIPController *)self setPipState:0];
  if ([(PHPIPController *)self shouldObtainDismissalAssertions]) {
    objc_msgSend(objc_msgSend((id)objc_opt_class(), "inCallRootViewControllerClass"), "releaseDismissalAssertionForReason:", @"PHPIPPresenceReason");
  }
  if (a5 == 1)
  {
    uint64_t v9 = +[NSNotificationCenter defaultCenter];
    [v9 postNotificationName:@"PHPIPControllerDidCancelNotification" object:self];
  }
  else
  {
    if (a5) {
      return;
    }
    uint64_t v9 = [(PHPIPController *)self pipProxy];
    [v9 preferredContentSizeDidChangeForViewController];
  }
}

- (void)pictureInPictureProxyPictureInPictureInterruptionBegan:(id)a3
{
  double v4 = sub_1000D5250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138543362;
    v22 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP interruption began", (uint8_t *)&v21, 0xCu);
  }
  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"PHPIPControllerInterruptionChangeNotification" object:self];

  if (![(PHPIPController *)self isUsedForScreenSharing])
  {
    double v6 = +[TUCallCenter sharedInstance];
    uint64_t v7 = [v6 currentVideoCall];
    -[PHPIPController setVideoWasPausedForInterruption:](self, "setVideoWasPausedForInterruption:", [v7 isSendingVideo]);

    id v8 = sub_1000D5250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      unsigned int v10 = [(PHPIPController *)self videoWasPausedForInterruption];
      int v21 = 138543618;
      v22 = self;
      __int16 v23 = 1024;
      unsigned int v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Storing videoWasPausedForInterruption as %d before stopping sending video", (uint8_t *)&v21, 0x12u);
    }
    int v11 = +[TUCallCenter sharedInstance];
    __int16 v12 = [v11 currentVideoCall];

    int64_t v13 = +[TUCallCenter sharedInstance];
    __int16 v14 = [v13 activeConversationForCall:v12];

    if ([v12 isConversation]
      && ([v14 isOneToOneModeEnabled] & 1) == 0)
    {
      if ([(PHPIPController *)self videoWasPausedForInterruption]) {
        [v12 setRemoteVideoPresentationState:2];
      }
      int64_t v15 = +[TUCallCenter sharedInstance];
      int64_t v16 = [v15 videoDeviceController];
      [v16 stopPreview];
    }
    else
    {
      if ([(PHPIPController *)self videoWasPausedForInterruption]) {
        [v12 setIsSendingVideo:0];
      }
      int64_t v15 = +[TUCallCenter sharedInstance];
      int64_t v16 = [v15 videoDeviceController];
      [v16 pausePreview];
    }

    if ([(PHPIPController *)self videoWasPausedForInterruption])
    {
      BOOL v17 = +[NSNotificationCenter defaultCenter];
      [v17 postNotificationName:@"PHPIPControllerDidHandleVideoMuteControlAction" object:self];
    }
    __int16 v18 = +[TUCallCenter sharedInstance];
    BOOL v19 = [v18 currentVideoCall];
    __int16 v20 = [v19 uniqueProxyIdentifier];
    [(PHPIPController *)self setPipInterruptedCallIdentifier:v20];
  }
}

- (void)pictureInPictureProxyPictureInPictureInterruptionEnded:(id)a3
{
  double v4 = sub_1000D5250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138543362;
    __int16 v20 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP interruption ended", (uint8_t *)&v19, 0xCu);
  }
  double v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"PHPIPControllerInterruptionChangeNotification" object:self];

  if ([(PHPIPController *)self isPipped])
  {
    if (![(PHPIPController *)self isUsedForScreenSharing])
    {
      if ([(PHPIPController *)self videoWasPausedForInterruption])
      {
        double v6 = +[TUCallCenter sharedInstance];
        uint64_t v7 = [v6 frontmostAudioOrVideoCall];
        unsigned int v8 = [v7 isVideo];

        if (v8)
        {
          uint64_t v9 = +[TUCallCenter sharedInstance];
          unsigned int v10 = [v9 currentVideoCall];

          int v11 = +[TUCallCenter sharedInstance];
          __int16 v12 = [v11 activeConversationForCall:v10];

          if ([v10 isConversation]
            && ([v12 isOneToOneModeEnabled] & 1) == 0)
          {
            [v10 setRemoteVideoPresentationState:1];
          }
          else
          {
            [v10 setIsSendingVideo:1];
          }
          __int16 v14 = +[TUCallCenter sharedInstance];
          int64_t v15 = [v14 videoDeviceController];
          [v15 startPreview];
        }
        [(PHPIPController *)self setVideoWasPausedForInterruption:0];
        int64_t v16 = +[NSNotificationCenter defaultCenter];
        [v16 postNotificationName:@"PHPIPControllerDidHandleVideoMuteControlAction" object:self];

        if ([(PHPIPController *)self expectingSystemInitiatedPIPInterruptionStop])
        {
          BOOL v17 = sub_1000D5250();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = 138543362;
            __int16 v20 = self;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP interruption was ended by system, posting notification...", (uint8_t *)&v19, 0xCu);
          }
          __int16 v18 = +[NSNotificationCenter defaultCenter];
          [v18 postNotificationName:@"PHPIPControllerSystemInitiatedPIPInterruptionStoppedNotification" object:self];
        }
      }
      [(PHPIPController *)self setExpectingSystemInitiatedPIPInterruptionStop:0];
      [(PHPIPController *)self setPipInterruptedCallIdentifier:0];
    }
  }
  else
  {
    int64_t v13 = sub_1000D5250();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v19 = 138412290;
      __int16 v20 = self;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%@: Not handling PIP interruption ended because we are not PIPped", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)pictureInPictureProxy:(id)a3 didUpdateStashedOrUnderLockState:(BOOL)a4
{
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"PHPIPControllerStashChangeNotification" object:self];
}

- (void)pictureInPictureProxyWillSetupPictureInPictureStop:(id)a3
{
  double v4 = sub_1000D5250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    uint64_t v7 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP will set up for picture-in-picture stop", (uint8_t *)&v6, 0xCu);
  }
  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"PHPIPControllerWillSetupPIPStopNotification" object:self];
}

- (int64_t)pictureInPictureProxyContentType:(id)a3
{
  if ([(PHPIPController *)self isUsedForScreenSharing]) {
    return 5;
  }
  else {
    return 4;
  }
}

- (BOOL)pipIsBeingResized
{
  if ((id)[(PHPIPController *)self pipState] != (id)2) {
    return 0;
  }
  unsigned __int8 v3 = [(PHPIPController *)self wrapperViewController];
  unsigned __int8 v4 = [v3 pipIsBeingResized];

  return v4;
}

- (void)callCenterCallStatusChangedNotification:(id)a3
{
  [(PHPIPController *)self updateShouldPIPWhenEnteringBackground];
  if ((id)[(PHPIPController *)self pipState] == (id)2
    && ![(PHPIPController *)self isUsedForScreenSharing])
  {
    unsigned __int8 v4 = +[TUCallCenter sharedInstance];
    id v5 = [v4 incomingCall];
    if (v5)
    {
    }
    else
    {
      int v6 = +[TUCallCenter sharedInstance];
      uint64_t v7 = [v6 incomingVideoCall];

      if (!v7) {
        goto LABEL_9;
      }
    }
    unsigned int v8 = sub_1000D5250();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138543362;
      int64_t v13 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Call center call status changed to an incoming call, manually animating out of the PIP to show call waiting", (uint8_t *)&v12, 0xCu);
    }
    [(PHPIPController *)self manuallyStopPIPWithCompletion:0];
  }
LABEL_9:
  if ((id)[(PHPIPController *)self pipState] == (id)2)
  {
    uint64_t v9 = +[TUCallCenter sharedInstance];
    if ([v9 hasCurrentCalls])
    {
    }
    else
    {
      unsigned int v10 = +[PHSOSViewController isSOSDismissalAssertionActive];

      if (v10)
      {
        int v11 = sub_1000D5250();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 138543362;
          int64_t v13 = self;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Call center status changed to no current calls, but InCallRootViewController still wants to show SOS. Manually animating out of PIP", (uint8_t *)&v12, 0xCu);
        }
        [(PHPIPController *)self manuallyStopPIPWithCompletion:0];
      }
    }
  }
  [(PHPIPController *)self updatePIPProxyControlStates];
}

- (void)updatePipSharePlaySessionWithConversation:(id)a3
{
  id v4 = a3;
  id v5 = [(PHPIPController *)self featureFlags];
  if (![v5 expanseEnabled])
  {
LABEL_17:

    goto LABEL_18;
  }
  unsigned __int8 v6 = [(PHPIPController *)self isUsedForScreenSharing];

  if ((v6 & 1) == 0)
  {
    uint64_t v7 = +[TUCallCenter sharedInstance];
    unsigned int v8 = [v7 hasCurrentVideoCalls];

    if (v8)
    {
      uint64_t v9 = +[TUCallCenter sharedInstance];
      unsigned int v10 = [v9 currentVideoCall];

      int v11 = +[TUCallCenter sharedInstance];
      id v5 = [v11 activeConversationForCall:v10];

      if (v5 && [v4 isEqualToConversation:v5])
      {
        int v12 = sub_1000D5250();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int64_t v13 = v12;
          __int16 v14 = [v4 groupUUID];
          int v28 = 138543618;
          BOOL v29 = self;
          __int16 v30 = 2112;
          v31 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring conversation update for groupUUID %@.", (uint8_t *)&v28, 0x16u);
        }
        goto LABEL_17;
      }
    }
    else
    {
      id v5 = 0;
    }
    int64_t v15 = [v4 activitySessions];
    int64_t v16 = [v15 allObjects];
    BOOL v17 = [v16 tu_firstObjectPassingTest:&stru_1002CDC20];

    __int16 v18 = [v17 activity];
    int v19 = [v18 activityIdentifier];
    unsigned __int8 v20 = [v19 isEqualToString:TUGroupActivityIdentifierScreenSharing];

    if ((v20 & 1) != 0
      || ([v17 activity],
          int v21 = objc_claimAutoreleasedReturnValue(),
          [v21 bundleIdentifier],
          v22 = objc_claimAutoreleasedReturnValue(),
          v21,
          !v22))
    {
      __int16 v23 = [v4 activeRemoteParticipants];
      unsigned int v24 = [v23 tu_containsObjectPassingTest:&stru_1002CDC60];

      if (v24)
      {
        v25 = +[NSBundle bundleForClass:objc_opt_class()];
        v22 = [v25 bundleIdentifier];
      }
      else
      {
        v22 = 0;
      }
    }
    v26 = sub_1000D5250();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      int v28 = 138543618;
      BOOL v29 = self;
      __int16 v30 = 2114;
      v31 = v22;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting PiP to SharePlay session ID: %{public}@", (uint8_t *)&v28, 0x16u);
    }
    v27 = [(PHPIPController *)self pipProxy];
    [v27 setClientSessionIdentifier:v22];

    goto LABEL_17;
  }
LABEL_18:
}

- (void)setClientSessionIdentifierFromPiPAuthorization:(id)a3
{
  id v4 = a3;
  id v5 = [(PHPIPController *)self featureFlags];
  unsigned int v6 = [v5 supportsScreenSharing];

  if (v6)
  {
    uint64_t v7 = sub_1000D5250();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543618;
      unsigned int v10 = self;
      __int16 v11 = 2114;
      id v12 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Setting PiP client session identifier for background PiP authorization to session ID: %{public}@", (uint8_t *)&v9, 0x16u);
    }
    unsigned int v8 = [(PHPIPController *)self pipProxy];
    [v8 setClientSessionIdentifier:v4];
  }
}

- (void)updateShouldPIPWhenEnteringBackground
{
  BOOL v3 = [(PHPIPController *)self shouldPIPWhenEnteringBackground];
  id v4 = sub_1000D5250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543618;
    uint64_t v7 = self;
    __int16 v8 = 1024;
    BOOL v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating shouldPIPWhenEnteringBackground to %d", (uint8_t *)&v6, 0x12u);
  }
  id v5 = [(PHPIPController *)self pipProxy];
  [v5 setPictureInPictureShouldStartWhenEnteringBackground:v3];
}

- (BOOL)shouldPIPWhenEnteringBackground
{
  if ((+[PGPictureInPictureProxy isPictureInPictureSupported] & 1) == 0)
  {
    __int16 v11 = sub_1000D5250();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    int v32 = 138543362;
    v33 = self;
    id v12 = "%{public}@: isPictureInPictureSupported is false";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v32, 0xCu);
    return 0;
  }
  BOOL v3 = [(PHPIPController *)self windowForTransitionAnimation];

  if (!v3)
  {
    __int16 v11 = sub_1000D5250();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO)) {
      return 0;
    }
    int v32 = 138543362;
    v33 = self;
    id v12 = "%{public}@: windowForTransitionAnimation is nil";
    goto LABEL_15;
  }
  id v4 = +[TUCallCenter sharedInstance];
  id v5 = [v4 currentAudioAndVideoCallCount];

  if (v5 == (id)1)
  {
    int v6 = +[TUCallCenter sharedInstance];
    uint64_t v7 = [v6 currentAudioAndVideoCalls];
    __int16 v8 = [v7 firstObject];

    if (([v8 isConnected] & 1) == 0 && objc_msgSend(v8, "status") != 3)
    {
      __int16 v14 = sub_1000D5250();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v32 = 138543362;
        v33 = self;
        int64_t v15 = "%{public}@: call is not connected or sending";
        goto LABEL_27;
      }
LABEL_28:
      unsigned __int8 v10 = 0;
LABEL_29:

      return v10;
    }
    if ([(PHPIPController *)self isUsedForScreenSharing])
    {
      BOOL v9 = sub_1000D5250();
      unsigned __int8 v10 = 1;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v32 = 138543362;
        v33 = self;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%{public}@: pip isUsedForScreenSharing", (uint8_t *)&v32, 0xCu);
      }
      goto LABEL_29;
    }
    if (([v8 isVideo] & 1) == 0)
    {
      __int16 v14 = sub_1000D5250();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v32 = 138543362;
        v33 = self;
        int64_t v15 = "%{public}@: call is not video";
        goto LABEL_27;
      }
      goto LABEL_28;
    }
    if (([v8 isConversation] & 1) == 0)
    {
      int64_t v16 = sub_1000D5250();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        BOOL v17 = v16;
        [v8 isVideo];
        __int16 v18 = NSStringFromBOOL();
        int v32 = 138543618;
        v33 = self;
        __int16 v34 = 2112;
        v35 = v18;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%{public}@: call isVideo is %@", (uint8_t *)&v32, 0x16u);
      }
      unsigned __int8 v10 = [v8 isVideo];
      goto LABEL_29;
    }
    if ([v8 wantsHoldMusic])
    {
      __int16 v14 = sub_1000D5250();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v32 = 138543362;
        v33 = self;
        int64_t v15 = "%{public}@: call wantsHoldMusic";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, v15, (uint8_t *)&v32, 0xCu);
        goto LABEL_28;
      }
      goto LABEL_28;
    }
    int v19 = +[TUCallCenter sharedInstance];
    unsigned __int8 v20 = [v19 activeConversationForCall:v8];

    if (!v20)
    {
      __int16 v23 = sub_1000D5250();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        unsigned int v24 = v23;
        [v8 isVideo];
        v25 = NSStringFromBOOL();
        int v32 = 138543618;
        v33 = self;
        __int16 v34 = 2112;
        v35 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "%{public}@: conversation is nil, call isVideo is %@", (uint8_t *)&v32, 0x16u);
      }
      unsigned __int8 v10 = [v8 isVideo];
      goto LABEL_42;
    }
    if ([v20 isContinuitySession])
    {
      int v21 = sub_1000D5250();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
LABEL_38:
        unsigned __int8 v10 = 0;
LABEL_42:

        goto LABEL_29;
      }
      int v32 = 138543362;
      v33 = self;
      v22 = "%{public}@: conversation presentationMode is continuitySession";
LABEL_37:
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, v22, (uint8_t *)&v32, 0xCu);
      goto LABEL_38;
    }
    if ([v20 state] != (id)2 && objc_msgSend(v20, "state") != (id)3)
    {
      int v21 = sub_1000D5250();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
        goto LABEL_38;
      }
      int v32 = 138543362;
      v33 = self;
      v22 = "%{public}@: conversation has not been joined";
      goto LABEL_37;
    }
    if ([v20 isOneToOneModeEnabled])
    {
      v26 = sub_1000D5250();
      unsigned __int8 v10 = 1;
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_INFO)) {
        goto LABEL_42;
      }
      int v32 = 138543362;
      v33 = self;
      v27 = "%{public}@: conversation isOneToOneModeEnabled";
      int v28 = v26;
    }
    else
    {
      if (![(PHPIPController *)self hasParticipantVideoForActiveConversation])
      {
        int v21 = sub_1000D5250();
        if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
          goto LABEL_38;
        }
        int v32 = 138543362;
        v33 = self;
        v22 = "%{public}@: conversation hasParticipantVideoForActiveConversation is false";
        goto LABEL_37;
      }
      BOOL v29 = [v20 remoteMembers];
      id v30 = [v29 count];

      int v21 = sub_1000D5250();
      BOOL v31 = os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
      if (!v30)
      {
        if (!v31) {
          goto LABEL_38;
        }
        int v32 = 138543362;
        v33 = self;
        v22 = "%{public}@: conversation remoteMembers equals 0";
        goto LABEL_37;
      }
      if (!v31)
      {
        unsigned __int8 v10 = 1;
        goto LABEL_42;
      }
      int v32 = 138543362;
      v33 = self;
      v27 = "%{public}@: shouldPIPWhenEnteringBackground";
      int v28 = v21;
      unsigned __int8 v10 = 1;
    }
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, v27, (uint8_t *)&v32, 0xCu);
    goto LABEL_42;
  }
  __int16 v11 = sub_1000D5250();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v32 = 138543362;
    v33 = self;
    id v12 = "%{public}@: currentAudioAndVideoCallCount is not 1";
    goto LABEL_15;
  }
  return 0;
}

- (BOOL)pipStateIsTransitory
{
  int64_t v3 = [(PHPIPController *)self pipState];
  if (v3 != 1) {
    LOBYTE(v3) = (id)[(PHPIPController *)self pipState] == (id)3;
  }
  return v3;
}

- (void)updatePIPSize
{
  if ([(PHPIPController *)self isRotating])
  {
    [(PHPIPController *)self setWantsPreferredContentSizeUpdateAfterRotationFinishes:1];
  }
  else
  {
    id v3 = [(PHPIPController *)self pipProxy];
    [v3 preferredContentSizeDidChangeForViewController];
  }
}

- (void)updatePIPFrame
{
  id v2 = [(PHPIPController *)self pipProxy];
  [v2 viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController];
}

- (void)sceneDidUpdate
{
  id v3 = sub_1000D5250();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138543362;
    int v6 = self;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating PIP proxy scene info", (uint8_t *)&v5, 0xCu);
  }
  id v4 = [(PHPIPController *)self pipProxy];
  [v4 viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController];
}

- (void)pictureInPictureProxy:(id)a3 didRequestFaceTimeAction:(int64_t)a4
{
  int v6 = sub_1000D5250();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    BOOL v9 = self;
    __int16 v10 = 2048;
    int64_t v11 = a4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: PIP proxy requested FaceTime action %ld", (uint8_t *)&v8, 0x16u);
  }
  switch(a4)
  {
    case 1:
      [(PHPIPController *)self handleEnableCameraAction];
      break;
    case 2:
      [(PHPIPController *)self handleDisableCameraAction];
      break;
    case 3:
      [(PHPIPController *)self handleMuteMicrophoneAction];
      break;
    case 4:
      [(PHPIPController *)self handleUnmuteMicrophoneAction];
      break;
    case 5:
      [(PHPIPController *)self handleFlipCameraAction];
      break;
    case 6:
      [(PHPIPController *)self handleShowSystemHUDAction];
      break;
    default:
      uint64_t v7 = sub_1000D5250();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_1001E9554((uint64_t)self, a4, v7);
      }
      break;
  }
}

- (void)callIsSendingVideoChanged:(id)a3
{
}

- (void)updatePIPProxyMicrophoneControlStates
{
  id v3 = +[TUCallCenter sharedInstance];
  id v6 = [v3 currentVideoCall];

  id v4 = [v6 isUplinkMuted];
  int v5 = [(PHPIPController *)self pipProxy];
  [v5 setMicrophoneMuted:v4];
}

- (void)updatePIPProxyLayerCloning
{
  id v3 = sub_1000D5250();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = v3;
    if ([(PHPIPController *)self isBroadcastingScreenSharing]) {
      CFStringRef v5 = @"YES";
    }
    else {
      CFStringRef v5 = @"NO";
    }
    if ([(PHPIPController *)self isBeingRemoteControlled]) {
      CFStringRef v6 = @"YES";
    }
    else {
      CFStringRef v6 = @"NO";
    }
    int v9 = 138412546;
    CFStringRef v10 = v5;
    __int16 v11 = 2112;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Updating disables layer cloning for PiP, isBroadcastingScreenSharing: %@ isBeingRemoteControlled: %@", (uint8_t *)&v9, 0x16u);
  }
  if ([(PHPIPController *)self isBroadcastingScreenSharing]) {
    uint64_t v7 = [(PHPIPController *)self isBeingRemoteControlled] ^ 1;
  }
  else {
    uint64_t v7 = 0;
  }
  int v8 = [(PHPIPController *)self pipProxy];
  [v8 setDisablesLayerCloning:v7];
}

- (void)updatePIPProxyCameraControlStates
{
  id v3 = +[TUCallCenter sharedInstance];
  id v4 = [v3 currentVideoCall];
  id v5 = [v4 isSendingVideo];

  CFStringRef v6 = [(PHPIPController *)self pipProxy];
  [v6 setCameraActive:v5];

  id v7 = [(PHPIPController *)self pipProxy];
  [v7 setCanSwitchCamera:v5];
}

- (void)updatePIPProxyControlStates
{
  [(PHPIPController *)self updatePIPProxyMicrophoneControlStates];

  [(PHPIPController *)self updatePIPProxyCameraControlStates];
}

- (void)handleEnableCameraAction
{
  id v6 = +[TUCallCenter sharedInstance];
  id v3 = [v6 currentVideoCall];
  [v3 setIsSendingVideo:1];

  id v4 = [v6 videoDeviceController];
  [v4 startPreview];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"PHPIPControllerDidHandleVideoMuteControlAction" object:self];
}

- (void)handleDisableCameraAction
{
  id v6 = +[TUCallCenter sharedInstance];
  id v3 = [v6 currentVideoCall];
  [v3 setIsSendingVideo:0];

  id v4 = [v6 videoDeviceController];
  [v4 stopPreview];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"PHPIPControllerDidHandleVideoMuteControlAction" object:self];
}

- (void)handleMuteMicrophoneAction
{
  id v3 = +[TUCallCenter sharedInstance];
  id v2 = [v3 currentVideoCall];
  [v2 setUplinkMuted:1];
}

- (void)handleUnmuteMicrophoneAction
{
  id v3 = +[TUCallCenter sharedInstance];
  id v2 = [v3 currentVideoCall];
  [v2 setUplinkMuted:0];
}

- (void)handleFlipCameraAction
{
  id v3 = +[TUCallCenter sharedInstance];
  id v2 = [v3 videoDeviceController];
  [v2 flipCamera];
}

- (void)handleShowSystemHUDAction
{
  id v4 = +[UIApplication sharedApplication];
  id v2 = [v4 delegate];
  id v3 = [v2 bannerPresentationManager];
  [v3 presentSystemHUD];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a6 == &off_1002CDB78)
  {
    if (![v10 isEqualToString:@"pictureInPictureActive"]) {
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_13;
    }
    id v13 = v11;
    int64_t v15 = [(PHPIPController *)self pipProxy];
    unsigned int v16 = [v13 isEqual:v15];

    if (v16)
    {
      BOOL v17 = sub_1000D5250();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v18 = v17;
        int v19 = [(PHPIPController *)self pipProxy];
        int v21 = 138543618;
        v22 = self;
        __int16 v23 = 1024;
        unsigned int v24 = [v19 isPictureInPictureActive];
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@: PGPictureInPictureProxy isPictureInPictureActive changed to %d, firing state change notification", (uint8_t *)&v21, 0x12u);
      }
      unsigned __int8 v20 = +[NSNotificationCenter defaultCenter];
      [v20 postNotificationName:@"PHPIPControllerPIPProxyActiveDidChangeNotification" object:self userInfo:0];
    }
LABEL_12:

    goto LABEL_13;
  }
  if (a6 != &off_1002CDB80) {
    goto LABEL_13;
  }
  id v13 = [(PHPIPController *)self pipProxy];
  if (![v13 isPictureInPicturePossible]) {
    goto LABEL_12;
  }
  unsigned int v14 = [(PHPIPController *)self shouldStartPIPWhenPossible];

  if (v14) {
    [(PHPIPController *)self startPIPNow];
  }
LABEL_13:
}

- (void)conversationManager:(id)a3 addedActiveConversation:(id)a4
{
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
}

- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4
{
}

- (void)screenSharingStateMonitor:(id)a3 didUpdateScreenSharingBroadcastingState:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(PHPIPController *)self isUsedForScreenSharing])
  {
    [(PHPIPController *)self setIsBroadcastingScreenSharing:v4];
    [(PHPIPController *)self updatePIPProxyLayerCloning];
  }
}

- (void)screenSharingInteractionController:(id)a3 didUpdateRemoteControlStatus:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(PHPIPController *)self featureFlags];
  unsigned int v7 = [v6 screenSharingRemoteControlEnabled];

  int v8 = sub_1000D5250();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      CFStringRef v10 = @"NO";
      if (v4) {
        CFStringRef v10 = @"YES";
      }
      int v11 = 138412290;
      CFStringRef v12 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating state for remote control, remote control state is %@", (uint8_t *)&v11, 0xCu);
    }
    [(PHPIPController *)self setIsBeingRemoteControlled:v4];
    [(PHPIPController *)self updatePIPProxyLayerCloning];
  }
  else if (v9)
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not updating state PiP state for remote control, screen sharing remote control feature flag is disabled", (uint8_t *)&v11, 2u);
  }
}

- (int64_t)pipState
{
  return self->_pipState;
}

- (unint64_t)currentPIPAnimationStyle
{
  return self->_currentPIPAnimationStyle;
}

- (void)setCurrentPIPAnimationStyle:(unint64_t)a3
{
  self->_currentPIPAnimationStyle = a3;
}

- (CNKFaceTimePiPSourceProviding)sourceProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceProvider);

  return (CNKFaceTimePiPSourceProviding *)WeakRetained;
}

- (int64_t)pipDeviceOrientation
{
  return self->_pipDeviceOrientation;
}

- (void)setPipDeviceOrientation:(int64_t)a3
{
  self->_pipDeviceOrientation = a3;
}

- (NSString)pipInterruptedCallIdentifier
{
  return self->_pipInterruptedCallIdentifier;
}

- (void)setPipInterruptedCallIdentifier:(id)a3
{
}

- (BOOL)expectingSystemInitiatedPIPInterruptionStop
{
  return self->_expectingSystemInitiatedPIPInterruptionStop;
}

- (void)setExpectingSystemInitiatedPIPInterruptionStop:(BOOL)a3
{
  self->_expectingSystemInitiatedPIPInterruptionStop = a3;
}

- (UIWindow)windowForTransitionAnimation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowForTransitionAnimation);

  return (UIWindow *)WeakRetained;
}

- (BOOL)shouldObtainDismissalAssertions
{
  return self->_shouldObtainDismissalAssertions;
}

- (void)setShouldObtainDismissalAssertions:(BOOL)a3
{
  self->_shouldObtainDismissalAssertions = a3;
}

- (BOOL)hasParticipantVideoForActiveConversation
{
  return self->_hasParticipantVideoForActiveConversation;
}

- (void)setHasParticipantVideoForActiveConversation:(BOOL)a3
{
  self->_hasParticipantVideoForActiveConversation = a3;
}

- (CNKScreenSharingStateMonitorFactory)screenSharingMonitorFactory
{
  return self->_screenSharingMonitorFactory;
}

- (CNKScreenSharingInteractionControllerFactory)screenSharingInteractionControllerFactory
{
  return self->_screenSharingInteractionControllerFactory;
}

- (PHPIPWrapperViewController)wrapperViewController
{
  return (PHPIPWrapperViewController *)objc_getProperty(self, a2, 88, 1);
}

- (void)setWrapperViewController:(id)a3
{
}

- (PGPictureInPictureProxy)pipProxy
{
  return (PGPictureInPictureProxy *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPipProxy:(id)a3
{
}

- (id)startCompletionBlock
{
  return objc_getProperty(self, a2, 104, 1);
}

- (void)setStartCompletionBlock:(id)a3
{
}

- (id)preparedToAnimateToFullScreenCompletionBlock
{
  return objc_getProperty(self, a2, 112, 1);
}

- (void)setPreparedToAnimateToFullScreenCompletionBlock:(id)a3
{
}

- (id)restoreUserInterfaceForPictureInPictureStopCompletionBlock
{
  return self->_restoreUserInterfaceForPictureInPictureStopCompletionBlock;
}

- (void)setRestoreUserInterfaceForPictureInPictureStopCompletionBlock:(id)a3
{
}

- (BOOL)videoWasPausedForInterruption
{
  return self->_videoWasPausedForInterruption;
}

- (void)setVideoWasPausedForInterruption:(BOOL)a3
{
  self->_videoWasPausedForInterruption = a3;
}

- (BOOL)shouldStartPIPWhenPossible
{
  return self->_shouldStartPIPWhenPossible;
}

- (void)setShouldStartPIPWhenPossible:(BOOL)a3
{
  self->_shouldStartPIPWhenPossible = a3;
}

- (BOOL)isUsedForScreenSharing
{
  return self->_isUsedForScreenSharing;
}

- (void)setIsUsedForScreenSharing:(BOOL)a3
{
  self->_isUsedForScreenSharing = a3;
}

- (BOOL)isBroadcastingScreenSharing
{
  return self->_isBroadcastingScreenSharing;
}

- (void)setIsBroadcastingScreenSharing:(BOOL)a3
{
  self->_isBroadcastingScreenSharing = a3;
}

- (BOOL)isBeingRemoteControlled
{
  return self->_isBeingRemoteControlled;
}

- (void)setIsBeingRemoteControlled:(BOOL)a3
{
  self->_isBeingRemoteControlled = a3;
}

- (BOOL)isRotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (BOOL)wantsPreferredContentSizeUpdateAfterRotationFinishes
{
  return self->_wantsPreferredContentSizeUpdateAfterRotationFinishes;
}

- (void)setWantsPreferredContentSizeUpdateAfterRotationFinishes:(BOOL)a3
{
  self->_wantsPreferredContentSizeUpdateAfterRotationFinishes = a3;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong(&self->_restoreUserInterfaceForPictureInPictureStopCompletionBlock, 0);
  objc_storeStrong(&self->_preparedToAnimateToFullScreenCompletionBlock, 0);
  objc_storeStrong(&self->_startCompletionBlock, 0);
  objc_storeStrong((id *)&self->_pipProxy, 0);
  objc_storeStrong((id *)&self->_wrapperViewController, 0);
  objc_storeStrong((id *)&self->_screenSharingInteractionControllerFactory, 0);
  objc_storeStrong((id *)&self->_screenSharingMonitorFactory, 0);
  objc_destroyWeak((id *)&self->_windowForTransitionAnimation);
  objc_storeStrong((id *)&self->_pipInterruptedCallIdentifier, 0);

  objc_destroyWeak((id *)&self->_sourceProvider);
}

@end