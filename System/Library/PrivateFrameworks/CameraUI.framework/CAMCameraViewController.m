@interface CAMCameraViewController
+ (BOOL)isEmulatingImagePicker;
+ (BOOL)supportsSecureCoding;
- (BOOL)automaticallyAdjustsApplicationIdleTimer;
- (BOOL)automaticallyManagesCameraSession;
- (BOOL)capturePhoto;
- (BOOL)isCapturingLivePhoto;
- (BOOL)isCapturingPhoto;
- (BOOL)isDisablingAdditionalCaptures;
- (BOOL)isDisablingMultipleCaptureFeatures;
- (BOOL)isPerformingTileTransition;
- (BOOL)isPreventingAdditionalCaptures;
- (BOOL)isRecording;
- (BOOL)startRecording;
- (BOOL)stopRecording;
- (CAMBurstController)burstController;
- (CAMCameraCaptureDelegate)captureDelegate;
- (CAMCameraConfigurationDelegate)configurationDelegate;
- (CAMCameraViewController)initWithCoder:(id)a3;
- (CAMCameraViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CAMCameraViewController)initWithOverrides:(id)a3 initialLayoutStyle:(int64_t)a4 privateOptions:(int64_t)a5;
- (CAMCameraViewController)initWithOverrides:(id)a3 usingEmulationMode:(int64_t)a4;
- (CAMCameraViewControllerCameraSessionDelegate)cameraSessionDelegate;
- (CAMCameraViewControllerPresentationDelegate)presentationDelegate;
- (CAMCreativeCameraDelegate)creativeCameraDelegate;
- (CAMKeepAliveController)keepAliveController;
- (CAMLocationController)locationController;
- (CAMMotionController)motionController;
- (CAMNebulaDaemonProxyManager)nebulaDaemonProxyManager;
- (CAMPersistenceController)persistenceController;
- (CAMPowerController)powerController;
- (CAMProtectionController)protectionController;
- (CAMRemoteShutterController)remoteShutterController;
- (CAMReviewButton)_reviewButton;
- (CAMThumbnailGenerator)_resultQueueThumbnailGenerator;
- (CAMTimelapseController)timelapseController;
- (CAMViewfinderViewController)viewfinderViewController;
- (CUCaptureController)captureController;
- (NSMutableDictionary)_resultQueueStillImageResultCoordinators;
- (OS_dispatch_queue)_resultProcessingQueue;
- (PAImageConversionServiceClient)_imageConversionClient;
- (PAVideoConversionServiceClient)_videoConversionClient;
- (id)_behaviorDefinedDestinationURLForRequest:(id)a3 withLocalDestinationURL:(id)a4 linkedDestinationURL:(id)a5;
- (id)_clientPropertiesForLivePhotoVideoURL:(id)a3 duration:(id *)a4 stillDisplayTime:(id *)a5 error:(id)a6;
- (id)_clientPropertiesForPhotoProperties:(id)a3 withFilteredImageURL:(id)a4 conversionOutputInfo:(id)a5 error:(id)a6;
- (id)_clientPropertiesForStillImageWithURL:(id)a3 captureMode:(int64_t)a4 captureOrientation:(int64_t)a5 previewSurface:(void *)a6 previewOrientation:(int64_t)a7 uniqueIdentifier:(id)a8 savedToPhotoLibrary:(BOOL)a9 captureResult:(id)a10;
- (id)_clientPropertiesForVideoURL:(id)a3 renderedURL:(id)a4 duration:(id *)a5 size:(CGSize)a6 creationDate:(id)a7 captureOrientation:(int64_t)a8 previewOrientation:(int64_t)a9 adjustments:(id)a10 uniqueIdentifier:(id)a11 savedToPhotoLibrary:(BOOL)a12;
- (id)_exportPropertiesForClientProperties:(id)a3;
- (id)_mediaConversionOptionsForAdjustments:(id)a3 mediaType:(int64_t)a4 description:(id)a5;
- (id)_previewImageFromVideoURL:(id)a3;
- (id)_resultQueueSafeImageFromSurface:(void *)a3 imageOrientation:(int64_t)a4;
- (id)_resultQueue_getOrCreateStillImageResultCoordinatorForRequest:(id)a3 captureTimeExpectedResultSpecifiers:(id)a4 isExpectingPairedVideo:(BOOL)a5 isDisablingMultipleCaptures:(BOOL)a6 isGeneratingFilteredMedia:(BOOL)a7;
- (id)_resultQueue_getStillImageResultCoordinatorForRequest:(id)a3;
- (id)reviewButton;
- (int64_t)captureDevice;
- (int64_t)captureMode;
- (int64_t)flashMode;
- (int64_t)hdrMode;
- (int64_t)livePhotoMode;
- (int64_t)messagesTransitionState;
- (int64_t)photoModeAspectRatioCrop;
- (int64_t)preferredStatusBarUpdateAnimation;
- (int64_t)timerDuration;
- (int64_t)torchMode;
- (unint64_t)_capturePersistenceBehaviorForViewfinderPersistenceBehavior:(unint64_t)a3;
- (unint64_t)_viewfinderPersistenceBehaviorForCapturePersistenceBehavior:(unint64_t)a3;
- (unint64_t)persistenceBehavior;
- (void)_commonCAMCameraViewControllerInitializationWithOverrides:(id)a3 usingEmulationMode:(int64_t)a4 initialLayoutStyle:(int64_t)a5 privateOptions:(int64_t)a6;
- (void)_handleCTMVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5;
- (void)_handleCTMVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5 size:(CGSize)a6 videoURL:(id)a7 renderedToURL:(id)a8 renderedAdjustments:(id)a9;
- (void)_handleLivePhotoVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5;
- (void)_handlePhotoProperties:(id)a3 videoProperties:(id)a4 unfilteredPhotoProperties:(id)a5 unfilteredVideoProperties:(id)a6 assetAdjustments:(id)a7 attemptPairingVideo:(BOOL)a8 error:(id)a9;
- (void)_handleVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5;
- (void)_notifyCaptureDelegateOfCompletedCaptureOfLivePhoto:(id)a3 withProperties:(id)a4 error:(id)a5;
- (void)_notifyCaptureDelegateOfCompletedCaptureOfPhoto:(id)a3 withProperties:(id)a4 error:(id)a5;
- (void)_notifyCaptureDelegateOfCompletedCaptureOfVideo:(id)a3 withProperties:(id)a4 error:(id)a5;
- (void)_renderLivePhotoWithCoordinator:(id)a3 specifiers:(unint64_t)a4 photoProperties:(id)a5 videoProperties:(id)a6 adjustments:(id)a7;
- (void)_resultQueue_forceCompletionIfPossibleForRequest:(id)a3;
- (void)_resultQueue_removeStillImageResultCoordinatorForIdentifier:(id)a3;
- (void)captureController:(id)a3 didGenerateStillImageCaptureResult:(id)a4 fromRequest:(id)a5;
- (void)configureForCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4;
- (void)dealloc;
- (void)didReceiveMemoryWarning;
- (void)handleReviewButtonReleased:(id)a3;
- (void)handleVolumeButtonPressed;
- (void)handleVolumeButtonReleased;
- (void)loadView;
- (void)persistenceController:(id)a3 didCompleteAllLocalPersistenceForRequest:(id)a4;
- (void)persistenceController:(id)a3 didGenerateStillImageLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6;
- (void)persistenceController:(id)a3 didGenerateVideoLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6;
- (void)resumeCameraSession;
- (void)setAutomaticallyAdjustsApplicationIdleTimer:(BOOL)a3;
- (void)setAutomaticallyManagesCameraSession:(BOOL)a3;
- (void)setCameraSessionDelegate:(id)a3;
- (void)setCaptureDelegate:(id)a3;
- (void)setConfigurationDelegate:(id)a3;
- (void)setCreativeCameraDelegate:(id)a3;
- (void)setDisablingAdditionalCaptures:(BOOL)a3;
- (void)setDisablingMultipleCaptureFeatures:(BOOL)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setHDRMode:(int64_t)a3;
- (void)setLivePhotoMode:(int64_t)a3;
- (void)setMessagesTransitionState:(int64_t)a3 animated:(BOOL)a4;
- (void)setPerformingTileTransition:(BOOL)a3;
- (void)setPersistenceBehavior:(unint64_t)a3;
- (void)setPhotoModeAspectRatioCrop:(int64_t)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setTimerDuration:(int64_t)a3;
- (void)setTorchMode:(int64_t)a3;
- (void)stillImagePersistenceCoordinator:(id)a3 requestsDispatchForResultSpecifiers:(unint64_t)a4 photoProperties:(id)a5 videoProperties:(id)a6 unfilteredPhotoProperties:(id)a7 unfilteredVideoProperties:(id)a8 assetAdjustments:(id)a9 error:(id)a10;
- (void)suspendCameraSession;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CAMCameraViewController

- (void)_commonCAMCameraViewControllerInitializationWithOverrides:(id)a3 usingEmulationMode:(int64_t)a4 initialLayoutStyle:(int64_t)a5 privateOptions:(int64_t)a6
{
  id v10 = a3;
  v68 = +[CAMCaptureCapabilities capabilities];
  int64_t v61 = a5;
  if ([v68 hasSystemTelephonyOfAnyKind]) {
    v11 = objc_alloc_init(CAMCallStatusMonitor);
  }
  else {
    v11 = 0;
  }
  v12 = +[CAMUserPreferences preferences];
  objc_msgSend(v12, "readPreferencesWithOverrides:emulationMode:callActive:shouldResetCaptureConfiguration:", v10, a4, -[CAMCallStatusMonitor isCallActive](v11, "isCallActive"), 0);

  v13 = [v12 captureConfiguration];
  v71 = v11;
  if ((a6 & 2) != 0)
  {
    uint64_t v14 = +[CAMCaptureConfiguration tinyConfigurationForConfiguration:preserveFilters:](CAMCaptureConfiguration, "tinyConfigurationForConfiguration:preserveFilters:", v13, [v12 preserveEffectFilter]);

    v13 = (void *)v14;
  }
  unint64_t v65 = a4 - 1;
  v70 = [v12 conflictingControlConfiguration];
  v15 = objc_alloc_init(CAMMotionController);
  int64_t v63 = a4;
  unint64_t v57 = a6;
  if (a6 & 1 | a4) {
    v16 = 0;
  }
  else {
    v16 = objc_alloc_init(CAMLocationController);
  }
  v17 = objc_alloc_init(CAMPowerController);
  v18 = objc_alloc_init(CAMProtectionController);
  v55 = objc_alloc_init(CAMKeepAliveController);
  v69 = objc_alloc_init(CAMNebulaDaemonProxyManager);
  v19 = [[CAMBurstController alloc] initWithProtectionController:v18 powerController:v17 remoteShutterController:0];
  v20 = [[CAMPersistenceController alloc] initWithLocationController:v16 burstController:v19 protectionController:v18 powerController:v17 irisVideoController:0];
  [(CAMBurstController *)v19 setPersistenceController:v20];
  v67 = +[CAMCaptureConfiguration captureGraphConfigurationUsingConfiguration:v13 outputToExternalStorage:0];
  objc_msgSend(v12, "defaultZoomFactorForGraphConfiguration:captureOrientation:outputToExternalStorage:", v67, -[CAMMotionController captureOrientation](v15, "captureOrientation"), 0);
  v52 = v18;
  v59 = v18;
  v21 = v16;
  v53 = v19;
  v23 = [[CUCaptureController alloc] initWithCaptureConfiguration:v13 zoomFactor:0 outputToExternalStorage:1 engineOptions:v16 locationController:v15 motionController:v19 burstController:v22 protectionController:v52 powerController:v17 irisVideoController:0 remoteShutterController:0];
  v24 = v13;
  v25 = v23;
  v26 = objc_alloc_init(CAMStorageController);
  v27 = 0;
  BOOL v28 = v65 >= 2;
  v66 = v12;
  if (v28) {
    v27 = [[CAMTimelapseController alloc] initWithCaptureController:v25 locationController:v21 motionController:v15 persistenceController:v20 storageController:v26 librarySelectionController:0 nebulaDaemonProxyManager:v69];
  }
  v56 = v26;
  v60 = v24;
  v29 = -[CAMViewfinderViewController initWithCaptureController:captureConfiguration:conflictingControlConfiguration:locationController:motionController:timelapseController:keepAliveController:remoteShutterController:powerController:cameraRollController:librarySelectionController:callStatusMonitor:storageController:usingEmulationMode:initialLayoutStyle:options:]([CAMViewfinderViewController alloc], "initWithCaptureController:captureConfiguration:conflictingControlConfiguration:locationController:motionController:timelapseController:keepAliveController:remoteShutterController:powerController:cameraRollController:librarySelectionController:callStatusMonitor:storageController:usingEmulationMode:initialLayoutStyle:options:", v25, v24, v70, v21, v15, v27, 0, 0, v17, 0, 0, v71, v26, v63, v61,
          (v57 >> 2) & 1);
  viewfinderViewController = self->_viewfinderViewController;
  self->_viewfinderViewController = v29;
  v31 = v29;

  captureController = self->_captureController;
  self->_captureController = v25;
  v33 = v25;

  timelapseController = self->_timelapseController;
  self->_timelapseController = v27;
  v35 = v27;

  persistenceController = self->_persistenceController;
  self->_persistenceController = v20;
  v37 = v20;

  motionController = self->_motionController;
  self->_motionController = v15;
  v64 = v15;

  locationController = self->_locationController;
  self->_locationController = v21;
  v62 = v21;

  powerController = self->_powerController;
  self->_powerController = v17;
  v58 = v17;

  burstController = self->_burstController;
  self->_burstController = v53;
  v54 = v53;

  keepAliveController = self->_keepAliveController;
  self->_keepAliveController = v55;
  v43 = v55;

  protectionController = self->_protectionController;
  self->_protectionController = v59;
  v45 = v59;

  nebulaDaemonProxyManager = self->_nebulaDaemonProxyManager;
  self->_nebulaDaemonProxyManager = v69;
  v47 = v69;

  [(CAMTimelapseController *)v35 restoreConfiguration];
  [(CUCaptureController *)v33 registerCaptureService:v37];
  [(CAMViewfinderViewController *)v31 setPersistenceBehavior:1];
  [(CAMViewfinderViewController *)v31 setReviewButtonSource:self];
  [(CUCaptureController *)v33 setResultDelegate:self];
  [(CAMPersistenceController *)v37 setResultDelegate:self];
  v48 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  v49 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.camera-ui.camera-view-controller.result-queue", v48);
  resultProcessingQueue = self->__resultProcessingQueue;
  self->__resultProcessingQueue = v49;

  v51 = self->__resultProcessingQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __138__CAMCameraViewController__commonCAMCameraViewControllerInitializationWithOverrides_usingEmulationMode_initialLayoutStyle_privateOptions___block_invoke;
  block[3] = &unk_263FA0208;
  block[4] = self;
  dispatch_async(v51, block);
  -[CAMCameraViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, 568.0);
  self->_automaticallyManagesCameraSession = 1;
}

