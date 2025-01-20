@interface CAMMessagesExtensionViewController
+ (BOOL)_deviceSupportsFunEffects;
+ (id)_userPreferenceOverridesFromCFXCamera:(id)a3 baseUserPreferenceOverrides:(id)a4;
+ (id)_userPreferenceOverridesFromRegularCamera:(id)a3 baseUserPreferenceOverrides:(id)a4;
+ (int64_t)_AVFlashModeForCAMTorchMode:(int64_t)a3;
+ (int64_t)_CAMTorchModeForAVFlashMode:(int64_t)a3;
+ (int64_t)_avDevicePositionFromUserPreferenceOverrides:(id)a3;
+ (int64_t)_avFlashModeFromUserPreferenceOverrides:(id)a3;
+ (int64_t)_cfxAspectRatioCropFromUserPreferenceOverrides:(id)a3;
+ (int64_t)_cfxCaptureModeFromUserPreferenceOverrides:(id)a3;
+ (int64_t)_deviceMemorySize;
+ (void)_removeChildViewController:(id)a3;
+ (void)_startCFXCamera:(id)a3;
+ (void)_startRegularCamera:(id)a3;
+ (void)_stopCFXCamera:(id)a3;
+ (void)_stopRegularCamera:(id)a3;
+ (void)initialize;
+ (void)registerActivityAttribution;
- (BOOL)_canCaptureFromMessagesCaptureState:(int64_t)a3;
- (BOOL)_didReceiveViewWillAppear;
- (BOOL)_isReviewControllerPresented;
- (BOOL)_isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4;
- (BOOL)_shouldDisableCameraForMultitasking;
- (BOOL)_shouldShowFunEffects;
- (BOOL)_transitionIfPossibleToNextCaptureState:(int64_t)a3;
- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6;
- (BOOL)assetExplorerReviewScreenViewController:(id)a3 shouldEnableActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6;
- (CAMCameraViewController)_regularCameraViewController;
- (CAMMessagesExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CAMUserPreferenceOverrides)_userPreferenceOverrides;
- (CFXCameraViewController)_cfxCameraViewController;
- (CGSize)_portraitOrientedSizeForSize:(CGSize)a3;
- (NSString)_logReferenceDescription;
- (PUAssetExplorerReviewScreenViewController)_reviewController;
- (PUReviewAsset)_currentReviewAssset;
- (double)_logReferenceTime;
- (double)_stateChangeReferenceTime;
- (id)_descriptionForState:(int64_t)a3;
- (id)_reviewViewControllerForAsset:(id)a3 source:(unint64_t)a4;
- (id)_stopAndReleaseCFXCameraViewController;
- (id)_stopAndReleaseRegularCameraViewController;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (int64_t)_captureState;
- (int64_t)_nextStateForCaptureTransitionFromState:(int64_t)a3;
- (unint64_t)availableControlsCountForReviewTransition:(id)a3;
- (void)_adoptChildViewController:(id)a3;
- (void)_cfxCameraDidStartCaptureSession;
- (void)_cfxCameraDidStopCaptureSession;
- (void)_createAndEmbedCFXCameraViewControllerIfNecessary;
- (void)_createAndEmbedRegularCameraViewControllerIfNecessary;
- (void)_dismissReviewController;
- (void)_fadeInViewController:(id)a3 overOutgoingViewController:(id)a4;
- (void)_handleHostDidEnterBackgroundNotification:(id)a3;
- (void)_handlePreviewDidStartRunning:(id)a3;
- (void)_preheatCFXCameraFromUserPreferenceOverrides:(id)a3;
- (void)_prepareForPresentationWithCompletionHandler:(id)a3;
- (void)_presentReviewControllerForAsset:(id)a3 source:(unint64_t)a4;
- (void)_regularCameraDidStartCaptureSession;
- (void)_regularCameraDidStopCaptureSession;
- (void)_saveAsset:(id)a3;
- (void)_setCameraViewController:(id)a3;
- (void)_setCaptureState:(int64_t)a3;
- (void)_setCfxCameraViewController:(id)a3;
- (void)_setCurrentReviewAssset:(id)a3;
- (void)_setDidReceiveViewWillAppear:(BOOL)a3;
- (void)_setLogReferenceDescription:(id)a3;
- (void)_setLogReferenceTime:(double)a3;
- (void)_setReviewController:(id)a3;
- (void)_setStateChangeReferenceTime:(double)a3;
- (void)_setUserPreferenceOverrides:(id)a3;
- (void)_startActiveCameraSession;
- (void)_startCFXCamera;
- (void)_startRegularCamera;
- (void)_stopActiveCameraSession;
- (void)_stopCFXCamera;
- (void)_stopRegularCamera;
- (void)_switchCameraViewControllers;
- (void)_transportAsset:(id)a3 forCompletionAction:(unint64_t)a4 sourceType:(unint64_t)a5 suppressLivePhoto:(BOOL)a6 completion:(id)a7;
- (void)_updateLayoutParametersForReviewBarsModel:(id)a3 viewBounds:(CGRect)a4 orientation:(int64_t)a5 forceLayout:(BOOL)a6;
- (void)_volumeButtonPressed:(BOOL)a3;
- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7;
- (void)assetExplorerReviewScreenViewController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3;
- (void)assetExplorerReviewScreenViewControllerDidPressRetake:(id)a3;
- (void)cameraViewController:(id)a3 didCaptureAVAsset:(id)a4 andAudioMix:(id)a5 withProperties:(id)a6 error:(id)a7;
- (void)cameraViewController:(id)a3 didCaptureLivePhoto:(id)a4 withProperties:(id)a5 error:(id)a6;
- (void)cameraViewController:(id)a3 didCaptureMediaItem:(id)a4;
- (void)cameraViewController:(id)a3 didCapturePhoto:(id)a4 withProperties:(id)a5 error:(id)a6;
- (void)cameraViewControllerCreativeCameraButtonWasPressed;
- (void)cameraViewControllerCreativeCameraButtonWasReleased;
- (void)cameraViewControllerDidRequestDismissal;
- (void)cameraViewControllerDidRequestPhotosExtension;
- (void)cameraViewControllerDidResumeCameraSession:(id)a3;
- (void)cameraViewControllerDidStartCaptureSession:(id)a3;
- (void)cameraViewControllerDidStopCaptureSession:(id)a3;
- (void)cameraViewControllerDidSuspendCameraSession:(id)a3;
- (void)cameraViewControllerDoneButtonWasTapped:(id)a3;
- (void)cameraViewControllerEffectsButtonWasTapped:(id)a3;
- (void)cameraViewControllerRequestedDismissal:(id)a3;
- (void)dealloc;
- (void)dismiss;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation CAMMessagesExtensionViewController

+ (void)initialize
{
  CAMSignpostWithIDAndArgs();

  +[CAMCaptureEngine preheatCaptureResources];
}

+ (void)registerActivityAttribution
{
}

+ (int64_t)_deviceMemorySize
{
  if (qword_10001A540 != -1) {
    dispatch_once(&qword_10001A540, &stru_1000145E0);
  }
  return qword_10001A538;
}

+ (BOOL)_deviceSupportsFunEffects
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002C84;
  block[3] = &unk_100014600;
  block[4] = a1;
  if (qword_10001A550 != -1) {
    dispatch_once(&qword_10001A550, block);
  }
  return byte_10001A548;
}

- (CAMMessagesExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  CAMSignpostWithIDAndArgs();
  double Current = CFAbsoluteTimeGetCurrent();
  v16.receiver = self;
  v16.super_class = (Class)CAMMessagesExtensionViewController;
  v9 = [(CAMMessagesExtensionViewController *)&v16 initWithNibName:v7 bundle:v6];

  if (v9)
  {
    [(CAMMessagesExtensionViewController *)v9 _setLogReferenceTime:Current];
    [(CAMMessagesExtensionViewController *)v9 _setLogReferenceDescription:@"init"];
    v10 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CAMMessagesExtensionViewController init", v15, 2u);
    }

    v9->__shouldShowFunEffects = [(id)objc_opt_class() _deviceSupportsFunEffects];
    v11 = +[NSNotificationCenter defaultCenter];
    [v11 addObserver:v9 selector:"_handlePreviewDidStartRunning:" name:AVCaptureVideoPreviewLayerDidStartRunningNotification object:0];

    v12 = +[NSNotificationCenter defaultCenter];
    [v12 addObserver:v9 selector:"_handleHostDidEnterBackgroundNotification:" name:NSExtensionHostDidEnterBackgroundNotification object:0];

    [(id)objc_opt_class() registerActivityAttribution];
    CAMSignpostWithIDAndArgs();
    v13 = v9;
  }

  return v9;
}

