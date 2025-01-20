@interface CFXCameraViewController
+ (void)initialize;
+ (void)preheatWithWindow:(id)a3 captureMode:(int64_t)a4 devicePosition:(int64_t)a5 aspectRatioCrop:(int64_t)a6;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)noteOutputFrameWithTimestamp:(SEL)a3;
- (BOOL)allowLandscapeForEffectBrowserViewController:(id)a3;
- (BOOL)cameraControlsShown;
- (BOOL)capturingFunCamMedia;
- (BOOL)externalCaptureSessionCameraPositionSet;
- (BOOL)isEffectsAnalyticsRunning;
- (BOOL)isEffectsPickerHidden;
- (BOOL)shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:(id)a3;
- (BOOL)shouldRotateCellsForDeviceOrientation;
- (BOOL)showsViewfinder;
- (BOOL)usesInternalCaptureSession;
- (CFXCameraControlsViewController)cameraControlsViewController;
- (CFXCameraStreamBufferQueue)outputBufferQueue;
- (CFXCameraViewController)initWithCaptureMode:(int64_t)a3;
- (CFXCameraViewController)initWithCaptureMode:(int64_t)a3 devicePosition:(int64_t)a4 flashMode:(int64_t)a5 aspectRatioCrop:(int64_t)a6;
- (CFXCameraViewController)initWithMode:(int64_t)a3;
- (CFXCameraViewControllerDelegate)delegate;
- (CFXCaptureViewController)captureViewController;
- (CFXEffectBrowserViewController)effectBrowserViewController;
- (CFXStageManagerWarningViewController)stageManagerWarning;
- (CFXThermalPolicyManager)thermalPolicyManager;
- (CGRect)externalContentRect;
- (CGRect)externalPresentationRect;
- (JFXMetadataValidator)metadataValidator;
- (JFXPixelRotationSession)externalCaptureSessionRotationSession;
- (JFXRemoteCommandServer)remoteCommandServer;
- (JFXThreadSafeDictionary)externalCaptureSessionInputFrameTimestamps;
- (NSString)animojiOnlyEffectID;
- (NSString)effectBrowserPresentedAppIdentifier;
- (NSTimer)effectsInStreamTimer;
- (OS_dispatch_queue)externalCaptureSessionInputDeserializationQueue;
- (OS_dispatch_queue)externalCaptureSessionInputProcessingQueue;
- (OS_dispatch_queue)externalCaptureSessionOutputProcessingQueue;
- (UIColor)animojiOnlyBackgroundColor;
- (UIView)effectsPickerDrawer;
- (UIView)effectsPickerSnapshotContainerView;
- (double)effectBrowserViewController:(id)a3 screenTopBarHeightForWindowBounds:(CGRect)a4 orientation:(int64_t)a5;
- (double)userInterfaceAlpha;
- (id)animojiEffectID;
- (id)localizedPromptForHidingAnimojiForEffectBrowserViewController:(id)a3;
- (id)selectedAnimojiIdentifierForEffectBrowserViewController:(id)a3;
- (id)selectedFilterIdentifierForEffectBrowserViewController:(id)a3;
- (int64_t)aspectRatioCrop;
- (int64_t)cameraPosition;
- (int64_t)captureMode;
- (int64_t)devicePosition;
- (int64_t)effectsState;
- (int64_t)externalCaptureSessionCameraPosition;
- (int64_t)flashMode;
- (int64_t)initialFlashMode;
- (int64_t)lastDeviceOrientation;
- (void)CFX_automationAddEffectWithEffectTypeIdentifier:(id)a3 identifier:(id)a4 string:(id)a5;
- (void)JFX_exitAnalytics;
- (void)captureViewController:(id)a3 didCaptureMediaItem:(id)a4;
- (void)captureViewController:(id)a3 didChangeEffectComposition:(id)a4;
- (void)captureViewController:(id)a3 didRenderFrame:(id)a4;
- (void)captureViewController:(id)a3 presentationRectWasPinchedWithState:(int64_t)a4 scale:(double)a5 velocity:(double)a6;
- (void)captureViewController:(id)a3 switchedToCameraPosition:(int64_t)a4;
- (void)captureViewControllerCameraFlipButtonWasTapped:(id)a3;
- (void)captureViewControllerDidStartVideoRecording:(id)a3;
- (void)captureViewControllerDidStopVideoRecording:(id)a3;
- (void)captureViewControllerDoneButtonWasTapped:(id)a3;
- (void)captureViewControllerEffectsButtonWasTapped:(id)a3;
- (void)captureViewControllerPresentationRectWasDoubleTapped:(id)a3;
- (void)dealloc;
- (void)effectBrowserViewController:(id)a3 didDropOverlayEffect:(id)a4 atScreenLocation:(CGPoint)a5 atScreenSize:(CGSize)a6 rotationAngle:(double)a7;
- (void)effectBrowserViewController:(id)a3 didRemoveAllEffectsOfType:(id)a4;
- (void)effectBrowserViewController:(id)a3 didSelectAppWithIdentifier:(id)a4;
- (void)effectBrowserViewController:(id)a3 didSelectEffect:(id)a4;
- (void)effectBrowserViewController:(id)a3 filterPickerPreviewBackgroundImageAtSizeInPixels:(CGSize)a4 completion:(id)a5;
- (void)effectBrowserViewController:(id)a3 willChangeDockHeight:(double)a4;
- (void)loadView;
- (void)noteInputFrameWithTimestamp:(double)a3;
- (void)remoteCommandServer:(id)a3 didReceiveAddShapeCommandWithIdentifier:(id)a4;
- (void)remoteCommandServer:(id)a3 didReceiveAddStickerCommandWithData:(id)a4 offset:(CGPoint)a5 scale:(double)a6 rotation:(double)a7;
- (void)remoteCommandServer:(id)a3 didReceiveAddStickerCommandWithIdentifier:(id)a4 offset:(CGPoint)a5 scale:(double)a6 rotation:(double)a7;
- (void)remoteCommandServer:(id)a3 didReceiveAddTextCommandWithIdentifier:(id)a4 string:(id)a5;
- (void)remoteCommandServer:(id)a3 didReceiveRemoveEffectsCommandWithTypeIdentifiers:(id)a4;
- (void)remoteCommandServer:(id)a3 didReceiveSetAnimojiCommandWithIdentifier:(id)a4;
- (void)remoteCommandServer:(id)a3 didReceiveSetFilterCommandWithIdentifier:(id)a4;
- (void)remoteCommandServer:(id)a3 didReceiveSetMemojiCommandWithContentsOfFile:(id)a4;
- (void)removeAllEffects;
- (void)renderFrameWithImageData:(id)a3 orientation:(int64_t)a4 presentationRect:(CGRect)a5 contentsRect:(CGRect)a6;
- (void)renderFrameWithImageDataArchive:(id)a3 imagePixelBuffer:(__CVBuffer *)a4 depthPixelBuffer:(__CVBuffer *)a5 orientation:(int64_t)a6 presentationRect:(CGRect)a7 contentsRect:(CGRect)a8;
- (void)resign;
- (void)setAnimojiOnlyBackgroundColor:(id)a3;
- (void)setAnimojiOnlyEffectID:(id)a3;
- (void)setCameraControlsShown:(BOOL)a3;
- (void)setCameraControlsViewController:(id)a3;
- (void)setCameraPosition:(int64_t)a3;
- (void)setCaptureViewController:(id)a3;
- (void)setCapturingFunCamMedia:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEffectBrowserPresentedAppIdentifier:(id)a3;
- (void)setEffectBrowserViewController:(id)a3;
- (void)setEffectsInStreamTimer:(id)a3;
- (void)setEffectsPickerDrawer:(id)a3;
- (void)setEffectsPickerHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setEffectsPickerSnapshotContainerView:(id)a3;
- (void)setExternalCaptureSessionCameraPosition:(int64_t)a3;
- (void)setExternalCaptureSessionCameraPositionSet:(BOOL)a3;
- (void)setExternalCaptureSessionInputFrameTimestamps:(id)a3;
- (void)setExternalCaptureSessionRotationSession:(id)a3;
- (void)setExternalContentRect:(CGRect)a3;
- (void)setExternalPresentationRect:(CGRect)a3;
- (void)setInitialFlashMode:(int64_t)a3;
- (void)setIsEffectsAnalyticsRunning:(BOOL)a3;
- (void)setLastDeviceOrientation:(int64_t)a3;
- (void)setMetadataValidator:(id)a3;
- (void)setOutputBufferQueue:(id)a3;
- (void)setRemoteCommandServer:(id)a3;
- (void)setShowsViewfinder:(BOOL)a3;
- (void)setStageManagerWarning:(id)a3;
- (void)setThermalPolicyManager:(id)a3;
- (void)setTransitionState:(int64_t)a3 animated:(BOOL)a4;
- (void)setUserInterfaceAlpha:(double)a3;
- (void)setUsesInternalCaptureSession:(BOOL)a3;
- (void)stageManagerWarningDoneButtonWasTapped:(id)a3;
- (void)startCaptureSession;
- (void)stopCaptureSession;
- (void)updateUIForVideoRecording:(BOOL)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation CFXCameraViewController

+ (void)initialize
{
  v7[1] = *MEMORY[0x263EF8340];
  +[CFXApplicationState beginMonitoringApplicationState];
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v2 addSuiteNamed:@"com.apple.MobileSMS"];

  v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v6 = *MEMORY[0x263F61328];
  v7[0] = &unk_26E801740;
  v4 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [v3 registerDefaults:v4];

  +[CFXEffect setupFactoryDelegate];
  v5 = +[CFXMediaSettings sharedInstance];
  +[JFXMediaSettings setProviderDelegate:v5];
}

+ (void)preheatWithWindow:(id)a3 captureMode:(int64_t)a4 devicePosition:(int64_t)a5 aspectRatioCrop:(int64_t)a6
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  +[JFXOrientationMonitor initializeWithKeyWindow:a3];
  uint64_t v9 = CFXCanonicalAspectRatioCropForCaptureModeAndDesiredAspectRatioCrop(a4, a6);
  v10 = JFXLog_camera();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = NSStringFromCFXAspectRatioCrop(a6);
    v12 = NSStringFromCFXAspectRatioCrop(v9);
    int v17 = 134218754;
    int64_t v18 = a5;
    __int16 v19 = 2048;
    int64_t v20 = a4;
    __int16 v21 = 2114;
    v22 = v11;
    __int16 v23 = 2114;
    v24 = v12;
    _os_log_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEFAULT, "devicePosition: %ld, captureMode: %ld, aspectRatioCrop: %{public}@, canonicalAspectRatioCrop: %{public}@", (uint8_t *)&v17, 0x2Au);
  }
  uint64_t v13 = JFXCameraModeForCaptureModeAndAspectRatioCrop(a4, v9);
  v14 = +[CFXEffectHostAppDelegate sharedInstance];
  [v14 setColorSpaceDelegate:0];

  v15 = +[JFXVideoCameraController sharedInstance];
  [v15 prepareCameraForMode:v13 position:2 completion:&__block_literal_global_2];

  v16 = +[JFXVideoCameraController sharedInstance];
  [v16 setOwnerName:@"Generated in Camera Effects"];
}

- (CFXCameraViewController)initWithCaptureMode:(int64_t)a3 devicePosition:(int64_t)a4 flashMode:(int64_t)a5 aspectRatioCrop:(int64_t)a6
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  v40.receiver = self;
  v40.super_class = (Class)CFXCameraViewController;
  v10 = [(CFXCameraViewController *)&v40 initWithNibName:0 bundle:0];
  if (v10)
  {
    uint64_t v11 = CFXCanonicalAspectRatioCropForCaptureModeAndDesiredAspectRatioCrop(a3, a6);
    v12 = dispatch_get_global_queue(25, 0);
    dispatch_async(v12, &__block_literal_global_12);

    uint64_t v13 = JFXLog_camera();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = NSStringFromCFXAspectRatioCrop(a6);
      v15 = NSStringFromCFXAspectRatioCrop(v11);
      *(_DWORD *)buf = 134219010;
      int64_t v42 = a4;
      __int16 v43 = 2048;
      int64_t v44 = a5;
      __int16 v45 = 2048;
      int64_t v46 = a3;
      __int16 v47 = 2114;
      v48 = v14;
      __int16 v49 = 2114;
      v50 = v15;
      _os_log_impl(&dword_234C41000, v13, OS_LOG_TYPE_DEFAULT, "devicePosition: %ld, flashMode: %ld, captureMode: %ld, aspectRatioCrop: %{public}@, canonicalAspectRatioCrop: %{public}@", buf, 0x34u);
    }
    v10->_aspectRatioCrop = v11;
    v10->_captureMode = a3;
    v10->_cameraPosition = 2;
    v10->_initialFlashMode = a5;
    v10->_showsViewfinder = 1;
    v10->_usesInternalCaptureSession = 1;
    v10->_cameraControlsShown = 1;
    uint64_t v16 = JFXCreateDispatchQueue(v10, @"externalCaptureSessionInputDeserializationQueue", 0);
    externalCaptureSessionInputDeserializationQueue = v10->_externalCaptureSessionInputDeserializationQueue;
    v10->_externalCaptureSessionInputDeserializationQueue = (OS_dispatch_queue *)v16;

    uint64_t v18 = JFXCreateDispatchQueue(v10, @"externalCaptureSessionInputProcessingQueue ", 0);
    externalCaptureSessionInputProcessingQueue = v10->_externalCaptureSessionInputProcessingQueue;
    v10->_externalCaptureSessionInputProcessingQueue = (OS_dispatch_queue *)v18;

    uint64_t v20 = JFXCreateDispatchQueue(v10, @"externalCaptureSessionOutputProcessingQueue", 0);
    externalCaptureSessionOutputProcessingQueue = v10->_externalCaptureSessionOutputProcessingQueue;
    v10->_externalCaptureSessionOutputProcessingQueue = (OS_dispatch_queue *)v20;

    v10->_externalCaptureSessionCameraPosition = 0;
    v10->_externalCaptureSessionCameraPositionSet = 0;
    uint64_t v22 = objc_opt_new();
    externalCaptureSessionInputFrameTimestamps = v10->_externalCaptureSessionInputFrameTimestamps;
    v10->_externalCaptureSessionInputFrameTimestamps = (JFXThreadSafeDictionary *)v22;

    v24 = [[JFXRemoteCommandServer alloc] initWithDelegate:v10];
    remoteCommandServer = v10->_remoteCommandServer;
    v10->_remoteCommandServer = v24;

    v26 = objc_alloc_init(CFXThermalPolicyManager);
    thermalPolicyManager = v10->_thermalPolicyManager;
    v10->_thermalPolicyManager = v26;

    v28 = v10->_thermalPolicyManager;
    v29 = +[JFXVideoCameraController sharedInstance];
    [v29 setThermalDelegate:v28];

    uint64_t v30 = objc_opt_new();
    metadataValidator = v10->_metadataValidator;
    v10->_metadataValidator = (JFXMetadataValidator *)v30;

    double v32 = *MEMORY[0x263F001B0];
    double v33 = *(double *)(MEMORY[0x263F001B0] + 8);
    v34 = +[CFXMediaSettings sharedInstance];
    objc_msgSend(v34, "setFrameSize:", v32, v33);

    v35 = +[CFXMediaSettings sharedInstance];
    objc_msgSend(v35, "setRenderSize:", v32, v33);

    v36 = +[CFXAnalyticsManager sharedInstance];
    [v36 startTrackingTimeIntervalEventWithName:@"activetime"];

    if (isStreamingMode([(CFXCameraViewController *)v10 captureMode]))
    {
      v37 = [[CFXCameraStreamBufferQueue alloc] initWithMaxCapacity:90];
      outputBufferQueue = v10->_outputBufferQueue;
      v10->_outputBufferQueue = v37;
    }
    v10->_isEffectsAnalyticsRunning = 0;
  }
  return v10;
}