uint64_t __138__CAMCameraViewController__commonCAMCameraViewControllerInitializationWithOverrides_usingEmulationMode_initialLayoutStyle_privateOptions___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 1104);
  *(void *)(v3 + 1104) = v2;

  v5 = objc_alloc_init(CAMThumbnailGenerator);
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void *)(v6 + 1112);
  *(void *)(v6 + 1112) = v5;
  return MEMORY[0x270F9A758](v5, v7);
}

- (CAMCameraViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CAMCameraViewController;
  v4 = [(CAMCameraViewController *)&v9 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v6 = objc_msgSend(v5, "cam_initialLayoutStyle");

    [(CAMCameraViewController *)v4 _commonCAMCameraViewControllerInitializationWithOverrides:0 usingEmulationMode:0 initialLayoutStyle:v6 privateOptions:0];
    uint64_t v7 = v4;
  }

  return v4;
}

- (CAMCameraViewController)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CAMCameraViewController;
  uint64_t v3 = [(CAMCameraViewController *)&v8 initWithCoder:a3];
  if (v3)
  {
    v4 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

    [(CAMCameraViewController *)v3 _commonCAMCameraViewControllerInitializationWithOverrides:0 usingEmulationMode:0 initialLayoutStyle:v5 privateOptions:0];
    uint64_t v6 = v3;
  }

  return v3;
}

- (CAMCameraViewController)initWithOverrides:(id)a3 usingEmulationMode:(int64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CAMCameraViewController;
  uint64_t v7 = [(CAMCameraViewController *)&v12 initWithNibName:0 bundle:0];
  if (v7)
  {
    objc_super v8 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v9 = objc_msgSend(v8, "cam_initialLayoutStyle");

    [(CAMCameraViewController *)v7 _commonCAMCameraViewControllerInitializationWithOverrides:v6 usingEmulationMode:a4 initialLayoutStyle:v9 privateOptions:0];
    id v10 = v7;
  }

  return v7;
}

- (CAMCameraViewController)initWithOverrides:(id)a3 initialLayoutStyle:(int64_t)a4 privateOptions:(int64_t)a5
{
  id v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CAMCameraViewController;
  uint64_t v9 = [(CAMCameraViewController *)&v13 initWithNibName:0 bundle:0];
  id v10 = v9;
  if (v9)
  {
    [(CAMCameraViewController *)v9 _commonCAMCameraViewControllerInitializationWithOverrides:v8 usingEmulationMode:0 initialLayoutStyle:a4 privateOptions:a5];
    v11 = v10;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v3 = [(CAMCameraViewController *)self viewfinderViewController];
  [v3 suspendCameraSessionWithCompletion:0];

  v4.receiver = self;
  v4.super_class = (Class)CAMCameraViewController;
  [(CAMCameraViewController *)&v4 dealloc];
}

- (void)loadView
{
  uint64_t v3 = [CAMCameraViewControllerContainerView alloc];
  id v6 = -[CAMCameraViewControllerContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  objc_super v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [(CAMCameraViewController *)self addChildViewController:v4];
  uint64_t v5 = [v4 view];
  [(CAMCameraViewControllerContainerView *)v6 setViewfinderView:v5];
  [v4 didMoveToParentViewController:self];
  [(CAMCameraViewController *)self setView:v6];
}

- (void)viewDidLoad
{
  v2.receiver = self;
  v2.super_class = (Class)CAMCameraViewController;
  [(CAMCameraViewController *)&v2 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CAMCameraViewController;
  [(CAMCameraViewController *)&v5 viewWillAppear:a3];
  objc_super v4 = [(CAMCameraViewController *)self navigationController];
  [v4 setNavigationBarHidden:1];

  if ([(CAMCameraViewController *)self automaticallyManagesCameraSession]) {
    [(CAMCameraViewController *)self resumeCameraSession];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMCameraViewController;
  [(CAMCameraViewController *)&v4 viewDidDisappear:a3];
  if ([(CAMCameraViewController *)self automaticallyManagesCameraSession]) {
    [(CAMCameraViewController *)self suspendCameraSession];
  }
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)CAMCameraViewController;
  [(CAMCameraViewController *)&v2 didReceiveMemoryWarning];
}

- (int64_t)preferredStatusBarUpdateAnimation
{
  return 2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (int64_t)captureMode
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  int64_t v3 = [v2 currentCaptureMode];

  return v3;
}

- (int64_t)captureDevice
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  int64_t v3 = [v2 currentCaptureDevice];

  return v3;
}

- (void)configureForCaptureMode:(int64_t)a3 captureDevice:(int64_t)a4
{
  id v6 = [(CAMCameraViewController *)self viewfinderViewController];
  [v6 changeToMode:a3 device:a4 animated:1];
}

- (int64_t)flashMode
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  int64_t v3 = [v2 flashMode];

  return v3;
}

- (void)setFlashMode:(int64_t)a3
{
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setFlashMode:a3];
}

- (int64_t)torchMode
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  int64_t v3 = [v2 torchMode];

  return v3;
}

- (void)setTorchMode:(int64_t)a3
{
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setTorchMode:a3];
}

- (int64_t)hdrMode
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  int64_t v3 = [v2 hdrMode];

  return v3;
}

- (void)setHDRMode:(int64_t)a3
{
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setHDRMode:a3];
}

- (int64_t)timerDuration
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  int64_t v3 = [v2 timerDuration];

  return v3;
}

- (void)setTimerDuration:(int64_t)a3
{
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setTimerDuration:a3];
}

- (int64_t)livePhotoMode
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  int64_t v3 = [v2 livePhotoMode];

  return v3;
}

- (void)setLivePhotoMode:(int64_t)a3
{
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setLivePhotoMode:a3];
}

- (int64_t)photoModeAspectRatioCrop
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  int64_t v3 = [v2 photoModeAspectRatioCrop];

  return v3;
}

- (void)setPhotoModeAspectRatioCrop:(int64_t)a3
{
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setPhotoModeAspectRatioCrop:a3];
}

- (BOOL)isCapturingPhoto
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 isCapturingPhoto];

  return v3;
}

- (BOOL)isCapturingLivePhoto
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 isCapturingLivePhoto];

  return v3;
}

- (BOOL)isRecording
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 isRecording];

  return v3;
}

- (BOOL)capturePhoto
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 capturePhoto];

  return v3;
}

- (BOOL)startRecording
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 startRecording];

  return v3;
}

- (BOOL)stopRecording
{
  objc_super v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 stopRecording];

  return v3;
}

+ (BOOL)isEmulatingImagePicker
{
  return 0;
}

- (void)suspendCameraSession
{
  char v3 = [(CAMCameraViewController *)self viewfinderViewController];
  id v4 = [(CAMCameraViewController *)self cameraSessionDelegate];
  objc_initWeak(&location, v4);

  id v5 = objc_loadWeakRetained(&location);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__CAMCameraViewController_suspendCameraSession__block_invoke;
    aBlock[3] = &unk_263FA0868;
    objc_copyWeak(&v9, &location);
    aBlock[4] = self;
    uint64_t v7 = _Block_copy(aBlock);
    objc_destroyWeak(&v9);
  }
  else
  {
    uint64_t v7 = 0;
  }
  [v3 suspendCameraSessionWithCompletion:v7];
  objc_destroyWeak(&location);
}

void __47__CAMCameraViewController_suspendCameraSession__block_invoke(uint64_t a1)
{
  id v2 = MEMORY[0x263EF83A0];
  objc_copyWeak(&v3, (id *)(a1 + 40));
  pl_dispatch_async();

  objc_destroyWeak(&v3);
}

void __47__CAMCameraViewController_suspendCameraSession__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cameraViewControllerDidSuspendCameraSession:*(void *)(a1 + 32)];
}

- (void)resumeCameraSession
{
  id v3 = [(CAMCameraViewController *)self viewfinderViewController];
  id v4 = [(CAMCameraViewController *)self cameraSessionDelegate];
  objc_initWeak(&location, v4);

  id v5 = objc_loadWeakRetained(&location);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __46__CAMCameraViewController_resumeCameraSession__block_invoke;
    aBlock[3] = &unk_263FA0868;
    objc_copyWeak(&v9, &location);
    aBlock[4] = self;
    uint64_t v7 = _Block_copy(aBlock);
    objc_destroyWeak(&v9);
  }
  else
  {
    uint64_t v7 = 0;
  }
  [v3 resumeCameraSessionWithCompletion:v7];
  objc_destroyWeak(&location);
}

void __46__CAMCameraViewController_resumeCameraSession__block_invoke(uint64_t a1)
{
  id v2 = MEMORY[0x263EF83A0];
  objc_copyWeak(&v3, (id *)(a1 + 40));
  pl_dispatch_async();

  objc_destroyWeak(&v3);
}

void __46__CAMCameraViewController_resumeCameraSession__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cameraViewControllerDidResumeCameraSession:*(void *)(a1 + 32)];
}

- (int64_t)messagesTransitionState
{
  id v2 = [(CAMCameraViewController *)self viewfinderViewController];
  int64_t v3 = [v2 messagesTransitionState];

  return v3;
}

- (void)setMessagesTransitionState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(CAMCameraViewController *)self viewfinderViewController];
  [v6 setMessagesTransitionState:a3 animated:v4];
}

- (void)handleVolumeButtonPressed
{
  id v2 = [(CAMCameraViewController *)self viewfinderViewController];
  [v2 handleVolumeButtonPressed];
}

- (void)handleVolumeButtonReleased
{
  id v2 = [(CAMCameraViewController *)self viewfinderViewController];
  [v2 handleVolumeButtonReleased];
}

- (BOOL)isDisablingMultipleCaptureFeatures
{
  id v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 isDisablingMultipleCaptureFeatures];

  return v3;
}

- (void)setDisablingMultipleCaptureFeatures:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setDisablingMultipleCaptureFeatures:v3];
}

- (BOOL)isDisablingAdditionalCaptures
{
  id v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 isDisablingAdditionalCaptures];

  return v3;
}

- (void)setDisablingAdditionalCaptures:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setDisablingAdditionalCaptures:v3];
}

- (BOOL)isPreventingAdditionalCaptures
{
  id v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 isPreventingAdditionalCaptures];

  return v3;
}

- (unint64_t)persistenceBehavior
{
  char v3 = [(CAMCameraViewController *)self viewfinderViewController];
  unint64_t v4 = -[CAMCameraViewController _capturePersistenceBehaviorForViewfinderPersistenceBehavior:](self, "_capturePersistenceBehaviorForViewfinderPersistenceBehavior:", [v3 persistenceBehavior]);

  return v4;
}

- (void)setPersistenceBehavior:(unint64_t)a3
{
  id v7 = [(CAMCameraViewController *)self viewfinderViewController];
  objc_msgSend(v7, "setPersistenceBehavior:", -[CAMCameraViewController _viewfinderPersistenceBehaviorForCapturePersistenceBehavior:](self, "_viewfinderPersistenceBehaviorForCapturePersistenceBehavior:", a3));
  id v5 = [(CAMCameraViewController *)self keepAliveController];
  id v6 = v5;
  if (a3 - 1 >= 2)
  {
    if (!a3) {
      [v5 startKeepAliveSession];
    }
  }
  else
  {
    [v5 stopKeepAliveSession];
  }
}