- (void)dealloc
{
  v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CAMMessagesExtensionViewController dealloc", buf, 2u);
  }

  v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self];

  id v5 = [(CAMMessagesExtensionViewController *)self _stopAndReleaseRegularCameraViewController];
  id v6 = [(CAMMessagesExtensionViewController *)self _stopAndReleaseCFXCameraViewController];
  v7.receiver = self;
  v7.super_class = (Class)CAMMessagesExtensionViewController;
  [(CAMMessagesExtensionViewController *)&v7 dealloc];
}

- (void)_prepareForPresentationWithCompletionHandler:(id)a3
{
  id v5 = (void (**)(id, uint64_t))a3;
  CAMSignpostWithIDAndArgs();
  double Current = CFAbsoluteTimeGetCurrent();
  objc_super v7 = [(CAMMessagesExtensionViewController *)self _logReferenceDescription];

  if (v7)
  {
    [(CAMMessagesExtensionViewController *)self _logReferenceTime];
    double v9 = v8;
    v10 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    v11 = NSStringFromSelector(a2);
    v12 = [(CAMMessagesExtensionViewController *)self _logReferenceDescription];
    int v13 = 138543874;
    v14 = v11;
    __int16 v15 = 2048;
    double v16 = Current - v9;
    __int16 v17 = 2114;
    v18 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", (uint8_t *)&v13, 0x20u);
  }
  else
  {
    [(CAMMessagesExtensionViewController *)self _setLogReferenceTime:Current];
    [(CAMMessagesExtensionViewController *)self _setLogReferenceDescription:@"_prepareForPresentationWithCompletionHandler"];
    v10 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    v11 = NSStringFromSelector(a2);
    int v13 = 138543362;
    v14 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v13, 0xCu);
  }

LABEL_7:
  if (![(CAMMessagesExtensionViewController *)self _captureState]) {
    [(CAMMessagesExtensionViewController *)self _setCaptureState:1];
  }
  if (v5) {
    v5[2](v5, 1);
  }
  CAMSignpostWithIDAndArgs();
}

- (void)_handlePreviewDidStartRunning:(id)a3
{
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMMessagesExtensionViewController *)self _logReferenceTime];
  double v6 = v5;
  objc_super v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [(CAMMessagesExtensionViewController *)self _logReferenceDescription];
    *(_DWORD *)buf = 134218242;
    double v12 = Current - v6;
    __int16 v13 = 2114;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AVCaptureVideoPreviewLayerDidStartRunningNotification %.3f seconds after %{public}@. Preloading frameworks.", buf, 0x16u);
  }
  if ([(CAMMessagesExtensionViewController *)self _shouldShowFunEffects])
  {
    double v9 = sub_100003330();
    dispatch_async(v9, &stru_100014620);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100003414;
  block[3] = &unk_100014668;
  block[4] = self;
  if (qword_10001A558 != -1) {
    dispatch_once(&qword_10001A558, block);
  }
}

- (void)dismiss
{
  CAMSignpostWithIDAndArgs();
  v3.receiver = self;
  v3.super_class = (Class)CAMMessagesExtensionViewController;
  [(CAMMessagesExtensionViewController *)&v3 dismiss];
  [(CAMMessagesExtensionViewController *)self _setUserPreferenceOverrides:0];
}

- (void)viewDidLoad
{
  CAMSignpostWithIDAndArgs();
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMMessagesExtensionViewController *)self _logReferenceTime];
  double v6 = v5;
  objc_super v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = NSStringFromSelector(a2);
    double v9 = [(CAMMessagesExtensionViewController *)self _logReferenceDescription];
    *(_DWORD *)buf = 138543874;
    v14 = v8;
    __int16 v15 = 2048;
    double v16 = Current - v6;
    __int16 v17 = 2114;
    v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", buf, 0x20u);
  }
  v12.receiver = self;
  v12.super_class = (Class)CAMMessagesExtensionViewController;
  [(CAMMessagesExtensionViewController *)&v12 viewDidLoad];
  [(CAMMessagesExtensionViewController *)self _setCaptureState:1];
  dispatch_time_t v10 = dispatch_time(0, 2000000000);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000037F8;
  v11[3] = &unk_100014690;
  v11[4] = self;
  v11[5] = 0x4000000000000000;
  dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, v11);
  CAMSignpostWithIDAndArgs();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  CAMSignpostWithIDAndArgs();
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMMessagesExtensionViewController *)self _logReferenceTime];
  double v8 = v7;
  double v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v10 = NSStringFromSelector(a2);
    v11 = [(CAMMessagesExtensionViewController *)self _logReferenceDescription];
    *(_DWORD *)buf = 138543874;
    v19 = v10;
    __int16 v20 = 2048;
    double v21 = Current - v8;
    __int16 v22 = 2114;
    v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", buf, 0x20u);
  }
  v17.receiver = self;
  v17.super_class = (Class)CAMMessagesExtensionViewController;
  [(CAMMessagesExtensionViewController *)&v17 viewWillAppear:v3];
  [(CAMMessagesExtensionViewController *)self _setDidReceiveViewWillAppear:1];
  [(CAMMessagesExtensionViewController *)self _setCaptureState:1];
  [(CAMMessagesExtensionViewController *)self _startActiveCameraSession];
  objc_super v12 = [(CAMMessagesExtensionViewController *)self view];
  __int16 v13 = [v12 window];
  v14 = [v13 layer];
  __int16 v15 = [v14 context];
  LODWORD(v16) = 1065361605;
  [v15 setDesiredDynamicRange:v16];

  CAMSignpostWithIDAndArgs();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  CAMSignpostWithIDAndArgs();
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMMessagesExtensionViewController *)self _logReferenceTime];
  double v8 = v7;
  double v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v10 = NSStringFromSelector(a2);
    v11 = [(CAMMessagesExtensionViewController *)self _logReferenceDescription];
    *(_DWORD *)buf = 138543874;
    v14 = v10;
    __int16 v15 = 2048;
    double v16 = Current - v8;
    __int16 v17 = 2114;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", buf, 0x20u);
  }
  v12.receiver = self;
  v12.super_class = (Class)CAMMessagesExtensionViewController;
  [(CAMMessagesExtensionViewController *)&v12 viewDidAppear:v3];
  CAMSignpostWithIDAndArgs();
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  CAMSignpostWithIDAndArgs();
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMMessagesExtensionViewController *)self _logReferenceTime];
  double v8 = v7;
  double v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v10 = NSStringFromSelector(a2);
    v11 = [(CAMMessagesExtensionViewController *)self _logReferenceDescription];
    *(_DWORD *)buf = 138543874;
    v14 = v10;
    __int16 v15 = 2048;
    double v16 = Current - v8;
    __int16 v17 = 2114;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", buf, 0x20u);
  }
  v12.receiver = self;
  v12.super_class = (Class)CAMMessagesExtensionViewController;
  [(CAMMessagesExtensionViewController *)&v12 viewWillDisappear:v3];
  [(CAMMessagesExtensionViewController *)self _stopActiveCameraSession];
  CAMSignpostWithIDAndArgs();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  CAMSignpostWithIDAndArgs();
  double Current = CFAbsoluteTimeGetCurrent();
  [(CAMMessagesExtensionViewController *)self _logReferenceTime];
  double v8 = v7;
  double v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v10 = NSStringFromSelector(a2);
    v11 = [(CAMMessagesExtensionViewController *)self _logReferenceDescription];
    *(_DWORD *)buf = 138543874;
    v14 = v10;
    __int16 v15 = 2048;
    double v16 = Current - v8;
    __int16 v17 = 2114;
    v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ %.3f seconds after %{public}@", buf, 0x20u);
  }
  v12.receiver = self;
  v12.super_class = (Class)CAMMessagesExtensionViewController;
  [(CAMMessagesExtensionViewController *)&v12 viewDidDisappear:v3];
  [(CAMMessagesExtensionViewController *)self _dismissReviewController];
  [(CAMMessagesExtensionViewController *)self _setCaptureState:0];
  [(CAMMessagesExtensionViewController *)self _setLogReferenceDescription:0];
  [(CAMMessagesExtensionViewController *)self _setLogReferenceTime:0.0];
  CAMSignpostWithIDAndArgs();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)CAMMessagesExtensionViewController;
  -[CAMMessagesExtensionViewController viewWillTransitionToSize:withTransitionCoordinator:](&v18, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  double v8 = [(CAMMessagesExtensionViewController *)self _reviewController];
  double v9 = [v8 reviewBarsModel];
  dispatch_time_t v10 = [v8 view];
  v11 = [v10 window];

  if (v11)
  {
    id v12 = [v11 _toWindowOrientation];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000040E8;
    v13[3] = &unk_1000146B8;
    double v15 = width;
    double v16 = height;
    v13[4] = self;
    id v14 = v9;
    id v17 = v12;
    [v7 animateAlongsideTransition:v13 completion:0];
  }
}