uint64_t __88__CFXCameraViewController_initWithCaptureMode_devicePosition_flashMode_aspectRatioCrop___block_invoke()
{
  +[CFXEffect initEffectRegistry];
  return +[CFXEffect preWarmShaderCache];
}

- (CFXCameraViewController)initWithCaptureMode:(int64_t)a3
{
  return [(CFXCameraViewController *)self initWithCaptureMode:a3 devicePosition:2 flashMode:0 aspectRatioCrop:0];
}

- (CFXCameraViewController)initWithMode:(int64_t)a3
{
  return [(CFXCameraViewController *)self initWithCaptureMode:a3 devicePosition:2 flashMode:0 aspectRatioCrop:0];
}

- (void)dealloc
{
  v3 = [(CFXCameraViewController *)self captureViewController];
  [v3 cameraDidStop];

  v4 = [(CFXCameraViewController *)self captureViewController];
  [v4 removeAllEffectsAnimated:0];

  double v5 = *MEMORY[0x263F001B0];
  double v6 = *(double *)(MEMORY[0x263F001B0] + 8);
  v7 = +[CFXMediaSettings sharedInstance];
  objc_msgSend(v7, "setFrameSize:", v5, v6);

  v8 = +[CFXMediaSettings sharedInstance];
  objc_msgSend(v8, "setRenderSize:", v5, v6);

  +[JFXOrientationMonitor uninitialize];
  v9.receiver = self;
  v9.super_class = (Class)CFXCameraViewController;
  [(CFXCameraViewController *)&v9 dealloc];
}

- (void)loadView
{
  v3 = [JFXPassThroughContainerView alloc];
  v4 = [MEMORY[0x263F1C920] mainScreen];
  [v4 bounds];
  double v5 = -[JFXPassThroughContainerView initWithFrame:](v3, "initWithFrame:");

  [(CFXCameraViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v126[4] = *MEMORY[0x263EF8340];
  v125.receiver = self;
  v125.super_class = (Class)CFXCameraViewController;
  [(CFXCameraViewController *)&v125 viewDidLoad];
  BOOL v3 = isStreamingMode([(CFXCameraViewController *)self captureMode]);
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    double v5 = [MEMORY[0x263F1C5C0] currentDevice];
    BOOL v4 = [v5 userInterfaceIdiom] == 0;
  }
  BOOL v124 = v3;
  if ((v3 | !+[JFXOrientationMonitor initialized]) == 1) {
    +[JFXOrientationMonitor initializeWithViewController:self];
  }
  double v6 = (void *)MEMORY[0x263F1C9E8];
  v7 = [MEMORY[0x263F086E0] jfxBundle];
  v8 = [v6 storyboardWithName:@"CFXCaptureViewController" bundle:v7];
  objc_super v9 = [v8 instantiateViewControllerWithIdentifier:@"CFXCaptureViewController"];
  [(CFXCameraViewController *)self setCaptureViewController:v9];

  v10 = [(CFXCameraViewController *)self captureViewController];
  [v10 setDelegate:self];

  int64_t v11 = [(CFXCameraViewController *)self captureMode];
  v12 = [(CFXCameraViewController *)self captureViewController];
  [v12 setCaptureMode:v11];

  +[JFXEffectEditingUtilities setStreamingMode:isStreamingMode([(CFXCameraViewController *)self captureMode])];
  uint64_t v13 = [(CFXCameraViewController *)self captureViewController];
  objc_msgSend(v13, "setAspectRatioCrop:", -[CFXCameraViewController aspectRatioCrop](self, "aspectRatioCrop"));

  if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) == 0)
  {
    v14 = [(CFXCameraViewController *)self captureViewController];
    objc_msgSend(v14, "setFlashMode:", -[CFXCameraViewController initialFlashMode](self, "initialFlashMode"));
  }
  v15 = [(CFXCameraViewController *)self captureViewController];
  [v15 updateUIForDevicePosition:2];

  if (v4)
  {
    uint64_t v16 = [(CFXCameraViewController *)self captureViewController];
    int v17 = [v16 cameraControls];
    uint64_t v18 = [v17 controlsContainerViewTopConstraint];
    __int16 v19 = [(CFXCameraViewController *)self captureViewController];
    [v19 setCaptureControlsContainerTopConstraint:v18];

    uint64_t v20 = [(CFXCameraViewController *)self captureViewController];
    __int16 v21 = [v20 cameraControls];
    uint64_t v22 = [v21 controlsContainerViewLeadingConstraint];
    __int16 v23 = [(CFXCameraViewController *)self captureViewController];
    [v23 setCaptureControlsContainerLeadingConstraint:v22];

    v24 = [(CFXCameraViewController *)self captureViewController];
    uint64_t v25 = [v24 cameraControls];
    v26 = [v25 controlsContainerViewTrailingConstraint];
    v27 = [(CFXCameraViewController *)self captureViewController];
    [v27 setCaptureControlsContainerTrailingConstraint:v26];

    v28 = [(CFXCameraViewController *)self captureViewController];
    v29 = [v28 cameraControls];
    uint64_t v30 = [v29 controlsContainerViewWidthConstraint];
    v31 = [(CFXCameraViewController *)self captureViewController];
    [v31 setCaptureControlsContainerWidthConstraint:v30];

    double v32 = [(CFXCameraViewController *)self captureViewController];
    double v33 = [v32 cameraControls];
    v34 = [v33 controlsContainerViewHeightConstraint];
    v35 = [(CFXCameraViewController *)self captureViewController];
    [v35 setCaptureControlsContainerHeightConstraint:v34];
  }
  v36 = [CFXCameraControlsViewController alloc];
  v37 = [(CFXCameraViewController *)self captureViewController];
  v38 = [(CFXCameraControlsViewController *)v36 initWithDelegate:v37 captureMode:[(CFXCameraViewController *)self captureMode]];
  [(CFXCameraViewController *)self setCameraControlsViewController:v38];

  if ([(CFXCameraViewController *)self captureMode] == 2)
  {
    v39 = [MEMORY[0x263F1C550] clearColor];
    objc_super v40 = [(CFXCameraViewController *)self cameraControlsViewController];
    [v40 setBackgroundColor:v39];
  }
  else
  {
    v39 = [MEMORY[0x263F1C550] blackColor];
    objc_super v40 = [v39 colorWithAlphaComponent:1.0];
    v41 = [(CFXCameraViewController *)self cameraControlsViewController];
    [v41 setBackgroundColor:v40];
  }
  int64_t v42 = [(CFXCameraViewController *)self captureViewController];
  __int16 v43 = [v42 cameraControls];

  if (!v4)
  {
    int64_t v44 = [v43 controlsContainerViewWidthConstraint];
    [v44 setActive:0];

    __int16 v45 = [v43 controlsContainerViewHeightConstraint];
    [v45 setActive:0];

    int64_t v46 = [v43 controlsContainerViewTopConstraint];
    LODWORD(v47) = 1144750080;
    [v46 setPriority:v47];
  }
  v48 = [v43 view];
  __int16 v49 = [v43 controlsContainerView];
  v50 = [(CFXCameraViewController *)self captureViewController];
  uint64_t v51 = [v50 effectBrowserContentPresenterViewController];

  v52 = [[CFXEffectBrowserViewController alloc] initWithDelegate:self contentPresenter:v51];
  [(CFXCameraViewController *)self setEffectBrowserViewController:v52];

  v53 = [(CFXCameraViewController *)self effectBrowserViewController];
  [v53 setContentPresenterDelegate:v51];

  [v51 setDelegate:self];
  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    int64_t v54 = [(CFXCameraViewController *)self captureMode];
    if (v54 == 2)
    {
      v56 = [(CFXCameraViewController *)self effectBrowserViewController];
      v57 = v56;
      BOOL v58 = 0;
    }
    else
    {
      if (v54) {
        goto LABEL_21;
      }
      BOOL v55 = [(CFXCameraViewController *)self aspectRatioCrop] != 1;
      v56 = [(CFXCameraViewController *)self effectBrowserViewController];
      v57 = v56;
      BOOL v58 = v55;
    }
    [v56 setShowAppIconBorders:v58];
  }