- (BOOL)automaticallyAdjustsApplicationIdleTimer
{
  id v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 automaticallyAdjustsApplicationIdleTimer];

  return v3;
}

- (void)setAutomaticallyAdjustsApplicationIdleTimer:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setAutomaticallyAdjustsApplicationIdleTimer:v3];
}

- (BOOL)isPerformingTileTransition
{
  id v2 = [(CAMCameraViewController *)self viewfinderViewController];
  char v3 = [v2 isPerformingTileTransition];

  return v3;
}

- (void)setPerformingTileTransition:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CAMCameraViewController *)self viewfinderViewController];
  [v4 setPerformingTileTransition:v3];
}

- (unint64_t)_viewfinderPersistenceBehaviorForCapturePersistenceBehavior:(unint64_t)a3
{
  unint64_t v3 = 1;
  if (a3 == 1) {
    unint64_t v3 = 2;
  }
  if (a3 == 2) {
    return 3;
  }
  else {
    return v3;
  }
}

- (unint64_t)_capturePersistenceBehaviorForViewfinderPersistenceBehavior:(unint64_t)a3
{
  if (a3 == 3) {
    return 2;
  }
  else {
    return a3 == 2;
  }
}

- (CAMCameraConfigurationDelegate)configurationDelegate
{
  id v2 = [(CAMCameraViewController *)self viewfinderViewController];
  unint64_t v3 = [v2 configurationDelegate];

  return (CAMCameraConfigurationDelegate *)v3;
}

- (void)setConfigurationDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCameraViewController *)self viewfinderViewController];
  [v5 setConfigurationDelegate:v4];
}

- (id)_resultQueueSafeImageFromSurface:(void *)a3 imageOrientation:(int64_t)a4
{
  if (a3)
  {
    id v6 = [(CAMCameraViewController *)self _resultQueueThumbnailGenerator];
    id v7 = (CGImage *)[v6 newBGRAImageInOrientation:0 usingSurface:a3];
    id v8 = [MEMORY[0x263F827E8] imageWithCGImage:v7 scale:a4 orientation:1.0];
    CGImageRelease(v7);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)_previewImageFromVideoURL:(id)a3
{
  if (a3)
  {
    unint64_t v3 = [a3 path];
    PLPreviewImageAndDurationForVideoAtPath();
    id v4 = 0;
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)_notifyCaptureDelegateOfCompletedCaptureOfPhoto:(id)a3 withProperties:(id)a4 error:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CAMCameraViewController *)self captureDelegate];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v10 cameraViewController:self didCapturePhoto:v11 withProperties:v8 error:v9];
  }
}

- (void)_notifyCaptureDelegateOfCompletedCaptureOfLivePhoto:(id)a3 withProperties:(id)a4 error:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(CAMCameraViewController *)self captureDelegate];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v10 cameraViewController:self didCaptureLivePhoto:v11 withProperties:v8 error:v9];
  }
}

- (void)_notifyCaptureDelegateOfCompletedCaptureOfVideo:(id)a3 withProperties:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 objectForKeyedSubscript:@"CAMCameraViewControllerAdjustments"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_super v12 = v11;
  }
  else {
    objc_super v12 = 0;
  }
  id v13 = v12;
  objc_initWeak(&location, self);
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F5DFA0]) initWithVideoAsset:v8 videoAdjustments:v13];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__CAMCameraViewController__notifyCaptureDelegateOfCompletedCaptureOfVideo_withProperties_error___block_invoke;
  v16[3] = &unk_263FA71C0;
  objc_copyWeak(&v18, &location);
  v16[4] = self;
  id v15 = v9;
  id v17 = v15;
  [v14 requestAVAssetWithResultHandler:v16];

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __96__CAMCameraViewController__notifyCaptureDelegateOfCompletedCaptureOfVideo_withProperties_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __96__CAMCameraViewController__notifyCaptureDelegateOfCompletedCaptureOfVideo_withProperties_error___block_invoke_2;
  v15[3] = &unk_263FA7198;
  objc_copyWeak(&v20, (id *)(a1 + 48));
  id v11 = *(void **)(a1 + 40);
  v15[4] = *(void *)(a1 + 32);
  id v16 = v8;
  id v17 = v9;
  id v18 = v11;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(MEMORY[0x263EF83A0], v15);

  objc_destroyWeak(&v20);
}

uint64_t __96__CAMCameraViewController__notifyCaptureDelegateOfCompletedCaptureOfVideo_withProperties_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  id v4 = [WeakRetained captureDelegate];

  if (v4 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v4 cameraViewController:*(void *)(a1 + 32) didCaptureAVAsset:*(void *)(a1 + 40) andAudioMix:*(void *)(a1 + 48) withProperties:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
  }
  return MEMORY[0x270F9A848]();
}

- (id)_exportPropertiesForClientProperties:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"CAMCameraViewControllerOrientation"];
  id v5 = [v3 objectForKeyedSubscript:@"CAMCameraViewControllerPixelWidth"];
  id v6 = [v3 objectForKeyedSubscript:@"CAMCameraViewControllerPixelHeight"];

  uint64_t v7 = (int)[v4 shortValue];
  uint64_t v8 = [v5 unsignedIntegerValue];
  uint64_t v9 = [v6 unsignedIntegerValue];
  id v10 = [MEMORY[0x263F5D978] exportPropertiesWithImageWidth:v8 imageHeight:v9 exifOrientation:v7 duration:0.0];

  return v10;
}

- (id)_clientPropertiesForStillImageWithURL:(id)a3 captureMode:(int64_t)a4 captureOrientation:(int64_t)a5 previewSurface:(void *)a6 previewOrientation:(int64_t)a7 uniqueIdentifier:(id)a8 savedToPhotoLibrary:(BOOL)a9 captureResult:(id)a10
{
  id v14 = a3;
  id v15 = a8;
  id v16 = a10;
  id v17 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v18 = [v16 metadata];
  v43 = [v16 captureDate];
  int64_t v19 = a4;
  id v20 = v15;
  v21 = [NSNumber numberWithInteger:v19];
  [v17 setObject:v21 forKeyedSubscript:@"CAMCameraViewControllerCaptureMode"];

  double v22 = [v16 error];
  [v17 setObject:v22 forKeyedSubscript:@"CAMCameraViewControllerCaptureError"];

  if (v20) {
    [v17 setObject:v20 forKey:@"CAMCameraViewControllerUniquePersistenceIdentifier"];
  }
  [v17 setObject:v14 forKeyedSubscript:@"CAMCameraViewControllerPhotoURL"];
  [v17 setObject:v18 forKeyedSubscript:@"CAMCameraViewControllerPhotoMetadata"];
  if (a5)
  {
    v23 = [NSNumber numberWithInteger:a5];
    [v17 setObject:v23 forKey:@"CAMCameraViewControllerCaptureOrientation"];
  }
  v40 = v14;
  v24 = [v18 objectForKey:*MEMORY[0x263F0F4C8]];
  v25 = v43;
  if (v24) {
    [v17 setObject:v24 forKey:@"CAMCameraViewControllerOrientation"];
  }
  v26 = [v18 objectForKey:*MEMORY[0x263F0F248]];
  v27 = [v26 objectForKey:*MEMORY[0x263F0F2E8]];
  uint64_t v28 = [v26 objectForKey:*MEMORY[0x263F0F2F0]];
  v29 = (void *)v28;
  if (v27 && v28)
  {
    [v24 shortValue];
    int v30 = PLExifOrientationSwapsWidthAndHeight();
    if (v30) {
      v31 = v27;
    }
    else {
      v31 = v29;
    }
    if (v30) {
      v27 = v29;
    }
    [v17 setObject:v27 forKey:@"CAMCameraViewControllerPixelWidth"];
    [v17 setObject:v31 forKey:@"CAMCameraViewControllerPixelHeight"];
    v29 = v31;
    v25 = v43;
  }
  if (v25) {
    [v17 setObject:v25 forKey:@"CAMCameraViewControllerCaptureDate"];
  }
  v32 = [NSNumber numberWithBool:a9];
  [v17 setObject:v32 forKey:@"CAMCameraViewControllerSavedToPhotoLibrary"];

  if (a6)
  {
    v33 = [(CAMCameraViewController *)self _resultQueueSafeImageFromSurface:a6 imageOrientation:a7];
    if (v33) {
      [v17 setObject:v33 forKey:@"CAMCameraViewControllerPreviewImage"];
    }
  }
  if ([(id)objc_opt_class() isEmulatingImagePicker])
  {
    v34 = [v16 capturePhoto];
    v35 = [v34 fileDataRepresentation];
    if (v35)
    {
      v42 = v20;
      [v17 setObject:v35 forKey:@"CAMCameraViewControllerFullsizeImageData"];
      v36 = [MEMORY[0x263F827E8] imageWithData:v35];
      if (v36) {
        [v17 setObject:v36 forKey:@"CAMCameraViewControllerFullsizeImage"];
      }

      id v20 = v42;
    }
  }
  v37 = (void *)[v17 copy];

  return v37;
}

- (id)_clientPropertiesForPhotoProperties:(id)a3 withFilteredImageURL:(id)a4 conversionOutputInfo:(id)a5 error:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = (void *)[a3 mutableCopy];
  id v13 = getPAMediaConversionServicePixelWidthKey();
  id v14 = [v10 objectForKeyedSubscript:v13];
  [v12 setObject:v14 forKeyedSubscript:@"CAMCameraViewControllerPixelWidth"];

  id v15 = getPAMediaConversionServicePixelHeightKey();
  id v16 = [v10 objectForKeyedSubscript:v15];

  [v12 setObject:v16 forKeyedSubscript:@"CAMCameraViewControllerPixelHeight"];
  [v12 setObject:v11 forKeyedSubscript:@"CAMCameraViewControllerPhotoURL"];

  [v12 setObject:v9 forKeyedSubscript:@"CAMCameraViewControllerCaptureError"];
  [v12 setObject:&unk_26BDDF0D8 forKeyedSubscript:@"CAMCameraViewControllerOrientation"];
  id v17 = [v12 objectForKeyedSubscript:@"CAMCameraViewControllerPhotoMetadata"];
  id v18 = (void *)[v17 mutableCopy];
  [v12 setObject:v18 forKeyedSubscript:@"CAMCameraViewControllerPhotoMetadata"];

  int64_t v19 = [v12 objectForKeyedSubscript:@"CAMCameraViewControllerPhotoMetadata"];
  [v19 setObject:&unk_26BDDF0D8 forKeyedSubscript:*MEMORY[0x263F0F4C8]];

  return v12;
}

- (id)_clientPropertiesForLivePhotoVideoURL:(id)a3 duration:(id *)a4 stillDisplayTime:(id *)a5 error:(id)a6
{
  id v9 = a3;
  if (v9)
  {
    id v10 = (objc_class *)MEMORY[0x263EFF9A0];
    id v11 = a6;
    id v12 = objc_alloc_init(v10);
    if (a4->var2)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a4;
      id v13 = [NSNumber numberWithDouble:CMTimeGetSeconds((CMTime *)&v17)];
      [v12 setObject:v13 forKeyedSubscript:@"CAMCameraViewControllerVideoDuration"];
    }
    if (a5->var2)
    {
      $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = *a5;
      id v14 = [MEMORY[0x263F08D40] valueWithCMTime:&v17];
      [v12 setObject:v14 forKeyedSubscript:@"CAMCameraViewControllerLivePhotoStillDisplayTime"];
    }
    [v12 setObject:v9 forKeyedSubscript:@"CAMCameraViewControllerVideoURL"];
    [v12 setObject:v11 forKeyedSubscript:@"CAMCameraViewControllerCaptureError"];

    id v15 = (void *)[v12 copy];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_clientPropertiesForVideoURL:(id)a3 renderedURL:(id)a4 duration:(id *)a5 size:(CGSize)a6 creationDate:(id)a7 captureOrientation:(int64_t)a8 previewOrientation:(int64_t)a9 adjustments:(id)a10 uniqueIdentifier:(id)a11 savedToPhotoLibrary:(BOOL)a12
{
  double height = a6.height;
  double width = a6.width;
  int64_t v19 = (objc_class *)MEMORY[0x263EFF9A0];
  id v20 = a11;
  id v21 = a10;
  id v22 = a7;
  id v23 = a4;
  id v24 = a3;
  id v25 = objc_alloc_init(v19);
  [v25 setObject:v20 forKeyedSubscript:@"CAMCameraViewControllerUniquePersistenceIdentifier"];

  v26 = [NSNumber numberWithDouble:width];
  [v25 setObject:v26 forKey:@"CAMCameraViewControllerPixelWidth"];

  v27 = [NSNumber numberWithDouble:height];
  [v25 setObject:v27 forKey:@"CAMCameraViewControllerPixelHeight"];

  [v25 setObject:v22 forKeyedSubscript:@"CAMCameraViewControllerCaptureDate"];
  [v25 setObject:v21 forKeyedSubscript:@"CAMCameraViewControllerAdjustments"];

  uint64_t v28 = [NSNumber numberWithBool:a12];
  [v25 setObject:v28 forKey:@"CAMCameraViewControllerSavedToPhotoLibrary"];

  if (a8)
  {
    v29 = [NSNumber numberWithInteger:a8];
    [v25 setObject:v29 forKey:@"CAMCameraViewControllerCaptureOrientation"];
  }
  if (a5->var2)
  {
    CMTime time = (CMTime)*a5;
    int v30 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
    [v25 setObject:v30 forKeyedSubscript:@"CAMCameraViewControllerVideoDuration"];
  }
  if (v23) {
    v31 = v23;
  }
  else {
    v31 = v24;
  }
  if (v23) {
    v32 = v24;
  }
  else {
    v32 = 0;
  }
  id v33 = v32;
  id v34 = v31;
  [v25 setObject:v34 forKeyedSubscript:@"CAMCameraViewControllerVideoURL"];
  [v25 setObject:v33 forKeyedSubscript:@"CAMCameraViewControllerUnadjustedVideoURL"];

  v35 = [(CAMCameraViewController *)self _previewImageFromVideoURL:v34];

  [v25 setObject:v35 forKeyedSubscript:@"CAMCameraViewControllerPreviewImage"];
  v36 = (void *)[v25 copy];

  return v36;
}

- (void)captureController:(id)a3 didGenerateStillImageCaptureResult:(id)a4 fromRequest:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [v8 captureOrientation];
  int64_t v10 = +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", v7, [v8 captureDevice], objc_msgSend(v8, "captureOrientation"));
  id v11 = [v8 persistenceUUID];
  uint64_t v12 = [v8 captureMode];
  uint64_t v13 = [v8 persistenceOptions];

  if (!v13)
  {
    id v14 = [(CAMCameraViewController *)self _resultProcessingQueue];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __92__CAMCameraViewController_captureController_didGenerateStillImageCaptureResult_fromRequest___block_invoke;
    v15[3] = &unk_263FA71E8;
    id v16 = v7;
    $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = self;
    uint64_t v19 = v12;
    uint64_t v20 = v9;
    int64_t v21 = v10;
    id v18 = v11;
    dispatch_async(v14, v15);
  }
}

