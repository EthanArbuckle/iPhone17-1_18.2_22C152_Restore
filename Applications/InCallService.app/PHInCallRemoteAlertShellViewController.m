@interface PHInCallRemoteAlertShellViewController
+ (BOOL)_isSecureForRemoteViewService;
- (AVPictureInPictureIndicatorView)pipPlaceholderView;
- (BOOL)_canShowWhileLocked;
- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear;
- (BOOL)hasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason;
- (BOOL)isMicIndicatorVisible;
- (BOOL)isShowingHUD;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)transitionFromBannerToDismissedIfNecessary;
- (ICSCallDisplayStyleManager)callDisplayStyleManager;
- (ICSScreenSharingContainerViewControllerProtocol)screenSharingContainerViewController;
- (ICSVideoMessageRootViewController)videoMessageRootViewController;
- (PHHIDEventMonitor)hidEventMonitor;
- (PHInCallContainerControllerProtocol)containerController;
- (PHInCallRemoteAlertShellViewController)initWithCallDisplayStyleManager:(id)a3;
- (PHInCallRootViewController)inCallRootViewController;
- (PHPIPController)pipController;
- (TUFilteredRequest)pendingRestrictedScreenTimeRequest;
- (UIViewController)screenSharingBroadcasterViewController;
- (id)_childViewController;
- (id)makeVideoMessageViewControllerWithURL:(id)a3;
- (id)pipFinishedCancellationBlock;
- (id)pipFinishedTransitionBlock;
- (id)requestFromAlertActivationContextUserInfo:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_createRootViewController;
- (void)_handlePiPEndedAndShouldBePresentedFullScreen:(BOOL)a3 transitionIsComplete:(BOOL)a4 viewControllerToSteal:(id)a5;
- (void)_stealViewControllerFromPIP;
- (void)_willAppearInRemoteViewController:(id)a3;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)constrainPIPPlaceholderFullScreen;
- (void)dealloc;
- (void)handleButtonActions:(id)a3;
- (void)handleDeviceLockEventWithSourceType:(int64_t)a3 resultHandler:(id)a4;
- (void)handleDoubleHeightStatusBarTap;
- (void)handleHeadsetButtonLongPressed;
- (void)handleHeadsetButtonPressed;
- (void)handleLockButtonPressed;
- (void)handleVolumeDownButtonPressed;
- (void)handleVolumeUpButtonPressed;
- (void)noteActivatedForActivityContinuationWithIdentifier:(id)a3;
- (void)noteActivatedForCustomReason:(id)a3 withUserInfo:(id)a4;
- (void)pipControllerDidRequestReturnToFullScreenNotification:(id)a3;
- (void)pipControllerStateDidChange:(id)a3;
- (void)pipDidCancelNotification:(id)a3;
- (void)pipWillCancelNotification:(id)a3;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)removePIPPlaceholderView;
- (void)requestScreenTimeShieldIfNecessary;
- (void)sceneSessionDidChange;
- (void)setCallDisplayStyleManager:(id)a3;
- (void)setHasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason:(BOOL)a3;
- (void)setHidEventMonitor:(id)a3;
- (void)setInCallRootViewController:(id)a3;
- (void)setPendingRestrictedScreenTimeRequest:(id)a3;
- (void)setPipController:(id)a3;
- (void)setPipFinishedCancellationBlock:(id)a3;
- (void)setPipFinishedTransitionBlock:(id)a3;
- (void)setPipPlaceholderView:(id)a3;
- (void)setScreenSharingBroadcasterViewController:(id)a3;
- (void)setScreenSharingContainerViewController:(id)a3;
- (void)setVideoMessageRootViewController:(id)a3;
- (void)showKeypadIfPossible;
- (void)showPIPPlaceholderView;
- (void)stopPIPAndStealViewController;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillAppear:(BOOL)a3;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
@end

@implementation PHInCallRemoteAlertShellViewController

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (PHInCallRemoteAlertShellViewController)initWithCallDisplayStyleManager:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHInCallRemoteAlertShellViewController;
  v6 = [(PHInCallRemoteAlertShellViewController *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);
    v8 = +[NSNotificationCenter defaultCenter];
    v9 = [(PHInCallRemoteAlertShellViewController *)v7 pipController];
    [v8 addObserver:v7 selector:"pipDidCancelNotification:" name:@"PHPIPControllerDidCancelNotification" object:v9];

    v10 = +[NSNotificationCenter defaultCenter];
    v11 = [(PHInCallRemoteAlertShellViewController *)v7 pipController];
    [v10 addObserver:v7 selector:"pipWillCancelNotification:" name:@"PHPIPControllerWillCancelNotification" object:v11];

    v12 = +[NSNotificationCenter defaultCenter];
    v13 = [(PHInCallRemoteAlertShellViewController *)v7 pipController];
    [v12 addObserver:v7 selector:"pipControllerDidRequestReturnToFullScreenNotification:" name:@"PHPIPControllerDidRequestReturnToFullScreenNotification" object:v13];

    v14 = +[NSNotificationCenter defaultCenter];
    v15 = [(PHInCallRemoteAlertShellViewController *)v7 pipController];
    [v14 addObserver:v7 selector:"pipControllerStateDidChange:" name:@"PHPIPControllerStateDidChangeNotification" object:v15];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PHInCallRemoteAlertShellViewController;
  [(PHInCallRemoteAlertShellViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)PHInCallRemoteAlertShellViewController;
  [(PHInCallRemoteAlertShellViewController *)&v28 viewDidLoad];
  v3 = +[UIColor clearColor];
  objc_super v4 = [(PHInCallRemoteAlertShellViewController *)self view];
  [v4 setBackgroundColor:v3];

  id v5 = [(PHInCallRemoteAlertShellViewController *)self view];
  [v5 setOpaque:0];

  v6 = [(PHInCallRemoteAlertShellViewController *)self view];
  v7 = [v6 layer];
  [v7 setAllowsGroupBlending:0];

  v8 = [(PHInCallRemoteAlertShellViewController *)self view];
  v9 = [v8 layer];
  [v9 setAllowsGroupOpacity:0];

  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_1000CC428;
  v27[3] = &unk_1002CD518;
  v27[4] = self;
  v10 = objc_retainBlock(v27);
  v11 = [(PHInCallRemoteAlertShellViewController *)self pipController];
  if ([v11 pipState] == (id)2)
  {
    int64_t v12 = [(ICSCallDisplayStyleManager *)self->_callDisplayStyleManager callDisplayStyle];

    if (v12 != 4)
    {
      v13 = sub_1000D5250();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1001EBC44(v13, v14, v15, v16, v17, v18, v19, v20);
      }
LABEL_10:
      [(PHInCallRemoteAlertShellViewController *)self setPipFinishedTransitionBlock:v10];
      goto LABEL_14;
    }
  }
  else
  {
  }
  v21 = [(PHInCallRemoteAlertShellViewController *)self pipController];
  id v22 = [v21 pipState];

  v23 = sub_1000D5130();
  BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
  if (v22 == (id)3)
  {
    if (v24)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "loadView: Appeared without a root view controller, but the PIP was animating so we'll create a new after a delay", buf, 2u);
    }

    goto LABEL_10;
  }
  if (v24)
  {
    v25 = [(PHInCallRemoteAlertShellViewController *)self pipController];
    id v26 = [v25 pipState];
    *(_DWORD *)buf = 134217984;
    id v30 = v26;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "loadView: Appeared without a root view controller so we'll create a new one (%ld)", buf, 0xCu);
  }
  ((void (*)(void *))v10[2])(v10);