LABEL_21:
  v59 = [(CFXCameraViewController *)self effectBrowserViewController];
  v60 = [v59 view];

  v61 = [(CFXCameraViewController *)self effectBrowserViewController];
  [v43 addChildViewController:v61];

  if (v4)
  {
    v62 = [v51 view];
    [v48 insertSubview:v60 belowSubview:v62];

    [v43 setEffectsBrowser:v60];
  }
  else
  {
    [v48 addSubview:v60];
  }
  [v60 setTranslatesAutoresizingMaskIntoConstraints:0];
  v63 = [v60 topAnchor];
  v64 = [v49 topAnchor];
  v65 = [v63 constraintEqualToAnchor:v64];

  v66 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v67 = [v66 userInterfaceIdiom];

  BOOL v123 = v4;
  v121 = v48;
  v122 = v43;
  v119 = v51;
  if (v67)
  {
    v68 = [v60 heightAnchor];
    uint64_t v69 = [v68 constraintEqualToConstant:44.0];

    v65 = (void *)v69;
  }
  v116 = objc_msgSend(v60, "leadingAnchor", MEMORY[0x263F08938]);
  [v49 leadingAnchor];
  v71 = v70 = v60;
  v72 = [v116 constraintEqualToAnchor:v71];
  v126[0] = v72;
  v73 = [v70 trailingAnchor];
  v74 = [v49 trailingAnchor];
  v75 = [v73 constraintEqualToAnchor:v74];
  v126[1] = v75;
  v126[2] = v65;
  v117 = v65;
  v118 = v70;
  v76 = [v70 bottomAnchor];
  v120 = v49;
  v77 = [v49 bottomAnchor];
  v78 = [v76 constraintEqualToAnchor:v77];
  v126[3] = v78;
  v79 = [MEMORY[0x263EFF8C0] arrayWithObjects:v126 count:4];
  [v115 activateConstraints:v79];

  v80 = [(CFXCameraViewController *)self effectBrowserViewController];
  [v80 didMoveToParentViewController:v122];

  v81 = [(CFXCameraViewController *)self cameraControlsViewController];
  v82 = [v81 view];
  v83 = [(CFXCameraViewController *)self captureViewController];
  [v83 setEffectsPickerDrawer:v82];

  v84 = [(CFXCameraViewController *)self captureViewController];
  [(UIViewController *)self jfxAddChildViewController:v84 constrainRelativeToSafeAreas:0];

  if (v123)
  {
    v85 = [(CFXCameraViewController *)self captureViewController];
    v86 = [v85 cameraControls];
    [(UIViewController *)self jfxAddChildViewController:v86 constrainRelativeToSafeAreas:0];

    v87 = (void *)MEMORY[0x263F1C9E8];
    v88 = [MEMORY[0x263F086E0] jfxBundle];
    v89 = [v87 storyboardWithName:@"CFXNonTransformedLiveCaptureContainerViewController" bundle:v88];
    v90 = [v89 instantiateViewControllerWithIdentifier:@"CFXNonTransformedLiveCaptureContainerViewController"];

    [v90 loadViewIfNeeded];
    v91 = [(CFXCameraViewController *)self thermalPolicyManager];
    v92 = [v90 liveCaptureViewController];
    [v92 setThermalPolicyManager:v91];

    v93 = [MEMORY[0x263F1C550] blackColor];
    v94 = [v90 view];
    [v94 setBackgroundColor:v93];

    v95 = [(CFXCameraViewController *)self captureViewController];
    v96 = [v90 liveCaptureViewController];
    [v95 setLiveCaptureViewController:v96];

    [(UIViewController *)self jfxAddChildViewController:v90 constrainRelativeToSafeAreas:0];
    v97 = [(CFXCameraViewController *)self view];
    v98 = [v90 view];
    v99 = [(CFXCameraViewController *)self captureViewController];
    v100 = [v99 view];
    [v97 insertSubview:v98 belowSubview:v100];

    v101 = [(CFXCameraViewController *)self captureViewController];
    v102 = [v101 liveCaptureContainer];
    [v102 removeFromSuperview];

    v103 = [(CFXCameraViewController *)self captureViewController];
    v104 = [v103 liveCaptureContainerContainer];
    [v104 removeFromSuperview];

    v105 = [v90 liveCaptureContainer];
    v106 = [(CFXCameraViewController *)self captureViewController];
    [v106 setLiveCaptureContainer:v105];

    v107 = [v90 liveCaptureContainerContainer];
    v108 = [(CFXCameraViewController *)self captureViewController];
    [v108 setLiveCaptureContainerContainer:v107];

    v109 = [v90 view];
    v110 = [(CFXCameraViewController *)self captureViewController];
    [v110 setNonTransformedContainerView:v109];
  }
  if ([(CFXCameraViewController *)self captureMode] == 1)
  {
    v111 = [(CFXCameraViewController *)self captureViewController];
    [v111 cameraDidStart];
  }
  if (!v124)
  {
    v112 = objc_alloc_init(CFXStageManagerWarningViewController);
    [(CFXCameraViewController *)self setStageManagerWarning:v112];

    v113 = [(CFXCameraViewController *)self stageManagerWarning];
    [v113 setDelegate:self];

    v114 = [(CFXCameraViewController *)self stageManagerWarning];
    [(UIViewController *)self jfxAddChildViewController:v114];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)CFXCameraViewController;
  -[CFXCameraViewController viewWillTransitionToSize:withTransitionCoordinator:](&v38, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (!isStreamingMode([(CFXCameraViewController *)self captureMode]))
  {
    v8 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    if (!v9)
    {
      v10 = [(CFXCameraViewController *)self view];
      int64_t v11 = [v10 subviews];
      v12 = [(CFXCameraViewController *)self captureViewController];
      uint64_t v13 = [v12 nonTransformedContainerView];
      uint64_t v14 = [v11 indexOfObject:v13];

      if (v14 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v15 = v14 + 1;
        uint64_t v16 = [(CFXCameraViewController *)self captureViewController];
        int v17 = [v16 liveCaptureSnapshot];
        uint64_t v18 = [(CFXCameraViewController *)self captureViewController];
        __int16 v19 = [v18 liveCaptureContainer];
        [v19 center];
        v36[4] = self;
        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        v37[2] = __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
        v37[3] = &unk_264C09FA8;
        v37[4] = self;
        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        v36[2] = __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
        v36[3] = &unk_264C09FA8;
        -[UIViewController displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:](self, "displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:", v17, v15, 1, v7, v37, v36);
      }
      uint64_t v20 = [(CFXCameraViewController *)self captureViewController];
      __int16 v21 = [v20 cameraControls];
      uint64_t v22 = [v21 effectsPickerSnapshot];

      __int16 v23 = [(CFXCameraViewController *)self captureViewController];
      v24 = [v23 cameraControls];
      [v24 effectsPickerCenter];
      double v26 = v25;
      double v28 = v27;
      v29 = [(CFXCameraViewController *)self view];
      uint64_t v30 = [v29 subviews];
      uint64_t v31 = [v30 count];
      v33[4] = self;
      v34[0] = MEMORY[0x263EF8330];
      v34[1] = 3221225472;
      v34[2] = __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5;
      v34[3] = &unk_264C09F10;
      v34[4] = self;
      id v35 = v22;
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      v33[2] = __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6;
      v33[3] = &unk_264C09FA8;
      id v32 = v22;
      -[UIViewController displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:](self, "displaySnapshot:atCenterPoint:atIndex:forTransitionToSize:fadeOut:withTransitionCoordinator:preTransitionBlock:postTransitionBlock:", v32, v31, 0, v7, v34, v33, v26, v28, width, height);
    }
  }
}

void __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) captureViewController];
  BOOL v3 = [v2 liveCaptureContainer];
  [v3 setHidden:1];

  id v5 = [*(id *)(a1 + 32) captureViewController];
  BOOL v4 = [v5 liveCaptureContainer];
  [v4 setAlpha:0.0];
}

uint64_t __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) captureViewController];
  BOOL v3 = [v2 liveCaptureContainer];
  [v3 setHidden:0];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
  v5[3] = &unk_264C09FA8;
  v5[4] = *(void *)(a1 + 32);
  return +[JTAnimation performAnimation:v5 duration:&__block_literal_global_55 completion:0.25];
}

void __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) captureViewController];
  v1 = [v2 liveCaptureContainer];
  [v1 setAlpha:1.0];
}

void __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  BOOL v3 = [v2 subviews];
  id v10 = [v3 lastObject];

  BOOL v4 = [v10 subviews];
  LODWORD(v3) = [v4 containsObject:*(void *)(a1 + 40)];

  if (v3) {
    [*(id *)(a1 + 32) setEffectsPickerSnapshotContainerView:v10];
  }
  id v5 = [*(id *)(a1 + 32) captureViewController];
  double v6 = [v5 cameraControls];
  id v7 = [v6 view];
  [v7 setHidden:1];

  v8 = [*(id *)(a1 + 32) captureViewController];
  uint64_t v9 = [v8 effectsPickerDrawer];
  [v9 setHidden:1];
}

uint64_t __78__CFXCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) captureViewController];
  BOOL v3 = [v2 cameraControls];
  BOOL v4 = [v3 view];
  [v4 setHidden:0];

  id v5 = [*(id *)(a1 + 32) captureViewController];
  double v6 = [v5 effectsPickerDrawer];
  [v6 setHidden:0];

  id v7 = *(void **)(a1 + 32);
  return [v7 setEffectsPickerSnapshotContainerView:0];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CFXCameraViewController;
  [(CFXCameraViewController *)&v6 viewDidLayoutSubviews];
  BOOL v3 = [MEMORY[0x263F1C5C0] currentDevice];
  if (![v3 userInterfaceIdiom]
    && !isStreamingMode([(CFXCameraViewController *)self captureMode]))
  {
    BOOL v4 = [(CFXCameraViewController *)self view];
    id v5 = [v4 window];

    if (!v5) {
      return;
    }
    BOOL v3 = [(CFXCameraViewController *)self captureViewController];
    [v3 applyRotationTransformForPortrait];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CFXCameraViewController;
  [(CFXCameraViewController *)&v7 willMoveToParentViewController:a3];
  if ([(CFXCameraViewController *)self captureMode] == 3)
  {
    BOOL v4 = [(CFXCameraViewController *)self animojiEffectID];

    if (!v4)
    {
      id v5 = +[JFXAnimojiEffect animojiIDs];
      objc_super v6 = [v5 firstObject];
      [(CFXCameraViewController *)self setAnimojiOnlyEffectID:v6];
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CFXCameraViewController;
  [(CFXCameraViewController *)&v4 viewDidAppear:a3];
  BOOL v3 = +[CFXAnalyticsManager sharedInstance];
  [v3 trackEventWithName:@"extensionlaunched"];
}

- (UIView)effectsPickerDrawer
{
  [(CFXCameraViewController *)self loadViewIfNeeded];
  BOOL v3 = [(CFXCameraViewController *)self captureViewController];
  objc_super v4 = [v3 effectsPickerDrawer];

  return (UIView *)v4;
}

- (void)setEffectsPickerDrawer:(id)a3
{
  id v4 = a3;
  [(CFXCameraViewController *)self loadViewIfNeeded];
  id v5 = [(CFXCameraViewController *)self captureViewController];
  [v5 setEffectsPickerDrawer:v4];

  if (!v4)
  {
    objc_super v6 = [(CFXCameraViewController *)self effectBrowserViewController];

    if (v6)
    {
      objc_super v7 = [(CFXCameraViewController *)self effectBrowserViewController];
      [v7 jfxRemoveFromParentViewController];

      [(CFXCameraViewController *)self setEffectBrowserViewController:0];
    }
  }
}

- (int64_t)effectsState
{
  BOOL v3 = [(CFXCameraViewController *)self captureViewController];
  id v4 = [v3 composition];

  id v5 = [(CFXCameraViewController *)self effectBrowserPresentedAppIdentifier];
  int v6 = [v5 isEqual:@"com.apple.FunCamera.Filters"];

  int v7 = [v4 isEmpty];
  v8 = +[JFXVideoCameraController sharedInstance];
  char v9 = [v8 sessionRequiresFaceTracking];

  if (v9)
  {
    int64_t v10 = 2;
  }
  else if ((v7 ^ 1 | v6) == 1)
  {
    if ([v4 requiresFaceTracking]) {
      int64_t v10 = 2;
    }
    else {
      int64_t v10 = 1;
    }
  }
  else
  {
    int64_t v10 = 0;
  }

  return v10;
}

- (void)setShowsViewfinder:(BOOL)a3
{
  if (self->_showsViewfinder != a3)
  {
    BOOL v3 = a3;
    self->_showsViewfinder = a3;
    [(CFXCameraViewController *)self loadViewIfNeeded];
    id v5 = [(CFXCameraViewController *)self captureViewController];
    [v5 setUseLocalCameraViewfinder:v3];
  }
}

- (double)userInterfaceAlpha
{
  [(CFXCameraViewController *)self loadViewIfNeeded];
  BOOL v3 = [(CFXCameraViewController *)self captureViewController];
  [v3 userInterfaceAlpha];
  double v5 = v4;

  return v5;
}

- (void)setUserInterfaceAlpha:(double)a3
{
  [(CFXCameraViewController *)self loadViewIfNeeded];
  id v5 = [(CFXCameraViewController *)self captureViewController];
  [v5 setUserInterfaceAlpha:a3];
}

- (void)setUsesInternalCaptureSession:(BOOL)a3
{
  if (self->_usesInternalCaptureSession != a3)
  {
    if (a3) {
      [(CFXCameraViewController *)self startCaptureSession];
    }
    else {
      [(CFXCameraViewController *)self stopCaptureSession];
    }
    self->_usesInternalCaptureSession = a3;
  }
}

- (int64_t)flashMode
{
  [(CFXCameraViewController *)self loadViewIfNeeded];
  BOOL v3 = [(CFXCameraViewController *)self captureViewController];
  int64_t v4 = [v3 flashMode];

  return v4;
}

- (int64_t)devicePosition
{
  if (isStreamingMode([(CFXCameraViewController *)self captureMode]))
  {
    return [(CFXCameraViewController *)self externalCaptureSessionCameraPosition];
  }
  else
  {
    return [(CFXCameraViewController *)self cameraPosition];
  }
}

- (UIColor)animojiOnlyBackgroundColor
{
  id v2 = [(CFXCameraViewController *)self captureViewController];
  BOOL v3 = [v2 cameraViewController];
  int64_t v4 = [v3 animojiBackgroundColor];

  return (UIColor *)v4;
}

- (void)setAnimojiOnlyBackgroundColor:(id)a3
{
  id v4 = a3;
  id v6 = [(CFXCameraViewController *)self captureViewController];
  id v5 = [v6 cameraViewController];
  [v5 setAnimojiBackgroundColor:v4];
}

- (id)animojiEffectID
{
  id v2 = [(CFXCameraViewController *)self captureViewController];
  BOOL v3 = [v2 composition];
  id v4 = [v3 jtEffectsForType:7];
  id v5 = [v4 firstObject];

  id v6 = [v5 effectID];

  return v6;
}

- (void)setAnimojiOnlyEffectID:(id)a3
{
  id v4 = a3;
  if ([(CFXCameraViewController *)self captureMode] == 3)
  {
    id v5 = +[JFXAnimojiEffect createAnimojiEffectForID:v4];
    if (v5)
    {
      id v6 = +[CFXEffectType effectTypeWithIdentifier:@"Animoji"];
      int v7 = [(CFXCameraViewController *)self captureViewController];
      v8 = [v7 composition];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __50__CFXCameraViewController_setAnimojiOnlyEffectID___block_invoke;
      v9[3] = &unk_264C09F10;
      int64_t v10 = v5;
      int64_t v11 = self;
      [v8 removeAllEffectsOfType:v6 completion:v9];
    }
    else
    {
      id v6 = JFXLog_effects();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[CFXCameraViewController setAnimojiOnlyEffectID:]();
      }
    }
  }
  else
  {
    id v5 = JFXLog_effects();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CFXCameraViewController setAnimojiOnlyEffectID:]();
    }
  }
}

void __50__CFXCameraViewController_setAnimojiOnlyEffectID___block_invoke(uint64_t a1)
{
  id v3 = +[CFXEffect effectWithJTEffect:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) captureViewController];
  [v2 addEffect:v3];
}

- (void)setExternalCaptureSessionCameraPosition:(int64_t)a3
{
  self->_externalCaptureSessionCameraPosition = a3;
  BOOL v3 = a3 == 0;
  id v4 = [(CFXCameraViewController *)self captureViewController];
  [v4 setIsExternalCaptureSessionAnExternalCamera:v3];
}

- (BOOL)isEffectsPickerHidden
{
  id v2 = [(CFXCameraViewController *)self effectBrowserViewController];
  BOOL v3 = [v2 view];
  char v4 = [v3 isHidden];

  return v4;
}

- (void)setEffectsPickerHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v6 = [(CFXCameraViewController *)self effectBrowserViewController];
  id v5 = [v6 view];
  [v5 setHidden:v4];
}