void __92__CAMCameraViewController_captureController_didGenerateStillImageCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) stillImageFilteredPreviewSurface];
  if (!v2) {
    uint64_t v2 = [*(id *)(a1 + 32) stillImageUnfilteredPreviewSurface];
  }
  LOBYTE(v9) = 0;
  id v3 = [*(id *)(a1 + 40) _clientPropertiesForStillImageWithURL:0 captureMode:*(void *)(a1 + 56) captureOrientation:*(void *)(a1 + 64) previewSurface:v2 previewOrientation:*(void *)(a1 + 72) uniqueIdentifier:*(void *)(a1 + 48) savedToPhotoLibrary:v9 captureResult:*(void *)(a1 + 32)];
  id v4 = [v3 objectForKey:@"CAMCameraViewControllerPreviewImage"];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __92__CAMCameraViewController_captureController_didGenerateStillImageCaptureResult_fromRequest___block_invoke_2;
  block[3] = &unk_263FA0A60;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v6;
  id v13 = v4;
  id v14 = v3;
  id v7 = v3;
  id v8 = v4;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __92__CAMCameraViewController_captureController_didGenerateStillImageCaptureResult_fromRequest___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) error];
  [*(id *)(a1 + 40) _notifyCaptureDelegateOfCompletedCaptureOfPhoto:*(void *)(a1 + 48) withProperties:*(void *)(a1 + 56) error:v2];
}

- (id)_behaviorDefinedDestinationURLForRequest:(id)a3 withLocalDestinationURL:(id)a4 linkedDestinationURL:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [v9 persistenceOptions];
  unint64_t v11 = [v9 temporaryPersistenceOptions];

  if ((unint64_t)(v10 - 1) <= 1)
  {
    uint64_t v12 = v7;
    if (v11 < 2)
    {
LABEL_5:
      id v13 = v12;
      goto LABEL_7;
    }
    if (v11 == 2)
    {
      uint64_t v12 = v8;
      goto LABEL_5;
    }
  }
  id v13 = 0;
LABEL_7:

  return v13;
}

- (void)persistenceController:(id)a3 didGenerateStillImageLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (![v11 conformsToProtocol:&unk_26BE66598]
    || ([v11 timelapseIdentifier],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        !v12))
  {
    BOOL v13 = [(CAMCameraViewController *)self isDisablingMultipleCaptureFeatures];
    BOOL v14 = [(CAMCameraViewController *)self isRecording];
    if (!v13 || !v14)
    {
      if ([v11 type]) {
        id v15 = 0;
      }
      else {
        id v15 = v11;
      }
      id v16 = v15;
      $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = [v9 localDestinationURL];
      id v18 = [v9 linkedDestinationURL];
      v36 = [(CAMCameraViewController *)self _behaviorDefinedDestinationURLForRequest:v11 withLocalDestinationURL:v17 linkedDestinationURL:v18];

      uint64_t v33 = [v11 captureMode];
      uint64_t v32 = [v11 captureOrientation];
      int64_t v31 = +[CAMOrientationUtilities imageOrientationOfResult:withCaptureDevice:captureOrientation:](CAMOrientationUtilities, "imageOrientationOfResult:withCaptureDevice:captureOrientation:", v10, [v11 captureDevice], objc_msgSend(v11, "captureOrientation"));
      uint64_t v19 = [v9 localPersistenceUUID];
      char v30 = [v11 shouldPersistToIncomingDirectory];
      v35 = (void *)v19;
      if ([v16 hasAdjustments])
      {
        uint64_t v20 = [v16 adjustmentFilters];
        BOOL v29 = [v20 count] == 0;
      }
      else
      {
        BOOL v29 = 0;
      }
      v37 = v16;
      uint64_t v21 = [v10 stillImageFilteredPreviewSurface];
      if (!v21) {
        uint64_t v21 = [v10 stillImageUnfilteredPreviewSurface];
      }
      id v22 = [v10 coordinationInfo];
      uint64_t v23 = [v22 resultSpecifiers];
      id v24 = [v22 allExpectedResultSpecifiers];
      id v25 = [(CAMCameraViewController *)self _resultProcessingQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke;
      block[3] = &unk_263FA7260;
      void block[4] = self;
      id v39 = v36;
      id v40 = v35;
      uint64_t v47 = v32;
      uint64_t v48 = v21;
      int64_t v49 = v31;
      uint64_t v46 = v33;
      char v51 = v30;
      id v41 = v10;
      id v42 = v37;
      id v43 = v11;
      BOOL v52 = v29;
      uint64_t v50 = v23;
      id v44 = v9;
      id v45 = v24;
      BOOL v53 = v13;
      id v34 = v24;
      id v26 = v37;
      id v27 = v35;
      id v28 = v36;
      dispatch_async(v25, block);
    }
  }
}

void __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  LOBYTE(v45) = *(unsigned char *)(a1 + 136);
  id v2 = [*(id *)(a1 + 32) _clientPropertiesForStillImageWithURL:*(void *)(a1 + 40) captureMode:*(void *)(a1 + 96) captureOrientation:*(void *)(a1 + 104) previewSurface:*(void *)(a1 + 112) previewOrientation:*(void *)(a1 + 120) uniqueIdentifier:*(void *)(a1 + 48) savedToPhotoLibrary:v45 captureResult:*(void *)(a1 + 56)];
  id v3 = [*(id *)(a1 + 32) _exportPropertiesForClientProperties:v2];
  if ([*(id *)(a1 + 64) wantsSemanticSceneFilter])
  {
    id v4 = (void *)MEMORY[0x263F5DEF8];
    id v5 = [*(id *)(a1 + 56) capturePhoto];
    uint64_t v6 = [v5 privateClientMetadata];
    id v63 = 0;
    id v7 = [v4 deserializedMetadataFromPrivateClientMetadata:v6 error:&v63];
    id v8 = v63;

    if (v8)
    {
      id v9 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_cold_1(a1, (uint64_t)v8, v9);
      }
    }
    uint64_t v10 = [MEMORY[0x263F5DF78] semanticEnhanceSceneForCameraMetadata:v7 ignoreCameraSetting:1];
    double v12 = v11;
    [v7 setSemanticEnhanceScene:v10];
    [v7 setSemanticEnhanceSceneConfidence:v12];
    BOOL v13 = (unint64_t)(v10 - 1) < 0xFFFFFFFFFFFFFFFELL;
    BOOL v14 = (void *)MEMORY[0x263F5D928];
    id v15 = [*(id *)(a1 + 80) adjustmentsData];
    id v16 = [v14 assetAdjustmentsFromCameraAdjustmentData:v15 cameraMetadata:v7 exportProperties:v3 applySemanticEnhance:v13 assetType:0];
  }
  else
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v17 = (void *)MEMORY[0x263F5D928];
    id v18 = [*(id *)(a1 + 80) adjustmentsData];
    id v16 = [v17 assetAdjustmentsFromCameraAdjustmentData:v18 exportProperties:v3];

    LODWORD(v13) = 0;
  }
  uint64_t v19 = [*(id *)(a1 + 56) isExpectingPairedVideo];
  if (*(unsigned char *)(a1 + 137)) {
    int v20 = 1;
  }
  else {
    int v20 = v13;
  }
  if (!v16) {
    int v20 = 0;
  }
  int v21 = v20 & v19 ^ 1;
  if (!*(unsigned char *)(a1 + 137)) {
    int v21 = 1;
  }
  int v22 = v20 & v21;
  if (*(unsigned char *)(a1 + 137)) {
    char v23 = 0;
  }
  else {
    char v23 = v20;
  }
  uint64_t v24 = *(void *)(a1 + 128);
  if (v23)
  {
    uint64_t v25 = 0;
    char v26 = 1;
  }
  else
  {
    char v26 = 0;
    v24 |= 2uLL;
    uint64_t v25 = v20 & v21;
  }
  id v27 = objc_msgSend(*(id *)(a1 + 32), "_resultQueue_getOrCreateStillImageResultCoordinatorForRequest:captureTimeExpectedResultSpecifiers:isExpectingPairedVideo:isDisablingMultipleCaptures:isGeneratingFilteredMedia:", *(void *)(a1 + 72), *(void *)(a1 + 88), v19, *(unsigned __int8 *)(a1 + 138), v25);
  id v28 = v27;
  if ((v23 & 1) == 0) {
    [v27 updatePhotoProperties:v2 assetAdjustments:v16 forResultSpecifiers:*(void *)(a1 + 128)];
  }
  if (v22)
  {
    char v50 = v26;
    char v51 = v3;
    BOOL v52 = v2;
    BOOL v29 = [*(id *)(a1 + 72) persistenceUUID];
    uint64_t v30 = *(void *)(a1 + 128);
    if ((v30 & 2) != 0)
    {
      int64_t v31 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if ((v30 & 1) == 0)
      {
LABEL_29:
        if (![(__CFString *)v31 length])
        {

          int64_t v31 = @"None";
        }
        uint64_t v33 = [NSString stringWithFormat:@"persistenceUUID %@; %@ still image", v29, v31];
        id v34 = (void *)*MEMORY[0x263F5DBF8];
        v35 = [*(id *)(a1 + 40) pathExtension];
        uint64_t v36 = [v34 stringByAppendingPathExtension:v35];

        v37 = [*(id *)(a1 + 40) URLByDeletingPathExtension];
        uint64_t v48 = (void *)v36;
        v38 = [v37 URLByAppendingPathExtension:v36];

        uint64_t v47 = [getPAMediaConversionServiceResourceURLCollectionClass() collectionWithMainResourceURL:*(void *)(a1 + 40)];
        uint64_t v46 = [getPAMediaConversionServiceResourceURLCollectionClass() collectionWithMainResourceURL:v38];
        int64_t v49 = (void *)v33;
        id v39 = [*(id *)(a1 + 32) _mediaConversionOptionsForAdjustments:v16 mediaType:1 description:v33];
        id v40 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          unint64_t v65 = v29;
          __int16 v66 = 2114;
          v67 = v31;
          _os_log_impl(&dword_2099F8000, v40, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Rendering image for specifier %{public}@", buf, 0x16u);
        }

        [v28 delayForcedDispatchForPhotoResultSpecifiers:v24];
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        id v42 = [*(id *)(a1 + 32) _imageConversionClient];
        v53[0] = MEMORY[0x263EF8330];
        v53[1] = 3221225472;
        v53[2] = __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_174;
        v53[3] = &unk_263FA7238;
        CFAbsoluteTime v59 = Current;
        v53[4] = *(void *)(a1 + 32);
        id v54 = v29;
        id v55 = v38;
        uint64_t v60 = *(void *)(a1 + 128);
        id v2 = v52;
        id v56 = v52;
        char v62 = v50;
        id v57 = v16;
        id v58 = v28;
        uint64_t v61 = v24;
        id v43 = v38;
        id v44 = v29;
        [v42 convertImageAtSourceURLCollection:v47 toDestinationURLCollection:v46 options:v39 completionHandler:v53];

        id v3 = v51;
        goto LABEL_34;
      }
    }
    else
    {
      int64_t v31 = &stru_26BD78BA0;
      if ((v30 & 1) == 0) {
        goto LABEL_29;
      }
    }
    uint64_t v32 = [(__CFString *)v31 stringByAppendingString:@"HDR"];

    int64_t v31 = (__CFString *)v32;
    goto LABEL_29;
  }