- (void)viewWillLayoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)CAMMessagesExtensionViewController;
  [(CAMMessagesExtensionViewController *)&v2 viewWillLayoutSubviews];
}

- (void)_adoptChildViewController:(id)a3
{
  if (a3)
  {
    id v20 = a3;
    v4 = [v20 view];
    double v5 = [(CAMMessagesExtensionViewController *)self view];
    [(CAMMessagesExtensionViewController *)self addChildViewController:v20];
    [v5 addSubview:v4];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [v4 leftAnchor];
    objc_super v18 = [v5 leftAnchor];
    id v17 = [v19 constraintEqualToAnchor:v18];
    v21[0] = v17;
    double v16 = [v4 rightAnchor];
    double v15 = [v5 rightAnchor];
    double v6 = [v16 constraintEqualToAnchor:v15];
    v21[1] = v6;
    id v7 = [v4 topAnchor];
    double v8 = [v5 topAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8];
    v21[2] = v9;
    [v4 bottomAnchor];
    dispatch_time_t v10 = v14 = self;
    v11 = [v5 bottomAnchor];
    id v12 = [v10 constraintEqualToAnchor:v11];
    v21[3] = v12;
    __int16 v13 = +[NSArray arrayWithObjects:v21 count:4];
    +[NSLayoutConstraint activateConstraints:v13];

    [v20 didMoveToParentViewController:v14];
  }
}

+ (void)_removeChildViewController:(id)a3
{
  id v4 = a3;
  [v4 willMoveToParentViewController:0];
  BOOL v3 = [v4 view];
  [v3 removeFromSuperview];

  [v4 removeFromParentViewController];
}

- (void)_createAndEmbedRegularCameraViewControllerIfNecessary
{
  if (!self->__regularCameraViewController)
  {
    CAMSignpostWithIDAndArgs();
    BOOL v3 = [(CAMMessagesExtensionViewController *)self view];
    uint64_t v4 = CAMLayoutStyleForView();

    id v8 = [(CAMMessagesExtensionViewController *)self _userPreferenceOverrides];
    if ([(CAMMessagesExtensionViewController *)self _shouldShowFunEffects]) {
      uint64_t v5 = 5;
    }
    else {
      uint64_t v5 = 1;
    }
    double v6 = (CAMCameraViewController *)[objc_alloc((Class)CAMCameraViewController) initWithOverrides:v8 initialLayoutStyle:v4 privateOptions:v5];
    regularCameraViewController = self->__regularCameraViewController;
    self->__regularCameraViewController = v6;

    [(CAMCameraViewController *)self->__regularCameraViewController setUberDelegate:self];
    [(CAMCameraViewController *)self->__regularCameraViewController setAutomaticallyManagesCameraSession:0];
    [(CAMCameraViewController *)self->__regularCameraViewController setPersistenceBehavior:1];
    [(CAMCameraViewController *)self->__regularCameraViewController setDisablingAdditionalCaptures:1];
    [(CAMCameraViewController *)self->__regularCameraViewController setDisablingMultipleCaptureFeatures:1];
    [(CAMMessagesExtensionViewController *)self _adoptChildViewController:self->__regularCameraViewController];
    CAMSignpostWithIDAndArgs();
  }
}

- (void)_createAndEmbedCFXCameraViewControllerIfNecessary
{
  if (!self->__cfxCameraViewController)
  {
    CAMSignpostWithIDAndArgs();
    id v9 = [(CAMMessagesExtensionViewController *)self _userPreferenceOverrides];
    id v3 = [(id)objc_opt_class() _cfxCaptureModeFromUserPreferenceOverrides:v9];
    id v4 = [(id)objc_opt_class() _avDevicePositionFromUserPreferenceOverrides:v9];
    id v5 = [(id)objc_opt_class() _avFlashModeFromUserPreferenceOverrides:v9];
    id v6 = [(id)objc_opt_class() _cfxAspectRatioCropFromUserPreferenceOverrides:v9];
    id v7 = (CFXCameraViewController *)[objc_alloc((Class)sub_1000046AC()) initWithCaptureMode:v3 devicePosition:v4 flashMode:v5 aspectRatioCrop:v6];
    cfxCameraViewController = self->__cfxCameraViewController;
    self->__cfxCameraViewController = v7;

    [(CFXCameraViewController *)self->__cfxCameraViewController setDelegate:self];
    [(CAMMessagesExtensionViewController *)self _adoptChildViewController:self->__cfxCameraViewController];
    CAMSignpostWithIDAndArgs();
  }
}

+ (int64_t)_cfxCaptureModeFromUserPreferenceOverrides:(id)a3
{
  id v3 = [a3 captureMode];
  id v4 = v3;
  if (v3) {
    int64_t v5 = 2 * ([v3 integerValue] == (id)1);
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

+ (int64_t)_cfxAspectRatioCropFromUserPreferenceOverrides:(id)a3
{
  id v3 = [a3 aspectRatioCrop];
  id v4 = v3;
  if (v3)
  {
    id v5 = [v3 integerValue];
    if (v5 == (id)2) {
      int64_t v6 = 1;
    }
    else {
      int64_t v6 = 2 * (v5 == (id)1);
    }
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

+ (int64_t)_avDevicePositionFromUserPreferenceOverrides:(id)a3
{
  id v3 = [a3 captureDevice];
  id v4 = v3;
  if (v3)
  {
    id v5 = (char *)[v3 integerValue];
    if ((unint64_t)(v5 - 1) > 0xA) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_100012ED8[(void)(v5 - 1)];
    }
    int64_t v7 = (int64_t)+[CAMCaptureConversions AVDevicePositionForCAMDevicePosition:v6];
  }
  else
  {
    int64_t v7 = 1;
  }

  return v7;
}

+ (int64_t)_avFlashModeFromUserPreferenceOverrides:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _cfxCaptureModeFromUserPreferenceOverrides:v4];
  if ((unint64_t)v5 >= 2)
  {
    if (v5 == (id)2)
    {
      id v9 = [v4 torchMode];
      int64_t v7 = v9;
      if (v9)
      {
        id v8 = objc_msgSend((id)objc_opt_class(), "_AVFlashModeForCAMTorchMode:", objc_msgSend(v9, "integerValue"));
        goto LABEL_8;
      }
LABEL_9:
      int64_t v10 = 2;
      goto LABEL_10;
    }
    if (v5 != (id)3)
    {
      int64_t v10 = 2;
      goto LABEL_11;
    }
  }
  uint64_t v6 = [v4 flashMode];
  int64_t v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  id v8 = +[CAMCaptureConversions captureFlashModeForFlashMode:](CAMCaptureConversions, "captureFlashModeForFlashMode:", [v6 integerValue]);
LABEL_8:
  int64_t v10 = (int64_t)v8;
LABEL_10:

LABEL_11:
  return v10;
}

- (void)_preheatCFXCameraFromUserPreferenceOverrides:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _cfxCaptureModeFromUserPreferenceOverrides:v4];
  id v6 = [(id)objc_opt_class() _avDevicePositionFromUserPreferenceOverrides:v4];
  id v7 = [(id)objc_opt_class() _cfxAspectRatioCropFromUserPreferenceOverrides:v4];

  id v8 = sub_1000046AC();
  id v10 = [(CAMMessagesExtensionViewController *)self view];
  id v9 = [v10 window];
  [v8 preheatWithWindow:v9 captureMode:v5 devicePosition:v6 aspectRatioCrop:v7];
}