LABEL_14:
}

- (void)viewWillAppear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PHInCallRemoteAlertShellViewController;
  [(PHInCallRemoteAlertShellViewController *)&v13 viewWillAppear:a3];
  objc_super v4 = +[PHInCallUtilities sharedInstance];
  if ([v4 requestedVCPresentationWithStatusBar])
  {

LABEL_8:
    v9 = sub_1000D5130();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v15 = @"PHSuppressInCallStatusBarForFullscreenUIReason";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "requestedVCPresentationWithStatusBar, do not add status bar suppression %@", buf, 0xCu);
    }

    goto LABEL_11;
  }
  id v5 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];
  id v6 = [v5 callDisplayStyle];

  if (!v6) {
    goto LABEL_8;
  }
  if (![(PHInCallRemoteAlertShellViewController *)self hasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason])
  {
    v7 = sub_1000D5130();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v15 = @"PHSuppressInCallStatusBarForFullscreenUIReason";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "add status bar suppression %@", buf, 0xCu);
    }

    v8 = +[PHInCallUtilities sharedInstance];
    [v8 startSuppressingInCallStatusBarForReason:@"PHSuppressInCallStatusBarForFullscreenUIReason"];

    [(PHInCallRemoteAlertShellViewController *)self setHasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason:1];
  }
LABEL_11:
  if (CPIsInternalDevice())
  {
    v10 = [(PHInCallRemoteAlertShellViewController *)self hidEventMonitor];

    if (!v10)
    {
      v11 = +[PHHIDEventMonitor HIDEventMonitor];
      [(PHInCallRemoteAlertShellViewController *)self setHidEventMonitor:v11];
    }
    int64_t v12 = [(PHInCallRemoteAlertShellViewController *)self hidEventMonitor];
    [v12 start];
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PHInCallRemoteAlertShellViewController;
  [(PHInCallRemoteAlertShellViewController *)&v8 viewDidMoveToWindow:v6 shouldAppearOrDisappear:v4];
  v7 = sub_1000D5130();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v10 = v6;
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "window: %@, shouldAppearOrDisappear: %d", buf, 0x12u);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PHInCallRemoteAlertShellViewController;
  [(PHInCallRemoteAlertShellViewController *)&v14 viewDidAppear:a3];
  BOOL v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [(PHInCallRemoteAlertShellViewController *)self isViewLoaded];
    id v6 = [(PHInCallRemoteAlertShellViewController *)self view];
    v7 = [v6 window];
    *(_DWORD *)buf = 67109378;
    unsigned int v16 = v5;
    __int16 v17 = 2112;
    uint64_t v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "self.isViewLoaded: %d, self.view.window: %@", buf, 0x12u);
  }
  +[ICSAriadne trace:4];
  objc_super v8 = [(PHInCallRemoteAlertShellViewController *)self view];
  v9 = [v8 window];
  id v10 = [v9 _rootSheetPresentationController];
  [v10 _setShouldScaleDownBehindDescendantSheets:0];

  dispatch_time_t v11 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000CC90C;
  block[3] = &unk_1002CD518;
  block[4] = self;
  dispatch_after(v11, (dispatch_queue_t)&_dispatch_main_q, block);
  BOOL v12 = +[PHInCallUtilities sharedInstance];
  [v12 startAllowingRingingCallStatusIndicator];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PHInCallRemoteAlertShellViewController;
  [(PHInCallRemoteAlertShellViewController *)&v13 viewDidDisappear:a3];
  BOOL v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v15 = @"PHSuppressInCallStatusBarForFullscreenUIReason";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "remove status bar suppression %@", buf, 0xCu);
  }

  unsigned int v5 = +[PHInCallUtilities sharedInstance];
  [v5 stopSuppressingInCallStatusBarForReason:@"PHSuppressInCallStatusBarForFullscreenUIReason"];

  id v6 = [(PHInCallRemoteAlertShellViewController *)self hidEventMonitor];
  [v6 stop];

  v7 = +[TUCallCenter sharedInstance];
  objc_super v8 = [v7 audioOrVideoCallWithStatus:4];

  if (v8)
  {
    v9 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];
    id v10 = [v9 callDisplayStyle];

    if (v10 != (id)3)
    {
      dispatch_time_t v11 = +[UIApplication sharedApplication];
      BOOL v12 = [v11 delegate];

      [v12 requestPresentationForCall:v8 dialRequest:0];
    }
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (PHInCallContainerControllerProtocol)containerController
{
  v3 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PHInCallRemoteAlertShellViewController *)self screenSharingContainerViewController];
  }
  id v6 = v5;

  return (PHInCallContainerControllerProtocol *)v6;
}