LABEL_34:
}

void __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_174(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  CFAbsoluteTime v9 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 80);
  uint64_t v10 = [*(id *)(a1 + 32) _resultProcessingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_2;
  block[3] = &unk_263FA7210;
  id v18 = v8;
  uint64_t v26 = a2;
  id v19 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  uint64_t v27 = *(void *)(a1 + 88);
  CFAbsoluteTime v28 = v9;
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v11;
  uint64_t v21 = v12;
  id v22 = *(id *)(a1 + 56);
  id v23 = v7;
  char v30 = *(unsigned char *)(a1 + 104);
  id v24 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 96);
  id v25 = v13;
  uint64_t v29 = v14;
  id v15 = v7;
  id v16 = v8;
  dispatch_async(v10, block);
}

void __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32) && *(void *)(a1 + 96) == 1)
  {
    id v2 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    uint64_t v3 = *(void *)(a1 + 40);
    uint64_t v4 = *(void *)(a1 + 104);
    if ((v4 & 2) != 0)
    {
      id v5 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if ((v4 & 1) == 0)
      {
LABEL_15:
        if (![(__CFString *)v5 length])
        {

          id v5 = @"None";
        }
        uint64_t v9 = *(void *)(a1 + 112);
        int v10 = 138543874;
        uint64_t v11 = v3;
        __int16 v12 = 2114;
        id v13 = v5;
        __int16 v14 = 2048;
        uint64_t v15 = v9;
        _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Finished rendering image for specifier %{public}@ (took %.3f seconds)", (uint8_t *)&v10, 0x20u);

        goto LABEL_9;
      }
    }
    else
    {
      id v5 = &stru_26BD78BA0;
      if ((v4 & 1) == 0) {
        goto LABEL_15;
      }
    }
    uint64_t v8 = [(__CFString *)v5 stringByAppendingString:@"HDR"];

    id v5 = (__CFString *)v8;
    goto LABEL_15;
  }
  id v2 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_2_cold_1(a1);
  }
LABEL_9:

  uint64_t v6 = [*(id *)(a1 + 56) _clientPropertiesForPhotoProperties:*(void *)(a1 + 64) withFilteredImageURL:*(void *)(a1 + 48) conversionOutputInfo:*(void *)(a1 + 72) error:*(void *)(a1 + 32)];
  if (*(unsigned char *)(a1 + 128)) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = *(void *)(a1 + 80);
  }
  [*(id *)(a1 + 88) updatePhotoProperties:v6 assetAdjustments:v7 forResultSpecifiers:*(void *)(a1 + 120)];
}

- (void)persistenceController:(id)a3 didGenerateVideoLocalPersistenceResult:(id)a4 forCaptureResult:(id)a5 fromRequest:(id)a6
{
  id v13 = a4;
  id v9 = a5;
  id v10 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  id v12 = v11;
  if ([v12 isCTMVideo])
  {
    [(CAMCameraViewController *)self _handleCTMVideoLocalPersistenceResult:v13 forCaptureResult:v9 fromRequest:v12];
  }
  else if (v12)
  {
    [(CAMCameraViewController *)self _handleLivePhotoVideoLocalPersistenceResult:v13 forCaptureResult:v9 fromRequest:v12];
  }
  else
  {
    [(CAMCameraViewController *)self _handleVideoLocalPersistenceResult:v13 forCaptureResult:v9 fromRequest:v10];
  }
}

- (void)_handleLivePhotoVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 coordinationInfo];
  uint64_t v12 = [v11 resultSpecifiers];
  id v13 = [v11 allExpectedResultSpecifiers];
  BOOL v14 = [(CAMCameraViewController *)self isDisablingMultipleCaptureFeatures];
  uint64_t v15 = [(CAMCameraViewController *)self _resultProcessingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__CAMCameraViewController__handleLivePhotoVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke;
  block[3] = &unk_263FA7288;
  void block[4] = self;
  id v21 = v10;
  BOOL v26 = v14;
  id v22 = v13;
  id v23 = v8;
  id v24 = v9;
  uint64_t v25 = v12;
  id v16 = v9;
  id v17 = v8;
  id v18 = v13;
  id v19 = v10;
  dispatch_async(v15, block);
}

void __100__CAMCameraViewController__handleLivePhotoVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "_resultQueue_getOrCreateStillImageResultCoordinatorForRequest:captureTimeExpectedResultSpecifiers:isExpectingPairedVideo:isDisablingMultipleCaptures:isGeneratingFilteredMedia:", *(void *)(a1 + 40), *(void *)(a1 + 48), 1, *(unsigned __int8 *)(a1 + 80), 0);
  uint64_t v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 56) localDestinationURL];
  uint64_t v6 = [*(id *)(a1 + 56) linkedDestinationURL];
  uint64_t v7 = [v3 _behaviorDefinedDestinationURLForRequest:v4 withLocalDestinationURL:v5 linkedDestinationURL:v6];

  long long v21 = 0uLL;
  uint64_t v22 = 0;
  id v8 = *(void **)(a1 + 56);
  if (v8 && ([v8 duration], id v9 = *(void **)(a1 + 56), v19 = 0uLL, v20 = 0, v9))
  {
    [v9 stillDisplayTime];
  }
  else
  {
    long long v19 = 0uLL;
    uint64_t v20 = 0;
  }
  id v10 = *(void **)(a1 + 32);
  uint64_t v11 = [*(id *)(a1 + 64) error];
  long long v17 = v21;
  uint64_t v18 = v22;
  long long v15 = v19;
  uint64_t v16 = v20;
  uint64_t v12 = [v10 _clientPropertiesForLivePhotoVideoURL:v7 duration:&v17 stillDisplayTime:&v15 error:v11];

  id v13 = [*(id *)(a1 + 40) adjustmentFilters];
  BOOL v14 = +[CAMEffectFilterManager isDepthEffectInFilters:v13];

  [v2 updateVideoProperties:v12 forResultSpecifiers:*(void *)(a1 + 72) wantsDepthRenderedForStill:v14];
}

- (void)_handleCTMVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 localDestinationURL];
  uint64_t v12 = [v8 linkedDestinationURL];
  id v13 = [(CAMCameraViewController *)self _behaviorDefinedDestinationURLForRequest:v10 withLocalDestinationURL:v11 linkedDestinationURL:v12];

  if ([v10 hasAdjustments])
  {
    BOOL v14 = [v8 adjustmentsData];
    BOOL v15 = v14 != 0;
  }
  else
  {
    BOOL v15 = 0;
  }
  uint64_t v16 = [(CAMCameraViewController *)self _resultProcessingQueue];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __94__CAMCameraViewController__handleCTMVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke;
  v21[3] = &unk_263FA72D8;
  id v22 = v10;
  id v23 = v9;
  BOOL v27 = v15;
  id v24 = v8;
  id v25 = v13;
  BOOL v26 = self;
  id v17 = v13;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  dispatch_async(v16, v21);
}

void __94__CAMCameraViewController__handleCTMVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  +[CAMOrientationUtilities videoTrackOrientationForVideoRequest:*(void *)(a1 + 32)];
  int v2 = PLExifOrientationFromImageOrientation();
  [*(id *)(a1 + 40) dimensions];
  CAMSizeForDimensions();
  double v4 = v3;
  double v6 = v5;
  if (*(unsigned char *)(a1 + 72))
  {
    uint64_t v7 = [*(id *)(a1 + 32) persistenceUUID];
    id v8 = [NSString stringWithFormat:@"persistenceUUID %@; CTM Video", v7];
    id v9 = (void *)MEMORY[0x263F5D978];
    id v10 = *(void **)(a1 + 48);
    if (v10) {
      [v10 duration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    uint64_t v16 = [v9 exportPropertiesWithImageWidth:(unint64_t)v4 imageHeight:(unint64_t)v6 exifOrientation:v2 duration:CMTimeGetSeconds(&time)];
    id v17 = (void *)MEMORY[0x263F5D928];
    id v18 = [*(id *)(a1 + 48) adjustmentsData];
    id v19 = [v17 assetAdjustmentsFromCameraAdjustmentData:v18 exportProperties:v16];

    id v20 = NSURL;
    long long v21 = (void *)MEMORY[0x263F5DB30];
    id v22 = [*(id *)(a1 + 56) path];
    id v23 = [v21 filteredVideoPathForRecordedLivePhotoVideoPath:v22];
    id v24 = [v20 fileURLWithPath:v23];

    id v25 = [*(id *)(a1 + 64) _mediaConversionOptionsForAdjustments:v19 mediaType:2 description:v8];
    BOOL v26 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v46 = v7;
      _os_log_impl(&dword_2099F8000, v26, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Rendering CTM video", buf, 0xCu);
    }

    BOOL v27 = [*(id *)(a1 + 64) _videoConversionClient];
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __94__CAMCameraViewController__handleCTMVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_183;
    v33[3] = &unk_263FA72B0;
    id v34 = v7;
    id v35 = v24;
    uint64_t v28 = *(void *)(a1 + 56);
    uint64_t v36 = *(void *)(a1 + 64);
    id v37 = *(id *)(a1 + 48);
    id v38 = *(id *)(a1 + 40);
    id v39 = *(id *)(a1 + 32);
    double v42 = v4;
    double v43 = v6;
    id v40 = *(id *)(a1 + 56);
    id v41 = v19;
    id v29 = v19;
    id v30 = v24;
    id v31 = v7;
    id v32 = (id)[v27 convertVideoAtSourceURL:v28 toDestinationURL:v30 options:v25 completionHandler:v33];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 56);
    uint64_t v11 = *(void **)(a1 + 64);
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v15 = *(void *)(a1 + 48);
    objc_msgSend(v11, "_handleCTMVideoLocalPersistenceResult:forCaptureResult:fromRequest:size:videoURL:renderedToURL:renderedAdjustments:", v15, v13, v14, v12, 0, 0);
  }
}

void __94__CAMCameraViewController__handleCTMVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_183(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = os_log_create("com.apple.camera", "Camera");
  id v10 = v9;
  if (a2 != 1 || v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = *(void *)(a1 + 32);
      id v20 = CAMPAMediaConversionNameForJobStatus(a2);
      uint64_t v21 = *(void *)(a1 + 40);
      int v22 = 138544130;
      uint64_t v23 = v19;
      __int16 v24 = 2114;
      id v25 = v20;
      __int16 v26 = 2114;
      uint64_t v27 = v21;
      __int16 v28 = 2114;
      id v29 = v8;
      _os_log_error_impl(&dword_2099F8000, v10, OS_LOG_TYPE_ERROR, "CVC %{public}@: Media conversion status %{public}@ writing filtered video at %{public}@ -- %{public}@", (uint8_t *)&v22, 0x2Au);
    }
    objc_msgSend(*(id *)(a1 + 48), "_handleCTMVideoLocalPersistenceResult:forCaptureResult:fromRequest:size:videoURL:renderedToURL:renderedAdjustments:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), 0, 0, *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v22 = 138543362;
      uint64_t v23 = v11;
      _os_log_impl(&dword_2099F8000, v10, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Finished rendering CTM video", (uint8_t *)&v22, 0xCu);
    }

    uint64_t v12 = getPAMediaConversionServicePixelWidthKey();
    uint64_t v13 = [v7 objectForKeyedSubscript:v12];

    uint64_t v14 = getPAMediaConversionServicePixelHeightKey();
    uint64_t v15 = [v7 objectForKeyedSubscript:v14];

    [v13 doubleValue];
    double v17 = v16;
    [v15 doubleValue];
    objc_msgSend(*(id *)(a1 + 48), "_handleCTMVideoLocalPersistenceResult:forCaptureResult:fromRequest:size:videoURL:renderedToURL:renderedAdjustments:", *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 40), *(void *)(a1 + 88), v17, v18);
  }
}

- (void)_handleCTMVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5 size:(CGSize)a6 videoURL:(id)a7 renderedToURL:(id)a8 renderedAdjustments:(id)a9
{
  double height = a6.height;
  double width = a6.width;
  id v17 = a3;
  id v31 = a4;
  id v18 = a5;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  if (v17) {
    [v17 duration];
  }
  else {
    memset(v32, 0, sizeof(v32));
  }
  int v22 = [v17 creationDate];
  uint64_t v23 = [v18 captureOrientation];
  int64_t v24 = +[CAMOrientationUtilities imageOrientationForVideoRequest:v18];
  id v25 = [v17 localPersistenceUUID];
  LOBYTE(v30) = [v18 shouldPersistToIncomingDirectory];
  __int16 v26 = -[CAMCameraViewController _clientPropertiesForVideoURL:renderedURL:duration:size:creationDate:captureOrientation:previewOrientation:adjustments:uniqueIdentifier:savedToPhotoLibrary:](self, "_clientPropertiesForVideoURL:renderedURL:duration:size:creationDate:captureOrientation:previewOrientation:adjustments:uniqueIdentifier:savedToPhotoLibrary:", v19, v20, v32, v22, v23, v24, width, height, v21, v25, v30);

  if (v20) {
    id v27 = v20;
  }
  else {
    id v27 = v19;
  }
  __int16 v28 = [MEMORY[0x263EFA8D0] assetWithURL:v27];
  id v29 = [v31 error];
  [(CAMCameraViewController *)self _notifyCaptureDelegateOfCompletedCaptureOfVideo:v28 withProperties:v26 error:v29];
}