- (id)_stopAndReleaseRegularCameraViewController
{
  id v3 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
  if (v3)
  {
    [(CAMCameraViewController *)self->__regularCameraViewController setUberDelegate:0];
    regularCameraViewController = self->__regularCameraViewController;
    self->__regularCameraViewController = 0;

    [(id)objc_opt_class() _stopRegularCamera:v3];
    id v5 = v3;
  }

  return v3;
}

- (id)_stopAndReleaseCFXCameraViewController
{
  id v3 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];
  if (v3)
  {
    [(CFXCameraViewController *)self->__cfxCameraViewController setDelegate:0];
    cfxCameraViewController = self->__cfxCameraViewController;
    self->__cfxCameraViewController = 0;

    [(id)objc_opt_class() _stopCFXCamera:v3];
    id v5 = v3;
  }

  return v3;
}

+ (id)_userPreferenceOverridesFromRegularCamera:(id)a3 baseUserPreferenceOverrides:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)CAMUserPreferenceOverrides) initWithOverrides:v6];

  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 captureMode]);
  [v7 setCaptureMode:v8];

  id v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 captureDevice]);
  [v7 setCaptureDevice:v9];

  id v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 flashMode]);
  [v7 setFlashMode:v10];

  v11 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 torchMode]);
  [v7 setTorchMode:v11];

  if (![v5 captureMode])
  {
    id v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 photoModeAspectRatioCrop]);
    [v7 setAspectRatioCrop:v12];
  }

  return v7;
}

+ (id)_userPreferenceOverridesFromCFXCamera:(id)a3 baseUserPreferenceOverrides:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)CAMUserPreferenceOverrides) initWithOverrides:v6];

  id v8 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[CAMCaptureConversions CAMDevicePositionForAVDevicePosition:](CAMCaptureConversions, "CAMDevicePositionForAVDevicePosition:", [v5 devicePosition]) == (id)1);
  [v7 setCaptureDevice:v8];

  id v9 = [v5 captureMode];
  if ((unint64_t)v9 >= 2)
  {
    if (v9 == (id)2)
    {
      [v7 setCaptureMode:&off_100014C20];
      __int16 v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend((id)objc_opt_class(), "_CAMTorchModeForAVFlashMode:", objc_msgSend(v5, "flashMode")));
      [v7 setTorchMode:v13];

      goto LABEL_12;
    }
    if (v9 != (id)3) {
      goto LABEL_12;
    }
  }
  [v7 setCaptureMode:&off_100014C08];
  id v10 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[CAMCaptureConversions flashModeForCaptureFlashMode:](CAMCaptureConversions, "flashModeForCaptureFlashMode:", [v5 flashMode]));
  [v7 setFlashMode:v10];

  id v11 = [v5 aspectRatioCrop];
  if (v11 == (id)2)
  {
    id v12 = &off_100014C20;
  }
  else if (v11 == (id)1)
  {
    id v12 = &off_100014C38;
  }
  else
  {
    if (v11) {
      goto LABEL_12;
    }
    id v12 = &off_100014C08;
  }
  [v7 setAspectRatioCrop:v12];
LABEL_12:

  return v7;
}

- (void)_stopActiveCameraSession
{
  [(CAMMessagesExtensionViewController *)self _stopRegularCamera];

  [(CAMMessagesExtensionViewController *)self _stopCFXCamera];
}

- (void)_startActiveCameraSession
{
  int64_t v3 = [(CAMMessagesExtensionViewController *)self _captureState];
  if ((unint64_t)(v3 - 3) < 2)
  {
    [(CAMMessagesExtensionViewController *)self _startCFXCamera];
  }
  else if (v3 == 6 || v3 == 1)
  {
    [(CAMMessagesExtensionViewController *)self _startRegularCamera];
  }
}

- (void)_startRegularCamera
{
  unint64_t v3 = [(CAMMessagesExtensionViewController *)self _captureState];
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x3D) != 0)
    {
      id v4 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [(CAMMessagesExtensionViewController *)self _descriptionForState:[(CAMMessagesExtensionViewController *)self _captureState]];
        *(_DWORD *)buf = 138543362;
        id v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Should not be trying to start regular camera from %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v6 = objc_opt_class();
      id v7 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
      objc_msgSend(v6, "_startRegularCamera:");
    }
  }
}

- (void)_startCFXCamera
{
  unint64_t v3 = [(CAMMessagesExtensionViewController *)self _captureState];
  if (v3 <= 6)
  {
    if (((1 << v3) & 0x67) != 0)
    {
      id v4 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        id v5 = [(CAMMessagesExtensionViewController *)self _descriptionForState:[(CAMMessagesExtensionViewController *)self _captureState]];
        *(_DWORD *)buf = 138543362;
        id v9 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Should not be trying to start CFX camera from %{public}@", buf, 0xCu);
      }
    }
    else
    {
      id v6 = objc_opt_class();
      id v7 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];
      objc_msgSend(v6, "_startCFXCamera:");
    }
  }
}

- (void)_stopRegularCamera
{
  unint64_t v3 = objc_opt_class();
  id v4 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
  [v3 _stopRegularCamera:v4];
}

- (void)_stopCFXCamera
{
  unint64_t v3 = objc_opt_class();
  id v4 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];
  [v3 _stopCFXCamera:v4];
}

+ (void)_startRegularCamera:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    CAMSignpostWithIDAndArgs();
    [v3 resumeCameraSession];
  }
  else
  {
    id v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trying to start RegularCamera but no view controller found", v5, 2u);
    }
  }
}

+ (void)_stopRegularCamera:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    CAMSignpostWithIDAndArgs();
    [v3 suspendCameraSession];
  }
}

+ (void)_startCFXCamera:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    CAMSignpostWithIDAndArgs();
    [v3 startCaptureSession];
  }
  else
  {
    id v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Trying to start CFXCamera but no view controller found", v5, 2u);
    }
  }
}

+ (void)_stopCFXCamera:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    CAMSignpostWithIDAndArgs();
    [v3 stopCaptureSession];
  }
}

- (void)_fadeInViewController:(id)a3 overOutgoingViewController:(id)a4
{
  id v5 = a4;
  id v6 = [a3 view];
  id v7 = v6;
  if (v5) {
    double v8 = 0.3;
  }
  else {
    double v8 = 0.0;
  }
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005648;
  v13[3] = &unk_100014668;
  id v14 = v6;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100005654;
  v11[3] = &unk_1000146E0;
  id v12 = v5;
  id v9 = v5;
  id v10 = v7;
  +[CAMView animateIfNeededWithDuration:2 options:v13 animations:v11 completion:v8];
}