- (PHPIPController)pipController
{
  pipController = self->_pipController;
  if (!pipController)
  {
    BOOL v4 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];
    id v5 = [v4 sceneType];

    if (v5)
    {
      id v6 = +[PHPIPController newScreenSharingPIPController];
    }
    else
    {
      id v6 = +[PHPIPController defaultPIPController];
    }
    v7 = self->_pipController;
    self->_pipController = v6;

    pipController = self->_pipController;
  }
  objc_super v8 = pipController;

  return v8;
}

- (void)sceneSessionDidChange
{
  v3 = [(PHInCallRemoteAlertShellViewController *)self pipController];
  [v3 sceneDidUpdate];

  id v4 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
  [v4 sceneDidConnect];
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 0;
}

- (void)_createRootViewController
{
  v3 = [(ICSCallDisplayStyleManager *)self->_callDisplayStyleManager rootViewController];

  if (v3)
  {
    id v4 = sub_1000D5130();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v66 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Not creating a new root view controller because one already exists", v66, 2u);
    }
    id v5 = 0;
  }
  else
  {
    id v6 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];

    if (!v6)
    {
      v7 = objc_alloc_init(ICSCallDisplayStyleManager);
      [(ICSCallDisplayStyleManager *)v7 setCallDisplayStyle:+[ICSCallDisplayStyleManager callDisplayStyleToRequestForCurrentState]];
      objc_super v8 = +[UIApplication sharedApplication];
      v9 = [v8 delegate];
      id v10 = [v9 currentInCallScene];
      dispatch_time_t v11 = [v10 session];
      BOOL v12 = [v11 persistentIdentifier];
      [(ICSCallDisplayStyleManager *)v7 setSceneSessionIdentifier:v12];

      [(PHInCallRemoteAlertShellViewController *)self setCallDisplayStyleManager:v7];
    }
    objc_super v13 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];
    id v14 = [v13 sceneType];

    id v5 = 0;
    switch((unint64_t)v14)
    {
      case 0uLL:
      case 5uLL:
        if (self->_inCallRootViewController) {
          goto LABEL_16;
        }
        CFStringRef v15 = [PHInCallRootViewController alloc];
        unsigned int v16 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];
        __int16 v17 = [(PHInCallRootViewController *)v15 initWithCallDisplayStyleManager:v16];
        [(PHInCallRemoteAlertShellViewController *)self setInCallRootViewController:v17];

        id v18 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
        goto LABEL_18;
      case 1uLL:
        if (self->_screenSharingContainerViewController) {
          goto LABEL_16;
        }
        uint64_t v19 = +[UIApplication sharedApplication];
        uint64_t v20 = [v19 delegate];
        v21 = [v20 featureFlags];
        unsigned int v22 = [v21 screenSharingDrawToHighlightEnabled];

        if (v22) {
          v23 = ICSScreenSharingSpectatorRootViewController;
        }
        else {
          v23 = PHScreenSharingContainerViewController;
        }
        id v36 = [v23 alloc];
        v37 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];
        id v38 = [v36 initWithCallDisplayStyleManager:v37];
        [(PHInCallRemoteAlertShellViewController *)self setScreenSharingContainerViewController:v38];

        id v5 = [(PHInCallRemoteAlertShellViewController *)self screenSharingContainerViewController];
        v32 = [(PHInCallRemoteAlertShellViewController *)self pipController];
        v39 = [(PHInCallRemoteAlertShellViewController *)self screenSharingContainerViewController];
        [v39 setPipController:v32];

        goto LABEL_26;
      case 2uLL:
        BOOL v24 = +[UIApplication sharedApplication];
        v25 = [v24 delegate];
        id v26 = [v25 featureFlags];
        unsigned int v27 = [v26 screenSharingDrawToHighlightEnabled];

        if (!v27) {
          goto LABEL_16;
        }
        objc_super v28 = objc_alloc_init(ICSScreenSharingBroadcasterRootViewController);
        [(PHInCallRemoteAlertShellViewController *)self setScreenSharingBroadcasterViewController:v28];

        id v18 = [(PHInCallRemoteAlertShellViewController *)self screenSharingBroadcasterViewController];
        goto LABEL_18;
      case 4uLL:
        if (self->_videoMessageRootViewController)
        {
LABEL_16:
          id v5 = 0;
        }
        else
        {
          v29 = +[UIApplication sharedApplication];
          id v30 = [v29 delegate];
          v31 = [v30 activationContext];
          v32 = [v31 videoMessageURL];

          v33 = +[UIApplication sharedApplication];
          v34 = [v33 delegate];
          [v34 setActivationContext:0];

          if (v32)
          {
            v35 = [(PHInCallRemoteAlertShellViewController *)self makeVideoMessageViewControllerWithURL:v32];
            [(PHInCallRemoteAlertShellViewController *)self setVideoMessageRootViewController:v35];

            id v5 = [(PHInCallRemoteAlertShellViewController *)self videoMessageRootViewController];
          }
          else
          {
            v40 = sub_1000D5130();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
              sub_1001EBC7C(v40, v41, v42, v43, v44, v45, v46, v47);
            }

            v48 = +[UIApplication sharedApplication];
            v49 = [v48 delegate];
            [v49 dismissVideoMessageSceneSession];

            id v5 = 0;
          }
LABEL_26:
        }
        break;
      case 6uLL:
        id v18 = objc_alloc_init((Class)UIViewController);
LABEL_18:
        id v5 = v18;
        break;
      default:
        break;
    }
    id v4 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];
    [v4 setRootViewController:v5];
  }

  v50 = [(PHInCallRemoteAlertShellViewController *)self view];
  [v50 bounds];
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  v59 = [v5 view];
  [v59 setFrame:v52, v54, v56, v58];

  v60 = [v5 view];
  [v60 setAutoresizingMask:18];

  [v5 willMoveToParentViewController:self];
  v61 = [(PHInCallRemoteAlertShellViewController *)self view];
  v62 = [v5 view];
  [v61 addSubview:v62];

  [(PHInCallRemoteAlertShellViewController *)self addChildViewController:v5];
  [v5 didMoveToParentViewController:self];
  v63 = [(PHInCallRemoteAlertShellViewController *)self containerController];
  v64 = [v63 pipSourceProvider];
  v65 = [(PHInCallRemoteAlertShellViewController *)self pipController];
  [v65 setSourceProvider:v64];
}