- (void)_handleVideoLocalPersistenceResult:(id)a3 forCaptureResult:(id)a4 fromRequest:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8)
  {
    uint64_t v11 = [v8 localDestinationURL];
    uint64_t v12 = [v8 linkedDestinationURL];
    uint64_t v13 = [(CAMCameraViewController *)self _behaviorDefinedDestinationURLForRequest:v10 withLocalDestinationURL:v11 linkedDestinationURL:v12];

    memset(buf, 0, sizeof(buf));
    uint64_t v38 = 0;
    [v8 duration];
    uint64_t v14 = [v8 creationDate];
    uint64_t v24 = [v10 captureOrientation];
    uint64_t v15 = [v8 localPersistenceUUID];
    char v16 = [v10 shouldPersistToIncomingDirectory];
    id v17 = v9;
    BOOL v18 = [v10 captureMode] == 2;
    id v19 = [(CAMCameraViewController *)self _resultProcessingQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __91__CAMCameraViewController__handleVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke;
    block[3] = &unk_263FA7300;
    id v26 = v13;
    BOOL v35 = v18;
    id v9 = v17;
    long long v33 = *(_OWORD *)buf;
    uint64_t v34 = v38;
    id v27 = v10;
    __int16 v28 = self;
    uint64_t v32 = v24;
    id v29 = v14;
    id v30 = v15;
    char v36 = v16;
    id v31 = v17;
    id v20 = v15;
    id v21 = v14;
    id v22 = v13;
    dispatch_async(v19, block);
  }
  else
  {
    uint64_t v23 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v23, OS_LOG_TYPE_DEFAULT, "Received nil for CAMVideoLocalPersistenceResult, possibly due to nebulad timeout", buf, 2u);
    }
  }
}

void __91__CAMCameraViewController__handleVideoLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke(uint64_t a1)
{
  int v2 = [MEMORY[0x263EFA8D0] assetWithURL:*(void *)(a1 + 32)];
  double v3 = [v2 tracksWithMediaType:*MEMORY[0x263EF9D48]];
  double v4 = [v3 firstObject];
  [v4 naturalSize];
  double v6 = v5;
  double v8 = v7;
  if (v4)
  {
    [v4 preferredTransform];
    double v9 = *((double *)&v37 + 1);
    double v10 = *(double *)&v37;
    double v11 = *((double *)&v38 + 1);
    double v12 = *(double *)&v38;
  }
  else
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v37 = 0u;
    double v11 = 0.0;
    double v9 = 0.0;
    double v12 = 0.0;
    double v10 = 0.0;
  }
  v40.size.double width = v8 * v12 + v10 * v6;
  v40.size.double height = v8 * v11 + v9 * v6;
  v40.origin.x = 0.0;
  v40.origin.y = 0.0;
  CGRect v41 = CGRectStandardize(v40);
  double width = v41.size.width;
  double height = v41.size.height;
  uint64_t v15 = (void *)MEMORY[0x263F5DFA8];
  objc_msgSend(v4, "nominalFrameRate", v41.origin.x, v41.origin.y);
  objc_msgSend(v15, "defaultSlowMotionRateForNominalFrameRate:");
  id v17 = 0;
  if (*(unsigned char *)(a1 + 112))
  {
    float v18 = v16;
    if (v16 > 0.0 && v16 < 1.0)
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v34 = 0u;
      long long v31 = *(_OWORD *)(a1 + 88);
      *(void *)&long long v32 = *(void *)(a1 + 104);
      [MEMORY[0x263F5DFA8] defaultSlowMotionTimeRangeForDuration:&v31];
      id v20 = objc_alloc(MEMORY[0x263F5DFA8]);
      long long v31 = v34;
      long long v32 = v35;
      long long v33 = v36;
      id v17 = objc_msgSend(v20, "initWithSlowMotionTimeRange:rate:", &v31, COERCE_DOUBLE(__PAIR64__(DWORD1(v36), LODWORD(v18))));
    }
  }
  int64_t v21 = +[CAMOrientationUtilities imageOrientationForVideoRequest:*(void *)(a1 + 40)];
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = *(void **)(a1 + 48);
  uint64_t v24 = *(void *)(a1 + 56);
  uint64_t v25 = *(void *)(a1 + 80);
  uint64_t v26 = *(void *)(a1 + 64);
  char v27 = *(unsigned char *)(a1 + 113);
  long long v34 = *(_OWORD *)(a1 + 88);
  *(void *)&long long v35 = *(void *)(a1 + 104);
  LOBYTE(v30) = v27;
  __int16 v28 = objc_msgSend(v23, "_clientPropertiesForVideoURL:renderedURL:duration:size:creationDate:captureOrientation:previewOrientation:adjustments:uniqueIdentifier:savedToPhotoLibrary:", v22, 0, &v34, v24, v25, v21, width, height, v17, v26, v30);
  id v29 = [*(id *)(a1 + 72) error];
  [*(id *)(a1 + 48) _notifyCaptureDelegateOfCompletedCaptureOfVideo:v2 withProperties:v28 error:v29];
}

- (void)persistenceController:(id)a3 didCompleteAllLocalPersistenceForRequest:(id)a4
{
  id v5 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    double v7 = [(CAMCameraViewController *)self _resultProcessingQueue];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __90__CAMCameraViewController_persistenceController_didCompleteAllLocalPersistenceForRequest___block_invoke;
    v9[3] = &unk_263FA0408;
    v9[4] = self;
    id v10 = v6;
    id v8 = v6;
    dispatch_async(v7, v9);
  }
}

uint64_t __90__CAMCameraViewController_persistenceController_didCompleteAllLocalPersistenceForRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resultQueue_forceCompletionIfPossibleForRequest:", *(void *)(a1 + 40));
}

- (void)_resultQueue_forceCompletionIfPossibleForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCameraViewController *)self _resultProcessingQueue];
  dispatch_assert_queue_V2(v5);

  if (([v4 isCTMVideo] & 1) == 0)
  {
    id v6 = [(CAMCameraViewController *)self _resultQueue_getStillImageResultCoordinatorForRequest:v4];
    double v7 = v6;
    if (v6)
    {
      [v6 forceRemainingDispatchesIfPossible];
      id v8 = [v7 identifier];
      [(CAMCameraViewController *)self _resultQueue_removeStillImageResultCoordinatorForIdentifier:v8];
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __76__CAMCameraViewController__resultQueue_forceCompletionIfPossibleForRequest___block_invoke;
      block[3] = &unk_263FA0208;
      void block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __76__CAMCameraViewController__resultQueue_forceCompletionIfPossibleForRequest___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F08320];
  v5[0] = @"Capture failed";
  int v2 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
  double v3 = [MEMORY[0x263F087E8] errorWithDomain:@"CAMCameraViewControllerErrorDomain" code:0 userInfo:v2];
  [*(id *)(a1 + 32) _notifyCaptureDelegateOfCompletedCaptureOfPhoto:0 withProperties:0 error:v3];
}

- (id)_resultQueue_getOrCreateStillImageResultCoordinatorForRequest:(id)a3 captureTimeExpectedResultSpecifiers:(id)a4 isExpectingPairedVideo:(BOOL)a5 isDisablingMultipleCaptures:(BOOL)a6 isGeneratingFilteredMedia:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  uint64_t v9 = a5;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = [(CAMCameraViewController *)self _resultProcessingQueue];
  dispatch_assert_queue_V2(v14);

  uint64_t v15 = [v12 persistenceUUID];
  float v16 = [(CAMCameraViewController *)self _resultQueueStillImageResultCoordinators];
  id v17 = [v16 objectForKeyedSubscript:v15];
  if (!v17)
  {
    id v18 = v13;
    id v19 = v18;
    if (v7)
    {
      BOOL v29 = v8;
      unsigned int v30 = v9;
      id v31 = v12;
      id v20 = (void *)[v18 mutableCopy];
      long long v32 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v21 = v19;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v33 != v24) {
              objc_enumerationMutation(v21);
            }
            uint64_t v26 = [*(id *)(*((void *)&v32 + 1) + 8 * i) unsignedIntegerValue];
            char v27 = [NSNumber numberWithUnsignedInteger:v26 | 2];
            [v20 addObject:v27];
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v32 objects:v36 count:16];
        }
        while (v23);
      }

      id v12 = v31;
      BOOL v8 = v29;
      uint64_t v9 = v30;
    }
    else
    {
      id v20 = v18;
    }
    id v17 = [[CAMCVCStillImageResultCoordinator alloc] initWithDelegate:self identifier:v15 allExpectedResultSpecifiers:v20 isExpectingPairedVideo:v9 allowMultipleCaptures:!v8 shouldReturnFilteredPhotosAsSingleAsset:1];
    [v16 setObject:v17 forKeyedSubscript:v15];
  }
  return v17;
}

- (id)_resultQueue_getStillImageResultCoordinatorForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCameraViewController *)self _resultProcessingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [v4 persistenceUUID];

  BOOL v7 = [(CAMCameraViewController *)self _resultQueueStillImageResultCoordinators];
  BOOL v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (void)_resultQueue_removeStillImageResultCoordinatorForIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCameraViewController *)self _resultProcessingQueue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CAMCameraViewController *)self _resultQueueStillImageResultCoordinators];
  [v6 setObject:0 forKeyedSubscript:v4];
}

- (void)stillImagePersistenceCoordinator:(id)a3 requestsDispatchForResultSpecifiers:(unint64_t)a4 photoProperties:(id)a5 videoProperties:(id)a6 unfilteredPhotoProperties:(id)a7 unfilteredVideoProperties:(id)a8 assetAdjustments:(id)a9 error:(id)a10
{
  id v26 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a10;
  id v21 = a9;
  uint64_t v22 = [(CAMCameraViewController *)self _resultProcessingQueue];
  dispatch_assert_queue_V2(v22);

  uint64_t v23 = [v26 isExpectingPairedVideo];
  if (v21 && v23)
  {
    if (v18) {
      id v24 = v18;
    }
    else {
      id v24 = v16;
    }
    if (v19) {
      id v25 = v19;
    }
    else {
      id v25 = v17;
    }
    -[CAMCameraViewController _renderLivePhotoWithCoordinator:specifiers:photoProperties:videoProperties:adjustments:](self, "_renderLivePhotoWithCoordinator:specifiers:photoProperties:videoProperties:adjustments:", v26, a4, v24, v25, v21, v23);
  }
  else
  {
    [(CAMCameraViewController *)self _handlePhotoProperties:v16 videoProperties:v17 unfilteredPhotoProperties:v18 unfilteredVideoProperties:v19 assetAdjustments:v21 attemptPairingVideo:v23 error:v20];
  }
}