- (void)_setCaptureState:(int64_t)a3
{
  int64_t captureState = self->__captureState;
  if (captureState != a3)
  {
    if ([(CAMMessagesExtensionViewController *)self _isValidStateTransitionFrom:self->__captureState to:a3])
    {
      CAMSignpostWithIDAndArgs();
      [(CAMMessagesExtensionViewController *)self _stateChangeReferenceTime];
      double v7 = v6;
      [(CAMMessagesExtensionViewController *)self _setStateChangeReferenceTime:CFAbsoluteTimeGetCurrent()];
      if (v7 == 0.0)
      {
        double v9 = 0.0;
      }
      else
      {
        [(CAMMessagesExtensionViewController *)self _stateChangeReferenceTime];
        double v9 = v8 - v7;
      }
      id v11 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(CAMMessagesExtensionViewController *)self _descriptionForState:self->__captureState];
        __int16 v13 = [(CAMMessagesExtensionViewController *)self _descriptionForState:a3];
        int v32 = 138543874;
        v33 = v12;
        __int16 v34 = 2114;
        v35 = v13;
        __int16 v36 = 2048;
        double v37 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Changing state from %{public}@ to %{public}@ (took %.3f seconds)", (uint8_t *)&v32, 0x20u);
      }
      self->__int64_t captureState = a3;
      switch(a3)
      {
        case 0:
          id v14 = [(CAMMessagesExtensionViewController *)self _stopAndReleaseRegularCameraViewController];
          double v15 = [(CAMMessagesExtensionViewController *)self _stopAndReleaseCFXCameraViewController];
          [(id)objc_opt_class() _removeChildViewController:v14];
          [(id)objc_opt_class() _removeChildViewController:v15];
          goto LABEL_18;
        case 1:
          id v14 = [(CAMMessagesExtensionViewController *)self _stopAndReleaseCFXCameraViewController];
          [(CAMMessagesExtensionViewController *)self _createAndEmbedRegularCameraViewControllerIfNecessary];
          [(CAMMessagesExtensionViewController *)self _startRegularCamera];
          uint64_t v23 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
          goto LABEL_17;
        case 2:
          [(CAMMessagesExtensionViewController *)self _stopRegularCamera];
          double v16 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
          [v16 setMessagesTransitionState:1 animated:1];
          goto LABEL_20;
        case 3:
          id v17 = objc_opt_class();
          objc_super v18 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
          v19 = [(CAMMessagesExtensionViewController *)self _userPreferenceOverrides];
          id v20 = [v17 _userPreferenceOverridesFromRegularCamera:v18 baseUserPreferenceOverrides:v19];
          [(CAMMessagesExtensionViewController *)self _setUserPreferenceOverrides:v20];

          [(CAMMessagesExtensionViewController *)self _createAndEmbedCFXCameraViewControllerIfNecessary];
          double v21 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];
          __int16 v22 = [v21 view];
          [v22 setAlpha:0.0];

          [(CAMMessagesExtensionViewController *)self _startCFXCamera];
          return;
        case 4:
          id v14 = [(CAMMessagesExtensionViewController *)self _stopAndReleaseRegularCameraViewController];
          [(CAMMessagesExtensionViewController *)self _createAndEmbedCFXCameraViewControllerIfNecessary];
          [(CAMMessagesExtensionViewController *)self _startCFXCamera];
          uint64_t v23 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];
LABEL_17:
          double v15 = (void *)v23;
          [(CAMMessagesExtensionViewController *)self _fadeInViewController:v23 overOutgoingViewController:v14];
LABEL_18:

          break;
        case 5:
          [(CAMMessagesExtensionViewController *)self _stopCFXCamera];
          double v16 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];
          [v16 setTransitionState:2 animated:1];
LABEL_20:

          break;
        case 6:
          v24 = objc_opt_class();
          v25 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];
          v26 = [(CAMMessagesExtensionViewController *)self _userPreferenceOverrides];
          v27 = [v24 _userPreferenceOverridesFromCFXCamera:v25 baseUserPreferenceOverrides:v26];
          [(CAMMessagesExtensionViewController *)self _setUserPreferenceOverrides:v27];

          [(CAMMessagesExtensionViewController *)self _createAndEmbedRegularCameraViewControllerIfNecessary];
          v28 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
          v29 = [v28 view];
          [v29 setAlpha:0.0];

          [(CAMMessagesExtensionViewController *)self _startRegularCamera];
          break;
        default:
          return;
      }
    }
    else
    {
      id v10 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v30 = [(CAMMessagesExtensionViewController *)self _descriptionForState:captureState];
        v31 = [(CAMMessagesExtensionViewController *)self _descriptionForState:a3];
        int v32 = 138543618;
        v33 = v30;
        __int16 v34 = 2114;
        v35 = v31;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Ignoring invalid transition from %{public}@ to %{public}@", (uint8_t *)&v32, 0x16u);
      }
    }
  }
}

- (BOOL)_isValidStateTransitionFrom:(int64_t)a3 to:(int64_t)a4
{
  int64_t v5 = [(CAMMessagesExtensionViewController *)self _nextStateForCaptureTransitionFromState:a3];
  return !a4 || v5 == a4;
}

- (int64_t)_nextStateForCaptureTransitionFromState:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return qword_100012F30[a3];
  }
}

- (BOOL)_transitionIfPossibleToNextCaptureState:(int64_t)a3
{
  int64_t v5 = [(CAMMessagesExtensionViewController *)self _captureState];
  BOOL v6 = [(CAMMessagesExtensionViewController *)self _isValidStateTransitionFrom:v5 to:a3];
  if (v6)
  {
    if ([(CAMMessagesExtensionViewController *)self _isReviewControllerPresented])
    {
      double v7 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        double v8 = [(CAMMessagesExtensionViewController *)self _descriptionForState:v5];
        double v9 = [(CAMMessagesExtensionViewController *)self _descriptionForState:a3];
        int v11 = 138543618;
        id v12 = v8;
        __int16 v13 = 2114;
        id v14 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Ignoring capture state transition from %{public}@ to %{public}@ because review controller is presented", (uint8_t *)&v11, 0x16u);
      }
      LOBYTE(v6) = 0;
    }
    else
    {
      [(CAMMessagesExtensionViewController *)self _setCaptureState:a3];
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (id)_descriptionForState:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return off_100014838[a3];
  }
}

- (void)_volumeButtonPressed:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMMessagesExtensionViewController *)self _reviewController];

  if (v5)
  {
    if (!v3) {
      return;
    }
    BOOL v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ignoring volume button press because review view controller is presented", (uint8_t *)&v14, 2u);
    }
    goto LABEL_19;
  }
  int64_t v7 = [(CAMMessagesExtensionViewController *)self _captureState];
  if ([(CAMMessagesExtensionViewController *)self _canCaptureFromMessagesCaptureState:v7])
  {
    double v8 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
    BOOL v6 = v8;
    if (v8)
    {
      if (v3) {
        [v8 handleVolumeButtonPressed];
      }
      else {
        [v8 handleVolumeButtonReleased];
      }
    }
    __int16 v13 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];

    if (!v13 || !v3) {
      goto LABEL_19;
    }
    double v9 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_18;
    }
    LOWORD(v14) = 0;
    id v10 = "Ignoring volume button press for CFXCamera since no capture API available";
    int v11 = v9;
    uint32_t v12 = 2;
LABEL_17:
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v14, v12);
LABEL_18:

    goto LABEL_19;
  }
  if (!v3) {
    return;
  }
  BOOL v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    double v9 = [(CAMMessagesExtensionViewController *)self _descriptionForState:v7];
    int v14 = 138543362;
    double v15 = v9;
    id v10 = "Ignoring volume button press during state %{public}@";
    int v11 = v6;
    uint32_t v12 = 12;
    goto LABEL_17;
  }
LABEL_19:
}

- (BOOL)_canCaptureFromMessagesCaptureState:(int64_t)a3
{
  return a3 == 1 || a3 == 4;
}

- (BOOL)_isReviewControllerPresented
{
  objc_super v2 = [(CAMMessagesExtensionViewController *)self _reviewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)_presentReviewControllerForAsset:(id)a3 source:(unint64_t)a4
{
  id v6 = a3;
  CAMSignpostWithIDAndArgs();
  id v8 = objc_alloc_init((Class)CAMAnalyticsMessagesCaptureEvent);
  [v8 populateFromReviewAsset:v6 withSourceType:a4];
  [v8 publish];
  [(CAMMessagesExtensionViewController *)self _stopActiveCameraSession];
  int64_t v7 = [(CAMMessagesExtensionViewController *)self _reviewViewControllerForAsset:v6 source:a4];
  [v7 setTransitioningDelegate:self];
  [v7 setModalPresentationStyle:0];
  [(CAMMessagesExtensionViewController *)self _setCurrentReviewAssset:v6];

  [(CAMMessagesExtensionViewController *)self _setReviewController:v7];
  [(CAMMessagesExtensionViewController *)self presentViewController:v7 animated:1 completion:&stru_100014700];
  CAMSignpostWithIDAndArgs();
}

- (void)_dismissReviewController
{
  CAMSignpostWithIDAndArgs();
  [(CAMMessagesExtensionViewController *)self dismissViewControllerAnimated:1 completion:0];
  [(CAMMessagesExtensionViewController *)self _setCurrentReviewAssset:0];
  [(CAMMessagesExtensionViewController *)self _setReviewController:0];

  CAMSignpostWithIDAndArgs();
}

- (void)_updateLayoutParametersForReviewBarsModel:(id)a3 viewBounds:(CGRect)a4 orientation:(int64_t)a5 forceLayout:(BOOL)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v13 = a3;
  int v14 = [(CAMMessagesExtensionViewController *)self view];
  uint64_t v15 = CAMLayoutStyleForView();

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000062E0;
  v16[3] = &unk_100014748;
  *(CGFloat *)&v16[5] = x;
  *(CGFloat *)&v16[6] = y;
  *(CGFloat *)&v16[7] = width;
  *(CGFloat *)&v16[8] = height;
  v16[4] = self;
  v16[9] = v15;
  v16[10] = a5;
  BOOL v17 = a6;
  [v13 performChanges:v16];
}