- (void)stopPIPAndStealViewController
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping PIP and restoring its view controller", (uint8_t *)buf, 2u);
  }

  id v4 = [(PHInCallRemoteAlertShellViewController *)self pipController];
  unsigned int v5 = [v4 isPreparedToAnimateToFullScreen];

  if (v5)
  {
    [(PHInCallRemoteAlertShellViewController *)self _stealViewControllerFromPIP];
  }
  else
  {
    objc_initWeak(buf, self);
    id v6 = [(PHInCallRemoteAlertShellViewController *)self pipController];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1000CD4E4;
    v7[3] = &unk_1002CED28;
    objc_copyWeak(&v8, buf);
    [v6 manuallyStopPIPWithCompletion:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(buf);
  }
}

- (void)_stealViewControllerFromPIP
{
  objc_initWeak(&location, self);
  v3 = [(PHInCallRemoteAlertShellViewController *)self pipController];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000CD604;
  v4[3] = &unk_1002D02D8;
  objc_copyWeak(&v5, &location);
  [v3 stopPIPAndStealViewController:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handlePiPEndedAndShouldBePresentedFullScreen:(BOOL)a3 transitionIsComplete:(BOOL)a4 viewControllerToSteal:(id)a5
{
  BOOL v5 = a3;
  id v7 = a5;
  if (!v7) {
    goto LABEL_22;
  }
  id v8 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
  if (v8)
  {

    goto LABEL_6;
  }
  if (![v7 conformsToProtocol:&OBJC_PROTOCOL___PHInCallRootViewControllerProtocol])
  {
LABEL_6:
    v9 = sub_1000D5250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "View controller stolen from PIP is not an InCallRootViewController: %@", buf, 0xCu);
    }
    goto LABEL_8;
  }
  [(PHInCallRemoteAlertShellViewController *)self setInCallRootViewController:v7];
LABEL_8:
  id v10 = [(PHInCallRemoteAlertShellViewController *)self containerController];
  uint64_t v11 = [v10 parentViewControllerForRestoringPiP];
  BOOL v12 = (void *)v11;
  if (v11) {
    objc_super v13 = (PHInCallRemoteAlertShellViewController *)v11;
  }
  else {
    objc_super v13 = self;
  }
  id v14 = v13;

  [v7 willMoveToParentViewController:v14];
  [(PHInCallRemoteAlertShellViewController *)v14 addChildViewController:v7];
  CFStringRef v15 = [(PHInCallRemoteAlertShellViewController *)v14 view];
  unsigned int v16 = [v7 view];
  [v15 addSubview:v16];

  [v7 didMoveToParentViewController:v14];
  __int16 v17 = [(PHInCallRemoteAlertShellViewController *)self containerController];
  [v17 handlePIPViewControllerRestoredAfterPIPStopped:v7];

  [v7 viewWillAppear:1];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = [v7 childViewControllers];
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * i) viewWillAppear:1];
      }
      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v20);
  }

  v23 = [(PHInCallRemoteAlertShellViewController *)self _remoteViewControllerProxy];
  [v23 setWhitePointAdaptivityStyle:[self preferredWhitePointAdaptivityStyle]];

  [(PHInCallRemoteAlertShellViewController *)self requestScreenTimeShieldIfNecessary];
  [(PHInCallRemoteAlertShellViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(PHInCallRemoteAlertShellViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
  if (v5)
  {
    BOOL v24 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];
    id v25 = [v24 callDisplayStyle];

    if (v25 == (id)4) {
      TUDispatchMainIfNecessary();
    }
  }

LABEL_22:
}

- (void)_willAppearInRemoteViewController:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PHInCallRemoteAlertShellViewController;
  [(PHInCallRemoteAlertShellViewController *)&v12 _willAppearInRemoteViewController:v4];
  BOOL v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithInteger:[(PHInCallRemoteAlertShellViewController *)self preferredWhitePointAdaptivityStyle]];
    *(_DWORD *)buf = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Setting WhitePointAdaptivityStyle to : %@", buf, 0xCu);
  }
  id v7 = [(PHInCallRemoteAlertShellViewController *)self _remoteViewControllerProxy];
  [v7 setWhitePointAdaptivityStyle:[self preferredWhitePointAdaptivityStyle]];

  id v8 = [(PHInCallRemoteAlertShellViewController *)self _remoteViewControllerProxy];
  [v8 setAllowsControlCenter:1];

  v9 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    uint64_t v11 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
    [v11 _willAppearInRemoteViewController:v4];
  }
}