- (void)_handlePhotoProperties:(id)a3 videoProperties:(id)a4 unfilteredPhotoProperties:(id)a5 unfilteredVideoProperties:(id)a6 assetAdjustments:(id)a7 attemptPairingVideo:(BOOL)a8 error:(id)a9
{
  BOOL v9 = a8;
  v55[2] = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v40 = a6;
  id v17 = a9;
  id v18 = a7;
  id v19 = a5;
  id v20 = [(CAMCameraViewController *)self _resultProcessingQueue];
  dispatch_assert_queue_V2(v20);

  id v21 = [v15 objectForKeyedSubscript:@"CAMCameraViewControllerPhotoURL"];
  CGRect v41 = [v16 objectForKeyedSubscript:@"CAMCameraViewControllerVideoURL"];
  uint64_t v22 = (void *)[v15 mutableCopy];
  uint64_t v23 = [v19 objectForKeyedSubscript:@"CAMCameraViewControllerPhotoURL"];

  [v22 setObject:v23 forKeyedSubscript:@"CAMCameraViewControllerUnadjustedPhotoURL"];
  [v22 setObject:v18 forKeyedSubscript:@"CAMCameraViewControllerAdjustments"];

  if (v9)
  {
    if (v21 && v41)
    {
      id v24 = [v16 objectForKeyedSubscript:@"CAMCameraViewControllerLivePhotoStillDisplayTime"];
      memset(buf, 0, sizeof(buf));
      uint64_t v52 = 0;
      id v25 = (long long *)MEMORY[0x263F01090];
      long long v39 = v24;
      if (v24)
      {
        [v24 CMTimeValue];
      }
      else
      {
        *(_OWORD *)buf = *MEMORY[0x263F01090];
        uint64_t v52 = *(void *)(MEMORY[0x263F01090] + 16);
      }
      double Current = CFAbsoluteTimeGetCurrent();
      BOOL v29 = (void *)MEMORY[0x263F14E50];
      v55[0] = v21;
      v55[1] = v41;
      unsigned int v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
      long long v53 = *v25;
      uint64_t v54 = *((void *)v25 + 2);
      long long v48 = *(_OWORD *)buf;
      uint64_t v49 = v52;
      id v50 = 0;
      id v26 = [v29 livePhotoWithResourceFileURLs:v30 pairingIdentifier:0 videoDuration:&v53 photoTime:&v48 error:&v50];
      id v31 = v50;

      double v32 = CFAbsoluteTimeGetCurrent();
      long long v33 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(v53) = 134217984;
        *(double *)((char *)&v53 + 4) = v32 - Current;
        _os_log_impl(&dword_2099F8000, v33, OS_LOG_TYPE_DEFAULT, "CAMCameraViewController: Finished loading live photo via livePhotoWithResourceFileURLs (took %.3f seconds)", (uint8_t *)&v53, 0xCu);
      }

      if (!v26 || v31)
      {
        long long v34 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          LODWORD(v53) = 138543362;
          *(void *)((char *)&v53 + 4) = v31;
          _os_log_impl(&dword_2099F8000, v34, OS_LOG_TYPE_DEFAULT, "CAMCameraViewController: attempted to create a live photo but failed – falling back to a normal photo (%{public}@)", (uint8_t *)&v53, 0xCu);
        }
      }
      else
      {
        [v22 addEntriesFromDictionary:v16];
        long long v34 = [v40 objectForKeyedSubscript:@"CAMCameraViewControllerVideoURL"];
        [v22 setObject:v34 forKeyedSubscript:@"CAMCameraViewControllerUnadjustedVideoURL"];
      }

      os_log_t v27 = v39;
LABEL_21:

      goto LABEL_22;
    }
    id v26 = 0;
    if (v21 && !v41)
    {
      os_log_t v27 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2099F8000, v27, OS_LOG_TYPE_DEFAULT, "CAMCameraViewController: missing video for live photo – falling back to a normal photo", buf, 2u);
      }
      id v26 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    id v26 = 0;
  }
LABEL_22:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __161__CAMCameraViewController__handlePhotoProperties_videoProperties_unfilteredPhotoProperties_unfilteredVideoProperties_assetAdjustments_attemptPairingVideo_error___block_invoke;
  block[3] = &unk_263FA5B28;
  id v43 = v26;
  id v44 = self;
  id v45 = v22;
  id v46 = v17;
  id v47 = v15;
  id v35 = v15;
  id v36 = v17;
  id v37 = v22;
  id v38 = v26;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __161__CAMCameraViewController__handlePhotoProperties_videoProperties_unfilteredPhotoProperties_unfilteredVideoProperties_assetAdjustments_attemptPairingVideo_error___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    int v2 = *(void **)(a1 + 40);
    objc_msgSend(v2, "_notifyCaptureDelegateOfCompletedCaptureOfLivePhoto:withProperties:error:");
  }
  else
  {
    id v3 = [*(id *)(a1 + 64) objectForKeyedSubscript:@"CAMCameraViewControllerPreviewImage"];
    [*(id *)(a1 + 40) _notifyCaptureDelegateOfCompletedCaptureOfPhoto:v3 withProperties:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
  }
}

- (PAImageConversionServiceClient)_imageConversionClient
{
  imageConversionClient = self->__imageConversionClient;
  if (!imageConversionClient)
  {
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getPAImageConversionServiceClientClass_softClass;
    uint64_t v13 = getPAImageConversionServiceClientClass_softClass;
    if (!getPAImageConversionServiceClientClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getPAImageConversionServiceClientClass_block_invoke;
      v9[3] = &unk_263FA0AB0;
      v9[4] = &v10;
      __getPAImageConversionServiceClientClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (PAImageConversionServiceClient *)objc_alloc_init(v5);
    BOOL v7 = self->__imageConversionClient;
    self->__imageConversionClient = v6;

    imageConversionClient = self->__imageConversionClient;
  }
  return imageConversionClient;
}

- (PAVideoConversionServiceClient)_videoConversionClient
{
  videoConversionClient = self->__videoConversionClient;
  if (!videoConversionClient)
  {
    uint64_t v10 = 0;
    double v11 = &v10;
    uint64_t v12 = 0x2050000000;
    id v4 = (void *)getPAVideoConversionServiceClientClass_softClass;
    uint64_t v13 = getPAVideoConversionServiceClientClass_softClass;
    if (!getPAVideoConversionServiceClientClass_softClass)
    {
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __getPAVideoConversionServiceClientClass_block_invoke;
      v9[3] = &unk_263FA0AB0;
      v9[4] = &v10;
      __getPAVideoConversionServiceClientClass_block_invoke((uint64_t)v9);
      id v4 = (void *)v11[3];
    }
    id v5 = v4;
    _Block_object_dispose(&v10, 8);
    id v6 = (PAVideoConversionServiceClient *)objc_alloc_init(v5);
    BOOL v7 = self->__videoConversionClient;
    self->__videoConversionClient = v6;

    videoConversionClient = self->__videoConversionClient;
  }
  return videoConversionClient;
}

- (id)_mediaConversionOptionsForAdjustments:(id)a3 mediaType:(int64_t)a4 description:(id)a5
{
  v56[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v36 = a5;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  BOOL v8 = (id *)getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_ptr;
  uint64_t v45 = getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    long long v39 = __getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_block_invoke;
    id v40 = &unk_263FA0AB0;
    CGRect v41 = &v42;
    BOOL v9 = (void *)MediaConversionServiceLibrary();
    v43[3] = (uint64_t)dlsym(v9, "PAMediaConversionServiceAdjustmentDataKey");
    getPAMediaConversionServiceAdjustmentDataKeySymbolLoc_ptr = *(void *)(v41[1] + 24);
    BOOL v8 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v8) {
    goto LABEL_24;
  }
  id v10 = *v8;
  v54[0] = v10;
  double v11 = [v7 adjustmentData];
  v56[0] = v11;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v12 = (id *)getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_ptr;
  uint64_t v45 = getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    long long v39 = __getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_block_invoke;
    id v40 = &unk_263FA0AB0;
    CGRect v41 = &v42;
    uint64_t v13 = (void *)MediaConversionServiceLibrary();
    v43[3] = (uint64_t)dlsym(v13, "PAMediaConversionServiceAdjustmentFormatIdentifierKey");
    getPAMediaConversionServiceAdjustmentFormatIdentifierKeySymbolLoc_ptr = *(void *)(v41[1] + 24);
    uint64_t v12 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v12) {
    goto LABEL_24;
  }
  id v14 = *v12;
  v54[1] = v14;
  id v15 = [v7 adjustmentFormatIdentifier];
  v56[1] = v15;
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  id v16 = (id *)getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_ptr;
  uint64_t v45 = getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_ptr;
  if (!getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_ptr)
  {
    uint64_t v37 = MEMORY[0x263EF8330];
    uint64_t v38 = 3221225472;
    long long v39 = __getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_block_invoke;
    id v40 = &unk_263FA0AB0;
    CGRect v41 = &v42;
    id v17 = (void *)MediaConversionServiceLibrary();
    v43[3] = (uint64_t)dlsym(v17, "PAMediaConversionServiceAdjustmentFormatVersionKey");
    getPAMediaConversionServiceAdjustmentFormatVersionKeySymbolLoc_ptr = *(void *)(v41[1] + 24);
    id v16 = (id *)v43[3];
  }
  _Block_object_dispose(&v42, 8);
  if (!v16)
  {
LABEL_24:
    -[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
    goto LABEL_26;
  }
  id v55 = *v16;
  id v18 = v55;
  id v19 = [v7 adjustmentFormatVersion];
  v56[2] = v19;
  id v35 = [NSDictionary dictionaryWithObjects:v56 forKeys:v54 count:3];

  if (a4 == 1)
  {
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x2050000000;
    os_log_t v27 = (void *)getPAMediaConversionServiceImageMetadataPolicyClass_softClass;
    uint64_t v45 = getPAMediaConversionServiceImageMetadataPolicyClass_softClass;
    if (!getPAMediaConversionServiceImageMetadataPolicyClass_softClass)
    {
      uint64_t v37 = MEMORY[0x263EF8330];
      uint64_t v38 = 3221225472;
      long long v39 = __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke;
      id v40 = &unk_263FA0AB0;
      CGRect v41 = &v42;
      __getPAMediaConversionServiceImageMetadataPolicyClass_block_invoke((uint64_t)&v37);
      os_log_t v27 = (void *)v43[3];
    }
    id v28 = v27;
    _Block_object_dispose(&v42, 8);
    id v20 = [v28 standardPolicy];
    id v21 = getPAMediaConversionServiceOptionAdjustmentInformationKey();
    v46[0] = v21;
    v51[0] = v35;
    uint64_t v22 = getPAMediaConversionServiceOptionApplyOrientationTransformKey();
    v46[1] = v22;
    v51[1] = MEMORY[0x263EFFA88];
    uint64_t v42 = 0;
    id v43 = &v42;
    uint64_t v44 = 0x2020000000;
    BOOL v29 = (id *)getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_ptr;
    uint64_t v45 = getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_ptr;
    if (!getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_ptr)
    {
      uint64_t v37 = MEMORY[0x263EF8330];
      uint64_t v38 = 3221225472;
      long long v39 = __getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_block_invoke;
      id v40 = &unk_263FA0AB0;
      CGRect v41 = &v42;
      unsigned int v30 = (void *)MediaConversionServiceLibrary();
      id v31 = dlsym(v30, "PAMediaConversionServiceOptionMetadataPolicyKey");
      *(void *)(v41[1] + 24) = v31;
      getPAMediaConversionServiceOptionMetadataPolicyKeySymbolLoc_ptr = *(void *)(v41[1] + 24);
      BOOL v29 = (id *)v43[3];
    }
    _Block_object_dispose(&v42, 8);
    if (v29)
    {
      id v47 = *v29;
      v51[2] = v20;
      id v23 = v47;
      id v24 = getPAMediaConversionServiceOptionRequestReasonKey();
      long long v48 = v24;
      id v25 = [NSString stringWithFormat:@"CAMCameraViewController: %@", v36];
      v51[3] = v25;
      double v32 = getPAMediaConversionServiceOptionJobPriorityKey();
      uint64_t v49 = v32;
      v51[4] = &unk_26BDDF0F0;
      long long v33 = getPAMediaConversionServiceOptionScaleFactorKey();
      id v50 = v33;
      v51[5] = &unk_26BDDF0D8;
      id v26 = [NSDictionary dictionaryWithObjects:v51 forKeys:v46 count:6];

      goto LABEL_19;
    }
    -[CAMImagePickerCameraViewController _handleCapturedImagePickerPhotoWithCropOverlayOutput:]();
LABEL_26:
    __break(1u);
  }
  if (a4 == 2)
  {
    id v20 = getPAMediaConversionServiceOptionAdjustmentInformationKey();
    v52[0] = v20;
    v53[0] = v35;
    id v21 = getPAMediaConversionServiceOptionApplyOrientationTransformKey();
    v52[1] = v21;
    v53[1] = MEMORY[0x263EFFA88];
    uint64_t v22 = getPAMediaConversionServiceOptionRequestReasonKey();
    v52[2] = v22;
    id v23 = [NSString stringWithFormat:@"CAMCameraViewController: %@", v36];
    v53[2] = v23;
    id v24 = getPAMediaConversionServiceOptionJobPriorityKey();
    v52[3] = v24;
    v53[3] = &unk_26BDDF0F0;
    id v25 = getPAMediaConversionServiceOptionScaleFactorKey();
    v52[4] = v25;
    v53[4] = &unk_26BDDF0D8;
    id v26 = [NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:5];
LABEL_19:

    goto LABEL_21;
  }
  id v26 = 0;
LABEL_21:

  return v26;
}

- (void)_renderLivePhotoWithCoordinator:(id)a3 specifiers:(unint64_t)a4 photoProperties:(id)a5 videoProperties:(id)a6 adjustments:(id)a7
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v50 = a7;
  id v15 = [(CAMCameraViewController *)self _resultProcessingQueue];
  dispatch_assert_queue_V2(v15);

  long long v53 = v13;
  id v16 = [v13 objectForKeyedSubscript:@"CAMCameraViewControllerPhotoURL"];
  id v17 = (void *)*MEMORY[0x263F5DBF8];
  id v18 = [v16 pathExtension];
  uint64_t v19 = [v17 stringByAppendingPathExtension:v18];

  id v20 = [v16 URLByDeletingPathExtension];
  id v56 = (void *)v19;
  uint64_t v21 = [v20 URLByAppendingPathExtension:v19];

  id v57 = v16;
  uint64_t v22 = [getPAMediaConversionServiceResourceURLCollectionClass() collectionWithMainResourceURL:v16];
  uint64_t v49 = (void *)v21;
  id v23 = [getPAMediaConversionServiceResourceURLCollectionClass() collectionWithMainResourceURL:v21];
  uint64_t v52 = v14;
  id v24 = [v14 objectForKeyedSubscript:@"CAMCameraViewControllerVideoURL"];
  uint64_t v54 = v24;
  id v55 = v22;
  if (v24)
  {
    id v25 = NSURL;
    id v26 = (void *)MEMORY[0x263F5DB30];
    unint64_t v27 = a4;
    id v28 = v24;
    BOOL v29 = [v24 path];
    unsigned int v30 = [v26 filteredVideoPathForRecordedLivePhotoVideoPath:v29];
    id v31 = [v25 fileURLWithPath:v30];

    double v32 = getPAMediaConversionResourceRoleVideoComplement();
    long long v33 = v28;
    a4 = v27;
    [v22 setResourceURL:v33 forRole:v32];

    long long v34 = getPAMediaConversionResourceRoleVideoComplement();
    [v23 setResourceURL:v31 forRole:v34];

    id v35 = @"live photo";
  }
  else
  {
    id v31 = 0;
    id v35 = @"photo (live photo fallback)";
  }
  id v58 = v12;
  id v36 = [v12 identifier];
  if ((a4 & 2) != 0)
  {
    uint64_t v37 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
    if ((a4 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t v37 = &stru_26BD78BA0;
  if (a4)
  {
LABEL_8:
    uint64_t v38 = [(__CFString *)v37 stringByAppendingString:@"HDR"];

    uint64_t v37 = (__CFString *)v38;
  }
LABEL_9:
  if (![(__CFString *)v37 length])
  {

    uint64_t v37 = @"None";
  }
  long long v48 = [NSString stringWithFormat:@"coordinator %@; %@ %@", v36, v37, v35];
  id v47 = -[CAMCameraViewController _mediaConversionOptionsForAdjustments:mediaType:description:](self, "_mediaConversionOptionsForAdjustments:mediaType:description:", v50, 1);
  long long v39 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v70 = v36;
    __int16 v71 = 2114;
    v72 = v35;
    __int16 v73 = 2114;
    v74 = v37;
    _os_log_impl(&dword_2099F8000, v39, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Rendering %{public}@ for specifier %{public}@", buf, 0x20u);
  }

  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  CGRect v41 = [(CAMCameraViewController *)self _imageConversionClient];
  v59[0] = MEMORY[0x263EF8330];
  v59[1] = 3221225472;
  v59[2] = __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke;
  v59[3] = &unk_263FA72B0;
  CFAbsoluteTime v67 = Current;
  v59[4] = self;
  id v60 = v36;
  uint64_t v61 = v35;
  id v62 = v53;
  unint64_t v68 = a4;
  id v63 = v52;
  id v64 = v31;
  id v65 = v49;
  id v66 = v50;
  id v51 = v50;
  id v42 = v49;
  id v43 = v31;
  id v44 = v52;
  id v45 = v53;
  id v46 = v36;
  [v41 convertImageAtSourceURLCollection:v55 toDestinationURLCollection:v23 options:v47 completionHandler:v59];
}

void __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  CFAbsoluteTime v9 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 96);
  id v10 = [*(id *)(a1 + 32) _resultProcessingQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke_2;
  block[3] = &unk_263FA7328;
  id v18 = v8;
  uint64_t v28 = a2;
  id v19 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  uint64_t v12 = *(void *)(a1 + 32);
  id v20 = v11;
  uint64_t v21 = v12;
  id v22 = *(id *)(a1 + 56);
  id v13 = *(id *)(a1 + 64);
  uint64_t v14 = *(void *)(a1 + 104);
  id v23 = v13;
  uint64_t v29 = v14;
  CFAbsoluteTime v30 = v9;
  id v24 = *(id *)(a1 + 72);
  id v25 = *(id *)(a1 + 80);
  id v26 = v7;
  id v27 = *(id *)(a1 + 88);
  id v15 = v7;
  id v16 = v8;
  dispatch_async(v10, block);
}

void __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if (!*(void *)(a1 + 32) && *(void *)(a1 + 112) == 1)
  {
    int v2 = os_log_create("com.apple.camera", "Camera");
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    uint64_t v5 = *(void *)(a1 + 120);
    if ((v5 & 2) != 0)
    {
      id v6 = [&stru_26BD78BA0 stringByAppendingString:@"Filtered"];
      if ((v5 & 1) == 0)
      {
LABEL_12:
        if (![(__CFString *)v6 length])
        {

          id v6 = @"None";
        }
        uint64_t v9 = *(void *)(a1 + 128);
        *(_DWORD *)buf = 138544130;
        uint64_t v20 = v4;
        __int16 v21 = 2114;
        uint64_t v22 = v3;
        __int16 v23 = 2114;
        id v24 = v6;
        __int16 v25 = 2048;
        uint64_t v26 = v9;
        _os_log_impl(&dword_2099F8000, v2, OS_LOG_TYPE_DEFAULT, "CVC %{public}@: Finished rendering %{public}@ for specifier %{public}@ (took %.3f seconds)", buf, 0x2Au);

LABEL_15:
        id v10 = [*(id *)(a1 + 72) objectForKeyedSubscript:@"CAMCameraViewControllerVideoDuration"];
        uint64_t v11 = [*(id *)(a1 + 72) objectForKeyedSubscript:@"CAMCameraViewControllerLivePhotoStillDisplayTime"];
        uint64_t v12 = (void *)v11;
        id v13 = *(void **)(a1 + 56);
        uint64_t v14 = *(void *)(a1 + 80);
        if (v10)
        {
          [v10 CMTimeValue];
          if (v12)
          {
LABEL_17:
            [v12 CMTimeValue];
LABEL_20:
            id v15 = [v13 _clientPropertiesForLivePhotoVideoURL:v14 duration:v18 stillDisplayTime:v17 error:*(void *)(a1 + 32)];
            id v16 = [*(id *)(a1 + 56) _clientPropertiesForPhotoProperties:*(void *)(a1 + 64) withFilteredImageURL:*(void *)(a1 + 88) conversionOutputInfo:*(void *)(a1 + 96) error:*(void *)(a1 + 32)];
            [*(id *)(a1 + 56) _handlePhotoProperties:v16 videoProperties:v15 unfilteredPhotoProperties:*(void *)(a1 + 64) unfilteredVideoProperties:*(void *)(a1 + 72) assetAdjustments:*(void *)(a1 + 104) attemptPairingVideo:1 error:*(void *)(a1 + 32)];

            return;
          }
        }
        else
        {
          memset(v18, 0, sizeof(v18));
          if (v11) {
            goto LABEL_17;
          }
        }
        memset(v17, 0, sizeof(v17));
        goto LABEL_20;
      }
    }
    else
    {
      id v6 = &stru_26BD78BA0;
      if ((v5 & 1) == 0) {
        goto LABEL_12;
      }
    }
    uint64_t v8 = [(__CFString *)v6 stringByAppendingString:@"HDR"];

    id v6 = (__CFString *)v8;
    goto LABEL_12;
  }
  id v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke_2_cold_1(a1);
  }

  [*(id *)(a1 + 56) _handlePhotoProperties:*(void *)(a1 + 64) videoProperties:*(void *)(a1 + 72) unfilteredPhotoProperties:0 unfilteredVideoProperties:0 assetAdjustments:0 attemptPairingVideo:1 error:0];
}