- (void)setTransitionState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int v7 = JFXLog_DebugViewerUI();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[CFXCameraViewController setTransitionState:animated:](v4, a3, v7);
  }

  switch(a3)
  {
    case 0:
      v8 = [(CFXCameraViewController *)self captureViewController];
      [v8 configureUIForOrientation];

      char v9 = [(CFXCameraViewController *)self effectBrowserViewController];
      int64_t v10 = [v9 view];
      [v10 setAlpha:1.0];

      int64_t v11 = [(CFXCameraViewController *)self cameraControlsViewController];
      [v11 setShutterButtonAlpha:1.0];

      v12 = [(CFXCameraViewController *)self captureViewController];
      [v12 removeLiveCaptureSnapshot];

      [(CFXCameraViewController *)self setCameraControlsShown:1];
      break;
    case 1:
      uint64_t v13 = [(CFXCameraViewController *)self cameraControlsViewController];
      [v13 setShutterButtonAlpha:0.0];

      uint64_t v14 = [(CFXCameraViewController *)self captureViewController];
      [v14 removeAnimojiTrackingReticle];
      goto LABEL_13;
    case 2:
      if (v4) {
        double v15 = 0.25;
      }
      else {
        double v15 = 0.0;
      }
      char v16 = ![(CFXCameraViewController *)self cameraControlsShown];
      if ((v16 & 1) == 0)
      {
        int v17 = [(CFXCameraViewController *)self captureViewController];
        [v17 showLiveCaptureSnapshotBlurred:1 animated:1 completion:0];
      }
      v22[0] = MEMORY[0x263EF8330];
      v22[1] = 3221225472;
      v22[2] = __55__CFXCameraViewController_setTransitionState_animated___block_invoke;
      v22[3] = &unk_264C0A0C0;
      v22[4] = self;
      char v23 = v16;
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __55__CFXCameraViewController_setTransitionState_animated___block_invoke_2;
      v20[3] = &unk_264C0A108;
      v20[4] = self;
      char v21 = v16;
      +[JTAnimation performAnimation:v22 duration:v20 completion:v15];
      break;
    case 3:
      uint64_t v18 = [(CFXCameraViewController *)self captureViewController];
      [v18 showLiveCaptureSnapshotBlurred:0 animated:0 completion:0];

      __int16 v19 = [(CFXCameraViewController *)self captureViewController];
      [v19 saveLiveCaptureSnapshotForReview];

      uint64_t v14 = [(CFXCameraViewController *)self cameraControlsViewController];
      [v14 setShutterButtonAlpha:0.0];
LABEL_13:

      break;
    default:
      return;
  }
}

void __55__CFXCameraViewController_setTransitionState_animated___block_invoke(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v2 = (double)*(unint64_t *)&a2;
  id v4 = [*(id *)(a1 + 32) effectBrowserViewController];
  BOOL v3 = [v4 view];
  [v3 setAlpha:v2];
}

uint64_t __55__CFXCameraViewController_setTransitionState_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setCameraControlsShown:*(unsigned __int8 *)(a1 + 40)];
}

- (void)removeAllEffects
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = [(CFXCameraViewController *)self captureViewController];
  [v3 removeAllEffectsAnimated:0];

  id v4 = [(CFXCameraViewController *)self metadataValidator];
  [v4 reset];

  [(CFXCameraViewController *)self setExternalCaptureSessionCameraPosition:0];
  id v5 = [(CFXCameraViewController *)self effectsInStreamTimer];
  [v5 invalidate];

  [(CFXCameraViewController *)self setEffectsInStreamTimer:0];
  id v6 = CFXLog_action();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [(CFXCameraViewController *)self captureViewController];
    v8 = [v7 composition];
    char v9 = [v8 jtEffects];
    int64_t v10 = +[CFXActionLogging actionLogAsJSONForEvent:@"stopped effects in stream" atLocation:@"live" withEffectStack:v9];
    int v14 = 138543362;
    double v15 = v10;
    _os_log_impl(&dword_234C41000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v14, 0xCu);
  }
  int64_t v11 = +[CFXAnalyticsManager sharedInstance];
  [v11 stopTrackingTimeIntervalEventWithName:@"activetime"];

  if ([(CFXCameraViewController *)self captureMode] == 3)
  {
    v12 = +[JFXAnimojiEffect animojiIDs];
    uint64_t v13 = [v12 firstObject];
    [(CFXCameraViewController *)self setAnimojiOnlyEffectID:v13];
  }
}

- (void)renderFrameWithImageData:(id)a3 orientation:(int64_t)a4 presentationRect:(CGRect)a5 contentsRect:(CGRect)a6
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  CGFloat v10 = a5.size.height;
  CGFloat v11 = a5.size.width;
  CGFloat v12 = a5.origin.y;
  CGFloat v13 = a5.origin.x;
  id v16 = a3;
  BOOL v17 = [(CFXCameraViewController *)self captureMode] != 3;
  uint64_t v18 = +[JFXVideoCameraController sharedInstance];
  [v18 setSkipARProcessingWhenNoFaceDataIsPresent:v17];

  __int16 v19 = [(CFXCameraViewController *)self captureViewController];
  uint64_t v20 = [v19 composition];
  char v21 = [v20 isEmpty];

  if ((v21 & 1) == 0)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke;
    block[3] = &unk_264C09FA8;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  [v16 timestamp];
  -[CFXCameraViewController noteInputFrameWithTimestamp:](self, "noteInputFrameWithTimestamp:");
  uint64_t v22 = [(CFXCameraViewController *)self externalCaptureSessionInputProcessingQueue];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_68;
  v24[3] = &unk_264C0A178;
  id v25 = v16;
  double v26 = self;
  CGFloat v27 = v13;
  CGFloat v28 = v12;
  CGFloat v29 = v11;
  CGFloat v30 = v10;
  CGFloat v31 = x;
  CGFloat v32 = y;
  CGFloat v33 = width;
  CGFloat v34 = height;
  int64_t v35 = a4;
  id v23 = v16;
  dispatch_async(v22, v24);
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) effectsInStreamTimer];

  if (v2)
  {
    id v5 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:5.0];
    BOOL v3 = [*(id *)(a1 + 32) effectsInStreamTimer];
    [v3 setFireDate:v5];
  }
  else
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_2;
    v6[3] = &__block_descriptor_40_e17_v16__0__NSTimer_8l;
    v6[4] = 0x4014000000000000;
    id v4 = [MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:1 repeats:v6 block:5.0];
    [*(id *)(a1 + 32) setEffectsInStreamTimer:v4];
  }
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  double v2 = JFXLog_camera();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 134217984;
    uint64_t v5 = v3;
    _os_log_impl(&dword_234C41000, v2, OS_LOG_TYPE_DEFAULT, "renderFrameWithImageData - effects applied but rendering hasn't been called in at least %lf seconds.", (uint8_t *)&v4, 0xCu);
  }
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_68(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v146 = *MEMORY[0x263EF8340];
  double v2 = (__CVBuffer *)[*(id *)(a1 + 32) pixelBuffer];
  double Width = (double)CVPixelBufferGetWidth(v2);
  double Height = (double)CVPixelBufferGetHeight(v2);
  uint64_t v5 = [*(id *)(v1 + 32) cameraPosition];
  if (v5
    || +[JFXOrientationMonitor isDeviceInterfaceLandscape])
  {
    if (Width >= Height) {
      double v6 = Height;
    }
    else {
      double v6 = Width;
    }
    if (Width >= Height) {
      double Height = Width;
    }
    double Width = v6;
  }
  uint64_t v7 = [*(id *)(v1 + 40) lastDeviceOrientation];
  int64_t v8 = +[JFXOrientationMonitor deviceInterfaceOrientation];
  unint64_t v9 = 0x264C08000uLL;
  CGFloat v10 = +[CFXMediaSettings sharedInstance];
  [v10 renderSize];
  double v12 = v11;
  double v14 = v13;

  BOOL v16 = Width == v12 && Height == v14 && v7 == v8;
  uint64_t v112 = v1;
  if (!v16)
  {
    BOOL v17 = +[CFXMediaSettings sharedInstance];
    [v17 renderSize];
    double v19 = v18;
    double v21 = v20;

    uint64_t v22 = +[CFXMediaSettings sharedInstance];
    objc_msgSend(v22, "setFrameSize:", Width, Height);

    id v23 = +[CFXMediaSettings sharedInstance];
    objc_msgSend(v23, "setRenderSize:", Width, Height);

    v24 = JFXLog_DebugCamera();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_68_cold_4(v1, v24, Width, Height);
    }

    v110 = objc_alloc_init(CFXEffectComposition);
    long long v140 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    long long v143 = 0u;
    id v25 = [*(id *)(v1 + 40) captureViewController];
    double v26 = [v25 composition];
    CGFloat v27 = [v26 effects];

    id obj = v27;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v140 objects:v145 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v108 = *(void *)v141;
      if (v5) {
        BOOL v30 = 1;
      }
      else {
        BOOL v30 = v7 == v8;
      }
      char v31 = v30;
      double v32 = v21 / Height;
      if (v19 / v21 >= Width / Height) {
        double v33 = v21;
      }
      else {
        double v33 = v19;
      }
      if (v19 / v21 >= Width / Height) {
        double v34 = Height;
      }
      else {
        double v34 = Width;
      }
      long long v107 = *MEMORY[0x263F010E0];
      uint64_t v35 = *(void *)(MEMORY[0x263F010E0] + 16);
      __asm { FMOV            V2.2D, #1.0 }
      long long v105 = _Q2;
      double v40 = v33 / v34;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v141 != v108) {
            objc_enumerationMutation(obj);
          }
          int64_t v42 = *(void **)(*((void *)&v140 + 1) + 8 * i);
          __int16 v43 = [v42 jtEffect];
          objc_msgSend(v43, "setRenderSize:", Width, Height);

          CGFloat v44 = v40;
          if ((v31 & 1) == 0)
          {
            __int16 v45 = objc_msgSend(v42, "jtEffect", v40);
            int v46 = [v45 type];

            CGFloat v44 = v32;
            if (v46 == 2)
            {
              objc_msgSend(*(id *)(v112 + 40), "lastDeviceOrientation", v32);
              +[JFXOrientationMonitor deviceOrientation];
              double v47 = [v42 jtEffect];
              v48 = v47;
              if (v47)
              {
                [v47 topLevelTransform];
              }
              else
              {
                long long v130 = 0u;
                long long v131 = 0u;
                long long v128 = 0u;
                long long v129 = 0u;
                long long v126 = 0u;
                long long v127 = 0u;
                long long v124 = 0u;
                long long v125 = 0u;
              }
              uint64_t v121 = 0;
              uint64_t v122 = 0;
              long long v123 = v105;
              pv_simd_matrix_rotate();
              v120[4] = v136;
              v120[5] = v137;
              v120[6] = v138;
              v120[7] = v139;
              v120[0] = v132;
              v120[1] = v133;
              v120[2] = v134;
              v120[3] = v135;
              [v48 setTopLevelTransform:v120];

              CGFloat v44 = v32;
            }
          }
          memset(&v144, 0, sizeof(v144));
          CGAffineTransformMakeScale(&v144, v44, v44);
          __int16 v49 = [v42 jtEffect];
          v50 = [*(id *)(v112 + 40) captureViewController];
          uint64_t v51 = [v50 view];
          [v51 frame];
          CGAffineTransform v119 = v144;
          long long v117 = v107;
          uint64_t v118 = v35;
          +[JFXEffectEditingUtilities addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:](JFXEffectEditingUtilities, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v49, &v119, &v117, 1);

          [(CFXEffectComposition *)v110 addEffect:v42 completion:0];
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v140 objects:v145 count:16];
      }
      while (v29);
    }

    uint64_t v1 = v112;
    v52 = [*(id *)(v112 + 40) captureViewController];
    [v52 setComposition:v110];

    if (v5)
    {
      v53 = (char *)&PVCardinalAnglesComplement
          + 4
          * +[JFXRotationTransforms rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:](JFXRotationTransforms, "rotationFromCaptureDevicePosition:captureVideoOrientation:toInterfaceOrientation:", [*(id *)(v112 + 32) cameraPosition], *(void *)(v112 + 112), 1);
      unint64_t v9 = 0x264C08000;
    }
    else
    {
      unsigned int v54 = +[JFXOrientationMonitor deviceInterfaceOrientation];
      unint64_t v9 = 0x264C08000uLL;
      if (v54 > 4)
      {
        uint64_t v55 = 0;
        goto LABEL_48;
      }
      v53 = (char *)&unk_234D61008 + 4 * (int)v54;
    }
    uint64_t v55 = *(unsigned int *)v53;