- (void)requestScreenTimeShieldIfNecessary
{
  uint64_t v3 = [(PHInCallRemoteAlertShellViewController *)self pendingRestrictedScreenTimeRequest];
  if (v3
    && (id v4 = (void *)v3,
        [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    id v6 = sub_1000D53E8();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = v6;
      id v8 = [(PHInCallRemoteAlertShellViewController *)self pendingRestrictedScreenTimeRequest];
      int v14 = 138412290;
      CFStringRef v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will request screen time alert for request %@", (uint8_t *)&v14, 0xCu);
    }
    +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHScreenTimeAlertAssertionReason"];
    v9 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
    char v10 = [(PHInCallRemoteAlertShellViewController *)self pendingRestrictedScreenTimeRequest];
    [v9 forceUpdateCallControllerForFilteredRequest:v10];

    [(PHInCallRemoteAlertShellViewController *)self setPendingRestrictedScreenTimeRequest:0];
  }
  else
  {
    uint64_t v11 = sub_1000D53E8();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v12 = v11;
      objc_super v13 = [(PHInCallRemoteAlertShellViewController *)self pendingRestrictedScreenTimeRequest];
      int v14 = 138412290;
      CFStringRef v15 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Not requesting screen time shield for filtered request: %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)noteActivatedForCustomReason:(id)a3 withUserInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v21 = 138412546;
    id v22 = v6;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Activated for reason: %@, userInfo: %@", (uint8_t *)&v21, 0x16u);
  }

  if (![v6 isEqualToString:SBUIRemoteAlertActivationReasonActivatingForUILock])
  {
    if ([v6 isEqualToString:SOSRemoteAlertActivationReasonActivatingForSOSWithClicks])
    {
      uint64_t v13 = SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen;
    }
    else
    {
      unsigned __int8 v14 = [v6 isEqualToString:SOSRemoteAlertActivationReasonActivatingForSOSWithKappa];
      uint64_t v13 = SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen;
      if ((v14 & 1) == 0
        && ([v6 isEqualToString:SOSRemoteAlertActivationReasonActivatingForSOSAlertRestingScreen] & 1) == 0&& !objc_msgSend(v6, "isEqualToString:", SOSRemoteAlertActivationReasonActivatingForSOSWithVolumeLockHold))
      {
        if ([v6 isEqualToString:SOSRemoteAlertActivationReasonActivatingForScreenTime])
        {
          id v20 = [(PHInCallRemoteAlertShellViewController *)self requestFromAlertActivationContextUserInfo:v7];
          [(PHInCallRemoteAlertShellViewController *)self setPendingRestrictedScreenTimeRequest:v20];

          [(PHInCallRemoteAlertShellViewController *)self requestScreenTimeShieldIfNecessary];
        }
        goto LABEL_17;
      }
    }
    CFStringRef v15 = +[TUCallCenter sharedInstance];
    [v15 disconnectAllCalls];

    unsigned int v16 = [v6 isEqualToString:v13];
    __int16 v17 = off_1002CFE50;
    if (!v16) {
      __int16 v17 = off_1002CFE08;
    }
    +[PHInCallRootViewController obtainDismissalAssertionForReason:*v17];
    id v18 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
    [v18 setCurrentAlertButtonAction:0];

    id v19 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
    [v19 forceUpdateCallControllerForSOS];

    objc_super v12 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
    [v12 dismissScreenTimeAlertHostIfNeeded];
    goto LABEL_16;
  }
  v9 = sub_1000D5130();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v21) = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Notified that we were activated for ending all calls and locking", (uint8_t *)&v21, 2u);
  }

  char v10 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    objc_super v12 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
    [v12 handleActivationForEndAndLock];
LABEL_16:
  }
LABEL_17:
}

- (id)requestFromAlertActivationContextUserInfo:(id)a3
{
  uint64_t v3 = [a3 objectForKeyedSubscript:SOSRemoteAlertActivationContextUserInfoRequestURLStringKey];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = +[NSURL URLWithString:v3];
    if (v4)
    {
      id v5 = [objc_alloc((Class)TUDialRequest) initWithURL:v4];
      if (!v5)
      {
        id v6 = [objc_alloc((Class)TUJoinConversationRequest) initWithURL:v4];
        id v7 = +[TUCallCenter sharedInstance];
        id v8 = [v7 conversationManager];
        v9 = [v6 remoteMembers];
        char v10 = [v6 conversationLink];
        char v11 = [v8 activeConversationWithRemoteMembers:v9 andLink:v10];

        objc_super v12 = [v11 activeRemoteParticipants];
        if ([v12 count]) {
          uint64_t v13 = v11;
        }
        else {
          uint64_t v13 = v6;
        }
        id v5 = v13;
      }
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)noteActivatedForActivityContinuationWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = sub_1000D5130();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Activated for activity continuation with identifier: %@", buf, 0xCu);
  }

  +[PHInCallRootViewController obtainDismissalAssertionForReason:@"PHDismissalReasonWaitingForHandoff"];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000CE2FC;
  v6[3] = &unk_1002D0300;
  id v7 = v3;
  id v5 = v3;
  +[NSUserActivity _fetchUserActivityWithUUID:v5 completionHandler:v6];
}

- (BOOL)_shouldRemoveViewFromHierarchyOnDisappear
{
  return 0;
}

- (void)handleDeviceLockEventWithSourceType:(int64_t)a3 resultHandler:(id)a4
{
  id v6 = a4;
  id v7 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
  unsigned int v8 = [v7 conformsToProtocol:&OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol];

  if (v8)
  {
    id v10 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
    [v10 handleDeviceLockEventWithSourceType:a3 resultHandler:v6];
  }
  else
  {
    id v9 = sub_1000D52D8();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHInCallRemoteAlertShellViewController does not have a child VC that can handle button events", buf, 2u);
    }
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)handleLockButtonPressed
{
  id v3 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
    [v5 handleLockButtonPressed];
  }
}

- (void)handleVolumeUpButtonPressed
{
  id v3 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol];

  if (v4)
  {
    id v5 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
    [v5 handleVolumeUpButtonPressed];
  }
}

- (void)handleVolumeDownButtonPressed
{
  id v3 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol];

  if (v4)
  {
    id v5 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
    [v5 handleVolumeDownButtonPressed];
  }
}

- (void)handleHeadsetButtonPressed
{
  id v3 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol];

  if (v4)
  {
    id v5 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
    [v5 handleHeadsetButtonPressed];
  }
}

- (void)handleHeadsetButtonLongPressed
{
  id v3 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___PHInCallHardwareButtonEventHandlerProtocol];

  if (v4)
  {
    id v5 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
    [v5 handleHeadsetButtonLongPressed];
  }
}