- (id)_reviewViewControllerForAsset:(id)a3 source:(unint64_t)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init((Class)PUReviewDataSource);
  [v6 insertAsset:v5];
  id v19 = [objc_alloc((Class)PUReviewAssetsDataSourceManager) initWithReviewDataSource:v6];
  id v7 = objc_alloc_init((Class)PUReviewScreenBarsModel);
  id v8 = [(CAMMessagesExtensionViewController *)self view];
  double v9 = [v8 window];

  id v10 = [v9 _windowInterfaceOrientation];
  int v11 = [(CAMMessagesExtensionViewController *)self view];
  [v11 bounds];
  -[CAMMessagesExtensionViewController _updateLayoutParametersForReviewBarsModel:viewBounds:orientation:forceLayout:](self, "_updateLayoutParametersForReviewBarsModel:viewBounds:orientation:forceLayout:", v7, v10, 0);

  id v12 = objc_alloc((Class)PUAssetExplorerReviewScreenViewController);
  id v13 = objc_alloc_init((Class)PUReviewAssetsMediaProvider);
  int v14 = +[NSIndexPath indexPathForRow:0 inSection:0];
  uint64_t v15 = [v5 identifier];

  double v16 = +[NSSet setWithObject:v15];
  id v17 = [v12 initWithDataSourceManager:v19 mediaProvider:v13 reviewAssetProvider:0 initialIndexPath:v14 initialSelectedAssetUUIDs:v16 initialDisabledLivePhotoAssetUUIDs:0 sourceType:a4 reviewBarsModel:v7 options:1];

  [v17 setDelegate:self];

  return v17;
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 canPerformActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  BOOL v13 = 0;
  if (a4 <= 8)
  {
    if (((1 << a4) & 0x157) != 0)
    {
      BOOL v13 = 1;
    }
    else if (a4 == 5)
    {
      BOOL v13 = [v11 mediaType] == (id)1;
    }
    else if (a4 == 7)
    {
      unsigned int v15 = [v11 mediaSubtypes];
      double v16 = [v10 view];
      char v17 = CEKIsViewInMultitask();

      unsigned int v18 = [(CAMMessagesExtensionViewController *)self _shouldShowFunEffects];
      char v19 = v17 ^ 1;
      if (v15) {
        char v19 = 0;
      }
      if ((*(void *)&v15 & 0x20000) != 0) {
        BOOL v20 = 0;
      }
      else {
        BOOL v20 = v19;
      }
      if (v18) {
        BOOL v13 = v20;
      }
      else {
        BOOL v13 = 0;
      }
    }
  }

  return v13;
}

- (BOOL)assetExplorerReviewScreenViewController:(id)a3 shouldEnableActionType:(unint64_t)a4 onAsset:(id)a5 inAssetCollection:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  LOBYTE(v12) = 0;
  if (a4 <= 8)
  {
    if (((1 << a4) & 0x172) == 0)
    {
      if (((1 << a4) & 5) != 0)
      {
        LOBYTE(v12) = 1;
        goto LABEL_6;
      }
      if (a4 != 7) {
        goto LABEL_6;
      }
    }
    unsigned int v12 = [v10 isTemporaryPlaceholder] ^ 1;
  }
LABEL_6:

  return v12;
}

- (void)assetExplorerReviewScreenViewController:(id)a3 didPerformCompletionAction:(unint64_t)a4 withSelectedAssetUUIDs:(id)a5 livePhotoDisabledAssetUUIDs:(id)a6 substituteAssetsByUUID:(id)a7
{
  id v11 = a3;
  id v12 = a6;
  BOOL v13 = [a7 allValues];
  uint64_t v14 = [v13 firstObject];
  if (v14)
  {
    unsigned int v15 = (void *)v14;

LABEL_4:
    double v16 = [v15 identifier];
    id v17 = [v12 containsObject:v16];

    unsigned int v18 = [(CAMMessagesExtensionViewController *)self view];
    char v19 = [v18 window];

    [v19 setUserInteractionEnabled:0];
    [(CAMMessagesExtensionViewController *)self _saveAsset:v15];
    id v20 = [v11 sourceType];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100006950;
    v23[3] = &unk_100014770;
    id v24 = v19;
    v25 = self;
    id v21 = v19;
    [(CAMMessagesExtensionViewController *)self _transportAsset:v15 forCompletionAction:a4 sourceType:v20 suppressLivePhoto:v17 completion:v23];

    goto LABEL_5;
  }
  unsigned int v15 = [(CAMMessagesExtensionViewController *)self _currentReviewAssset];

  if (v15) {
    goto LABEL_4;
  }
  __int16 v22 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_10000AB74();
  }

  [(CAMMessagesExtensionViewController *)self dismiss];
LABEL_5:
}

- (void)assetExplorerReviewScreenViewControllerDidPressCancel:(id)a3
{
  id v4 = [(CAMMessagesExtensionViewController *)self _currentReviewAssset];
  id v5 = +[NSProcessInfo processInfo];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006AF8;
  v9[3] = &unk_1000146E0;
  id v10 = v4;
  id v6 = v4;
  [v5 performExpiringActivityWithReason:@"Marking files purgeable" usingBlock:v9];

  id v7 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Dismissing from assetExplorerReviewScreenViewControllerDidPressCancel", v8, 2u);
  }

  [(CAMMessagesExtensionViewController *)self dismiss];
}

- (void)assetExplorerReviewScreenViewControllerDidPressRetake:(id)a3
{
  id v4 = [(CAMMessagesExtensionViewController *)self _currentReviewAssset];
  id v5 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100006C44;
  block[3] = &unk_100014668;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  [(CAMMessagesExtensionViewController *)self _dismissReviewController];
  [(CAMMessagesExtensionViewController *)self _startActiveCameraSession];
}

- (void)assetExplorerReviewScreenViewController:(id)a3 willTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
}

- (void)_transportAsset:(id)a3 forCompletionAction:(unint64_t)a4 sourceType:(unint64_t)a5 suppressLivePhoto:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = 5;
  if (a5 == 4) {
    uint64_t v14 = 2;
  }
  if (a5 == 2) {
    uint64_t v15 = 1;
  }
  else {
    uint64_t v15 = v14;
  }
  double v16 = [(CAMMessagesExtensionViewController *)self activeConversation];
  if (v16)
  {
    id v17 = [CAMAssetTransportController alloc];
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    unsigned int v18 = (void *)qword_10001A598;
    uint64_t v41 = qword_10001A598;
    if (!qword_10001A598)
    {
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      v35 = sub_100008918;
      __int16 v36 = &unk_1000147F8;
      double v37 = &v38;
      sub_100008918((uint64_t)&v33);
      unsigned int v18 = (void *)v39[3];
    }
    id v19 = v18;
    _Block_object_dispose(&v38, 8);
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2050000000;
    id v20 = (void *)qword_10001A5A0;
    uint64_t v41 = qword_10001A5A0;
    if (!qword_10001A5A0)
    {
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      v35 = sub_100008AD0;
      __int16 v36 = &unk_1000147F8;
      double v37 = &v38;
      sub_100008AD0((uint64_t)&v33);
      id v20 = (void *)v39[3];
    }
    uint64_t v31 = v15;
    id v32 = v13;
    id v21 = v12;
    BOOL v22 = v8;
    id v23 = v20;
    _Block_object_dispose(&v38, 8);
    uint64_t v38 = 0;
    v39 = &v38;
    uint64_t v40 = 0x2020000000;
    id v24 = (void *)qword_10001A5A8;
    uint64_t v41 = qword_10001A5A8;
    if (!qword_10001A5A8)
    {
      v33 = _NSConcreteStackBlock;
      uint64_t v34 = 3221225472;
      v35 = sub_100008B28;
      __int16 v36 = &unk_1000147F8;
      double v37 = &v38;
      v25 = (void *)sub_100008970();
      v26 = dlsym(v25, "kUTTypeAssetPreviewImage");
      *(void *)(v37[1] + 24) = v26;
      qword_10001A5A8 = *(void *)(v37[1] + 24);
      id v24 = (void *)v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v24)
    {
      v30 = (_Unwind_Exception *)sub_10000AC10();
      _Block_object_dispose(&v38, 8);
      _Unwind_Resume(v30);
    }
    os_log_t v27 = [(CAMAssetTransportController *)v17 initWithConversation:v16 packageGeneratorClass:v19 statisticsManagerClass:v23 previewImageKey:*v24];
    if (a4 == 1)
    {
      CAMSignpostWithIDAndArgs();
      id v12 = v21;
      BOOL v29 = v22;
      id v13 = v32;
      [v27 sendAsset:v21 suppressLivePhoto:v29 mediaOrigin:v31 completion:v32];
    }
    else
    {
      id v12 = v21;
      if (a4)
      {
        id v13 = v32;
      }
      else
      {
        CAMSignpostWithIDAndArgs();
        BOOL v28 = v22;
        id v13 = v32;
        [v27 stageAsset:v21 suppressLivePhoto:v28 mediaOrigin:v31 completion:v32];
      }
    }
  }
  else
  {
    os_log_t v27 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10000ABDC();
    }
  }
}