LABEL_48:
    v56 = [[JFXPixelRotationSession alloc] initWithRotation:v55 mirror:0];
    [*(id *)(v112 + 40) setExternalCaptureSessionRotationSession:v56];

    objc_msgSend(*(id *)(v112 + 40), "setLastDeviceOrientation:", +[JFXOrientationMonitor deviceInterfaceOrientation](JFXOrientationMonitor, "deviceInterfaceOrientation"));
  }
  if (CGRectIsEmpty(*(CGRect *)(v1 + 48)) || CGRectHasNan())
  {
    v57 = JFXLog_camera();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR)) {
      __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_68_cold_3();
    }

    BOOL v58 = [MEMORY[0x263F1C920] mainScreen];
    [v58 bounds];
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
    double v66 = v65;
  }
  else
  {
    double v60 = *(double *)(v1 + 48);
    double v62 = *(double *)(v1 + 56);
    double v64 = *(double *)(v1 + 64);
    double v66 = *(double *)(v1 + 72);
  }
  if (CGRectIsEmpty(*(CGRect *)(v1 + 80)) || CGRectHasNan())
  {
    uint64_t v67 = JFXLog_camera();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
      __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_68_cold_2();
    }

    double v111 = 0.0;
    double v109 = 1.0;
    double v68 = 1.0;
    double v69 = 0.0;
  }
  else
  {
    double v69 = *(double *)(v1 + 80);
    double v68 = *(double *)(v1 + 96);
    double v109 = *(double *)(v1 + 104);
    double v111 = *(double *)(v1 + 88);
  }
  [*(id *)(v1 + 40) externalPresentationRect];
  v150.origin.CGFloat x = v60;
  v150.origin.CGFloat y = v62;
  v150.size.CGFloat width = v64;
  v150.size.CGFloat height = v66;
  if (!CGRectEqualToRect(v148, v150)
    || ([*(id *)(v1 + 40) externalContentRect],
        v151.origin.CGFloat x = v69,
        v151.size.CGFloat height = v109,
        v151.origin.CGFloat y = v111,
        v151.size.CGFloat width = v68,
        !CGRectEqualToRect(v149, v151)))
  {
    uint64_t v1 = v112;
    objc_msgSend(*(id *)(v112 + 40), "setExternalPresentationRect:", v60, v62, v64, v66);
    objc_msgSend(*(id *)(v112 + 40), "setExternalContentRect:", v69, v111, v68, v109);
    v70 = JFXLog_camera();
    if (os_log_type_enabled(v70, OS_LOG_TYPE_DEBUG))
    {
      v102 = NSStringFromCGRect(*(CGRect *)(v112 + 48));
      v103 = NSStringFromCGRect(*(CGRect *)(v112 + 80));
      v147.CGFloat width = Width;
      v147.CGFloat height = Height;
      v104 = NSStringFromCGSize(v147);
      LODWORD(v144.a) = 138412802;
      *(void *)((char *)&v144.a + 4) = v102;
      WORD2(v144.b) = 2112;
      *(void *)((char *)&v144.b + 6) = v103;
      HIWORD(v144.c) = 2112;
      *(void *)&v144.d = v104;
      _os_log_debug_impl(&dword_234C41000, v70, OS_LOG_TYPE_DEBUG, "renderFrameWithImageData presentationRect  %@ contentRect %@ renderSize %@", (uint8_t *)&v144, 0x20u);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_72;
    block[3] = &unk_264C0A150;
    block[4] = *(void *)(v112 + 40);
    *(double *)&void block[5] = v60;
    *(double *)&block[6] = v62;
    *(double *)&block[7] = v64;
    *(double *)&block[8] = v66;
    *(double *)&block[9] = v69;
    *(double *)&block[10] = v111;
    *(double *)&block[11] = v68;
    *(double *)&block[12] = v109;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  uint64_t v71 = [*(id *)(v1 + 32) captureFramesPerSecond];
  v72 = [*(id *)(v9 + 3112) sharedInstance];
  [v72 setFrameRate:v71];

  uint64_t v73 = [*(id *)(v1 + 32) captureFramesPerSecond];
  v74 = [*(id *)(v9 + 3112) sharedInstance];
  [v74 setTimeScale:v73];

  [*(id *)(v1 + 32) setMirrored:useMirroredFrontCameraInStreamMode()];
  uint64_t v75 = [*(id *)(v1 + 32) cameraPosition];
  if (v75 != [*(id *)(v1 + 40) externalCaptureSessionCameraPosition]
    || ([*(id *)(v1 + 40) externalCaptureSessionCameraPositionSet] & 1) == 0)
  {
    [*(id *)(v1 + 40) setExternalCaptureSessionCameraPositionSet:1];
    v76 = CFXLog_action();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
    {
      v77 = [*(id *)(v1 + 40) captureViewController];
      v78 = [v77 composition];
      v79 = [v78 jtEffects];
      v80 = +[CFXActionLogging actionLogAsJSONForEvent:@"camera flipped" atLocation:@"live" withEffectStack:v79];
      LODWORD(v144.a) = 138543362;
      *(void *)((char *)&v144.a + 4) = v80;
      _os_log_impl(&dword_234C41000, v76, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v144, 0xCu);
    }
    v114[0] = MEMORY[0x263EF8330];
    v114[1] = 3221225472;
    v114[2] = __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_73;
    v114[3] = &unk_264C09F10;
    int8x16_t v113 = *(int8x16_t *)(v1 + 32);
    id v81 = (id)v113.i64[0];
    int8x16_t v115 = vextq_s8(v113, v113, 8uLL);
    dispatch_async(MEMORY[0x263EF83A0], v114);
    if (([*(id *)(v1 + 40) isEffectsAnalyticsRunning] & 1) == 0)
    {
      [*(id *)(v1 + 40) setIsEffectsAnalyticsRunning:1];
      v82 = CFXLog_action();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
      {
        v83 = [*(id *)(v1 + 40) captureViewController];
        v84 = [v83 composition];
        v85 = [v84 jtEffects];
        v86 = +[CFXActionLogging actionLogAsJSONForEvent:@"started effects in stream" atLocation:@"live" withEffectStack:v85];
        LODWORD(v144.a) = 138543362;
        *(void *)((char *)&v144.a + 4) = v86;
        _os_log_impl(&dword_234C41000, v82, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v144, 0xCu);
      }
      v87 = (void *)MEMORY[0x263EF83A0];
      dispatch_async(MEMORY[0x263EF83A0], &__block_literal_global_76);
    }
    v88 = +[JFXVideoCameraController sharedInstance];
    [v88 setMostRecentARMetadata:0];

    objc_msgSend(*(id *)(v1 + 40), "setExternalCaptureSessionCameraPosition:", objc_msgSend(*(id *)(v1 + 32), "cameraPosition"));
  }
  v89 = [*(id *)(v1 + 32) faceData];

  if (!v89)
  {
    v90 = JFXLog_camera();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
      __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_68_cold_1(v90, v91, v92, v93, v94, v95, v96, v97);
    }
  }
  uint64_t v98 = *(void *)(v1 + 112);
  uint64_t v99 = *(void *)(v1 + 32);
  v100 = [*(id *)(v1 + 40) captureViewController];
  v101 = [v100 composition];
  +[CFXCameraStreamAdapter notifyExternalImageData:v99 orientation:v98 effectComposition:v101];
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_72(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) captureViewController];
  objc_msgSend(v2, "setLiveCapturePresentationFrame:withContentRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_73(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) captureViewController];
  [v2 removeEffectsForCameraSwitch];

  uint64_t v3 = [*(id *)(a1 + 40) cameraPosition];
  if (v3 == 2)
  {
    int v4 = +[CFXAnalyticsManager sharedInstance];
    [v4 stopTrackingTimeIntervalEventWithName:@"activeexternalcameratime"];

    uint64_t v5 = +[CFXAnalyticsManager sharedInstance];
    [v5 stopTrackingTimeIntervalEventWithName:@"activebackcameratime"];

    double v6 = +[CFXAnalyticsManager sharedInstance];
    [v6 startTrackingTimeIntervalEventWithName:@"activefrontcameratime"];
  }
  else if (v3 != 1)
  {
    if (v3) {
      return;
    }
    goto LABEL_7;
  }
  uint64_t v7 = +[CFXAnalyticsManager sharedInstance];
  [v7 stopTrackingTimeIntervalEventWithName:@"activeexternalcameratime"];

  int64_t v8 = +[CFXAnalyticsManager sharedInstance];
  [v8 stopTrackingTimeIntervalEventWithName:@"activefrontcameratime"];

  unint64_t v9 = +[CFXAnalyticsManager sharedInstance];
  [v9 startTrackingTimeIntervalEventWithName:@"activebackcameratime"];

LABEL_7:
  CGFloat v10 = +[CFXAnalyticsManager sharedInstance];
  [v10 stopTrackingTimeIntervalEventWithName:@"activebackcameratime"];

  double v11 = +[CFXAnalyticsManager sharedInstance];
  [v11 stopTrackingTimeIntervalEventWithName:@"activefrontcameratime"];

  id v12 = +[CFXAnalyticsManager sharedInstance];
  [v12 startTrackingTimeIntervalEventWithName:@"activeexternalcameratime"];
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_74()
{
  id v0 = +[CFXAnalyticsManager sharedInstance];
  [v0 startTrackingTimeIntervalEventWithName:@"activetime"];
}

- (void)startCaptureSession
{
  if (![(CFXCameraViewController *)self usesInternalCaptureSession])
  {
    CGFloat v10 = (void *)MEMORY[0x263EFF940];
    uint64_t v11 = *MEMORY[0x263EFF4A0];
    objc_msgSend(NSString, "stringWithFormat:", @"%s called on %@ not configured to run internally; see usesInternalCaptureSession",
      "-[CFXCameraViewController startCaptureSession]",
    id v12 = self);
    double v13 = [v10 exceptionWithName:v11 reason:v12 userInfo:0];

    objc_exception_throw(v13);
  }
  [(CFXCameraViewController *)self setCapturingFunCamMedia:0];
  uint64_t v3 = +[JFXVideoCameraController sharedInstance];
  int v4 = [v3 cameraSessionRunning];

  uint64_t v5 = [(CFXCameraViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__CFXCameraViewController_startCaptureSession__block_invoke;
  v14[3] = &unk_264C0A1A0;
  char v15 = v4;
  v14[4] = self;
  char v16 = v6 & 1;
  uint64_t v7 = MEMORY[0x237DD15A0](v14);
  int64_t v8 = (void *)v7;
  if (v4)
  {
    (*(void (**)(uint64_t, void))(v7 + 16))(v7, 0);
  }
  else
  {
    unint64_t v9 = +[JFXVideoCameraController sharedInstance];
    [v9 startCameraSession:v8];
  }
}

void __46__CFXCameraViewController_startCaptureSession__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (!*(unsigned char *)(a1 + 40))
  {
    if ([*(id *)(a1 + 32) captureMode] == 2)
    {
      if ([*(id *)(a1 + 32) initialFlashMode] == 2) {
        uint64_t v3 = 2;
      }
      else {
        uint64_t v3 = [*(id *)(a1 + 32) initialFlashMode] == 1;
      }
      int v4 = +[JFXVideoCameraController sharedInstance];
      [v4 setCaptureTorchMode:v3 completion:0];
    }
    uint64_t v5 = [*(id *)(a1 + 32) captureViewController];
    [v5 cameraDidStart];
  }
  if (*(unsigned char *)(a1 + 41))
  {
    char v6 = [*(id *)(a1 + 32) delegate];
    [v6 cameraViewControllerDidStartCaptureSession:*(void *)(a1 + 32)];
  }
}

- (void)stopCaptureSession
{
  if ([(CFXCameraViewController *)self usesInternalCaptureSession])
  {
    uint64_t v3 = +[JFXVideoCameraController sharedInstance];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __45__CFXCameraViewController_stopCaptureSession__block_invoke;
    v4[3] = &unk_264C09FA8;
    v4[4] = self;
    [v3 stopCameraSession:v4];
  }
}

void __45__CFXCameraViewController_stopCaptureSession__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __45__CFXCameraViewController_stopCaptureSession__block_invoke_2;
    block[3] = &unk_264C09FA8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __45__CFXCameraViewController_stopCaptureSession__block_invoke_2(uint64_t a1)
{
  if (([*(id *)(a1 + 32) capturingFunCamMedia] & 1) == 0)
  {
    id v2 = +[JFXVideoCameraController sharedInstance];
    [v2 prepareCameraForMode:0 position:0 completion:0];

    objc_msgSend(*(id *)(a1 + 32), "JFX_exitAnalytics");
    [*(id *)(a1 + 32) setIsEffectsAnalyticsRunning:0];
  }
  char v3 = [*(id *)(a1 + 32) captureViewController];
  [v3 cameraDidStop];

  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 cameraViewControllerDidStopCaptureSession:*(void *)(a1 + 32)];
}

- (void)resign
{
  id v2 = [(CFXCameraViewController *)self captureViewController];
  [v2 resign];
}

- (void)renderFrameWithImageDataArchive:(id)a3 imagePixelBuffer:(__CVBuffer *)a4 depthPixelBuffer:(__CVBuffer *)a5 orientation:(int64_t)a6 presentationRect:(CGRect)a7 contentsRect:(CGRect)a8
{
  CGFloat height = a8.size.height;
  CGFloat width = a8.size.width;
  CGFloat y = a8.origin.y;
  CGFloat x = a8.origin.x;
  CGFloat v12 = a7.size.height;
  CGFloat v13 = a7.size.width;
  CGFloat v14 = a7.origin.y;
  CGFloat v15 = a7.origin.x;
  id v20 = a3;
  double v21 = [(CFXCameraViewController *)self captureViewController];
  int v22 = [v21 livePlayerIsSaturated];

  if (v22)
  {
    id v23 = [(CFXCameraViewController *)self captureViewController];
    [v23 willDropCameraFrame];

    kdebug_trace();
  }
  else
  {
    CVPixelBufferRetain(a4);
    CVPixelBufferRetain(a5);
    v24 = [(CFXCameraViewController *)self externalCaptureSessionInputDeserializationQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __135__CFXCameraViewController_renderFrameWithImageDataArchive_imagePixelBuffer_depthPixelBuffer_orientation_presentationRect_contentsRect___block_invoke;
    block[3] = &unk_264C0A1C8;
    uint64_t v28 = a4;
    uint64_t v29 = a5;
    id v26 = v20;
    CGFloat v27 = self;
    int64_t v30 = a6;
    CGFloat v31 = v15;
    CGFloat v32 = v14;
    CGFloat v33 = v13;
    CGFloat v34 = v12;
    CGFloat v35 = x;
    CGFloat v36 = y;
    CGFloat v37 = width;
    CGFloat v38 = height;
    dispatch_async(v24, block);
  }
}

void __135__CFXCameraViewController_renderFrameWithImageDataArchive_imagePixelBuffer_depthPixelBuffer_orientation_presentationRect_contentsRect___block_invoke(uint64_t a1)
{
  v23[2] = *MEMORY[0x263EF8340];
  long long v20 = *MEMORY[0x263F010E0];
  *(_OWORD *)&time.value = *MEMORY[0x263F010E0];
  CMTimeEpoch v2 = *(void *)(MEMORY[0x263F010E0] + 16);
  time.epoch = v2;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  char v3 = (void *)MEMORY[0x263F08928];
  id v4 = (void *)MEMORY[0x263EFFA08];
  v23[0] = objc_opt_class();
  v23[1] = objc_opt_class();
  uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:2];
  char v6 = [v4 setWithArray:v5];
  id v7 = [v3 unarchivedObjectOfClasses:v6 fromData:*(void *)(a1 + 32) error:0];

  if (v7)
  {
    [v7 timestamp];
    CMTimeMakeWithSeconds(&v21, v8, 1000000000);
    CMTime time = v21;
    CMTimeGetSeconds(&time);
    kdebug_trace();
    [v7 setPixelBuffer:*(void *)(a1 + 48)];
    unint64_t v9 = [v7 depthData];
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 56);

      if (v10)
      {
        uint64_t v11 = [v7 depthData];
        CGFloat v12 = [v11 depthDataByReplacingDepthDataMapWithPixelBuffer:*(void *)(a1 + 56) error:0];
        [v7 setDepthData:v12];
      }
    }
    CGFloat v13 = objc_msgSend(*(id *)(a1 + 40), "metadataValidator", v20);
    [v13 validateARImageData:v7];

    CGFloat v14 = [BufferWithTimestamp alloc];
    uint64_t v15 = *(void *)(a1 + 48);
    [v7 timestamp];
    char v16 = -[BufferWithTimestamp initWithBuffer:timstamp:](v14, "initWithBuffer:timstamp:", v15);
    BOOL v17 = [*(id *)(a1 + 40) outputBufferQueue];
    int v18 = [v17 enqueue:v16];

    if (v18)
    {
      CVPixelBufferRetain(*(CVPixelBufferRef *)(a1 + 48));
    }
    else
    {
      double v19 = JFXLog_camera();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        __135__CFXCameraViewController_renderFrameWithImageDataArchive_imagePixelBuffer_depthPixelBuffer_orientation_presentationRect_contentsRect___block_invoke_cold_1();
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "renderFrameWithImageData:orientation:presentationRect:contentsRect:", v7, *(void *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 128));
  }
  else
  {
    *(_OWORD *)&time.value = v20;
    time.epoch = v2;
    CMTimeGetSeconds(&time);
    kdebug_trace();
  }
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
  CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 56));
}