- (void)handleDoubleHeightStatusBarTap
{
  id v3 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(PHInCallRemoteAlertShellViewController *)self _childViewController];
    [v5 handleDoubleHeightStatusBarTap];
  }
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = +[NSNumber numberWithInteger:[(PHInCallRemoteAlertShellViewController *)self preferredWhitePointAdaptivityStyle]];
    *(_DWORD *)buf = 138412290;
    uint64_t v13 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Setting WhitePointAdaptivityStyle to : %@", buf, 0xCu);
  }
  id v10 = [(PHInCallRemoteAlertShellViewController *)self _remoteViewControllerProxy];
  [v10 setWhitePointAdaptivityStyle:[self preferredWhitePointAdaptivityStyle]];

  v11.receiver = self;
  v11.super_class = (Class)PHInCallRemoteAlertShellViewController;
  [(PHInCallRemoteAlertShellViewController *)&v11 configureWithContext:v7 completion:v6];
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  unsigned int v8 = sub_1000D5130();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412290;
    id v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "context: %@", (uint8_t *)&v14, 0xCu);
  }

  id v9 = [v6 actions];
  [(PHInCallRemoteAlertShellViewController *)self handleButtonActions:v9];

  id v10 = [v6 reason];
  objc_super v11 = [v6 userInfo];
  [(PHInCallRemoteAlertShellViewController *)self noteActivatedForCustomReason:v10 withUserInfo:v11];

  if (+[PHInCallUIUtilities isSpringBoardPasscodeLocked])
  {
    objc_super v12 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
    [v12 prepareForDeviceLock];
  }
  if (v7)
  {
    uint64_t v13 = sub_1000D5130();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Calling completion block", (uint8_t *)&v14, 2u);
    }

    v7[2](v7);
  }
}

- (void)handleButtonActions:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5130();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v38[0] = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "buttonActions: %@", buf, 0xCu);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v6)
  {
    id v8 = v6;
    id v9 = &_ss4Int8VN_ptr;
    uint64_t v10 = *(void *)v34;
    *(void *)&long long v7 = 67109378;
    long long v31 = v7;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        objc_super v12 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v13 = sub_1000D5130();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v38[0] = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Handling current SBUIRemoteAlertButtonAction: %@", buf, 0xCu);
        }

        int v14 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
        [v14 setCurrentAlertButtonAction:v12];

        id v15 = [v9[349] sharedInstance];
        unsigned int v16 = [v15 incomingCall];
        __int16 v17 = v16;
        if (v16)
        {
          id v18 = v16;
        }
        else
        {
          id v19 = [v9[349] sharedInstance];
          id v18 = [v19 incomingVideoCall];
        }
        unsigned int v20 = +[PHSOSViewController isSOSDismissalAssertionActive];
        if ((v20 & 1) != 0 || v18 && ([v18 shouldSuppressRingtone] & 1) == 0)
        {
          int v21 = sub_1000D5130();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v31;
            LODWORD(v38[0]) = v20;
            WORD2(v38[0]) = 2112;
            *(void *)((char *)v38 + 6) = v18;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "dismissalAssertions contains PHSOSCallAssertionReason: %d; incomingCall = %@\n"
              "Sending response that we have handled all events",
              buf,
              0x12u);
          }

          id v22 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
          [v22 setCurrentAlertButtonAction:0];
        }
        id v23 = [v12 events:v31];
        id v24 = sub_1000D5130();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v38[0] = v23;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[alertAction events]: %ld", buf, 0xCu);
        }

        if (v23)
        {
          id v25 = sub_1000D5130();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventLockButton", buf, 2u);
          }

          [(PHInCallRemoteAlertShellViewController *)self handleLockButtonPressed];
          if ((v23 & 2) == 0)
          {
LABEL_23:
            if ((v23 & 4) == 0) {
              goto LABEL_24;
            }
            goto LABEL_34;
          }
        }
        else if ((v23 & 2) == 0)
        {
          goto LABEL_23;
        }
        long long v26 = sub_1000D5130();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventVolumeUpButton", buf, 2u);
        }

        [(PHInCallRemoteAlertShellViewController *)self handleVolumeUpButtonPressed];
        if ((v23 & 4) == 0)
        {
LABEL_24:
          if ((v23 & 8) == 0) {
            goto LABEL_25;
          }
          goto LABEL_37;
        }
LABEL_34:
        long long v27 = sub_1000D5130();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventVolumeDownButton", buf, 2u);
        }

        [(PHInCallRemoteAlertShellViewController *)self handleVolumeDownButtonPressed];
        if ((v23 & 8) == 0)
        {
LABEL_25:
          if ((v23 & 0x20) == 0) {
            goto LABEL_26;
          }
          goto LABEL_40;
        }
LABEL_37:
        long long v28 = sub_1000D5130();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventHeadsetButton", buf, 2u);
        }

        [(PHInCallRemoteAlertShellViewController *)self handleHeadsetButtonPressed];
        if ((v23 & 0x20) == 0)
        {
LABEL_26:
          if ((v23 & 0x10) == 0) {
            goto LABEL_46;
          }
LABEL_43:
          id v30 = sub_1000D5130();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventHomeButton", buf, 2u);
          }

          [(PHInCallRemoteAlertShellViewController *)self handleHomeButtonPressed];
          goto LABEL_46;
        }
LABEL_40:
        long long v29 = sub_1000D5130();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "alertAction events contained SBUIRemoteAlertServiceButtonEventHeadsetButtonLongPress", buf, 2u);
        }

        [(PHInCallRemoteAlertShellViewController *)self handleHeadsetButtonLongPressed];
        if ((v23 & 0x10) != 0) {
          goto LABEL_43;
        }
LABEL_46:

        id v9 = &_ss4Int8VN_ptr;
      }
      id v8 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v8);
  }
}