- (void)_saveAsset:(id)a3
{
  id v3 = a3;
  id v4 = +[PHPhotoLibrary sharedPhotoLibrary];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000070B8;
  v6[3] = &unk_100014668;
  id v7 = v3;
  id v5 = v3;
  [v4 performChanges:v6 completionHandler:&stru_1000147B0];
}

- (BOOL)_shouldDisableCameraForMultitasking
{
  id v3 = +[CAMCaptureCapabilities capabilities];
  unsigned int v4 = [v3 isSplitScreenSupported];

  if ([(CAMMessagesExtensionViewController *)self isViewLoaded])
  {
    id v5 = [(CAMMessagesExtensionViewController *)self view];
  }
  else
  {
    id v5 = 0;
  }
  id v6 = [v5 window];
  id v7 = [v6 screen];
  if (v6)
  {
    [v6 bounds];
    double width = v10;
    double height = v12;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
  }
  if (v7) {
    unsigned int v14 = v4;
  }
  else {
    unsigned int v14 = 0;
  }
  if (v14 == 1 && (v15 = width, double v16 = height, !CGRectIsEmpty(*(CGRect *)&x)))
  {
    [v7 _referenceBounds];
    double v19 = v18;
    double v21 = v20;
    -[CAMMessagesExtensionViewController _portraitOrientedSizeForSize:](self, "_portraitOrientedSizeForSize:", width, height);
    BOOL v17 = v23 != v21 || v22 != v19;
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

- (CGSize)_portraitOrientedSizeForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(CAMMessagesExtensionViewController *)self view];
  id v6 = [v5 window];
  id v7 = [v6 screen];
  [v7 _referenceBounds];
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = width < height;
  if (v9 < v11) {
    BOOL v12 = width > height;
  }
  if (v12) {
    double v13 = width;
  }
  else {
    double v13 = height;
  }
  if (v12) {
    double v14 = height;
  }
  else {
    double v14 = width;
  }
  result.double height = v13;
  result.double width = v14;
  return result;
}

- (void)cameraViewController:(id)a3 didCapturePhoto:(id)a4 withProperties:(id)a5 error:(id)a6
{
  if (!a4 || a6)
  {
    id v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000AC34();
    }
  }
  else
  {
    id v8 = +[CAMCameraReviewAdapter reviewAssetForPhoto:a4 withProperties:a5];
    [(CAMMessagesExtensionViewController *)self _presentReviewControllerForAsset:v8 source:2];
  }
}

- (void)cameraViewController:(id)a3 didCaptureLivePhoto:(id)a4 withProperties:(id)a5 error:(id)a6
{
  if (!a4 || a6)
  {
    id v7 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000AC68();
    }
  }
  else
  {
    id v8 = +[CAMCameraReviewAdapter reviewAssetForLivePhoto:a4 withProperties:a5];
    [(CAMMessagesExtensionViewController *)self _presentReviewControllerForAsset:v8 source:2];
  }
}

- (void)cameraViewController:(id)a3 didCaptureAVAsset:(id)a4 andAudioMix:(id)a5 withProperties:(id)a6 error:(id)a7
{
  if (!a4 || a7)
  {
    id v8 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000AC9C();
    }
  }
  else
  {
    id v9 = +[CAMCameraReviewAdapter reviewAssetForAVAsset:a4 audioMix:a5 properties:a6];
    [(CAMMessagesExtensionViewController *)self _presentReviewControllerForAsset:v9 source:2];
  }
}

- (void)cameraViewControllerDidRequestPhotosExtension
{
  if (objc_opt_respondsToSelector())
  {
    [(CAMMessagesExtensionViewController *)self _dismissAndPresentPhotosApp];
  }
}

- (void)cameraViewControllerDidRequestDismissal
{
  id v3 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Dismissing for Done button pressed", v4, 2u);
  }

  [(CAMMessagesExtensionViewController *)self dismiss];
}

- (void)cameraViewControllerCreativeCameraButtonWasPressed
{
  id v3 = objc_opt_class();
  unsigned int v4 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
  id v5 = [(CAMMessagesExtensionViewController *)self _userPreferenceOverrides];
  id v6 = [v3 _userPreferenceOverridesFromRegularCamera:v4 baseUserPreferenceOverrides:v5];

  [(CAMMessagesExtensionViewController *)self _preheatCFXCameraFromUserPreferenceOverrides:v6];
}

- (void)cameraViewControllerCreativeCameraButtonWasReleased
{
}

- (void)_switchCameraViewControllers
{
  int64_t v3 = [(CAMMessagesExtensionViewController *)self _captureState];
  if (v3 == 1)
  {
    unsigned int v4 = self;
    uint64_t v5 = 2;
LABEL_5:
    if ([(CAMMessagesExtensionViewController *)v4 _transitionIfPossibleToNextCaptureState:v5])
    {
      return;
    }
    goto LABEL_6;
  }
  if (v3 == 4)
  {
    unsigned int v4 = self;
    uint64_t v5 = 5;
    goto LABEL_5;
  }
LABEL_6:
  id v6 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(CAMMessagesExtensionViewController *)self _descriptionForState:[(CAMMessagesExtensionViewController *)self _captureState]];
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cannot switch cameras from state %{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)cameraViewControllerDidSuspendCameraSession:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];

  if (v5 == v4)
  {
    [(CAMMessagesExtensionViewController *)self _regularCameraDidStopCaptureSession];
  }
}

- (void)_regularCameraDidStopCaptureSession
{
  [(CAMMessagesExtensionViewController *)self _regularCameraViewController];

  CAMSignpostWithIDAndArgs();
  if (![(CAMMessagesExtensionViewController *)self _transitionIfPossibleToNextCaptureState:3])
  {
    int64_t v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CAMMessagesExtensionViewController *)self _descriptionForState:[(CAMMessagesExtensionViewController *)self _captureState]];
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Regular Camera stopped while in state %{public}@, not taking action", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)cameraViewControllerDidResumeCameraSession:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];

  if (v5 == v4)
  {
    [(CAMMessagesExtensionViewController *)self _regularCameraDidStartCaptureSession];
  }
}

- (void)_regularCameraDidStartCaptureSession
{
  [(CAMMessagesExtensionViewController *)self _regularCameraViewController];

  CAMSignpostWithIDAndArgs();
  if (![(CAMMessagesExtensionViewController *)self _transitionIfPossibleToNextCaptureState:1])
  {
    int64_t v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CAMMessagesExtensionViewController *)self _descriptionForState:[(CAMMessagesExtensionViewController *)self _captureState]];
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Regular Camera started while in state %{public}@, not taking action", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)cameraViewControllerRequestedDismissal:(id)a3
{
  id v4 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing from cameraViewControllerRequestedDismissal (CAMCameraViewController)", v5, 2u);
  }

  [(CAMMessagesExtensionViewController *)self dismiss];
}

- (void)cameraViewControllerDidStopCaptureSession:(id)a3
{
}