- (void)effectBrowserViewController:(id)a3 didDropOverlayEffect:(id)a4 atScreenLocation:(CGPoint)a5 atScreenSize:(CGSize)a6 rotationAngle:(double)a7
{
  double height = a6.height;
  double width = a6.width;
  double y = a5.y;
  double x = a5.x;
  id v13 = a4;
  id v14 = [(CFXCameraViewController *)self captureViewController];
  objc_msgSend(v14, "addOverlayEffect:atScreenLocation:atScreenSize:rotationAngle:", v13, x, y, width, height, a7);
}

- (void)effectBrowserViewController:(id)a3 didSelectAppWithIdentifier:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  Float64 v8 = +[CFXAnalyticsManager sharedInstance];
  unint64_t v9 = v8;
  if (v7)
  {
    [v8 startTrackingPickerWithIdentifier:v7];
  }
  else
  {
    uint64_t v10 = [(CFXCameraViewController *)self effectBrowserPresentedAppIdentifier];
    [v9 stopTrackingPickerWithIdentifier:v10];
  }
  [(CFXCameraViewController *)self setEffectBrowserPresentedAppIdentifier:v7];
  if (([v7 isEqual:@"com.apple.FunCamera.Filters"] & 1) == 0)
  {
    uint64_t v11 = +[JFXVideoCameraController sharedInstance];
    [v11 setSessionRequiresFaceTracking:v7 != 0];
  }
  int64_t v12 = [(CFXCameraViewController *)self effectsState];
  id v13 = JFXLog_pickerUI();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 134217984;
    int64_t v18 = v12;
    _os_log_impl(&dword_234C41000, v13, OS_LOG_TYPE_DEFAULT, "The effect browser has changed - effectsState: %ld", (uint8_t *)&v17, 0xCu);
  }

  id v14 = [(CFXCameraViewController *)self delegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    char v16 = [(CFXCameraViewController *)self delegate];
    [v16 cameraViewController:self didChangeEffectsState:v12];
  }
}

- (void)effectBrowserViewController:(id)a3 didRemoveAllEffectsOfType:(id)a4
{
  id v5 = a4;
  id v6 = [(CFXCameraViewController *)self captureViewController];
  [v6 removeAllEffectsOfType:v5 animated:1];

  id v7 = [v5 identifier];

  LODWORD(v5) = [v7 isEqualToString:@"Animoji"];
  if (v5)
  {
    id v8 = +[CFXAnalyticsManager sharedInstance];
    [v8 didSelectEffectOfType:@"Animoji" effectIsNone:1];
  }
}

- (void)effectBrowserViewController:(id)a3 didSelectEffect:(id)a4
{
  id v5 = a4;
  id v6 = [(CFXCameraViewController *)self captureViewController];
  [v6 addEffect:v5];

  id v7 = [v5 jtEffect];
  int v8 = [v7 type];

  unint64_t v9 = @"Filter";
  if (v8 != 1) {
    unint64_t v9 = 0;
  }
  uint64_t v10 = v9;
  id v12 = +[CFXAnalyticsManager sharedInstance];
  uint64_t v11 = [v5 isNone];

  [v12 didSelectEffectOfType:v10 effectIsNone:v11];
}

- (id)selectedFilterIdentifierForEffectBrowserViewController:(id)a3
{
  char v3 = [(CFXCameraViewController *)self captureViewController];
  id v4 = [v3 composition];
  id v5 = [v4 jtEffectsForType:1];
  id v6 = [v5 firstObject];

  id v7 = [v6 effectID];

  return v7;
}

- (id)selectedAnimojiIdentifierForEffectBrowserViewController:(id)a3
{
  char v3 = [(CFXCameraViewController *)self captureViewController];
  id v4 = [v3 composition];
  id v5 = [v4 jtEffectsForType:7];
  id v6 = [v5 firstObject];

  id v7 = [v6 effectID];

  return v7;
}

- (id)localizedPromptForHidingAnimojiForEffectBrowserViewController:(id)a3
{
  int64_t v3 = [(CFXCameraViewController *)self devicePosition];
  if (!v3)
  {
    id v4 = [MEMORY[0x263F086E0] jfxBundle];
    id v5 = v4;
    id v6 = @"HIDE_MEMOJI_EXTERNAL_CAMERA_PROMPT_DISPLAY Name";
    goto LABEL_5;
  }
  if (v3 == 1)
  {
    id v4 = [MEMORY[0x263F086E0] jfxBundle];
    id v5 = v4;
    id v6 = @"HIDE_MEMOJI_BACK_CAMERA_PROMPT_DISPLAY Name";
LABEL_5:
    id v7 = [v4 localizedStringForKey:v6 value:&stru_26E7CDB50 table:0];

    goto LABEL_7;
  }
  id v7 = 0;
LABEL_7:
  return v7;
}

- (void)effectBrowserViewController:(id)a3 willChangeDockHeight:(double)a4
{
  BOOL v6 = a4 > 50.0;
  id v7 = [(CFXCameraViewController *)self captureViewController];
  double v8 = a4 + -44.0;
  [v7 updateUIForDockMagnify:v6 dockHeightDelta:v8];

  id v9 = [(CFXCameraViewController *)self cameraControlsViewController];
  [v9 updateUIForDockMagnify:v6 dockHeightDelta:v8];
}

- (BOOL)shouldAlwaysPresentExpandedAppsForEffectBrowserViewController:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  BOOL v5 = [v4 userInterfaceIdiom] == 1 && -[CFXCameraViewController captureMode](self, "captureMode") != 1;

  return v5;
}

- (BOOL)shouldRotateCellsForDeviceOrientation
{
  return [(CFXCameraViewController *)self captureMode] == 1;
}

- (BOOL)allowLandscapeForEffectBrowserViewController:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  if ([v4 userInterfaceIdiom]) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [(CFXCameraViewController *)self captureMode] != 1;
  }

  return v5;
}

- (void)effectBrowserViewController:(id)a3 filterPickerPreviewBackgroundImageAtSizeInPixels:(CGSize)a4 completion:(id)a5
{
}

- (double)effectBrowserViewController:(id)a3 screenTopBarHeightForWindowBounds:(CGRect)a4 orientation:(int64_t)a5
{
  objc_msgSend(MEMORY[0x263F5E478], "cameraTopBarFrameForReferenceBounds:", a3, a5, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  return CGRectGetHeight(*(CGRect *)&v5);
}

- (void)captureViewController:(id)a3 didCaptureMediaItem:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(CFXCameraViewController *)self effectBrowserViewController];
  [v6 hideBrowserAnimated:0 completion:0];

  if (!v5)
  {
    id v9 = +[JFXVideoCameraController sharedInstance];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __69__CFXCameraViewController_captureViewController_didCaptureMediaItem___block_invoke;
    v10[3] = &unk_264C09FA8;
    v10[4] = self;
    [v9 stopCameraSession:v10];
    goto LABEL_5;
  }
  [(CFXCameraViewController *)self setCapturingFunCamMedia:1];
  id v7 = [(CFXCameraViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CFXCameraViewController *)self delegate];
    [v9 cameraViewController:self didCaptureMediaItem:v5];
LABEL_5:
  }
}

uint64_t __69__CFXCameraViewController_captureViewController_didCaptureMediaItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startCaptureSession];
}

- (void)captureViewController:(id)a3 didChangeEffectComposition:(id)a4
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int64_t v5 = [(CFXCameraViewController *)self effectsState];
  BOOL v6 = JFXLog_effects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134217984;
    int64_t v11 = v5;
    _os_log_impl(&dword_234C41000, v6, OS_LOG_TYPE_DEFAULT, "The effect composition has changed - effectsState: %ld", (uint8_t *)&v10, 0xCu);
  }

  id v7 = [(CFXCameraViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CFXCameraViewController *)self delegate];
    [v9 cameraViewController:self didChangeEffectsState:v5];
  }
}

- (void)captureViewController:(id)a3 didRenderFrame:(id)a4
{
  id v5 = a4;
  BOOL v6 = [(CFXCameraViewController *)self externalCaptureSessionOutputProcessingQueue];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke;
  v8[3] = &unk_264C09F10;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(v6, v8);
}

void __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke(uint64_t a1)
{
  *(void *)&v46[5] = *MEMORY[0x263EF8340];
  CMTimeEpoch v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) == 0) {
    goto LABEL_29;
  }
  id v4 = *(void **)(a1 + 40);
  if (v4) {
    [v4 timestamp];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  BOOL v6 = [*(id *)(a1 + 32) outputBufferQueue];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    char v8 = [*(id *)(a1 + 32) outputBufferQueue];
    if ((unint64_t)[v8 count] < 2)
    {
LABEL_13:
    }
    else
    {
      while (1)
      {
        id v9 = [*(id *)(a1 + 32) outputBufferQueue];
        [v9 headBufferTimestamp];
        double v11 = vabdd_f64(Seconds, v10);

        if (v11 <= 0.0001) {
          break;
        }
        uint64_t v12 = [*(id *)(a1 + 32) outputBufferQueue];
        id v13 = [v12 dequeue];

        id v14 = [*(id *)(a1 + 32) delegate];
        char v15 = objc_opt_respondsToSelector();

        if (v15)
        {
          char v16 = [*(id *)(a1 + 32) delegate];
          objc_msgSend(v16, "cameraViewController:didDropFrame:", *(void *)(a1 + 32), objc_msgSend(v13, "pixelBuffer"));
        }
        CVPixelBufferRelease((CVPixelBufferRef)[v13 pixelBuffer]);
        int v17 = JFXLog_camera();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke_cold_2(v45, v13, v46, v17);
        }

        char v8 = [*(id *)(a1 + 32) outputBufferQueue];
        if ((unint64_t)[v8 count] <= 1) {
          goto LABEL_13;
        }
      }
    }
    int64_t v18 = [*(id *)(a1 + 32) outputBufferQueue];
    uint64_t v19 = [v18 dequeue];
    uint64_t v20 = [v19 pixelBuffer];

    CMTime v21 = [*(id *)(a1 + 32) externalCaptureSessionRotationSession];
    int v22 = (__CVBuffer *)objc_msgSend(v21, "createRotatedPixelBuffer:using:", objc_msgSend(*(id *)(a1 + 40), "pixelBuffer"), v20);

    id v23 = [CFXFrame alloc];
    v24 = *(void **)(a1 + 40);
    if (v24) {
      [v24 timestamp];
    }
    else {
      memset(v42, 0, sizeof(v42));
    }
    id v26 = [(CFXFrame *)v23 initWithPixelBuffer:v22 timestamp:v42];
    CVPixelBufferRelease(v22);
    uint64_t v28 = *(void **)(a1 + 32);
    CGFloat v27 = *(void **)(a1 + 40);
    if (v27)
    {
      [v27 timestamp];
      if (v28)
      {
LABEL_22:
        [v28 noteOutputFrameWithTimestamp:v39];
LABEL_25:
        long long v37 = v40;
        uint64_t v38 = v41;
        [(CFXFrame *)v26 setLatency:&v37];
        if (v26)
        {
          [(CFXFrame *)v26 timestamp];
          [(CFXFrame *)v26 latency];
        }
        else
        {
          memset(&v36, 0, sizeof(v36));
          memset(&v35, 0, sizeof(v35));
        }
        JFXAutomationLogFrameMetrics(@"jfx_rendered", &v36, &v35);
        uint64_t v29 = [*(id *)(a1 + 32) delegate];
        [v29 cameraViewController:*(void *)(a1 + 32) didRenderFrame:v26];

LABEL_29:
        int64_t v30 = [*(id *)(a1 + 32) captureViewController];
        CGFloat v31 = [v30 composition];
        int v32 = [v31 isEmpty];

        CGFloat v33 = *(void **)(a1 + 40);
        if (v32)
        {
          if (v33) {
            [v33 timestamp];
          }
          else {
            memset(&v34[1], 0, sizeof(CMTime));
          }
          CMTime v44 = v34[1];
          CMTimeGetSeconds(&v44);
        }
        else
        {
          if (v33) {
            [v33 timestamp];
          }
          else {
            memset(v34, 0, 24);
          }
          CMTime v44 = v34[0];
          CMTimeGetSeconds(&v44);
        }
        kdebug_trace();
        return;
      }
    }
    else
    {
      memset(v39, 0, sizeof(v39));
      if (v28) {
        goto LABEL_22;
      }
    }
    long long v40 = 0uLL;
    uint64_t v41 = 0;
    goto LABEL_25;
  }
  id v25 = JFXLog_camera();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke_cold_1();
  }
}