- (id)_childViewController
{
  id v3 = [(PHInCallRemoteAlertShellViewController *)self childViewControllers];
  id v4 = [v3 count];

  if (v4)
  {
    if (v4 != (id)1) {
      NSLog(@"InCall view controller shell expects to only have one child view controller, but it has found more than one...");
    }
    id v5 = [(PHInCallRemoteAlertShellViewController *)self childViewControllers];
    id v6 = [v5 lastObject];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  id v6 = [(PHInCallRemoteAlertShellViewController *)self childViewControllers];
  id v7 = [v6 lastObject];

  if (objc_opt_respondsToSelector()) {
    [v7 willAnimateRotationToInterfaceOrientation:a3 duration:a4];
  }
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  id v4 = [(PHInCallRemoteAlertShellViewController *)self childViewControllers];
  id v5 = [v4 lastObject];

  if (objc_opt_respondsToSelector()) {
    unsigned __int8 v6 = [v5 shouldAutorotateToInterfaceOrientation:a3];
  }
  else {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (+[PHUIConfiguration canAutoRotateInCallUIForFaceTimeAudio](PHUIConfiguration, "canAutoRotateInCallUIForFaceTimeAudio")&& +[PHUIConfiguration canAutoRotateInCallUIForFaceTime])
  {
    return 30;
  }
  id v4 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];
  id v5 = [v4 sceneType];

  if (v5 != (id)1) {
    goto LABEL_9;
  }
  unsigned __int8 v6 = +[UIApplication sharedApplication];
  id v7 = [v6 delegate];
  id v8 = [v7 featureFlags];
  unsigned int v9 = [v8 screenSharingDrawToHighlightEnabled];

  if (v9)
  {
    uint64_t v10 = [(PHInCallRemoteAlertShellViewController *)self childViewControllers];
    objc_super v11 = [v10 lastObject];

    id v12 = [v11 supportedInterfaceOrientations];
    return (unint64_t)v12;
  }
  uint64_t v13 = +[UIApplication sharedApplication];
  int v14 = [v13 delegate];
  id v15 = [v14 featureFlags];
  int v16 = [v15 supportsScreenSharing];

  if (v16) {
    return 26;
  }
LABEL_9:
  __int16 v17 = [(PHInCallRemoteAlertShellViewController *)self callDisplayStyleManager];
  id v18 = [v17 callDisplayStyle];

  if (v18 == (id)3) {
    return 24;
  }
  else {
    return 2;
  }
}

- (void)pipWillCancelNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5250();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v6 = v5;
    id v7 = [(PHInCallRemoteAlertShellViewController *)self pipController];
    *(_DWORD *)buf = 138543362;
    unsigned int v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PiP will cancel: %{public}@", buf, 0xCu);
  }
  id v8 = [(PHInCallRemoteAlertShellViewController *)self pipFinishedCancellationBlock];

  if (v8)
  {
    unsigned int v9 = sub_1000D5250();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1001EBD94(v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000CF754;
    v17[3] = &unk_1002CED28;
    objc_copyWeak(&v18, (id *)buf);
    [(PHInCallRemoteAlertShellViewController *)self setPipFinishedCancellationBlock:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

- (void)pipDidCancelNotification:(id)a3
{
  id v4 = sub_1000D5250();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = v4;
    unsigned __int8 v6 = [(PHInCallRemoteAlertShellViewController *)self pipController];
    int v13 = 138412290;
    uint64_t v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PiP did cancel: %@", (uint8_t *)&v13, 0xCu);
  }
  id v7 = [(PHInCallRemoteAlertShellViewController *)self pipController];
  if ([v7 pipState])
  {

    goto LABEL_5;
  }
  uint64_t v10 = [(PHInCallRemoteAlertShellViewController *)self pipFinishedTransitionBlock];

  if (!v10)
  {
LABEL_5:
    id v8 = [(PHInCallRemoteAlertShellViewController *)self pipFinishedCancellationBlock];

    if (v8)
    {
      unsigned int v9 = [(PHInCallRemoteAlertShellViewController *)self pipFinishedCancellationBlock];
      v9[2]();

      [(PHInCallRemoteAlertShellViewController *)self setPipFinishedCancellationBlock:0];
    }
    return;
  }
  uint64_t v11 = sub_1000D5250();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v13) = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "PIP state did change and we have a pending transition block - we'll run that block now", (uint8_t *)&v13, 2u);
  }
  uint64_t v12 = [(PHInCallRemoteAlertShellViewController *)self pipFinishedTransitionBlock];
  v12[2]();

  [(PHInCallRemoteAlertShellViewController *)self setPipFinishedTransitionBlock:0];
}

- (void)pipControllerDidRequestReturnToFullScreenNotification:(id)a3
{
  id v4 = a3;
  id v5 = sub_1000D5250();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138543618;
    id v19 = self;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ is handling notification %@", (uint8_t *)&v18, 0x16u);
  }
  unsigned __int8 v6 = [(PHInCallRemoteAlertShellViewController *)self pipController];
  id v7 = [v6 windowForTransitionAnimation];
  id v8 = [(PHInCallRemoteAlertShellViewController *)self view];
  unsigned int v9 = [v8 window];
  unsigned __int8 v10 = [v7 isEqual:v9];

  if (v10)
  {
    [(PHInCallRemoteAlertShellViewController *)self stopPIPAndStealViewController];
  }
  else
  {
    uint64_t v11 = sub_1000D5250();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1001EBDCC((uint64_t)self, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)pipControllerStateDidChange:(id)a3
{
  id v4 = [(PHInCallRemoteAlertShellViewController *)self pipController];
  id v5 = [v4 pipState];

  if (v5 == (id)2)
  {
    [(PHInCallRemoteAlertShellViewController *)self showPIPPlaceholderView];
  }
  else
  {
    unsigned __int8 v6 = [(PHInCallRemoteAlertShellViewController *)self pipController];
    id v7 = [v6 pipState];

    if (v7 == (id)3)
    {
      [(PHInCallRemoteAlertShellViewController *)self removePIPPlaceholderView];
    }
  }
}

- (void)showPIPPlaceholderView
{
  uint64_t v3 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
  if (!v3) {
    goto LABEL_3;
  }
  id v4 = (void *)v3;
  id v5 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
  unsigned __int8 v6 = [v5 superview];

  if (!v6)
  {
LABEL_3:
    id v7 = sub_1000D5250();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting up PIP placeholder view to show in app switcher while calls is PIPped", v16, 2u);
    }
    id v8 = objc_alloc_init((Class)AVPictureInPictureIndicatorView);
    [(PHInCallRemoteAlertShellViewController *)self setPipPlaceholderView:v8];

    unsigned int v9 = +[NSBundle mainBundle];
    unsigned __int8 v10 = [v9 localizedStringForKey:@"PIP_PLACEHOLDER_MESSAGE" value:&stru_1002D6110 table:@"InCallService"];
    uint64_t v11 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
    [v11 setCustomMessage:v10];

    uint64_t v12 = +[UIColor blackColor];
    uint64_t v13 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
    [v13 setBackgroundColor:v12];

    uint64_t v14 = [(PHInCallRemoteAlertShellViewController *)self view];
    uint64_t v15 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
    [v14 addSubview:v15];

    [(PHInCallRemoteAlertShellViewController *)self constrainPIPPlaceholderFullScreen];
  }
}