- (void)_cfxCameraDidStopCaptureSession
{
  [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];

  CAMSignpostWithIDAndArgs();
  if (![(CAMMessagesExtensionViewController *)self _transitionIfPossibleToNextCaptureState:6])
  {
    int64_t v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CAMMessagesExtensionViewController *)self _descriptionForState:[(CAMMessagesExtensionViewController *)self _captureState]];
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CFXCamera stopped while in state %{public}@, not taking action", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)cameraViewControllerDidStartCaptureSession:(id)a3
{
}

- (void)_cfxCameraDidStartCaptureSession
{
  [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];

  CAMSignpostWithIDAndArgs();
  if (![(CAMMessagesExtensionViewController *)self _transitionIfPossibleToNextCaptureState:4])
  {
    int64_t v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(CAMMessagesExtensionViewController *)self _descriptionForState:[(CAMMessagesExtensionViewController *)self _captureState]];
      int v5 = 138543362;
      id v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CFXCamera started while in state %{public}@, not taking action", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)cameraViewController:(id)a3 didCaptureMediaItem:(id)a4
{
  int v5 = +[PUReviewAsset reviewAssetFromCFXMediaItem:a4];
  if (v5)
  {
    [(CAMMessagesExtensionViewController *)self _presentReviewControllerForAsset:v5 source:4];
  }
  else
  {
    id v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000ACD0();
    }
  }
}

- (void)cameraViewControllerDoneButtonWasTapped:(id)a3
{
  id v4 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Dismissing from cameraViewControllerDoneButtonWasTapped (CFXCameraViewController)", v5, 2u);
  }

  [(CAMMessagesExtensionViewController *)self dismiss];
}

- (void)cameraViewControllerEffectsButtonWasTapped:(id)a3
{
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = objc_alloc_init(CAMReviewTransitionAnimator);
  [(CAMReviewTransitionAnimator *)v6 setTransitionDirection:0];
  id v7 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
  [(CAMReviewTransitionAnimator *)v6 setCameraViewController:v7];

  int v8 = [(CAMMessagesExtensionViewController *)self _reviewController];
  [(CAMReviewTransitionAnimator *)v6 setReviewViewController:v8];

  [(CAMReviewTransitionAnimator *)v6 setDelegate:self];
  id v9 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];
  [(CAMReviewTransitionAnimator *)v6 setFunCamViewController:v9];

  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = objc_alloc_init(CAMReviewTransitionAnimator);
  [(CAMReviewTransitionAnimator *)v4 setTransitionDirection:1];
  int v5 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
  [(CAMReviewTransitionAnimator *)v4 setCameraViewController:v5];

  id v6 = [(CAMMessagesExtensionViewController *)self _reviewController];
  [(CAMReviewTransitionAnimator *)v4 setReviewViewController:v6];

  [(CAMReviewTransitionAnimator *)v4 setDelegate:self];
  id v7 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];
  [(CAMReviewTransitionAnimator *)v4 setFunCamViewController:v7];

  return v4;
}

- (unint64_t)availableControlsCountForReviewTransition:(id)a3
{
  id v4 = [(CAMMessagesExtensionViewController *)self _currentReviewAssset];
  int v5 = [(CAMMessagesExtensionViewController *)self _reviewController];
  LODWORD(v6) = [(CAMMessagesExtensionViewController *)self assetExplorerReviewScreenViewController:v5 canPerformActionType:6 onAsset:v4 inAssetCollection:0];
  unsigned int v7 = [(CAMMessagesExtensionViewController *)self assetExplorerReviewScreenViewController:v5 canPerformActionType:5 onAsset:v4 inAssetCollection:0];
  uint64_t v8 = 1;
  if (v6) {
    uint64_t v8 = 2;
  }
  if (v7) {
    uint64_t v6 = v8;
  }
  else {
    uint64_t v6 = v6;
  }
  unint64_t v9 = v6
     + [(CAMMessagesExtensionViewController *)self assetExplorerReviewScreenViewController:v5 canPerformActionType:7 onAsset:v4 inAssetCollection:0];

  return v9;
}

+ (int64_t)_CAMTorchModeForAVFlashMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

+ (int64_t)_AVFlashModeForCAMTorchMode:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (void)_handleHostDidEnterBackgroundNotification:(id)a3
{
  id v4 = [(CAMMessagesExtensionViewController *)self _reviewController];

  if (v4)
  {
    int v5 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received NSExtensionHostDidEnterBackgroundNotification but ignoring since we are showing review screen.", buf, 2u);
    }
    goto LABEL_21;
  }
  uint64_t v6 = [(CAMMessagesExtensionViewController *)self _regularCameraViewController];
  int v5 = v6;
  if (v6)
  {
    if (([v6 isCapturingPhoto] & 1) != 0
      || ([v5 isCapturingLivePhoto] & 1) != 0
      || ([v5 isRecording] & 1) != 0)
    {
      unsigned int v7 = 1;
    }
    else
    {
      unsigned int v7 = [v5 isPreventingAdditionalCaptures];
    }
  }
  else
  {
    unsigned int v7 = 0;
  }
  uint64_t v8 = [(CAMMessagesExtensionViewController *)self _cfxCameraViewController];

  if (!v7)
  {
    double v10 = os_log_create("com.apple.camera", "Camera");
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v11)
      {
        __int16 v15 = 0;
        BOOL v12 = "Received NSExtensionHostDidEnterBackgroundNotification while showing CFXCamera (cannot verify if recording"
              "), dismissing CameraMessagesApp extension.";
        double v13 = (uint8_t *)&v15;
LABEL_19:
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }
    else if (v11)
    {
      __int16 v14 = 0;
      BOOL v12 = "Received NSExtensionHostDidEnterBackgroundNotification, dismissing CameraMessagesApp extension.";
      double v13 = (uint8_t *)&v14;
      goto LABEL_19;
    }

    [(CAMMessagesExtensionViewController *)self dismiss];
    goto LABEL_21;
  }
  unint64_t v9 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Received NSExtensionHostDidEnterBackgroundNotification but ignoring since we are capturing or awaiting review.", v16, 2u);
  }

LABEL_21:
}

- (int64_t)_captureState
{
  return self->__captureState;
}

- (CAMCameraViewController)_regularCameraViewController
{
  return self->__regularCameraViewController;
}

- (void)_setCameraViewController:(id)a3
{
}

- (CAMUserPreferenceOverrides)_userPreferenceOverrides
{
  return self->__userPreferenceOverrides;
}

- (void)_setUserPreferenceOverrides:(id)a3
{
}

- (CFXCameraViewController)_cfxCameraViewController
{
  return self->__cfxCameraViewController;
}

- (void)_setCfxCameraViewController:(id)a3
{
}

- (PUReviewAsset)_currentReviewAssset
{
  return self->__currentReviewAssset;
}

- (void)_setCurrentReviewAssset:(id)a3
{
}

- (PUAssetExplorerReviewScreenViewController)_reviewController
{
  return self->__reviewController;
}

- (void)_setReviewController:(id)a3
{
}

- (BOOL)_didReceiveViewWillAppear
{
  return self->__didReceiveViewWillAppear;
}

- (void)_setDidReceiveViewWillAppear:(BOOL)a3
{
  self->__didReceiveViewWillAppear = a3;
}

- (BOOL)_shouldShowFunEffects
{
  return self->__shouldShowFunEffects;
}

- (double)_logReferenceTime
{
  return self->__logReferenceTime;
}

- (void)_setLogReferenceTime:(double)a3
{
  self->__logReferenceTime = a3;
}

- (NSString)_logReferenceDescription
{
  return self->__logReferenceDescription;
}

- (void)_setLogReferenceDescription:(id)a3
{
}

- (double)_stateChangeReferenceTime
{
  return self->__stateChangeReferenceTime;
}

- (void)_setStateChangeReferenceTime:(double)a3
{
  self->__stateChangeReferenceTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__logReferenceDescription, 0);
  objc_storeStrong((id *)&self->__reviewController, 0);
  objc_storeStrong((id *)&self->__currentReviewAssset, 0);
  objc_storeStrong((id *)&self->__cfxCameraViewController, 0);
  objc_storeStrong((id *)&self->__userPreferenceOverrides, 0);

  objc_storeStrong((id *)&self->__regularCameraViewController, 0);
}

@end