- (void)captureViewControllerDoneButtonWasTapped:(id)a3
{
  uint64_t v4 = [(CFXCameraViewController *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    BOOL v6 = [(CFXCameraViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(CFXCameraViewController *)self delegate];
      [v8 cameraViewControllerDoneButtonWasTapped:self];
    }
  }
}

- (void)captureViewControllerEffectsButtonWasTapped:(id)a3
{
  uint64_t v4 = [(CFXCameraViewController *)self delegate];
  if (v4)
  {
    id v5 = (void *)v4;
    BOOL v6 = [(CFXCameraViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = [(CFXCameraViewController *)self delegate];
      [v8 cameraViewControllerEffectsButtonWasTapped:self];
    }
  }
}

- (void)captureViewControllerPresentationRectWasDoubleTapped:(id)a3
{
  uint64_t v4 = [(CFXCameraViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(CFXCameraViewController *)self delegate];
    [v6 cameraViewControllerPresentationRectWasDoubleTapped:self];
  }
}

- (void)captureViewController:(id)a3 presentationRectWasPinchedWithState:(int64_t)a4 scale:(double)a5 velocity:(double)a6
{
  double v10 = [(CFXCameraViewController *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(CFXCameraViewController *)self delegate];
    [v12 cameraViewController:self presentationRectWasPinchedWithState:a4 scale:a5 velocity:a6];
  }
}

- (void)captureViewControllerDidStartVideoRecording:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1)
  {
    id v6 = [(CFXCameraViewController *)self effectBrowserViewController];
    [v6 hideBrowserAnimated:1 completion:0];
  }
  [(CFXCameraViewController *)self updateUIForVideoRecording:1];
}

- (void)captureViewControllerDidStopVideoRecording:(id)a3
{
}

- (void)captureViewControllerCameraFlipButtonWasTapped:(id)a3
{
  id v3 = [(CFXCameraViewController *)self effectBrowserViewController];
  [v3 refreshEffectBrowserForCameraFlip];
}

- (void)captureViewController:(id)a3 switchedToCameraPosition:(int64_t)a4
{
}

- (void)remoteCommandServer:(id)a3 didReceiveAddShapeCommandWithIdentifier:(id)a4
{
}

- (void)remoteCommandServer:(id)a3 didReceiveAddStickerCommandWithIdentifier:(id)a4 offset:(CGPoint)a5 scale:(double)a6 rotation:(double)a7
{
  double y = a5.y;
  double x = a5.x;
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v12 = a4;
  id v13 = +[CFXEffectType effectTypeWithIdentifier:@"EmojiStickers"];
  id v14 = v12;
  char v15 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v14];
  char v16 = v14;
  if (v15)
  {
    if (v14)
    {
LABEL_3:
      int v17 = +[CFXEffect effectWithIdentifier:v16 forEffectType:v13];
      int64_t v18 = JFXLog_automation();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v17 localizedTitle];
        v43.double x = x;
        v43.double y = y;
        uint64_t v20 = NSStringFromCGPoint(v43);
        *(_DWORD *)buf = 138544130;
        CGFloat v34 = v19;
        __int16 v35 = 2114;
        CMTime v36 = v20;
        __int16 v37 = 2048;
        double v38 = a6;
        __int16 v39 = 2048;
        double v40 = a7;
        _os_log_impl(&dword_234C41000, v18, OS_LOG_TYPE_DEFAULT, "Adding Emoji Sticker effect - name: %{public}@, offset: %{public}@, scale: %f, rotation: %f", buf, 0x2Au);
      }
      CMTime v21 = [(CFXCameraViewController *)self captureViewController];
      objc_msgSend(v21, "addOverlayEffect:atNormalizedPlanePoint:scale:rotationAngle:", v17, x, y, a6, a7);

      goto LABEL_20;
    }
  }
  else
  {

    [v13 effects];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    char v16 = (void *)[v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
    if (v16)
    {
      uint64_t v28 = self;
      uint64_t v23 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(v22);
          }
          id v25 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          id v26 = [v25 localizedTitle];
          int v27 = [v26 isEqualToString:v14];

          if (v27)
          {
            char v16 = [v25 identifier];
            goto LABEL_16;
          }
        }
        char v16 = (void *)[v22 countByEnumeratingWithState:&v29 objects:v41 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_16:
      self = v28;
    }

    if (v16) {
      goto LABEL_3;
    }
  }
  int v17 = JFXLog_automation();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
    -[CFXCameraViewController remoteCommandServer:didReceiveAddStickerCommandWithIdentifier:offset:scale:rotation:]();
  }
LABEL_20:
}

- (void)remoteCommandServer:(id)a3 didReceiveAddStickerCommandWithData:(id)a4 offset:(CGPoint)a5 scale:(double)a6 rotation:(double)a7
{
  double y = a5.y;
  double x = a5.x;
  v46[1] = *MEMORY[0x263EF8340];
  id v12 = a4;
  if (v12)
  {
    id v13 = NSString;
    id v14 = [MEMORY[0x263F08C38] UUID];
    char v15 = [v14 UUIDString];
    char v16 = [v13 stringWithFormat:@"CommanderAvatar_%@.png", v15];

    int v17 = NSURL;
    int64_t v18 = NSTemporaryDirectory();
    uint64_t v19 = [v18 stringByAppendingPathComponent:v16];
    uint64_t v20 = [v17 fileURLWithPath:v19];

    if ([v12 writeToURL:v20 atomically:0])
    {
      uint64_t v45 = *MEMORY[0x263F61720];
      CMTime v21 = [v20 path];
      v46[0] = v21;
      id v22 = [NSDictionary dictionaryWithObjects:v46 forKeys:&v45 count:1];

      uint64_t v23 = +[JFXEffectFactory sharedInstance];
      v24 = [v23 createEffectForType:2 fromID:*MEMORY[0x263F61538] withProperties:v22];

      id v25 = +[CFXEffect effectWithJTEffect:v24];
      id v26 = JFXLog_automation();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        long long v31 = [v25 jtEffect];
        int v27 = NSStringFromJFXEffectType([v31 type]);
        [v25 localizedTitle];
        v28 = long long v32 = self;
        v47.double x = x;
        v47.double y = y;
        long long v29 = NSStringFromCGPoint(v47);
        *(_DWORD *)buf = 138544642;
        CGFloat v34 = v27;
        __int16 v35 = 2114;
        CMTime v36 = v28;
        __int16 v37 = 2114;
        double v38 = v20;
        __int16 v39 = 2114;
        double v40 = v29;
        __int16 v41 = 2048;
        double v42 = a6;
        __int16 v43 = 2048;
        double v44 = a7;
        _os_log_impl(&dword_234C41000, v26, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, url: %{public}@, offset: %{public}@, scale: %f, rotation: %f", buf, 0x3Eu);

        self = v32;
      }

      long long v30 = [(CFXCameraViewController *)self captureViewController];
      objc_msgSend(v30, "addOverlayEffect:atNormalizedPlanePoint:scale:rotationAngle:", v25, x, y, a6, a7);
    }
    else
    {
      id v22 = JFXLog_automation();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[CFXCameraViewController remoteCommandServer:didReceiveAddStickerCommandWithData:offset:scale:rotation:]();
      }
    }
  }
  else
  {
    char v16 = JFXLog_automation();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[CFXCameraViewController remoteCommandServer:didReceiveAddStickerCommandWithData:offset:scale:rotation:](v16);
    }
  }
}

- (void)remoteCommandServer:(id)a3 didReceiveAddTextCommandWithIdentifier:(id)a4 string:(id)a5
{
}

- (void)remoteCommandServer:(id)a3 didReceiveRemoveEffectsCommandWithTypeIdentifiers:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = JFXLog_automation();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v20 = v5;
    _os_log_impl(&dword_234C41000, v6, OS_LOG_TYPE_DEFAULT, "Removing effects - types: %{public}@", buf, 0xCu);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = +[CFXEffectType effectTypeWithIdentifier:](CFXEffectType, "effectTypeWithIdentifier:", *(void *)(*((void *)&v14 + 1) + 8 * v11), (void)v14);
        id v13 = [(CFXCameraViewController *)self captureViewController];
        [v13 removeAllEffectsOfType:v12 animated:1];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (void)remoteCommandServer:(id)a3 didReceiveSetAnimojiCommandWithIdentifier:(id)a4
{
}

- (void)remoteCommandServer:(id)a3 didReceiveSetMemojiCommandWithContentsOfFile:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = [MEMORY[0x263F08C38] UUID];
  id v7 = [v6 UUIDString];

  uint64_t v8 = +[JFXAnimojiEffect createMemojiEffectWithContentsOfFile:v5 identifier:v7];
  uint64_t v9 = +[CFXEffect effectWithJTEffect:v8];
  uint64_t v10 = JFXLog_automation();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543618;
    id v13 = v5;
    __int16 v14 = 2114;
    long long v15 = v7;
    _os_log_impl(&dword_234C41000, v10, OS_LOG_TYPE_DEFAULT, "Adding Memoji at path: %{public}@, identifier: %{public}@", (uint8_t *)&v12, 0x16u);
  }

  uint64_t v11 = [(CFXCameraViewController *)self captureViewController];
  [v11 addEffect:v9 allowImmediateTextEditing:1];
}

- (void)remoteCommandServer:(id)a3 didReceiveSetFilterCommandWithIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = +[CFXEffectType effectTypeWithIdentifier:@"Filter"];
  id v7 = v5;
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v7];
  uint64_t v9 = v7;
  if (v8)
  {
    if (v7)
    {
LABEL_3:
      [(CFXCameraViewController *)self CFX_automationAddEffectWithEffectTypeIdentifier:@"Filter" identifier:v9 string:0];
      goto LABEL_19;
    }
  }
  else
  {
    [v6 effects];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    uint64_t v9 = v7;
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v19 = self;
      id v20 = v6;
      uint64_t v13 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v16 = objc_msgSend(v15, "localizedTitle", v19, v20, (void)v21);
          int v17 = [v16 isEqualToString:v7];

          if (v17)
          {
            uint64_t v9 = [v15 identifier];

            goto LABEL_14;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      uint64_t v9 = v7;
LABEL_14:
      self = v19;
      id v6 = v20;
    }

    if (v9) {
      goto LABEL_3;
    }
  }
  int64_t v18 = JFXLog_automation();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
    -[CFXCameraViewController remoteCommandServer:didReceiveSetFilterCommandWithIdentifier:]();
  }

LABEL_19:
}

- (void)CFX_automationAddEffectWithEffectTypeIdentifier:(id)a3 identifier:(id)a4 string:(id)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = (__CFString *)a5;
  uint64_t v11 = +[CFXEffectType effectTypeWithIdentifier:v8];
  uint64_t v12 = +[CFXEffect effectWithIdentifier:v9 forEffectType:v11];
  uint64_t v13 = v12;
  if (@"Text" == v8)
  {
    __int16 v14 = [v12 jtEffect];
    +[JFXEffectEditingUtilities updateEffectText:v14 newText:v10];
  }
  else
  {
    if (@"Animoji" != v8) {
      goto LABEL_6;
    }
    __int16 v14 = +[JFXAnimojiEffect createAnimojiEffectForID:v9];
    uint64_t v15 = +[CFXEffect effectWithJTEffect:v14];

    uint64_t v13 = (void *)v15;
  }

LABEL_6:
  uint64_t v16 = JFXLog_automation();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = [v13 jtEffect];
    NSStringFromJFXEffectType([v17 type]);
    int64_t v18 = v23 = self;
    uint64_t v19 = [v13 localizedTitle];
    id v20 = (void *)v19;
    *(_DWORD *)buf = 138544130;
    long long v21 = &stru_26E7CDB50;
    id v25 = v18;
    if (v10) {
      long long v21 = v10;
    }
    __int16 v26 = 2114;
    uint64_t v27 = v19;
    __int16 v28 = 2114;
    id v29 = v9;
    __int16 v30 = 2114;
    long long v31 = v21;
    _os_log_impl(&dword_234C41000, v16, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, identifier: %{public}@, string: %{public}@", buf, 0x2Au);

    self = v23;
  }

  long long v22 = [(CFXCameraViewController *)self captureViewController];
  [v22 addEffect:v13 allowImmediateTextEditing:@"Text"];
}