- (void)handleReviewButtonReleased:(id)a3
{
  id v5 = [(CAMCameraViewController *)self presentationDelegate];
  if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    [v5 cameraViewControllerRequestedDismissal:self];
  }
  else
  {
    uint64_t v4 = [(CAMCameraViewController *)self presentingViewController];
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
}

- (id)reviewButton
{
  reviewButton = self->__reviewButton;
  if (!reviewButton)
  {
    uint64_t v4 = [CAMReviewButton alloc];
    id v5 = -[CAMReviewButton initWithFrame:](v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    id v6 = self->__reviewButton;
    self->__reviewButton = v5;

    [(CAMReviewButton *)self->__reviewButton addTarget:self action:sel_handleReviewButtonReleased_ forControlEvents:64];
    reviewButton = self->__reviewButton;
  }
  return reviewButton;
}

- (CAMCreativeCameraDelegate)creativeCameraDelegate
{
  int v2 = [(CAMCameraViewController *)self viewfinderViewController];
  uint64_t v3 = [v2 creativeCameraDelegate];

  return (CAMCreativeCameraDelegate *)v3;
}

- (void)setCreativeCameraDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMCameraViewController *)self viewfinderViewController];
  [v5 setCreativeCameraDelegate:v4];
}

- (CAMCameraCaptureDelegate)captureDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_captureDelegate);
  return (CAMCameraCaptureDelegate *)WeakRetained;
}

- (void)setCaptureDelegate:(id)a3
{
}

- (CUCaptureController)captureController
{
  return self->_captureController;
}

- (CAMTimelapseController)timelapseController
{
  return self->_timelapseController;
}

- (CAMMotionController)motionController
{
  return self->_motionController;
}

- (CAMLocationController)locationController
{
  return self->_locationController;
}

- (CAMPowerController)powerController
{
  return self->_powerController;
}

- (CAMBurstController)burstController
{
  return self->_burstController;
}

- (CAMKeepAliveController)keepAliveController
{
  return self->_keepAliveController;
}

- (CAMProtectionController)protectionController
{
  return self->_protectionController;
}

- (CAMRemoteShutterController)remoteShutterController
{
  return self->_remoteShutterController;
}

- (CAMNebulaDaemonProxyManager)nebulaDaemonProxyManager
{
  return self->_nebulaDaemonProxyManager;
}

- (CAMReviewButton)_reviewButton
{
  return self->__reviewButton;
}

- (OS_dispatch_queue)_resultProcessingQueue
{
  return self->__resultProcessingQueue;
}

- (NSMutableDictionary)_resultQueueStillImageResultCoordinators
{
  return self->__resultQueueStillImageResultCoordinators;
}

- (CAMThumbnailGenerator)_resultQueueThumbnailGenerator
{
  return self->__resultQueueThumbnailGenerator;
}

- (CAMViewfinderViewController)viewfinderViewController
{
  return self->_viewfinderViewController;
}

- (CAMCameraViewControllerPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (CAMCameraViewControllerPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (BOOL)automaticallyManagesCameraSession
{
  return self->_automaticallyManagesCameraSession;
}

- (void)setAutomaticallyManagesCameraSession:(BOOL)a3
{
  self->_automaticallyManagesCameraSession = a3;
}

- (CAMCameraViewControllerCameraSessionDelegate)cameraSessionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraSessionDelegate);
  return (CAMCameraViewControllerCameraSessionDelegate *)WeakRetained;
}

- (void)setCameraSessionDelegate:(id)a3
{
}

- (CAMPersistenceController)persistenceController
{
  return self->_persistenceController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistenceController, 0);
  objc_destroyWeak((id *)&self->_cameraSessionDelegate);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_viewfinderViewController, 0);
  objc_storeStrong((id *)&self->__resultQueueThumbnailGenerator, 0);
  objc_storeStrong((id *)&self->__resultQueueStillImageResultCoordinators, 0);
  objc_storeStrong((id *)&self->__resultProcessingQueue, 0);
  objc_storeStrong((id *)&self->__reviewButton, 0);
  objc_storeStrong((id *)&self->_nebulaDaemonProxyManager, 0);
  objc_storeStrong((id *)&self->_remoteShutterController, 0);
  objc_storeStrong((id *)&self->_protectionController, 0);
  objc_storeStrong((id *)&self->_keepAliveController, 0);
  objc_storeStrong((id *)&self->_burstController, 0);
  objc_storeStrong((id *)&self->_powerController, 0);
  objc_storeStrong((id *)&self->_locationController, 0);
  objc_storeStrong((id *)&self->_motionController, 0);
  objc_storeStrong((id *)&self->_timelapseController, 0);
  objc_storeStrong((id *)&self->_captureController, 0);
  objc_destroyWeak((id *)&self->_captureDelegate);
  objc_storeStrong((id *)&self->__videoConversionClient, 0);
  objc_storeStrong((id *)&self->__imageConversionClient, 0);
}

void __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = [*(id *)(a1 + 72) persistenceUUID];
  int v6 = 138543618;
  id v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_2099F8000, a3, OS_LOG_TYPE_ERROR, "CVC %{public}@: Failed to deserialize PFCameraMetadata: %{public}@", (uint8_t *)&v6, 0x16u);
}

void __122__CAMCameraViewController_persistenceController_didGenerateStillImageLocalPersistenceResult_forCaptureResult_fromRequest___block_invoke_2_cold_1(uint64_t a1)
{
  v1 = CAMPAMediaConversionNameForJobStatus(*(void *)(a1 + 96));
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_2099F8000, v2, v3, "CVC %{public}@: Media conversion status %{public}@ rendering image to %{public}@ -- %{public}@", v4, v5, v6, v7, v8);
}

void __114__CAMCameraViewController__renderLivePhotoWithCoordinator_specifiers_photoProperties_videoProperties_adjustments___block_invoke_2_cold_1(uint64_t a1)
{
  v1 = CAMPAMediaConversionNameForJobStatus(*(void *)(a1 + 112));
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1_4(&dword_2099F8000, v2, v3, "CVC %{public}@: Media conversion status %{public}@ writing filtered %{public}@ -- %{public}@", v4, v5, v6, v7, v8);
}

@end