- (void)constrainPIPPlaceholderFullScreen
{
  uint64_t v3 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v24 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
  id v22 = [v24 topAnchor];
  id v23 = [(PHInCallRemoteAlertShellViewController *)self view];
  id v21 = [v23 topAnchor];
  __int16 v20 = [v22 constraintEqualToAnchor:v21];
  v25[0] = v20;
  id v19 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
  uint64_t v17 = [v19 bottomAnchor];
  int v18 = [(PHInCallRemoteAlertShellViewController *)self view];
  uint64_t v16 = [v18 bottomAnchor];
  uint64_t v15 = [v17 constraintEqualToAnchor:v16];
  v25[1] = v15;
  uint64_t v14 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
  id v4 = [v14 leadingAnchor];
  id v5 = [(PHInCallRemoteAlertShellViewController *)self view];
  unsigned __int8 v6 = [v5 leadingAnchor];
  id v7 = [v4 constraintEqualToAnchor:v6];
  v25[2] = v7;
  id v8 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
  unsigned int v9 = [v8 trailingAnchor];
  unsigned __int8 v10 = [(PHInCallRemoteAlertShellViewController *)self view];
  uint64_t v11 = [v10 trailingAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11];
  v25[3] = v12;
  uint64_t v13 = +[NSArray arrayWithObjects:v25 count:4];
  +[NSLayoutConstraint activateConstraints:v13];
}

- (void)removePIPPlaceholderView
{
  uint64_t v3 = sub_1000D5250();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Removing PIP placeholder view", v5, 2u);
  }
  id v4 = [(PHInCallRemoteAlertShellViewController *)self pipPlaceholderView];
  [v4 removeFromSuperview];

  [(PHInCallRemoteAlertShellViewController *)self setPipPlaceholderView:0];
}

- (void)showKeypadIfPossible
{
  uint64_t v3 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];

  if (v3)
  {
    id v4 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
    [v4 showKeypadIfPossible];
  }
}

- (BOOL)transitionFromBannerToDismissedIfNecessary
{
  uint64_t v3 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];

  if (!v3) {
    return 0;
  }
  id v4 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
  unsigned __int8 v5 = [v4 transitionFromBannerToDismissedIfNecessary];

  return v5;
}

- (BOOL)isShowingHUD
{
  v2 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
  unsigned __int8 v3 = [v2 isShowingHUD];

  return v3;
}

- (BOOL)isMicIndicatorVisible
{
  if ([(PHInCallRemoteAlertShellViewController *)self isShowingHUD]) {
    return 1;
  }
  id v4 = [(PHInCallRemoteAlertShellViewController *)self inCallRootViewController];
  unsigned __int8 v5 = [v4 isShowing6UP];

  return v5;
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (void)setCallDisplayStyleManager:(id)a3
{
}

- (void)setPipController:(id)a3
{
}

- (PHHIDEventMonitor)hidEventMonitor
{
  return self->_hidEventMonitor;
}

- (void)setHidEventMonitor:(id)a3
{
}

- (PHInCallRootViewController)inCallRootViewController
{
  return self->_inCallRootViewController;
}

- (void)setInCallRootViewController:(id)a3
{
}

- (ICSScreenSharingContainerViewControllerProtocol)screenSharingContainerViewController
{
  return self->_screenSharingContainerViewController;
}

- (void)setScreenSharingContainerViewController:(id)a3
{
}

- (UIViewController)screenSharingBroadcasterViewController
{
  return self->_screenSharingBroadcasterViewController;
}

- (void)setScreenSharingBroadcasterViewController:(id)a3
{
}

- (ICSVideoMessageRootViewController)videoMessageRootViewController
{
  return self->_videoMessageRootViewController;
}

- (void)setVideoMessageRootViewController:(id)a3
{
}

- (id)pipFinishedTransitionBlock
{
  return objc_getProperty(self, a2, 72, 1);
}

- (void)setPipFinishedTransitionBlock:(id)a3
{
}

- (id)pipFinishedCancellationBlock
{
  return objc_getProperty(self, a2, 80, 1);
}

- (void)setPipFinishedCancellationBlock:(id)a3
{
}

- (TUFilteredRequest)pendingRestrictedScreenTimeRequest
{
  return self->_pendingRestrictedScreenTimeRequest;
}

- (void)setPendingRestrictedScreenTimeRequest:(id)a3
{
}

- (AVPictureInPictureIndicatorView)pipPlaceholderView
{
  return self->_pipPlaceholderView;
}

- (void)setPipPlaceholderView:(id)a3
{
}

- (BOOL)hasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason
{
  return self->_hasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason;
}

- (void)setHasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason:(BOOL)a3
{
  self->_hasStartedInitialSuppressionOfInCallStatusBarForFullscreenUIReason = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipPlaceholderView, 0);
  objc_storeStrong((id *)&self->_pendingRestrictedScreenTimeRequest, 0);
  objc_storeStrong(&self->_pipFinishedCancellationBlock, 0);
  objc_storeStrong(&self->_pipFinishedTransitionBlock, 0);
  objc_storeStrong((id *)&self->_videoMessageRootViewController, 0);
  objc_storeStrong((id *)&self->_screenSharingBroadcasterViewController, 0);
  objc_storeStrong((id *)&self->_screenSharingContainerViewController, 0);
  objc_storeStrong((id *)&self->_inCallRootViewController, 0);
  objc_storeStrong((id *)&self->_hidEventMonitor, 0);
  objc_storeStrong((id *)&self->_pipController, 0);

  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
}

- (id)makeVideoMessageViewControllerWithURL:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  unsigned int v9 = self;
  id v10 = sub_1001731A8((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

  return v10;
}

@end