- (void)stageManagerWarningDoneButtonWasTapped:(id)a3
{
  uint64_t v4 = [(CFXCameraViewController *)self delegate];

  if (v4)
  {
    id v5 = [(CFXCameraViewController *)self delegate];
    [v5 cameraViewControllerDoneButtonWasTapped:self];
  }
}

- (void)JFX_exitAnalytics
{
  CMTimeEpoch v2 = +[CFXAnalyticsManager sharedInstance];
  [v2 stopTrackingTimeIntervalEventWithName:@"activefrontcameratime"];

  id v3 = +[CFXAnalyticsManager sharedInstance];
  [v3 stopTrackingTimeIntervalEventWithName:@"activebackcameratime"];

  id v4 = +[CFXAnalyticsManager sharedInstance];
  [v4 stopTrackingTimeIntervalEventWithName:@"activetime"];
}

- (void)noteInputFrameWithTimestamp:(double)a3
{
  id v4 = [NSNumber numberWithDouble:a3];
  id v5 = [v4 stringValue];

  memset(&v10, 0, sizeof(v10));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v10, HostTimeClock);
  CMTime v9 = v10;
  id v7 = [MEMORY[0x263F08D40] valueWithCMTime:&v9];
  uint64_t v8 = [(CFXCameraViewController *)self externalCaptureSessionInputFrameTimestamps];
  [v8 setValue:v7 forKey:v5];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)noteOutputFrameWithTimestamp:(SEL)a3
{
  memset(&v18, 0, sizeof(v18));
  HostTimeClock = CMClockGetHostTimeClock();
  CMClockGetTime(&v18, HostTimeClock);
  CMTime time = *(CMTime *)a4;
  uint64_t v8 = [NSNumber numberWithDouble:CMTimeGetSeconds(&time)];
  CMTime v9 = [v8 stringValue];

  memset(&time, 0, sizeof(time));
  CMTime v10 = [(CFXCameraViewController *)self externalCaptureSessionInputFrameTimestamps];
  uint64_t v11 = [v10 valueForKey:v9];
  uint64_t v12 = v11;
  if (v11) {
    [v11 CMTimeValue];
  }
  else {
    memset(&time, 0, sizeof(time));
  }

  uint64_t v13 = [(CFXCameraViewController *)self externalCaptureSessionInputFrameTimestamps];
  [v13 removeObjectForKey:v9];

  retstr->var0 = 0;
  *(void *)&retstr->var1 = 0;
  retstr->var3 = 0;
  CMTime lhs = v18;
  CMTime v15 = time;
  CMTimeSubtract((CMTime *)retstr, &lhs, &v15);

  return result;
}

- (void)updateUIForVideoRecording:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__CFXCameraViewController_updateUIForVideoRecording___block_invoke;
  v3[3] = &unk_264C0A0C0;
  v3[4] = self;
  BOOL v4 = a3;
  +[JTAnimation performAnimation:v3 duration:0 completion:0.25];
}

void __53__CFXCameraViewController_updateUIForVideoRecording___block_invoke(uint64_t a1)
{
  CMTimeEpoch v2 = [*(id *)(a1 + 32) captureViewController];
  [v2 updateUIForVideoRecording:*(unsigned __int8 *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) cameraControlsViewController];
  [v3 updateUIForVideoRecording:*(unsigned __int8 *)(a1 + 40)];

  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  id v6 = [*(id *)(a1 + 32) effectBrowserViewController];
  id v5 = [v6 view];
  [v5 setAlpha:v4];
}

- (int64_t)aspectRatioCrop
{
  return self->_aspectRatioCrop;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (CFXCameraViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXCameraViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsViewfinder
{
  return self->_showsViewfinder;
}

- (BOOL)usesInternalCaptureSession
{
  return self->_usesInternalCaptureSession;
}

- (NSString)animojiOnlyEffectID
{
  return self->_animojiOnlyEffectID;
}

- (CFXCaptureViewController)captureViewController
{
  return self->_captureViewController;
}

- (void)setCaptureViewController:(id)a3
{
}

- (CFXEffectBrowserViewController)effectBrowserViewController
{
  return self->_effectBrowserViewController;
}

- (void)setEffectBrowserViewController:(id)a3
{
}

- (CFXCameraControlsViewController)cameraControlsViewController
{
  return self->_cameraControlsViewController;
}

- (void)setCameraControlsViewController:(id)a3
{
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (void)setCameraPosition:(int64_t)a3
{
  self->_cameraPosition = a3;
}

- (int64_t)initialFlashMode
{
  return self->_initialFlashMode;
}

- (void)setInitialFlashMode:(int64_t)a3
{
  self->_initialFlashMode = a3;
}

- (BOOL)cameraControlsShown
{
  return self->_cameraControlsShown;
}

- (void)setCameraControlsShown:(BOOL)a3
{
  self->_cameraControlsShown = a3;
}

- (BOOL)capturingFunCamMedia
{
  return self->_capturingFunCamMedia;
}

- (void)setCapturingFunCamMedia:(BOOL)a3
{
  self->_capturingFunCamMedia = a3;
}

- (NSString)effectBrowserPresentedAppIdentifier
{
  return self->_effectBrowserPresentedAppIdentifier;
}

- (void)setEffectBrowserPresentedAppIdentifier:(id)a3
{
}

- (JFXRemoteCommandServer)remoteCommandServer
{
  return self->_remoteCommandServer;
}

- (void)setRemoteCommandServer:(id)a3
{
}

- (UIView)effectsPickerSnapshotContainerView
{
  return self->_effectsPickerSnapshotContainerView;
}

- (void)setEffectsPickerSnapshotContainerView:(id)a3
{
}

- (OS_dispatch_queue)externalCaptureSessionInputDeserializationQueue
{
  return self->_externalCaptureSessionInputDeserializationQueue;
}

- (OS_dispatch_queue)externalCaptureSessionInputProcessingQueue
{
  return self->_externalCaptureSessionInputProcessingQueue;
}

- (OS_dispatch_queue)externalCaptureSessionOutputProcessingQueue
{
  return self->_externalCaptureSessionOutputProcessingQueue;
}

- (JFXPixelRotationSession)externalCaptureSessionRotationSession
{
  return self->_externalCaptureSessionRotationSession;
}

- (void)setExternalCaptureSessionRotationSession:(id)a3
{
}

- (int64_t)lastDeviceOrientation
{
  return self->_lastDeviceOrientation;
}

- (void)setLastDeviceOrientation:(int64_t)a3
{
  self->_lastDeviceOrientation = a3;
}

- (int64_t)externalCaptureSessionCameraPosition
{
  return self->_externalCaptureSessionCameraPosition;
}

- (BOOL)externalCaptureSessionCameraPositionSet
{
  return self->_externalCaptureSessionCameraPositionSet;
}

- (void)setExternalCaptureSessionCameraPositionSet:(BOOL)a3
{
  self->_externalCaptureSessionCameraPositionSet = a3;
}

- (JFXThreadSafeDictionary)externalCaptureSessionInputFrameTimestamps
{
  return self->_externalCaptureSessionInputFrameTimestamps;
}

- (void)setExternalCaptureSessionInputFrameTimestamps:(id)a3
{
}

- (CGRect)externalPresentationRect
{
  double x = self->_externalPresentationRect.origin.x;
  double y = self->_externalPresentationRect.origin.y;
  double width = self->_externalPresentationRect.size.width;
  double height = self->_externalPresentationRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setExternalPresentationRect:(CGRect)a3
{
  self->_externalPresentationRect = a3;
}

- (CGRect)externalContentRect
{
  double x = self->_externalContentRect.origin.x;
  double y = self->_externalContentRect.origin.y;
  double width = self->_externalContentRect.size.width;
  double height = self->_externalContentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setExternalContentRect:(CGRect)a3
{
  self->_externalContentRect = a3;
}

- (NSTimer)effectsInStreamTimer
{
  return self->_effectsInStreamTimer;
}

- (void)setEffectsInStreamTimer:(id)a3
{
}

- (CFXThermalPolicyManager)thermalPolicyManager
{
  return self->_thermalPolicyManager;
}

- (void)setThermalPolicyManager:(id)a3
{
}

- (JFXMetadataValidator)metadataValidator
{
  return self->_metadataValidator;
}

- (void)setMetadataValidator:(id)a3
{
}

- (CFXCameraStreamBufferQueue)outputBufferQueue
{
  return self->_outputBufferQueue;
}

- (void)setOutputBufferQueue:(id)a3
{
}

- (CFXStageManagerWarningViewController)stageManagerWarning
{
  return self->_stageManagerWarning;
}

- (void)setStageManagerWarning:(id)a3
{
}

- (BOOL)isEffectsAnalyticsRunning
{
  return self->_isEffectsAnalyticsRunning;
}

- (void)setIsEffectsAnalyticsRunning:(BOOL)a3
{
  self->_isEffectsAnalyticsRunning = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stageManagerWarning, 0);
  objc_storeStrong((id *)&self->_outputBufferQueue, 0);
  objc_storeStrong((id *)&self->_metadataValidator, 0);
  objc_storeStrong((id *)&self->_thermalPolicyManager, 0);
  objc_storeStrong((id *)&self->_effectsInStreamTimer, 0);
  objc_storeStrong((id *)&self->_externalCaptureSessionInputFrameTimestamps, 0);
  objc_storeStrong((id *)&self->_externalCaptureSessionRotationSession, 0);
  objc_storeStrong((id *)&self->_externalCaptureSessionOutputProcessingQueue, 0);
  objc_storeStrong((id *)&self->_externalCaptureSessionInputProcessingQueue, 0);
  objc_storeStrong((id *)&self->_externalCaptureSessionInputDeserializationQueue, 0);
  objc_storeStrong((id *)&self->_effectsPickerSnapshotContainerView, 0);
  objc_storeStrong((id *)&self->_remoteCommandServer, 0);
  objc_storeStrong((id *)&self->_effectBrowserPresentedAppIdentifier, 0);
  objc_storeStrong((id *)&self->_cameraControlsViewController, 0);
  objc_storeStrong((id *)&self->_effectBrowserViewController, 0);
  objc_storeStrong((id *)&self->_captureViewController, 0);
  objc_storeStrong((id *)&self->_animojiOnlyEffectID, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setAnimojiOnlyEffectID:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_234C41000, v0, v1, "Invalid effect id %@, must be an Animoji efffect!", v2, v3, v4, v5, v6);
}

- (void)setAnimojiOnlyEffectID:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "Trying to set animoji effect externally in non-animoji-only mode", v2, v3, v4, v5, v6);
}

- (void)setTransitionState:(os_log_t)log animated:.cold.1(char a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 134218240;
  uint64_t v4 = a2;
  __int16 v5 = 1024;
  int v6 = a1 & 1;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "transitionState: %ld, animated: %d", (uint8_t *)&v3, 0x12u);
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_68_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_68_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "invalid contents rect, falling back to 0 0 1 1", v2, v3, v4, v5, v6);
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_68_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "invalid presentation rect, falling back to main screen bounds", v2, v3, v4, v5, v6);
}

void __94__CFXCameraViewController_renderFrameWithImageData_orientation_presentationRect_contentsRect___block_invoke_68_cold_4(uint64_t a1, NSObject *a2, CGFloat a3, CGFloat a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v8 = NSStringFromCGRect(*(CGRect *)(a1 + 48));
  CMTime v9 = NSStringFromCGRect(*(CGRect *)(a1 + 80));
  v18.double width = a3;
  v18.double height = a4;
  CMTime v10 = NSStringFromCGSize(v18);
  int v11 = 138412802;
  uint64_t v12 = v8;
  __int16 v13 = 2112;
  __int16 v14 = v9;
  __int16 v15 = 2112;
  uint64_t v16 = v10;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "renderFrameWithImageData presentationRect  %@ contentRect %@ renderSize %@", (uint8_t *)&v11, 0x20u);
}

void __135__CFXCameraViewController_renderFrameWithImageDataArchive_imagePixelBuffer_depthPixelBuffer_orientation_presentationRect_contentsRect___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "Failed to enqueue output buffer", v2, v3, v4, v5, v6);
}

void __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "Out of order frame arrived", v2, v3, v4, v5, v6);
}

void __64__CFXCameraViewController_captureViewController_didRenderFrame___block_invoke_cold_2(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  [a2 timestamp];
  *(_DWORD *)a1 = 134217984;
  *a3 = v7;
  _os_log_error_impl(&dword_234C41000, a4, OS_LOG_TYPE_ERROR, "Frame dropped, timestamp: %f", a1, 0xCu);
}

- (void)remoteCommandServer:didReceiveAddStickerCommandWithIdentifier:offset:scale:rotation:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_234C41000, v0, v1, "Adding Emoji Sticker failed - identifier: %{public}@, reason: The sticker asset does not exist", v2, v3, v4, v5, v6);
}

- (void)remoteCommandServer:(NSObject *)a1 didReceiveAddStickerCommandWithData:offset:scale:rotation:.cold.1(NSObject *a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v2 = NSStringFromJFXEffectType(2);
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_234C41000, a1, OS_LOG_TYPE_ERROR, "Adding effect failed - type: %{public}@, reason: No sticker data", v3, 0xCu);
}

- (void)remoteCommandServer:didReceiveAddStickerCommandWithData:offset:scale:rotation:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_234C41000, v0, v1, "Saving sticker image failed", v2, v3, v4, v5, v6);
}

- (void)remoteCommandServer:didReceiveSetFilterCommandWithIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0(&dword_234C41000, v0, v1, "Set Filter failed - identifier: %{public}@, reason: The Filter does not exist", v2, v3, v4, v5, v6);
}

@end