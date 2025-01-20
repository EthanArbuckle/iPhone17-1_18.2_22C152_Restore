@interface CFXCaptureViewController
- ($76EADD4ED24426C67044446678BAA581)dynamicShutterSettings;
- (BOOL)CFX_isRenderingAnimatedOverlaysThatDontLoop;
- (BOOL)CFX_isZoomAllowed;
- (BOOL)cameraIsFlipping;
- (BOOL)canToggleBetweenZoomFactorsForZoomControl:(id)a3;
- (BOOL)captureContainerUncroppedFrameWasCalculatedWithContentRect;
- (BOOL)configuredForOrientation;
- (BOOL)dockIsMagnified;
- (BOOL)effectEditorView:(id)a3 isEffectAtPoint:(CGPoint)a4 effect:(id)a5;
- (BOOL)effectEditorView:(id)a3 isFaceTrackingDataAvailableForEffect:(id)a4;
- (BOOL)effectEditorView:(id)a3 isFaceTrackingEffect:(id)a4;
- (BOOL)effectEditorView:(id)a3 presentCustomTextEditingUI:(id)a4;
- (BOOL)effectEditorView:(id)a3 shouldEditTextForEffect:(id)a4;
- (BOOL)fullScreenTextEditViewController:(id)a3 shouldDisableEditingAnimationForEffect:(id)a4;
- (BOOL)isEditingEffect;
- (BOOL)isExternalCaptureSessionAnExternalCamera;
- (BOOL)isFaceTrackingDataAvailable;
- (BOOL)isMessagesOnPhone;
- (BOOL)isRecording;
- (BOOL)isShowingAnimojiReticle;
- (BOOL)livePlayerIsSaturated;
- (BOOL)needsBlackBackgroundForCTMControls;
- (BOOL)observingOrientationChanges;
- (BOOL)passThroughContainerView:(id)a3 shouldHandleTouchWithinView:(id)a4 atPoint:(CGPoint)a5;
- (BOOL)presentFullScreenTextEditorForEffect:(id)a3 insertingEffect:(BOOL)a4;
- (BOOL)removeButtonRelativeBoundsIsViewSpace;
- (BOOL)shouldPerformSegueWithIdentifier:(id)a3 sender:(id)a4;
- (BOOL)shouldShowAnimojiFaceReticle;
- (BOOL)shouldUseFaceTracking;
- (BOOL)switchedToVideoMode;
- (BOOL)useLocalCameraViewfinder;
- (CAMControlStatusBar)controlStatusBar;
- (CAMDynamicShutterControl)dynamicShutterControl;
- (CAMElapsedTimeView)elapsedTimeView;
- (CAMFlashButton)flashButton;
- (CAMSnapshotView)liveCaptureContainerSnapshot;
- (CAMTopBar)topBar;
- (CAMViewfinderReticleView)reticleView;
- (CAMZoomControl)zoomControl;
- (CAMZoomSlider)zoomSlider;
- (CFXCaptureViewControllerDelegate)delegate;
- (CFXControlsViewController)cameraControls;
- (CFXEffectBrowserContentPresenterViewController)effectBrowserContentPresenterViewController;
- (CFXEffectComposition)composition;
- (CFXEffectEditorView)effectEditor;
- (CFXFaceReticleView)animojiTrackingLossReticle;
- (CFXLiveCaptureViewController)cameraViewController;
- (CFXViewfinderFlipTransition)viewfinderFlipTransition;
- (CGAffineTransform)overlayTransformForLocalViewfinder;
- (CGPoint)effectEditorView:(id)a3 removeButtonPositionForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (CGPoint)effectEditorView:(id)a3 spacingBetweenCenterPointOfEffect:(id)a4 point:(CGPoint)a5 relativeToBounds:(CGRect)a6;
- (CGRect)CFX_cameraViewFinderUncroppedFrame;
- (CGRect)CFX_generateAutoRotationCorrectionFrameWithInterfaceOrientation:(int64_t)a3;
- (CGRect)bottomBarCTMControlsFrameForWindowOrientation:(int64_t)a3 bounds:(CGRect)a4;
- (CGRect)effectEditorView:(id)a3 frameForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (CGRect)effectEditorView:(id)a3 hitAreaBoundingFrameForEffect:(id)a4 adjustForMinimumSize:(BOOL)a5 relativeToBounds:(CGRect)a6;
- (CGRect)externalUncroppedPresentationRect;
- (CGRect)presentationRect;
- (CGRect)zoomControlFrame;
- (CGRect)zoomSliderFrame;
- (JFXPassThroughContainerView)effectEditorContainerView;
- (JFXThreadSafeArray)runOnceAnimatedOverlays;
- (NSLayoutConstraint)captureControlsContainerHeightConstraint;
- (NSLayoutConstraint)captureControlsContainerLeadingConstraint;
- (NSLayoutConstraint)captureControlsContainerTopConstraint;
- (NSLayoutConstraint)captureControlsContainerTrailingConstraint;
- (NSLayoutConstraint)captureControlsContainerWidthConstraint;
- (NSLayoutConstraint)facePromptLabelYConstraint;
- (NSLayoutConstraint)topBarContaineHeightConstraint;
- (NSLayoutConstraint)topBarTopConstraint;
- (OS_dispatch_group)editingOverlayWithGestureGroup;
- (PUReviewScreenDoneButton)doneButton;
- (UIView)animojiReticleFacePromptView;
- (UIView)bottomControlsContainer;
- (UIView)cameraControlsContainerView;
- (UIView)effectsPickerDrawer;
- (UIView)liveCaptureContainer;
- (UIView)liveCaptureContainerContainer;
- (UIView)nonTransformedContainerView;
- (UIView)presentationView;
- (double)CFX_maxZoomForCamera;
- (double)dockMagnifiedHeightDelta;
- (double)userInterfaceAlpha;
- (double)zoomFactorAtPinchStart;
- (id)effectEditorView:(id)a3 effectAtPoint:(CGPoint)a4;
- (id)effectEditorView:(id)a3 overlayEffectFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (id)effectEditorView:(id)a3 textEditingPropertiesForEffect:(id)a4 relativeToBounds:(CGRect)a5;
- (id)effectEditorView:(id)a3 textForEffect:(id)a4;
- (id)liveCaptureSnapshot;
- (int64_t)CFX_camFlashModeForCaptureFlashMode:(int64_t)a3;
- (int64_t)CFX_captureFlashModeForCAMFlashMode:(int64_t)a3;
- (int64_t)CFX_captureTorchModeForCAMFlashMode:(int64_t)a3;
- (int64_t)aspectRatioCrop;
- (int64_t)captureInterfaceOrientationForDisplay;
- (int64_t)captureMode;
- (int64_t)faceTrackingInterfaceOrientationForfullScreenTextEditViewController:(id)a3;
- (int64_t)flashMode;
- (unint64_t)appliedDirectOverlayEditingGestures;
- (unint64_t)effectEditorView:(id)a3 maximumTextLengthForEffect:(id)a4;
- (void)CFX_addEffect:(id)a3 allowImmediateTextEditing:(BOOL)a4;
- (void)CFX_adjustOverlaysForCaptureOrientationChanged:(int64_t)a3 oldCaptureOrientation:(int64_t)a4;
- (void)CFX_applyAutoRotationCorrectionToEditorViews;
- (void)CFX_executeBlockAfterNextFrameRendered:(id)a3;
- (void)CFX_getCAMCaptureForPosition:(int64_t)a3 type:(id)a4 captureDevice:(int64_t *)a5 captureDevicePosition:(int64_t *)a6 captureMode:(int64_t *)a7;
- (void)CFX_getCaptureDevice:(int64_t *)a3 captureDevicePosition:(int64_t *)a4 captureMode:(int64_t *)a5;
- (void)CFX_handleZoomPinchGestureRecognizer:(id)a3;
- (void)CFX_hideAppStripUpperBackgroundView:(BOOL)a3;
- (void)CFX_performBackCameraZoomWithPinchGestureRecognizer:(id)a3;
- (void)CFX_performFrontCameraZoomWithPinchGestureRecognizer:(id)a3;
- (void)CFX_respondToShutterPress;
- (void)CFX_setFrameAndRenderSizes;
- (void)CFX_setZoomSliderFromZoomFactor:(double)a3;
- (void)CFX_toggleCaptureUI;
- (void)JFX_capturePhoto;
- (void)JFX_orientationMonitorDeviceInterfaceOrientationNotification:(id)a3;
- (void)JFX_orientationMonitorInterfaceOrientationNotification:(id)a3;
- (void)addEffect:(id)a3;
- (void)addEffect:(id)a3 allowImmediateTextEditing:(BOOL)a4;
- (void)addOverlayEffect:(id)a3 atNormalizedPlanePoint:(CGPoint)a4 scale:(double)a5 rotationAngle:(double)a6;
- (void)addOverlayEffect:(id)a3 atScreenLocation:(CGPoint)a4 atScreenSize:(CGSize)a5 rotationAngle:(double)a6;
- (void)applyAutoRotationCorrectionToEditorViewsWithTransitionCoordinator:(id)a3;
- (void)applyRotationTransformForPortrait;
- (void)cameraControlsViewControllerEffectsButtonWasTapped:(id)a3;
- (void)cameraControlsViewControllerSwitchCameraButtonWasTapped:(id)a3;
- (void)cameraDidStart;
- (void)cameraDidStop;
- (void)completedVideoRecordWithURL:(id)a3 metadataURL:(id)a4;
- (void)configureCTMUIForCaptureMode;
- (void)configureCaptureControlsForOrientationWithAnimation:(BOOL)a3;
- (void)configureUIForOrientation;
- (void)configureUIForWindowOrientation:(int64_t)a3 bounds:(CGRect)a4;
- (void)configureWithControlsViewController:(id)a3;
- (void)configureZoomControl;
- (void)controlStatusBar:(id)a3 didCreateIndicatorForType:(unint64_t)a4;
- (void)controlStatusBar:(id)a3 didReceiveTapInIndicatorForType:(unint64_t)a4;
- (void)dealloc;
- (void)displayEffectEditorForEffect:(id)a3 forMode:(unint64_t)a4;
- (void)doneButtonTapped:(id)a3;
- (void)dynamicShutterControlDidShortPress:(id)a3;
- (void)dynamicShutterControlDidStart:(id)a3;
- (void)dynamicShutterControlStopLockedRecording;
- (void)effectCompositionDidChange:(id)a3;
- (void)effectEditorView:(id)a3 didBeginEditingTextForEffect:(id)a4;
- (void)effectEditorView:(id)a3 didEditTextForEffect:(id)a4 newText:(id)a5;
- (void)effectEditorView:(id)a3 didEndEditingTextForEffect:(id)a4 wasCancelled:(BOOL)a5;
- (void)effectEditorView:(id)a3 didMoveEffect:(id)a4 withTouchPoint:(CGPoint)a5;
- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4;
- (void)effectEditorView:(id)a3 didTransformEffect:(id)a4 transform:(CGAffineTransform *)a5 relativeToBounds:(CGRect)a6;
- (void)effectEditorViewDidBeginEditing:(id)a3;
- (void)effectEditorViewDidEndEditing:(id)a3;
- (void)enableAnimationForOverlayEffect:(id)a3;
- (void)fadeInFaceInViewPromptLabel;
- (void)fadeOutFaceInViewPromptLabel;
- (void)flashModeDidChange;
- (void)fullScreenTextEditViewController:(id)a3 didBeginAnimationBeforeEditingEffect:(id)a4 completion:(id)a5;
- (void)fullScreenTextEditViewController:(id)a3 didBeginEditingEffect:(id)a4;
- (void)fullScreenTextEditViewController:(id)a3 didFinishAnimationAfterEditingEffect:(id)a4 completion:(id)a5;
- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4;
- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingEffect:(id)a4 withUpdatedText:(id)a5;
- (void)fullScreenTextEditViewController:(id)a3 willBeginAnimationAfterEditingEffect:(id)a4 updatedText:(id)a5;
- (void)handlePinchGestureRecognizer:(id)a3;
- (void)hideAnimojiFaceReticleForTrackingGain;
- (void)insertCamBottomBar:(id)a3;
- (void)layoutZoomControlForCTM;
- (void)layoutZoomControlRelativeToBottomBarAndPreview:(id)a3;
- (void)layoutZoomSliderRelativeToBottomBarAndPreview;
- (void)layoutZoomUI;
- (void)liveCaptureViewController:(id)a3 didRenderFrame:(id)a4;
- (void)liveCaptureViewController:(id)a3 livePreviewDoubleTappedAtNormalizedCenterPoint:(CGPoint)a4 gesture:(id)a5;
- (void)liveCaptureViewController:(id)a3 livePreviewPannedAtNormalizedPoint:(CGPoint)a4 gesture:(id)a5;
- (void)liveCaptureViewController:(id)a3 livePreviewPinchedAtNormalizedCenterPoint:(CGPoint)a4 gesture:(id)a5;
- (void)liveCaptureViewController:(id)a3 livePreviewRotatedAtNormalizedCenterPoint:(CGPoint)a4 gesture:(id)a5;
- (void)liveCaptureViewController:(id)a3 livePreviewTappedAtNormalizedPoint:(CGPoint)a4;
- (void)prepareForSegue:(id)a3 sender:(id)a4;
- (void)removeAllEffectsAnimated:(BOOL)a3;
- (void)removeAllEffectsOfType:(id)a3 animated:(BOOL)a4;
- (void)removeAnimojiTrackingReticle;
- (void)removeEffectEditorAnimated:(BOOL)a3;
- (void)removeEffectsForCameraSwitch;
- (void)removeLiveCaptureSnapshot;
- (void)resign;
- (void)returnCTMUIToPhotoMode;
- (void)saveLiveCaptureSnapshotForReview;
- (void)setAnimojiReticleFacePromptView:(id)a3;
- (void)setAnimojiTrackingLossReticle:(id)a3;
- (void)setAppliedDirectOverlayEditingGestures:(unint64_t)a3;
- (void)setAspectRatioCrop:(int64_t)a3;
- (void)setBottomControlsContainer:(id)a3;
- (void)setCameraControls:(id)a3;
- (void)setCameraControlsContainerView:(id)a3;
- (void)setCameraIsFlipping:(BOOL)a3;
- (void)setCameraViewController:(id)a3;
- (void)setCaptureContainerUncroppedFrameWasCalculatedWithContentRect:(BOOL)a3;
- (void)setCaptureControlsContainerHeightConstraint:(id)a3;
- (void)setCaptureControlsContainerLeadingConstraint:(id)a3;
- (void)setCaptureControlsContainerTopConstraint:(id)a3;
- (void)setCaptureControlsContainerTrailingConstraint:(id)a3;
- (void)setCaptureControlsContainerWidthConstraint:(id)a3;
- (void)setCaptureMode:(int64_t)a3;
- (void)setComposition:(id)a3;
- (void)setConfiguredForOrientation:(BOOL)a3;
- (void)setControlStatusBar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDockIsMagnified:(BOOL)a3;
- (void)setDockMagnifiedHeightDelta:(double)a3;
- (void)setDoneButton:(id)a3;
- (void)setDynamicShutterControl:(id)a3;
- (void)setDynamicShutterSettings:(id *)a3;
- (void)setEditingOverlayWithGestureGroup:(id)a3;
- (void)setEffectBrowserContentPresenterViewController:(id)a3;
- (void)setEffectEditor:(id)a3;
- (void)setEffectEditorContainerView:(id)a3;
- (void)setEffectsPickerDrawer:(id)a3;
- (void)setElapsedTimeView:(id)a3;
- (void)setExternalUncroppedPresentationRect:(CGRect)a3;
- (void)setFacePromptLabelYConstraint:(id)a3;
- (void)setFlashButton:(id)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setIsExternalCaptureSessionAnExternalCamera:(BOOL)a3;
- (void)setIsRecording:(BOOL)a3;
- (void)setIsShowingAnimojiReticle:(BOOL)a3;
- (void)setLiveCaptureContainer:(id)a3;
- (void)setLiveCaptureContainerContainer:(id)a3;
- (void)setLiveCaptureContainerSnapshot:(id)a3;
- (void)setLiveCapturePresentationFrame:(CGRect)a3 withContentRect:(CGRect)a4;
- (void)setLiveCaptureViewController:(id)a3;
- (void)setNonTransformedContainerView:(id)a3;
- (void)setObservingOrientationChanges:(BOOL)a3;
- (void)setPresentationRect:(CGRect)a3;
- (void)setPresentationView:(id)a3;
- (void)setReticleView:(id)a3;
- (void)setRunOnceAnimatedOverlays:(id)a3;
- (void)setSwitchedToVideoMode:(BOOL)a3;
- (void)setTopBar:(id)a3;
- (void)setTopBarContaineHeightConstraint:(id)a3;
- (void)setTopBarTopConstraint:(id)a3;
- (void)setTorchModeForFlashMode:(int64_t)a3;
- (void)setUseLocalCameraViewfinder:(BOOL)a3;
- (void)setUserInterfaceAlpha:(double)a3;
- (void)setViewfinderFlipTransition:(id)a3;
- (void)setZoomControl:(id)a3;
- (void)setZoomControlFrame:(CGRect)a3;
- (void)setZoomFactorAtPinchStart:(double)a3;
- (void)setZoomSlider:(id)a3;
- (void)setZoomSliderFrame:(CGRect)a3;
- (void)setupAnimojiFaceReticleForTrackingLoss;
- (void)setupFaceInViewPromptLabel;
- (void)showAnimojiFaceReticleForTrackingLoss;
- (void)showLiveCaptureSnapshotBlurred:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)startVideoRecording;
- (void)stopVideoRecording:(id)a3;
- (void)toggleBetweenZoomFactorsForZoomControl:(id)a3;
- (void)toggleCTMFlashButton;
- (void)updateAnimojiTrackingReticleAndLabelLayout;
- (void)updateControlVisibilityAnimated:(BOOL)a3;
- (void)updateEffectEditorLayout;
- (void)updateFullScreenTextEditorLayout;
- (void)updateTopBar;
- (void)updateUIForDevicePosition:(int64_t)a3;
- (void)updateUIForDockMagnify:(BOOL)a3 dockHeightDelta:(double)a4;
- (void)updateUIForVideoRecording:(BOOL)a3;
- (void)updateZoomUIForCapturing:(BOOL)a3 animated:(BOOL)a4;
- (void)updateZoomUIVisibility;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willDropCameraFrame;
- (void)zoomControl:(id)a3 didChangeZoomFactor:(double)a4 interactionType:(int64_t)a5;
- (void)zoomSliderDidBeginAutozooming:(id)a3;
- (void)zoomSliderDidEndAutozooming:(id)a3;
- (void)zoomSliderValueDidChange:(id)a3 forEvent:(id)a4;
@end

@implementation CFXCaptureViewController

- (void)viewDidLoad
{
  v114.receiver = self;
  v114.super_class = (Class)CFXCaptureViewController;
  [(CFXCaptureViewController *)&v114 viewDidLoad];
  double v3 = *MEMORY[0x263F001A8];
  double v4 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 24);
  -[CFXCaptureViewController setZoomControlFrame:](self, "setZoomControlFrame:", *MEMORY[0x263F001A8], v4, v5, v6);
  -[CFXCaptureViewController setZoomSliderFrame:](self, "setZoomSliderFrame:", v3, v4, v5, v6);
  v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  v9 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v9 userInterfaceIdiom])
  {
    BOOL v10 = 0;
  }
  else
  {
    v11 = [MEMORY[0x263F1C920] mainScreen];
    [v11 bounds];
    if ((uint64_t)v12 <= 811)
    {
      v13 = [MEMORY[0x263F1C920] mainScreen];
      [v13 bounds];
      BOOL v10 = (uint64_t)v14 > 811;
    }
    else
    {
      BOOL v10 = 1;
    }
  }
  int IsCTMSupported = CFXCaptureCapabilitiesIsCTMSupported();
  [(CFXCaptureViewController *)self setIsShowingAnimojiReticle:0];
  v16 = [(CFXCaptureViewController *)self view];
  [v16 setDelegate:self];

  [(CFXCaptureViewController *)self setObservingOrientationChanges:0];
  v17 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v18 = objc_msgSend(v17, "cam_initialLayoutStyle");

  v19 = (void *)[objc_alloc(MEMORY[0x263F307B0]) initWithLayoutStyle:v18];
  [(CFXCaptureViewController *)self setFlashButton:v19];

  v20 = [(CFXCaptureViewController *)self flashButton];
  [v20 setAllowsAutomaticFlash:1];

  v21 = [(CFXCaptureViewController *)self flashButton];
  [v21 reloadData];

  v22 = [(CFXCaptureViewController *)self flashButton];
  [v22 addTarget:self action:sel_flashModeDidChange forControlEvents:4096];

  v23 = [(CFXCaptureViewController *)self flashButton];
  [v23 setFlashMode:2];

  v24 = [(CFXCaptureViewController *)self flashButton];
  [v24 setExclusiveTouch:1];

  if (IsCTMSupported)
  {
    id v25 = objc_alloc_init(MEMORY[0x263F307A8]);
    [(CFXCaptureViewController *)self setElapsedTimeView:v25];

    v26 = [(CFXCaptureViewController *)self elapsedTimeView];
    [v26 setBackgroundStyle:3 animated:0];

    v27 = [MEMORY[0x263F5E470] doneButton];
    [(CFXCaptureViewController *)self setDoneButton:v27];

    v28 = [(CFXCaptureViewController *)self doneButton];
    [v28 addTarget:self action:sel_doneButtonTapped_ forControlEvents:64];
  }
  else
  {
    v29 = (void *)[objc_alloc(MEMORY[0x263F307A8]) initWithLayoutStyle:v18];
    [(CFXCaptureViewController *)self setElapsedTimeView:v29];

    v30 = [MEMORY[0x263F5E470] doneButton];
    [(CFXCaptureViewController *)self setDoneButton:v30];

    v31 = [(CFXCaptureViewController *)self doneButton];
    [v31 addTarget:self action:sel_doneButtonTapped_ forControlEvents:64];

    v28 = [(CFXCaptureViewController *)self flashButton];
    v32 = [(CFXCaptureViewController *)self topBar];
    [v32 setFlashButton:v28];
  }
  v33 = [(CFXCaptureViewController *)self doneButton];
  v34 = [(CFXCaptureViewController *)self topBar];
  [v34 setDoneButton:v33];

  if (v8)
  {
    if ([(CFXCaptureViewController *)self captureMode] != 2) {
      goto LABEL_18;
    }
    v35 = [(CFXCaptureViewController *)self elapsedTimeView];
    [v35 intrinsicContentSize];
    double v37 = v36;
    double v39 = v38;

    v40 = [(CFXCaptureViewController *)self elapsedTimeView];
    objc_msgSend(v40, "setFrame:", 0.0, 23.0, v37, v39);

    v41 = [(CFXCaptureViewController *)self view];
    v42 = [(CFXCaptureViewController *)self elapsedTimeView];
    [v41 addSubview:v42];

    v43 = [(CFXCaptureViewController *)self elapsedTimeView];
    [v43 setUserInteractionEnabled:0];
  }
  else
  {
    if (IsCTMSupported)
    {
      v43 = [(CFXCaptureViewController *)self view];
      v44 = [(CFXCaptureViewController *)self elapsedTimeView];
      [v43 addSubview:v44];
    }
    else
    {
      v43 = [(CFXCaptureViewController *)self elapsedTimeView];
      v44 = [(CFXCaptureViewController *)self topBar];
      [v44 setElapsedTimeView:v43];
    }
  }
LABEL_18:
  v45 = +[JFXOrientationMonitor keyWindow];
  [v45 bounds];
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  double v53 = v52;

  objc_msgSend(MEMORY[0x263F5E478], "cameraTopBarFrameForReferenceBounds:", v47, v49, v51, v53);
  double v55 = v54;
  double v57 = v54 + v56;
  v58 = [(CFXCaptureViewController *)self topBarContaineHeightConstraint];
  [v58 setConstant:v57];

  if (v10)
  {
    v59 = [(CFXCaptureViewController *)self topBarTopConstraint];
    [v59 setConstant:v55];
  }
  [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:0];
  dispatch_group_t v60 = dispatch_group_create();
  [(CFXCaptureViewController *)self setEditingOverlayWithGestureGroup:v60];

  v61 = [(CFXCaptureViewController *)self topBar];
  [v61 setOrientation:1];

  v62 = [(CFXCaptureViewController *)self topBar];
  [v62 setVisibilityUpdateDelegate:self];

  if (!isStreamingMode([(CFXCaptureViewController *)self captureMode]))
  {
    v63 = [MEMORY[0x263F30780] capabilities];
    if ([v63 zoomControlSupported])
    {
      v64 = (void *)[objc_alloc(MEMORY[0x263F307E8]) initWithLayoutStyle:v18];
      [(CFXCaptureViewController *)self setZoomControl:v64];

      v65 = [(CFXCaptureViewController *)self zoomControl];
      [v65 setDelegate:self];

      v66 = [(CFXCaptureViewController *)self view];
      [(CFXCaptureViewController *)self zoomControl];
    }
    else
    {
      v67 = (void *)[objc_alloc(MEMORY[0x263F307F8]) initWithLayoutStyle:v18];
      [(CFXCaptureViewController *)self setZoomSlider:v67];

      v68 = [(CFXCaptureViewController *)self zoomSlider];
      [v68 setDelegate:self];

      v69 = [(CFXCaptureViewController *)self zoomSlider];
      [v69 setExclusiveTouch:1];

      v70 = [(CFXCaptureViewController *)self zoomSlider];
      [v70 setMinimumValue:0.0];

      v71 = [(CFXCaptureViewController *)self zoomSlider];
      LODWORD(v72) = 1.0;
      [v71 setMaximumValue:v72];

      v73 = [(CFXCaptureViewController *)self zoomSlider];
      [v73 addTarget:self action:sel_zoomSliderValueDidChange_forEvent_ forControlEvents:4096];

      v74 = [(CFXCaptureViewController *)self zoomSlider];
      [v74 setAlpha:0.0];

      v66 = [(CFXCaptureViewController *)self view];
      [(CFXCaptureViewController *)self zoomSlider];
    v75 = };
    [v66 addSubview:v75];

    [(CFXCaptureViewController *)self updateZoomUIVisibility];
  }
  if ([(CFXCaptureViewController *)self isMessagesOnPhone])
  {
    v76 = [(CFXCaptureViewController *)self cameraControls];
    v77 = [v76 effectBrowserContentPresenterViewController];
    [(CFXCaptureViewController *)self setEffectBrowserContentPresenterViewController:v77];
  }
  else
  {
    v78 = [(CFXCaptureViewController *)self effectBrowserContentPresenterViewController];

    if (!v78) {
      goto LABEL_30;
    }
    v76 = [(CFXCaptureViewController *)self effectBrowserContentPresenterViewController];
    [(UIViewController *)self jfxAddChildViewController:v76];
  }

LABEL_30:
  BOOL v79 = [(CFXCaptureViewController *)self isMessagesOnPhone];
  v80 = [(CFXCaptureViewController *)self cameraControlsContainerView];
  [v80 setHidden:v79];

  [(CFXCaptureViewController *)self setConfiguredForOrientation:0];
  [(CFXCaptureViewController *)self setSwitchedToVideoMode:0];
  if (IsCTMSupported)
  {
    id v81 = MTLCreateSystemDefaultDevice();
    id v82 = objc_alloc(MEMORY[0x263F307A0]);
    v83 = (void *)[v81 newCommandQueue];
    v84 = (void *)[v82 initWithMetalDevice:v81 commandQueue:v83];
    [(CFXCaptureViewController *)self setDynamicShutterControl:v84];

    v85 = [(CFXCaptureViewController *)self dynamicShutterControl];
    [v85 setDelegate:self];

    long long v86 = *(_OWORD *)(MEMORY[0x263F30768] + 16);
    v110[0] = *MEMORY[0x263F30768];
    v110[1] = v86;
    v110[2] = *(_OWORD *)(MEMORY[0x263F30768] + 32);
    uint64_t v87 = *(void *)(MEMORY[0x263F30768] + 64);
    uint64_t v111 = *(void *)(MEMORY[0x263F30768] + 48);
    uint64_t v112 = 1;
    uint64_t v113 = v87;
    [(CFXCaptureViewController *)self setDynamicShutterSettings:v110];
    v88 = objc_alloc_init(JFXPassThroughContainerView);
    [(CFXCaptureViewController *)self setBottomControlsContainer:v88];

    v89 = [(CFXCaptureViewController *)self view];
    v90 = [(CFXCaptureViewController *)self bottomControlsContainer];
    [v89 addSubview:v90];

    v91 = [(CFXCaptureViewController *)self topBar];
    [v91 setHidden:1];

    id v92 = objc_alloc_init(MEMORY[0x263F30790]);
    [(CFXCaptureViewController *)self setControlStatusBar:v92];

    v93 = [(CFXCaptureViewController *)self controlStatusBar];
    [v93 setDelegate:self];

    v94 = [(CFXCaptureViewController *)self controlStatusBar];
    [v94 setPrimaryDesiredIndicatorTypes:&unk_26E802070];

    v95 = [(CFXCaptureViewController *)self controlStatusBar];
    v96 = [v95 flashIndicator];
    [v96 addTarget:self action:sel_flashModeDidChange forControlEvents:4096];

    double v97 = *MEMORY[0x263F1D1C0];
    double v98 = *(double *)(MEMORY[0x263F1D1C0] + 8);
    double v99 = *(double *)(MEMORY[0x263F1D1C0] + 16);
    double v100 = *(double *)(MEMORY[0x263F1D1C0] + 24);
    v101 = [(CFXCaptureViewController *)self doneButton];
    objc_msgSend(v101, "setTappableEdgeInsets:", v97, v98, v99, v100);

    v102 = [(CFXCaptureViewController *)self doneButton];
    v103 = [(CFXCaptureViewController *)self controlStatusBar];
    [v103 setSecondaryAccessoryControl:v102];

    v104 = [(CFXCaptureViewController *)self view];
    v105 = [(CFXCaptureViewController *)self controlStatusBar];
    [v104 addSubview:v105];

    [(CFXCaptureViewController *)self configureCTMUIForCaptureMode];
    v106 = objc_msgSend(objc_alloc(MEMORY[0x263F307E0]), "initWithFrame:", v3, v4, v5, v6);
    [(CFXCaptureViewController *)self setReticleView:v106];

    v107 = [(CFXCaptureViewController *)self view];
    v108 = [(CFXCaptureViewController *)self reticleView];
    [v107 insertSubview:v108 atIndex:0];
  }
  v109 = objc_opt_new();
  [(CFXCaptureViewController *)self setRunOnceAnimatedOverlays:v109];

  [(CFXCaptureViewController *)self setIsExternalCaptureSessionAnExternalCamera:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v26.receiver = self;
  v26.super_class = (Class)CFXCaptureViewController;
  [(CFXCaptureViewController *)&v26 viewWillAppear:a3];
  [(CFXCaptureViewController *)self updateTopBar];
  id v4 = objc_alloc(MEMORY[0x263F1CB60]);
  double v5 = objc_msgSend(v4, "initWithSize:", *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
  [(CFXCaptureViewController *)self setPresentationView:v5];

  double v6 = [(CFXCaptureViewController *)self presentationView];
  [v6 setUserInteractionEnabled:0];

  if ([(CFXCaptureViewController *)self isMessagesOnPhone]) {
    [(CFXCaptureViewController *)self nonTransformedContainerView];
  }
  else {
  v7 = [(CFXCaptureViewController *)self view];
  }
  uint64_t v8 = [(CFXCaptureViewController *)self presentationView];
  [v7 addSubview:v8];

  v9 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (!v10)
  {
    v11 = +[JFXOrientationMonitor keyWindow];
    [v11 bounds];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v27.origin.x = v13;
    v27.origin.y = v15;
    v27.size.width = v17;
    v27.size.height = v19;
    double Width = CGRectGetWidth(v27);
    v28.origin.x = v13;
    v28.origin.y = v15;
    v28.size.width = v17;
    v28.size.height = v19;
    double Height = CGRectGetHeight(v28);
    double v22 = Width >= Height ? Height : Width;
    double v23 = Width >= Height ? Width : Height;
    -[CFXCaptureViewController configureUIForWindowOrientation:bounds:](self, "configureUIForWindowOrientation:bounds:", 1, 0.0, 0.0, v22, v23);
    if (CFXCaptureCapabilitiesIsCTMSupported())
    {
      if ([(CFXCaptureViewController *)self needsBlackBackgroundForCTMControls]) {
        [MEMORY[0x263F1C550] blackColor];
      }
      else {
      v24 = [MEMORY[0x263F1C550] clearColor];
      }
      id v25 = [(CFXCaptureViewController *)self bottomControlsContainer];
      [v25 setBackgroundColor:v24];
    }
  }
  [(CFXCaptureViewController *)self configureCaptureControlsForOrientationWithAnimation:0];
  [(CFXCaptureViewController *)self configureUIForOrientation];
  [(CFXCaptureViewController *)self CFX_applyAutoRotationCorrectionToEditorViews];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CFXCaptureViewController;
  [(CFXCaptureViewController *)&v5 viewWillDisappear:a3];
  id v4 = [(CFXCaptureViewController *)self runOnceAnimatedOverlays];
  [v4 removeAllObjects];
}

- (CGRect)CFX_generateAutoRotationCorrectionFrameWithInterfaceOrientation:(int64_t)a3
{
  [(CFXCaptureViewController *)self externalUncroppedPresentationRect];
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v13 = [(CFXCaptureViewController *)self view];
  double v14 = [v13 superview];
  [v14 frame];
  double v16 = v15;

  switch(a3)
  {
    case 2:
      v21 = [(CFXCaptureViewController *)self view];
      [v21 bounds];
      double Width = CGRectGetWidth(v37);
      v38.origin.x = v6;
      v38.origin.y = v8;
      v38.size.width = v10;
      v38.size.height = v12;
      double v23 = Width - CGRectGetWidth(v38) - v6;

      v24 = [(CFXCaptureViewController *)self view];
      [v24 bounds];
      double Height = CGRectGetHeight(v39);
      v40.origin.x = v6;
      v40.origin.y = v8;
      v40.size.width = v10;
      v40.size.height = v12;
      double v19 = Height - CGRectGetHeight(v40) - v8;

LABEL_7:
      double v8 = v23;
      break;
    case 3:
      objc_super v26 = [(CFXCaptureViewController *)self view];
      [v26 bounds];
      double v27 = CGRectGetHeight(v41);
      v42.origin.x = v6;
      v42.origin.y = v8;
      v42.size.width = v10;
      v42.size.height = v12;
      double v23 = v27 - CGRectGetHeight(v42) - v8;

      v43.origin.x = v6;
      v43.origin.y = v8;
      v43.size.width = v10;
      v43.size.height = v12;
      CGFloat v28 = CGRectGetHeight(v43);
      v44.origin.x = v6;
      v44.origin.y = v8;
      v44.size.width = v10;
      v44.size.height = v12;
      CGFloat v12 = CGRectGetWidth(v44);
      CGFloat v10 = v28;
      double v19 = v6;
      goto LABEL_7;
    case 4:
      CGFloat v17 = [(CFXCaptureViewController *)self view];
      [v17 bounds];
      double v18 = CGRectGetWidth(v33);
      v34.origin.x = v6;
      v34.origin.y = v8;
      v34.size.width = v10;
      v34.size.height = v12;
      double v19 = v18 - CGRectGetWidth(v34) - v6 - v16;

      v35.origin.x = v6;
      v35.origin.y = v8;
      v35.size.width = v10;
      v35.size.height = v12;
      CGFloat v20 = CGRectGetHeight(v35);
      v36.origin.x = v6;
      v36.origin.y = v8;
      v36.size.width = v10;
      v36.size.height = v12;
      CGFloat v12 = CGRectGetWidth(v36);
      CGFloat v10 = v20;
      break;
    default:
      double v19 = v8;
      double v8 = v6;
      break;
  }
  double v29 = v8;
  double v30 = v19;
  double v31 = v10;
  double v32 = v12;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

- (void)CFX_applyAutoRotationCorrectionToEditorViews
{
  uint64_t v74 = *MEMORY[0x263EF8340];
  if (isStreamingMode([(CFXCaptureViewController *)self captureMode]))
  {
    int64_t v3 = +[JFXOrientationMonitor interfaceOrientation];
    [(CFXCaptureViewController *)self CFX_generateAutoRotationCorrectionFrameWithInterfaceOrientation:v3];
    CGFloat v5 = v4;
    double v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    double v12 = 0.0;
    if (v3 != 1)
    {
      if (v3 == 3)
      {
        double v12 = 1.57079633;
      }
      else if (v3 == 4)
      {
        double v12 = -1.57079633;
      }
      else
      {
        double v12 = 3.14159265;
        if (v3 != 2) {
          double v12 = 0.0;
        }
      }
    }
    memset(&v65.c, 0, 32);
    if ((unint64_t)(v3 - 3) >= 2) {
      double v13 = v12;
    }
    else {
      double v13 = -v12;
    }
    *(_OWORD *)&v65.a = 0uLL;
    CGAffineTransformMakeRotation(&v65, v13);
    double v14 = JFXLog_viewerUI();
    double v59 = v5;
    double v60 = v11;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      switch(v3)
      {
        case 1:
          double v15 = @"UIInterfaceOrientationPortrait";
          break;
        case 3:
          double v15 = @"UIInterfaceOrientationLandscapeRight";
          break;
        case 4:
          double v15 = @"UIInterfaceOrientationLandscapeLeft";
          break;
        case 2:
          double v15 = @"UIInterfaceOrientationPortraitUpsideDown";
          break;
        default:
          double v15 = 0;
          break;
      }
      [(CFXCaptureViewController *)self externalUncroppedPresentationRect];
      double v16 = NSStringFromCGRect(v75);
      v76.origin.x = v5;
      v76.origin.y = v7;
      v76.size.width = v9;
      v76.size.height = v11;
      CGFloat v17 = NSStringFromCGRect(v76);
      *(_DWORD *)buf = 138413058;
      v67 = v15;
      __int16 v68 = 2048;
      double v69 = v13 / 0.0174532925;
      __int16 v70 = 2112;
      v71 = v16;
      __int16 v72 = 2112;
      v73 = v17;
      _os_log_impl(&dword_234C41000, v14, OS_LOG_TYPE_DEFAULT, "Updating editor view frames - orientation: %@, rotation: %f, uncroppedPresentationRect: %@, frame: %@", buf, 0x2Au);
    }
    double v18 = v9;
    double v58 = v9;

    double v19 = [(CFXCaptureViewController *)self view];
    [v19 bounds];
    double Width = CGRectGetWidth(v77);

    v21 = [(CFXCaptureViewController *)self view];
    [v21 bounds];
    double Height = CGRectGetHeight(v78);

    if (Width >= Height) {
      double v23 = Height;
    }
    else {
      double v23 = Width;
    }
    v24 = [(CFXCaptureViewController *)self view];
    [v24 bounds];
    double v25 = CGRectGetWidth(v79);

    objc_super v26 = [(CFXCaptureViewController *)self view];
    [v26 bounds];
    double v27 = CGRectGetHeight(v80);

    if (v25 < v27) {
      double v25 = v27;
    }
    double v28 = *MEMORY[0x263F00148];
    double v29 = *(double *)(MEMORY[0x263F00148] + 8);
    double v30 = [(CFXCaptureViewController *)self liveCaptureContainerContainer];
    objc_msgSend(v30, "setBounds:", v28, v29, v23, v25);

    double v31 = [(CFXCaptureViewController *)self view];
    [v31 center];
    double v33 = v32;
    double v35 = v34;
    CGRect v36 = [(CFXCaptureViewController *)self liveCaptureContainerContainer];
    objc_msgSend(v36, "setCenter:", v33, v35);

    CGAffineTransform v64 = v65;
    CGRect v37 = [(CFXCaptureViewController *)self liveCaptureContainerContainer];
    CGAffineTransform v63 = v64;
    [v37 setTransform:&v63];

    CGRect v38 = [(CFXCaptureViewController *)self liveCaptureContainer];
    objc_msgSend(v38, "setFrame:", v59, v7, v18, v60);

    CGRect v39 = [(CFXCaptureViewController *)self effectEditorContainerView];
    objc_msgSend(v39, "setBounds:", v28, v29, v57, v25);

    CGRect v40 = [(CFXCaptureViewController *)self view];
    [v40 center];
    double v42 = v41;
    double v44 = v43;
    v45 = [(CFXCaptureViewController *)self effectEditorContainerView];
    objc_msgSend(v45, "setCenter:", v42, v44);

    CGAffineTransform v62 = v65;
    double v46 = [(CFXCaptureViewController *)self effectEditorContainerView];
    CGAffineTransform v61 = v62;
    [v46 setTransform:&v61];

    double v47 = [(CFXCaptureViewController *)self effectEditor];
    objc_msgSend(v47, "setFrame:", v59, v7, v58, v60);

    [(CFXCaptureViewController *)self presentationRect];
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    double v55 = v54;
    double v56 = [(CFXCaptureViewController *)self presentationView];
    objc_msgSend(v56, "setFrame:", v49, v51, v53, v55);

    [(CFXCaptureViewController *)self updateAnimojiTrackingReticleAndLabelLayout];
  }
}

- (void)applyAutoRotationCorrectionToEditorViewsWithTransitionCoordinator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CGFloat v5 = [(CFXCaptureViewController *)self effectEditor];
    [v5 setHidden:1];

    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __94__CFXCaptureViewController_applyAutoRotationCorrectionToEditorViewsWithTransitionCoordinator___block_invoke;
    v6[3] = &unk_264C0B718;
    v6[4] = self;
    [v4 animateAlongsideTransition:0 completion:v6];
  }
  else
  {
    [(CFXCaptureViewController *)self CFX_applyAutoRotationCorrectionToEditorViews];
  }
}

void __94__CFXCaptureViewController_applyAutoRotationCorrectionToEditorViewsWithTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "CFX_applyAutoRotationCorrectionToEditorViews");
  id v2 = [*(id *)(a1 + 32) effectEditor];
  [v2 setHidden:0];
}

- (void)CFX_adjustOverlaysForCaptureOrientationChanged:(int64_t)a3 oldCaptureOrientation:(int64_t)a4
{
  uint64_t v107 = *MEMORY[0x263EF8340];
  double v7 = +[CFXMediaSettings sharedInstance];
  [v7 renderSize];
  double v9 = v8;
  double v11 = v10;

  double v12 = 0.0;
  double angle = 0.0;
  if (a3 != a4)
  {
    double v13 = 0.0;
    if (a3 != 1)
    {
      if (a3 == 3)
      {
        double v13 = 1.57079633;
      }
      else if (a3 == 4)
      {
        double v13 = -1.57079633;
      }
      else
      {
        double v13 = 3.14159265;
        if (a3 != 2) {
          double v13 = 0.0;
        }
      }
    }
    if (a4 != 1)
    {
      if (a4 == 3)
      {
        double v12 = 1.57079633;
      }
      else if (a4 == 4)
      {
        double v12 = -1.57079633;
      }
      else
      {
        double v12 = 3.14159265;
        if (a4 != 2) {
          double v12 = 0.0;
        }
      }
    }
    double angle = v13 - v12;
  }
  double v14 = JFXLog_viewerUI();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    switch(a3)
    {
      case 1:
        double v15 = @"UIInterfaceOrientationPortrait";
        break;
      case 3:
        double v15 = @"UIInterfaceOrientationLandscapeRight";
        break;
      case 4:
        double v15 = @"UIInterfaceOrientationLandscapeLeft";
        break;
      default:
        double v15 = @"UIInterfaceOrientationPortraitUpsideDown";
        if (a3 != 2) {
          double v15 = 0;
        }
        break;
    }
    switch(a4)
    {
      case 1:
        double v16 = @"UIInterfaceOrientationPortrait";
        break;
      case 3:
        double v16 = @"UIInterfaceOrientationLandscapeRight";
        break;
      case 4:
        double v16 = @"UIInterfaceOrientationLandscapeLeft";
        break;
      default:
        double v16 = @"UIInterfaceOrientationPortraitUpsideDown";
        if (a4 != 2) {
          double v16 = 0;
        }
        break;
    }
    LODWORD(buf.a) = 138412802;
    *(void *)((char *)&buf.a + 4) = v15;
    WORD2(buf.b) = 2112;
    *(void *)((char *)&buf.b + 6) = v16;
    HIWORD(buf.c) = 2048;
    buf.d = angle * 180.0 / 3.14159265;
    _os_log_impl(&dword_234C41000, v14, OS_LOG_TYPE_DEFAULT, "adjust overlays for capture orientation changed: captureInterfaceOrientation %@ oldCaptureInterfaceOrientation %@ capture rotation angle %f", (uint8_t *)&buf, 0x20u);
  }

  memset(&buf, 0, sizeof(buf));
  CGAffineTransformMakeRotation(&buf, angle);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  CGAffineTransform v64 = self;
  CGFloat v17 = [(CFXCaptureViewController *)self composition];
  double v18 = [v17 effects];

  uint64_t v19 = [v18 countByEnumeratingWithState:&v100 objects:v105 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v101;
    CGFloat v70 = *MEMORY[0x263F000D0];
    CGFloat v68 = *(double *)(MEMORY[0x263F000D0] + 16);
    CGFloat v69 = *(double *)(MEMORY[0x263F000D0] + 8);
    CGFloat v22 = *(double *)(MEMORY[0x263F000D0] + 40);
    CGFloat v66 = *(double *)(MEMORY[0x263F000D0] + 32);
    CGFloat v67 = *(double *)(MEMORY[0x263F000D0] + 24);
    __asm { FMOV            V0.2D, #1.0 }
    long long v65 = _Q0;
    uint64_t v28 = MEMORY[0x263F010E0];
    unint64_t v29 = 0x264C08000uLL;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v101 != v21) {
          objc_enumerationMutation(v18);
        }
        double v31 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        double v32 = [v31 jtEffect];
        int v33 = [v32 type];

        if (v33 == 2)
        {
          double v34 = [v31 jtEffect];
          double v35 = [v34 trackingProps];
          uint64_t v36 = [v35 trackingType];

          if (v36 == 2)
          {
            if (v34)
            {
              [v34 topLevelTransform];
            }
            else
            {
              long long v87 = 0u;
              long long v88 = 0u;
              long long v85 = 0u;
              long long v86 = 0u;
              long long v83 = 0u;
              long long v84 = 0u;
              long long v81 = 0u;
              long long v82 = 0u;
            }
            uint64_t v78 = 0;
            uint64_t v79 = 0;
            long long v80 = v65;
            pv_simd_matrix_rotate();
            v77[4] = v93;
            v77[5] = v94;
            v77[6] = v95;
            v77[7] = v96;
            v77[0] = v89;
            v77[1] = v90;
            v77[2] = v91;
            v77[3] = v92;
            [v34 setTopLevelTransform:v77];
          }
          else if (!v36)
          {
            *(_OWORD *)&v104.a = *(_OWORD *)v28;
            long long v76 = *(_OWORD *)&v104.a;
            v104.CGFloat c = *(CGFloat *)(v28 + 16);
            CGFloat c = v104.c;
            objc_msgSend(v34, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v104, 1, 1, 1, 0.0, 0.0, v9, v11);
            double CenterPoint = CGRectGetCenterPoint(v38, v39, v40, v41);
            double v74 = v42;
            double v43 = CGRectGetCenterPoint(0.0, 0.0, v9, v11);
            double v45 = v44;
            v99.a = v70;
            v99.b = v69;
            v99.CGFloat c = v68;
            v99.d = v67;
            v99.tx = v66;
            v99.ty = v22;
            CGAffineTransformTranslate(&v104, &v99, v43, v44);
            CGAffineTransform v99 = v104;
            CGAffineTransformRotate(&v104, &v99, angle);
            CGAffineTransform v99 = v104;
            CGAffineTransformTranslate(&v104, &v99, -v43, -v45);
            CGPoint point = (CGPoint)vaddq_f64(*(float64x2_t *)&v104.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v104.c, v74), *(float64x2_t *)&v104.a, CenterPoint));
            double v46 = *(void **)(v29 + 3640);
            CGAffineTransform v104 = buf;
            *(_OWORD *)&v99.a = v76;
            v99.CGFloat c = c;
            objc_msgSend(v46, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v34, &v104, &v99, 0, 0.0, 0.0, v9, v11);
            *(_OWORD *)&v104.a = v76;
            v104.CGFloat c = c;
            objc_msgSend(v34, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v104, 1, 1, 1, 0.0, 0.0, v9, v11);
            double v51 = CGRectGetCenterPoint(v47, v48, v49, v50);
            CGFloat v53 = v52;
            double v54 = point.y - v52;
            double v55 = JFXLog_DebugViewerUI();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
            {
              v108.x = CenterPoint;
              v108.y = v74;
              CGRect v75 = NSStringFromCGPoint(v108);
              v109.x = v51;
              v109.y = v53;
              double v57 = NSStringFromCGPoint(v109);
              double v58 = NSStringFromCGPoint(point);
              v110.x = point.x - v51;
              v110.y = v54;
              double v59 = NSStringFromCGPoint(v110);
              LODWORD(v104.a) = 138413058;
              *(void *)((char *)&v104.a + 4) = v75;
              WORD2(v104.b) = 2112;
              *(void *)((char *)&v104.b + 6) = v57;
              HIWORD(v104.c) = 2112;
              *(void *)&v104.d = v58;
              LOWORD(v104.tx) = 2112;
              *(void *)((char *)&v104.tx + 2) = v59;
              _os_log_debug_impl(&dword_234C41000, v55, OS_LOG_TYPE_DEBUG, "rotated overlays for capture orientation changed: overlayCenterPoint %@ rotatedCenterPoint %@ targetRotatedCenterPoint %@ translation required %@", (uint8_t *)&v104, 0x2Au);

              uint64_t v28 = MEMORY[0x263F010E0];
              unint64_t v29 = 0x264C08000;
            }
            memset(&v104, 0, sizeof(v104));
            CGAffineTransformMakeTranslation(&v104, point.x - v51, v54);
            double v56 = *(void **)(v29 + 3640);
            CGAffineTransform v99 = v104;
            long long v97 = v76;
            CGFloat v98 = c;
            objc_msgSend(v56, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v34, &v99, &v97, 0, 0.0, 0.0, v9, v11);
          }
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v100 objects:v105 count:16];
    }
    while (v20);
  }

  double v60 = CFXLog_action();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    CGAffineTransform v61 = [(CFXCaptureViewController *)v64 composition];
    CGAffineTransform v62 = [v61 jtEffects];
    CGAffineTransform v63 = +[CFXActionLogging actionLogAsJSONForEvent:@"device rotated" atLocation:@"live" withEffectStack:v62];
    LODWORD(v104.a) = 138543362;
    *(void *)((char *)&v104.a + 4) = v63;
    _os_log_impl(&dword_234C41000, v60, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v104, 0xCu);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CFXCaptureViewController;
  -[CFXCaptureViewController viewWillTransitionToSize:withTransitionCoordinator:](&v12, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (isStreamingMode([(CFXCaptureViewController *)self captureMode]))
  {
    [(CFXCaptureViewController *)self applyAutoRotationCorrectionToEditorViewsWithTransitionCoordinator:v7];
  }
  else
  {
    double v8 = CFXLog_action();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = [(CFXCaptureViewController *)self composition];
      double v10 = [v9 jtEffects];
      double v11 = +[CFXActionLogging actionLogAsJSONForEvent:@"device rotated" atLocation:@"live" withEffectStack:v10];
      *(_DWORD *)CGAffineTransform buf = 138543362;
      double v14 = v11;
      _os_log_impl(&dword_234C41000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
    }
  }
}

- (void)dealloc
{
  [MEMORY[0x263F61250] flushEngine];
  v3.receiver = self;
  v3.super_class = (Class)CFXCaptureViewController;
  [(CFXCaptureViewController *)&v3 dealloc];
}

- (void)prepareForSegue:(id)a3 sender:(id)a4
{
  id v11 = a3;
  CGFloat v5 = [v11 destinationViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v11 destinationViewController];
    [(CFXCaptureViewController *)self setLiveCaptureViewController:v7];
  }
  double v8 = [v11 destinationViewController];
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass();

  if (v9)
  {
    double v10 = [v11 destinationViewController];
    [(CFXCaptureViewController *)self setCameraControls:v10];
  }
}

- (BOOL)shouldPerformSegueWithIdentifier:(id)a3 sender:(id)a4
{
  if (objc_msgSend(a3, "isEqualToString:", @"CFXLiveCaptureViewControllerSegue", a4)) {
    return ![(CFXCaptureViewController *)self isMessagesOnPhone];
  }
  else {
    return 1;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CFXCaptureViewController;
  [(CFXCaptureViewController *)&v5 viewDidAppear:a3];
  [(CFXCaptureViewController *)self layoutZoomUI];
  if ([(CFXCaptureViewController *)self isMessagesOnPhone])
  {
    id v4 = [(CFXCaptureViewController *)self effectBrowserContentPresenterViewController];
    objc_msgSend(v4, "configureEffectBrowserContentPresentationForOrientation:", +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation"));
  }
}

- (void)updateTopBar
{
  if (isStreamingMode([(CFXCaptureViewController *)self captureMode]))
  {
    id v5 = [(CFXCaptureViewController *)self topBar];
    [v5 setHidden:1];
  }
  else
  {
    if (CFXCaptureCapabilitiesIsCTMSupported()) {
      return;
    }
    objc_super v3 = [(CFXCaptureViewController *)self topBar];
    [v3 setHidden:0];

    id v4 = [(CFXCaptureViewController *)self topBar];
    objc_msgSend(v4, "configureForMode:animated:", -[CFXCaptureViewController captureMode](self, "captureMode") == 2, 0);

    id v5 = [(CFXCaptureViewController *)self topBar];
    [v5 setStyle:0];
  }
}

- (void)configureCaptureControlsForOrientationWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  if (!v6)
  {
    int64_t v7 = +[JFXOrientationMonitor deviceInterfaceOrientation];
    double v8 = [(CFXCaptureViewController *)self delegate];
    id v17 = [v8 cameraControlsViewControllerForCaptureViewController:self];

    char v9 = [v17 effectButton];
    [v9 setOrientation:v7 animated:v3];

    double v10 = [v17 flipButton];
    [v10 setOrientation:v7 animated:v3];

    if (CFXCaptureCapabilitiesIsCTMSupported())
    {
      id v11 = [(CFXCaptureViewController *)self controlStatusBar];
      objc_super v12 = [v11 flashIndicator];
      [v12 setOrientation:v7 animated:v3];
    }
    else
    {
      int64_t v13 = [(CFXCaptureViewController *)self captureMode];
      double v14 = [(CFXCaptureViewController *)self flashButton];
      id v11 = v14;
      if (v13 == 2) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = v7;
      }
      [v14 setOrientation:v15 animated:v3];
    }

    double v16 = [(CFXCaptureViewController *)self zoomControl];
    [v16 setOrientation:v7 animated:v3];
  }
}

- (void)configureUIForOrientation
{
  int64_t v3 = +[JFXOrientationMonitor interfaceOrientation];
  id v4 = +[JFXOrientationMonitor keyWindow];
  [v4 bounds];
  -[CFXCaptureViewController configureUIForWindowOrientation:bounds:](self, "configureUIForWindowOrientation:bounds:", v3);
}

- (void)configureUIForWindowOrientation:(int64_t)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ([(CFXCaptureViewController *)self captureMode] == 1) {
    return;
  }
  unint64_t v10 = 0x263F1C000uLL;
  id v11 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v12 = [v11 userInterfaceIdiom];

  int IsCTMSupported = CFXCaptureCapabilitiesIsCTMSupported();
  objc_msgSend(MEMORY[0x263F5E478], "cameraBottomBarFrameForReferenceBounds:", x, y, width, height);
  double v342 = v14;
  double v343 = v15;
  double v340 = v17;
  double v341 = v16;
  objc_msgSend(MEMORY[0x263F5E478], "reviewScreenControlBarFrameForReferenceBounds:", x, y, width, height);
  CGFloat v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  objc_super v26 = [(CFXCaptureViewController *)self delegate];
  double v27 = [v26 cameraControlsViewControllerForCaptureViewController:self];

  v350 = [v27 bottomBar];
  int64_t v28 = [(CFXCaptureViewController *)self captureMode];
  unint64_t v349 = a3 - 5;
  double v351 = y;
  CGFloat v352 = x;
  if (v12)
  {
    unint64_t v29 = [MEMORY[0x263F1C920] mainScreen];
    [v29 bounds];
    CGFloat v30 = v374.origin.x;
    CGFloat v31 = v374.origin.y;
    CGFloat v32 = v374.size.width;
    CGFloat v33 = v374.size.height;
    double v34 = CGRectGetWidth(v374);
    v375.origin.double x = v30;
    v375.origin.double y = v31;
    v375.size.double width = v32;
    v375.size.double height = v33;
    double v35 = v34 / CGRectGetHeight(v375);

    double v36 = v35;
    double x = v352;
    objc_msgSend(MEMORY[0x263F5E478], "cameraContentFrameForContentAspectRatio:referenceBounds:", v36, v352, y, width, height);
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    double v44 = v43;
    double v45 = [(CFXCaptureViewController *)self captureControlsContainerTopConstraint];
    LODWORD(v46) = 1144750080;
    [v45 setPriority:v46];

    CGFloat v47 = [(CFXCaptureViewController *)self captureControlsContainerHeightConstraint];
    LODWORD(v48) = 1132068864;
    [v47 setPriority:v48];

    if ([(CFXCaptureViewController *)self captureMode] == 2)
    {
      CGFloat v49 = [(CFXCaptureViewController *)self view];
      [v49 frame];
      double v346 = v38;
      double v50 = height;
      CGFloat v51 = CGRectGetWidth(v376) * 0.5;

      double v52 = [(CFXCaptureViewController *)self elapsedTimeView];
      [v52 frame];
      double v53 = v51 - CGRectGetWidth(v377) * 0.5;
      double height = v50;

      double v54 = [(CFXCaptureViewController *)self elapsedTimeView];
      [v54 frame];
      double v344 = v55;
      double v56 = [(CFXCaptureViewController *)self elapsedTimeView];
      [v56 frame];
      double v57 = v44;
      double v58 = v40;
      CGFloat v59 = CGRectGetWidth(v378);
      double v60 = [(CFXCaptureViewController *)self elapsedTimeView];
      [v60 frame];
      double v61 = width;
      double v62 = v42;
      CGFloat v63 = CGRectGetHeight(v379);

      unint64_t v10 = 0x263F1C000uLL;
      CGAffineTransform v64 = [(CFXCaptureViewController *)self elapsedTimeView];
      double v65 = v53;
      double v38 = v346;
      double v66 = v59;
      double v40 = v58;
      double v44 = v57;
      double v67 = v63;
      double v42 = v62;
      double width = v61;
      double y = v351;
      double x = v352;
      objc_msgSend(v64, "setFrame:", v65, v344, v66, v67);
    }
    CGFloat v68 = v350;
    goto LABEL_58;
  }
  CGFloat v345 = v19;
  CGFloat v333 = v21;
  CGFloat v334 = v23;
  CGFloat rect = v25;
  double v69 = 0.5625;
  if (!v28) {
    double v69 = 0.75;
  }
  objc_msgSend(MEMORY[0x263F5E478], "cameraContentFrameForContentAspectRatio:referenceBounds:", v69, x, y, width, height);
  double v347 = v70;
  double v338 = v71;
  double v73 = v72;
  double v75 = v74;
  int64_t v76 = a3;
  double v77 = height;
  double v78 = width;
  if ((unint64_t)(a3 - 5) >= 0xFFFFFFFFFFFFFFFELL)
  {
    int64_t v79 = [(CFXCaptureViewController *)self captureMode];
    int64_t v76 = a3;
    double v77 = height;
    double v78 = width;
    if (!v79)
    {
      int64_t v76 = 1;
      double v77 = width;
      double v78 = height;
    }
  }
  long long v372 = 0u;
  long long v373 = 0u;
  long long v370 = 0u;
  long long v371 = 0u;
  long long v368 = 0u;
  long long v369 = 0u;
  double v336 = v75;
  objc_msgSend(MEMORY[0x263F5E478], "cameraTopBarGeometryForReferenceBounds:forContentSize:withOrientation:", v76, x, y, v78, v77, v73, v75);
  long long v80 = [(CFXCaptureViewController *)self topBar];
  objc_msgSend(v80, "setCenter:", 0.0, 0.0);

  long long v81 = [(CFXCaptureViewController *)self topBar];
  objc_msgSend(v81, "setBounds:", 0.0, 0.0, 0.0, 0.0);

  int64_t v82 = [(CFXCaptureViewController *)self captureMode];
  if (v349 >= 0xFFFFFFFFFFFFFFFELL && v82 == 2)
  {
    long long v83 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v83 userInterfaceIdiom])
    {
      double v84 = 38.0;
    }
    else
    {
      long long v85 = [MEMORY[0x263F1C920] mainScreen];
      [v85 bounds];
      if ((uint64_t)v86 == 568)
      {
        double v84 = 35.0;
      }
      else
      {
        long long v87 = [MEMORY[0x263F1C920] mainScreen];
        [v87 bounds];
        if ((uint64_t)v88 == 568) {
          double v84 = 35.0;
        }
        else {
          double v84 = 38.0;
        }
      }
      unint64_t v10 = 0x263F1C000uLL;
    }

    long long v89 = [(CFXCaptureViewController *)self topBar];
    objc_msgSend(v89, "setBounds:", v368, 274.0, v84);

    long long v90 = [MEMORY[0x263F1C5C0] currentDevice];
    if (![v90 userInterfaceIdiom])
    {
      long long v91 = [MEMORY[0x263F1C920] mainScreen];
      [v91 bounds];
      if ((uint64_t)v92 == 568)
      {

        unint64_t v10 = 0x263F1C000;
      }
      else
      {
        long long v93 = [MEMORY[0x263F1C920] mainScreen];
        [v93 bounds];
        uint64_t v330 = (uint64_t)v94;

        unint64_t v10 = 0x263F1C000uLL;
        if (v330 != 568) {
          goto LABEL_28;
        }
      }
      v380.origin.double x = v19;
      v380.origin.double y = v333;
      v380.size.double width = v334;
      v380.size.double height = rect;
      double v95 = CGRectGetHeight(v380);
      v381.origin.double x = v342;
      v381.origin.double y = v343;
      v381.size.double height = v340;
      v381.size.double width = v341;
      double v96 = *((double *)&v370 + 1) - (v95 - CGRectGetHeight(v381));
      long long v90 = [(CFXCaptureViewController *)self topBar];
      objc_msgSend(v90, "setCenter:", *(double *)&v370, v96);
    }
  }
LABEL_28:
  long long v365 = v371;
  long long v366 = v372;
  long long v367 = v373;
  long long v97 = [(CFXCaptureViewController *)self topBar];
  v364[0] = v365;
  v364[1] = v366;
  v364[2] = v367;
  [v97 setTransform:v364];

  CGFloat v98 = [(CFXCaptureViewController *)self captureControlsContainerTopConstraint];
  long long v100 = v98;
  if (v349 >= 0xFFFFFFFFFFFFFFFELL) {
    float v101 = 750.0;
  }
  else {
    float v101 = 250.0;
  }
  if (v349 >= 0xFFFFFFFFFFFFFFFELL) {
    float v102 = 250.0;
  }
  else {
    float v102 = 750.0;
  }
  *(float *)&double v99 = v101;
  [v98 setPriority:v99];

  long long v103 = [(CFXCaptureViewController *)self captureControlsContainerWidthConstraint];
  *(float *)&double v104 = v101;
  [v103 setPriority:v104];

  v105 = [(CFXCaptureViewController *)self captureControlsContainerHeightConstraint];
  *(float *)&double v106 = v102;
  [v105 setPriority:v106];

  uint64_t v107 = [(CFXCaptureViewController *)self view];
  CGPoint v108 = v107;
  if (v349 < 0xFFFFFFFFFFFFFFFELL)
  {
    [v107 bounds];
    double v109 = CGRectGetHeight(v382) - v343;

    CGPoint v110 = [*(id *)(v10 + 1472) currentDevice];
    double v44 = v336;
    double v42 = v73;
    if ([v110 userInterfaceIdiom])
    {

      CGFloat v68 = v350;
LABEL_45:
      if ([(CFXCaptureViewController *)self dockIsMagnified])
      {
        [(CFXCaptureViewController *)self dockMagnifiedHeightDelta];
        double v109 = v109 + v128;
      }
      v129 = [(CFXCaptureViewController *)self captureControlsContainerHeightConstraint];
      [v129 setConstant:v109];

      v130 = [(CFXCaptureViewController *)self captureControlsContainerLeadingConstraint];
      LODWORD(v131) = 1144750080;
      [v130 setPriority:v131];

      v132 = [(CFXCaptureViewController *)self captureControlsContainerTrailingConstraint];
      LODWORD(v133) = 1144750080;
      [v132 setPriority:v133];
      double v38 = v347;
      double v40 = v338;
      goto LABEL_57;
    }
    v121 = [MEMORY[0x263F1C920] mainScreen];
    [v121 bounds];
    if ((uint64_t)v122 == 568)
    {

      CGFloat v68 = v350;
    }
    else
    {
      [MEMORY[0x263F1C920] mainScreen];
      v126 = unint64_t v125 = v10;
      [v126 bounds];
      uint64_t v331 = (uint64_t)v127;

      unint64_t v10 = v125;
      CGFloat v68 = v350;
      if (v331 != 568) {
        goto LABEL_45;
      }
    }
    v384.origin.double x = v345;
    v384.origin.double y = v333;
    v384.size.double width = v334;
    v384.size.double height = rect;
    double v109 = CGRectGetHeight(v384);
    goto LABEL_45;
  }
  [v107 frame];
  CGFloat v112 = v111;
  CGFloat v114 = v113;
  CGFloat v116 = v115;
  CGFloat v118 = v117;

  v383.origin.double x = v112;
  v383.origin.double y = v114;
  v383.size.double width = v116;
  v383.size.double height = v118;
  double v119 = CGRectGetWidth(v383) - v343;
  v120 = [*(id *)(v10 + 1472) currentDevice];
  if (![v120 userInterfaceIdiom])
  {
    v123 = [MEMORY[0x263F1C920] mainScreen];
    [v123 bounds];
    double v44 = v336;
    double v42 = v73;
    if ((uint64_t)v124 == 568)
    {
    }
    else
    {
      [MEMORY[0x263F1C920] mainScreen];
      v135 = unint64_t v134 = v10;
      [v135 bounds];
      uint64_t v332 = (uint64_t)v136;

      unint64_t v10 = v134;
      if (v332 != 568) {
        goto LABEL_50;
      }
    }
    v385.origin.double x = v345;
    v385.origin.double y = v333;
    v385.size.double width = v334;
    v385.size.double height = rect;
    double v119 = CGRectGetHeight(v385);
    goto LABEL_50;
  }

  double v44 = v336;
  double v42 = v73;
LABEL_50:
  v137 = [(CFXCaptureViewController *)self captureControlsContainerWidthConstraint];
  [v137 setConstant:v119];

  v138 = [(CFXCaptureViewController *)self captureControlsContainerLeadingConstraint];
  v140 = v138;
  if (a3 == 4) {
    *(float *)&double v139 = 750.0;
  }
  else {
    *(float *)&double v139 = 250.0;
  }
  if (a3 == 4) {
    float v141 = 250.0;
  }
  else {
    float v141 = 750.0;
  }
  [v138 setPriority:v139];

  v132 = [(CFXCaptureViewController *)self captureControlsContainerTrailingConstraint];
  *(float *)&double v142 = v141;
  [v132 setPriority:v142];
  CGFloat v68 = v350;
  double v38 = v347;
  double v40 = v338;
  double x = v352;
LABEL_57:

LABEL_58:
  v143 = [(CFXCaptureViewController *)self view];
  [v143 layoutIfNeeded];

  long long v372 = 0u;
  long long v373 = 0u;
  long long v370 = 0u;
  long long v371 = 0u;
  long long v368 = 0u;
  long long v369 = 0u;
  double v348 = width;
  objc_msgSend(MEMORY[0x263F5E478], "orientedGeometryForFrame:inBounds:orientation:", a3, v38, v40, v42, v44, x, y, width, height);
  double v144 = *((double *)&v371 + 1);
  double v339 = *(double *)&v371;
  long long v145 = v372;
  double v337 = *(double *)&v372;
  long long v146 = v369;
  v147 = [(CFXCaptureViewController *)self view];
  [v147 frame];
  double v149 = v148;
  double v151 = v150;
  double v153 = v152;
  double v155 = v154;
  v156 = [(CFXCaptureViewController *)self liveCaptureContainerContainer];
  objc_msgSend(v156, "setFrame:", v149, v151, v153, v155);

  if ((IsCTMSupported & 1) == 0)
  {
    double v157 = *MEMORY[0x263F001A8];
    double v158 = *(double *)(MEMORY[0x263F001A8] + 8);
    long long v159 = v370;
    v160 = [(CFXCaptureViewController *)self liveCaptureContainer];
    [v160 setCenter:v159];

    v161 = [(CFXCaptureViewController *)self liveCaptureContainer];
    objc_msgSend(v161, "setBounds:", v157, v158, fabs(v337 * *((double *)&v146 + 1) + v339 * *(double *)&v146), fabs(*((double *)&v145 + 1) * *((double *)&v146 + 1) + v144 * *(double *)&v146));
  }
  CGFloat v162 = v351;
  double v163 = v352;
  if (![(CFXCaptureViewController *)self configuredForOrientation])
  {
    long long v362 = 0u;
    long long v363 = 0u;
    long long v360 = 0u;
    long long v361 = 0u;
    long long v358 = 0u;
    long long v359 = 0u;
    objc_msgSend(MEMORY[0x263F5E478], "orientedGeometryForFrame:inBounds:orientation:", a3, v342, v343, v341, v340, v352, v351, width, height);
    v164 = [*(id *)(v10 + 1472) currentDevice];
    if ([v164 userInterfaceIdiom]) {
      [v27 view];
    }
    else {
    v165 = [v27 backgroundView];
    }

    v166 = [(CFXCaptureViewController *)self view];
    [v166 convertPoint:v165 toView:v360];
    double v168 = v167;
    double v170 = v169;

    v357[0] = v361;
    v357[1] = v362;
    v357[2] = v363;
    [v68 setTransform:v357];
    if (IsCTMSupported)
    {
      -[CFXCaptureViewController bottomBarCTMControlsFrameForWindowOrientation:bounds:](self, "bottomBarCTMControlsFrameForWindowOrientation:bounds:", a3, v352, v351, width, height);
      double v171 = v386.origin.x;
      CGFloat v172 = v386.origin.y;
      double v173 = v386.size.width;
      double v174 = v386.size.height;
      double MidX = CGRectGetMidX(v386);
      v387.origin.double x = v171;
      v387.origin.double y = v172;
      v387.size.double width = v173;
      v387.size.double height = v174;
      objc_msgSend(v68, "setCenter:", MidX, CGRectGetMidY(v387));
      double v176 = v172;
      double width = v348;
      objc_msgSend(v68, "setBounds:", v171, v176, v173, v174);
    }
    else
    {
      v177 = [*(id *)(v10 + 1472) currentDevice];
      uint64_t v178 = [v177 userInterfaceIdiom];
      double v180 = *((double *)&v360 + 1);
      double v179 = *(double *)&v360;
      if (v178)
      {
        double v179 = v168;
        double v180 = v170;
      }
      objc_msgSend(v68, "setCenter:", v179, v180);

      objc_msgSend(v68, "setBounds:", v358, v359);
      [(CFXCaptureViewController *)self layoutZoomUI];
    }
  }
  v181 = [(CFXCaptureViewController *)self effectBrowserContentPresenterViewController];
  objc_msgSend(v181, "configureEffectBrowserContentPresentationForOrientation:", +[JFXOrientationMonitor interfaceOrientation](JFXOrientationMonitor, "interfaceOrientation"));

  if (IsCTMSupported)
  {
    if (v349 >= 0xFFFFFFFFFFFFFFFELL)
    {
      v388.origin.double x = v352;
      v388.origin.double y = v351;
      v388.size.double width = width;
      v388.size.double height = height;
      double v183 = CGRectGetHeight(v388);
      v389.origin.double x = v352;
      v389.origin.double y = v351;
      v389.size.double width = width;
      v389.size.double height = height;
      double v182 = CGRectGetWidth(v389);
      double v184 = 0.0;
      double v163 = 0.0;
    }
    else
    {
      double v182 = height;
      double v183 = width;
      double v184 = v351;
    }
    id v185 = objc_alloc(MEMORY[0x263F307C0]);
    v186 = [(CFXCaptureViewController *)self dynamicShutterControl];
    [v186 intrinsicContentSize];
    v189 = objc_msgSend(v185, "initWithReferenceBounds:shutterIntrinsicSize:", v163, v184, v183, v182, v187, v188);

    uint64_t v190 = CFXPreviewAspectRatioForAspectRatioCrop([(CFXCaptureViewController *)self aspectRatioCrop]);
    if (![(CFXCaptureViewController *)self aspectRatioCrop]) {
      uint64_t v190 = [(CFXCaptureViewController *)self captureMode] == 2;
    }
    [v189 viewportFrameForAspectRatio:v190 usingAppDrawer:1 accessoryAreaExpanded:0];
    double v193 = v192;
    double v194 = v191;
    double v196 = v195;
    double v198 = v197;
    if (v349 >= 0xFFFFFFFFFFFFFFFELL)
    {
      if (a3 == 4)
      {
        v390.origin.double x = v352;
        v390.origin.double y = v351;
        v390.size.double width = width;
        v390.size.double height = height;
        double v199 = CGRectGetWidth(v390);
        v391.origin.double x = v193;
        v391.origin.double y = v194;
        v391.size.double width = v196;
        v391.size.double height = v198;
        double v200 = v199 - (v194 + CGRectGetHeight(v391));
      }
      else
      {
        double v200 = v191;
      }
      v392.origin.double x = v193;
      v392.origin.double y = v194;
      v392.size.double width = v196;
      v392.size.double height = v198;
      CGFloat v201 = CGRectGetHeight(v392);
      v393.origin.double x = v193;
      v393.origin.double y = v194;
      v393.size.double width = v196;
      v393.size.double height = v198;
      double v198 = CGRectGetWidth(v393);
      double v194 = 0.0;
      double v196 = v201;
      double v193 = v200;
      CGFloat v162 = v351;
    }
    v202 = [(CFXCaptureViewController *)self liveCaptureContainer];
    objc_msgSend(v202, "setFrame:", v193, v194, v196, v198);

    if (![(CFXCaptureViewController *)self configuredForOrientation])
    {
      v203 = [(CFXCaptureViewController *)self reticleView];
      objc_msgSend(v203, "setFrame:", v193, v194, v196, v198);

      if ([(CFXCaptureViewController *)self aspectRatioCrop] == 2) {
        uint64_t v204 = 3;
      }
      else {
        uint64_t v204 = 0;
      }
      [v189 viewportFrameForAspectRatio:v204 usingAppDrawer:1 accessoryAreaExpanded:0];
      double v208 = v207;
      double v210 = v209;
      if (v349 >= 0xFFFFFFFFFFFFFFFELL)
      {
        CGFloat v212 = v205;
        CGFloat v213 = v206;
        if (a3 == 4)
        {
          v394.origin.double x = v352;
          v394.origin.double y = v162;
          v394.size.double width = width;
          v394.size.double height = height;
          CGRectGetWidth(v394);
          v395.origin.double x = v212;
          v395.origin.double y = v208;
          v395.size.double width = v213;
          v395.size.double height = v210;
          CGRectGetHeight(v395);
        }
        unint64_t v211 = v10;
        v396.origin.double x = v212;
        v396.origin.double y = v208;
        v396.size.double width = v213;
        v396.size.double height = v210;
        CGRectGetHeight(v396);
        v397.origin.double x = v212;
        v397.origin.double y = v208;
        v397.size.double width = v213;
        v397.size.double height = v210;
        double v210 = CGRectGetWidth(v397);
        double v208 = 0.0;
      }
      else
      {
        unint64_t v211 = v10;
      }
      v214 = [(CFXCaptureViewController *)self bottomControlsContainer];
      objc_msgSend(v214, "setFrame:", 0.0, v210 + v208, width, height - (v210 + v208));

      v215 = [(CFXCaptureViewController *)self dynamicShutterControl];
      [v189 frameForShutterControl:v215];
      double v217 = v216;
      double v219 = v218;
      double v221 = v220;
      double v223 = v222;

      v224 = [(CFXCaptureViewController *)self bottomControlsContainer];
      v225 = [(CFXCaptureViewController *)self view];
      objc_msgSend(v224, "convertRect:fromView:", v225, v217, v219, v221, v223);
      double v227 = v226;
      double v229 = v228;
      double v231 = v230;
      double v233 = v232;

      v234 = [(CFXCaptureViewController *)self dynamicShutterControl];
      objc_msgSend(v234, "setFrame:", v227, v229, v231, v233);

      v235 = [(CFXCaptureViewController *)self bottomControlsContainer];
      v236 = [(CFXCaptureViewController *)self dynamicShutterControl];
      [v235 insertSubview:v236 atIndex:0];

      v237 = [v27 effectButton];
      [v189 frameForBottomLeftControl:v237];
      double v239 = v238;
      double v241 = v240;
      double v243 = v242;
      double v245 = v244;

      v246 = [(CFXCaptureViewController *)self bottomControlsContainer];
      v247 = [(CFXCaptureViewController *)self view];
      objc_msgSend(v246, "convertRect:fromView:", v247, v239, v241, v243, v245);
      double v249 = v248;
      double v251 = v250;
      double v253 = v252;
      double v255 = v254;

      v256 = [v27 effectButton];
      objc_msgSend(v256, "setFrame:", v249, v251, v253, v255);

      v257 = [(CFXCaptureViewController *)self bottomControlsContainer];
      v258 = [v27 effectButton];
      [v257 addSubview:v258];

      v259 = [v27 flipButton];
      [v189 frameForBottomRightControl:v259];
      double v261 = v260;
      double v263 = v262;
      double v265 = v264;
      double v267 = v266;

      v268 = [(CFXCaptureViewController *)self bottomControlsContainer];
      v269 = [(CFXCaptureViewController *)self view];
      objc_msgSend(v268, "convertRect:fromView:", v269, v261, v263, v265, v267);
      double v271 = v270;
      double v273 = v272;
      double v275 = v274;
      double v277 = v276;

      v278 = [v27 flipButton];
      objc_msgSend(v278, "setFrame:", v271, v273, v275, v277);

      v279 = [(CFXCaptureViewController *)self bottomControlsContainer];
      v280 = [v27 flipButton];
      [v279 addSubview:v280];

      [v189 frameForControlStatusBar];
      double v282 = v281;
      double v284 = v283;
      double v286 = v285;
      double v288 = v287;
      v289 = [(CFXCaptureViewController *)self controlStatusBar];
      objc_msgSend(v289, "setFrame:", v282, v284, v286, v288);

      if ([(CFXCaptureViewController *)self aspectRatioCrop] == 2)
      {
        v290 = [(CFXCaptureViewController *)self bottomControlsContainer];
        [v290 frame];
        objc_msgSend(v350, "setFrame:");
      }
      [(CFXCaptureViewController *)self layoutZoomUI];
      unint64_t v10 = v211;
      CGFloat v68 = v350;
    }
    [v189 viewportFrameForAspectRatio:v190 usingAppDrawer:1 accessoryAreaExpanded:0];
    double v292 = v291;
    double v294 = v293;
    double v296 = v295;
    double v298 = v297;
    long long v362 = 0u;
    long long v363 = 0u;
    long long v360 = 0u;
    long long v361 = 0u;
    long long v358 = 0u;
    long long v359 = 0u;
    v299 = [(CFXCaptureViewController *)self elapsedTimeView];
    if (v189)
    {
      objc_msgSend(v189, "geometryForElapsedTimeView:viewportFrame:orientation:", v299, a3, v292, v294, v296, v298);
    }
    else
    {
      long long v362 = 0u;
      long long v363 = 0u;
      long long v360 = 0u;
      long long v361 = 0u;
      long long v358 = 0u;
      long long v359 = 0u;
    }

    long long v300 = v358;
    long long v301 = v359;
    v302 = [(CFXCaptureViewController *)self elapsedTimeView];
    objc_msgSend(v302, "setBounds:", v300, v301);

    long long v303 = v360;
    v304 = [(CFXCaptureViewController *)self elapsedTimeView];
    [v304 setCenter:v303];

    long long v354 = v361;
    long long v355 = v362;
    long long v356 = v363;
    v305 = [(CFXCaptureViewController *)self elapsedTimeView];
    v353[0] = v354;
    v353[1] = v355;
    v353[2] = v356;
    [v305 setTransform:v353];

    v306 = [*(id *)(v10 + 1472) currentDevice];
    uint64_t v307 = [v306 userInterfaceIdiom];

    if (!v307)
    {
      [v189 viewportFrameForAspectRatio:0 usingAppDrawer:1 accessoryAreaExpanded:0];
      double MaxY = CGRectGetMaxY(v398);
      v309 = [(CFXCaptureViewController *)self view];
      [v309 frame];
      if (v349 >= 0xFFFFFFFFFFFFFFFELL)
      {
        double v314 = CGRectGetWidth(*(CGRect *)&v310) - MaxY;

        v316 = [(CFXCaptureViewController *)self captureControlsContainerWidthConstraint];
      }
      else
      {
        double v314 = CGRectGetHeight(*(CGRect *)&v310) - MaxY;

        if ([(CFXCaptureViewController *)self dockIsMagnified])
        {
          [(CFXCaptureViewController *)self dockMagnifiedHeightDelta];
          double v314 = v314 + v315;
        }
        v316 = [(CFXCaptureViewController *)self captureControlsContainerHeightConstraint];
      }
      v317 = v316;
      [v316 setConstant:v314];
    }
  }
  v318 = [(CFXCaptureViewController *)self liveCaptureContainer];
  [v318 frame];
  -[CFXCaptureViewController setPresentationRect:](self, "setPresentationRect:");

  [(CFXCaptureViewController *)self presentationRect];
  double v320 = v319;
  double v322 = v321;
  double v324 = v323;
  double v326 = v325;
  v327 = [(CFXCaptureViewController *)self presentationView];
  objc_msgSend(v327, "setFrame:", v320, v322, v324, v326);

  [(CFXCaptureViewController *)self updateAnimojiTrackingReticleAndLabelLayout];
  [(CFXCaptureViewController *)self updateEffectEditorLayout];
  [(CFXCaptureViewController *)self updateFullScreenTextEditorLayout];
  v328 = [*(id *)(v10 + 1472) currentDevice];
  uint64_t v329 = [v328 userInterfaceIdiom];

  if (!v329) {
    [(CFXCaptureViewController *)self setConfiguredForOrientation:1];
  }
}

- (void)applyRotationTransformForPortrait
{
  int64_t v3 = [(CFXCaptureViewController *)self parentViewController];
  id v4 = +[JFXOrientationMonitor keyWindow];
  [v4 bounds];
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  CGFloat v13 = v12;
  CGFloat v14 = v10;
  CGFloat v15 = v8;
  double v42 = v6;
  if (v3)
  {
    double v16 = [v3 view];
    [v16 bounds];
    CGFloat v6 = v17;
    CGFloat v15 = v18;
    CGFloat v14 = v19;
    CGFloat v13 = v20;
  }
  int64_t v21 = +[JFXOrientationMonitor interfaceOrientation];
  v45.origin.double x = v6;
  v45.origin.double y = v15;
  v45.size.double width = v14;
  v45.size.double height = v13;
  double Width = CGRectGetWidth(v45);
  v46.origin.double x = v6;
  v46.origin.double y = v15;
  v46.size.double width = v14;
  v46.size.double height = v13;
  double Height = CGRectGetHeight(v46);
  switch(v21)
  {
    case 1:
      double v24 = 0.0;
      break;
    case 3:
      double v24 = 1.57079633;
      break;
    case 4:
      double v24 = -1.57079633;
      break;
    default:
      double v24 = 3.14159265;
      if (v21 != 2) {
        double v24 = 0.0;
      }
      break;
  }
  CGAffineTransformMakeRotation(&v44, -v24);
  double v25 = [(CFXCaptureViewController *)self view];
  CGAffineTransform v43 = v44;
  [v25 setTransform:&v43];

  if (Width >= Height) {
    double v26 = Height;
  }
  else {
    double v26 = Width;
  }
  if (Width < Height) {
    double Width = Height;
  }
  double v27 = [(CFXCaptureViewController *)self view];
  objc_msgSend(v27, "setBounds:", 0.0, 0.0, v26, Width);

  if (v3)
  {
    int64_t v28 = [v3 view];
    [v28 bounds];
    objc_msgSend(v3, "jfxCenterAdjustedForOrientationForPortraitFrame:relativeToParentFrame:withOrientation:", v21, 0.0, 0.0, v26, Width, v29, v30, v31, v32);
    double v34 = v33;
    double v36 = v35;
    double v37 = [(CFXCaptureViewController *)self view];
    objc_msgSend(v37, "setCenter:", v34, v36);
  }
  else
  {
    -[UIViewController jfxCenterAdjustedForOrientationForPortraitFrame:relativeToParentFrame:withOrientation:](self, "jfxCenterAdjustedForOrientationForPortraitFrame:relativeToParentFrame:withOrientation:", v21, 0.0, 0.0, v26, Width, v42, v8, v10, v12);
    double v39 = v38;
    double v41 = v40;
    int64_t v28 = [(CFXCaptureViewController *)self view];
    objc_msgSend(v28, "setCenter:", v39, v41);
  }
}

- (void)setAspectRatioCrop:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  double v5 = JFXLog_viewerUI();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CGFloat v6 = NSStringFromCFXAspectRatioCrop(a3);
    int v7 = 138543362;
    double v8 = v6;
    _os_log_impl(&dword_234C41000, v5, OS_LOG_TYPE_DEFAULT, "aspectRatioCrop: %{public}@", (uint8_t *)&v7, 0xCu);
  }
  self->_aspectRatioCrop = a3;
}

- (void)setCaptureMode:(int64_t)a3
{
  self->_captureMode = a3;
  [(CFXCaptureViewController *)self loadViewIfNeeded];
  if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) == 0)
  {
    BOOL v4 = isStreamingMode([(CFXCaptureViewController *)self captureMode]);
    id v5 = [(CFXCaptureViewController *)self topBar];
    [v5 setHidden:v4];
  }
}

- (UIView)effectsPickerDrawer
{
  [(CFXCaptureViewController *)self loadViewIfNeeded];
  int64_t v3 = [(CFXCaptureViewController *)self cameraControls];
  BOOL v4 = [v3 effectsPickerDrawer];

  return (UIView *)v4;
}

- (void)setEffectsPickerDrawer:(id)a3
{
  id v4 = a3;
  [(CFXCaptureViewController *)self loadViewIfNeeded];
  id v5 = [(CFXCaptureViewController *)self cameraControls];
  [v5 setEffectsPickerDrawer:v4];
}

- (BOOL)livePlayerIsSaturated
{
  id v2 = [(CFXCaptureViewController *)self cameraViewController];
  char v3 = [v2 livePlayerIsSaturated];

  return v3;
}

- (void)willDropCameraFrame
{
  id v2 = [(CFXCaptureViewController *)self cameraViewController];
  [v2 willDropCameraFrame];
}

- (void)setUseLocalCameraViewfinder:(BOOL)a3
{
  BOOL v3 = a3;
  [(CFXCaptureViewController *)self loadViewIfNeeded];
  id v5 = [(CFXCaptureViewController *)self cameraViewController];
  [v5 setUseLocalCameraViewfinder:v3];
}

- (BOOL)useLocalCameraViewfinder
{
  [(CFXCaptureViewController *)self loadViewIfNeeded];
  BOOL v3 = [(CFXCaptureViewController *)self cameraViewController];
  char v4 = [v3 useLocalCameraViewfinder];

  return v4;
}

- (double)userInterfaceAlpha
{
  id v2 = [(CFXCaptureViewController *)self cameraControlsContainerView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (void)setUserInterfaceAlpha:(double)a3
{
  id v4 = [(CFXCaptureViewController *)self cameraControlsContainerView];
  [v4 setAlpha:a3];
}

- (int64_t)flashMode
{
  [(CFXCaptureViewController *)self loadViewIfNeeded];
  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    double v3 = [(CFXCaptureViewController *)self controlStatusBar];
    id v4 = [v3 flashIndicator];
    uint64_t v5 = [v4 flashMode];
  }
  else
  {
    CGFloat v6 = [(CFXCaptureViewController *)self flashButton];
    char v7 = [v6 isHidden];

    if (v7)
    {
      uint64_t v5 = 0;
      goto LABEL_7;
    }
    double v3 = [(CFXCaptureViewController *)self flashButton];
    uint64_t v5 = [v3 flashMode];
  }

LABEL_7:
  return [(CFXCaptureViewController *)self CFX_captureFlashModeForCAMFlashMode:v5];
}

- (void)setFlashMode:(int64_t)a3
{
  [(CFXCaptureViewController *)self loadViewIfNeeded];
  int64_t v5 = [(CFXCaptureViewController *)self CFX_camFlashModeForCaptureFlashMode:a3];
  CGFloat v6 = [(CFXCaptureViewController *)self flashButton];
  [v6 setFlashMode:v5];

  [(CFXCaptureViewController *)self flashModeDidChange];
}

- (CFXEffectComposition)composition
{
  id v2 = [(CFXCaptureViewController *)self cameraViewController];
  double v3 = [v2 composition];

  return (CFXEffectComposition *)v3;
}

- (int64_t)captureInterfaceOrientationForDisplay
{
  return +[JFXOrientationMonitor interfaceOrientation];
}

- (void)toggleCTMFlashButton
{
  double v3 = [(CFXCaptureViewController *)self controlStatusBar];
  id v4 = [v3 flashIndicator];
  uint64_t v5 = [v4 flashMode];

  if (v5)
  {
    if (v5 == 1)
    {
      CGFloat v6 = [(CFXCaptureViewController *)self controlStatusBar];
      char v7 = [v6 flashIndicator];
      double v8 = v7;
      uint64_t v9 = 0;
    }
    else
    {
      if (v5 != 2) {
        return;
      }
      CGFloat v6 = [(CFXCaptureViewController *)self controlStatusBar];
      char v7 = [v6 flashIndicator];
      double v8 = v7;
      uint64_t v9 = 1;
    }
  }
  else
  {
    CGFloat v6 = [(CFXCaptureViewController *)self controlStatusBar];
    char v7 = [v6 flashIndicator];
    double v8 = v7;
    uint64_t v9 = 2;
  }
  [v7 setFlashMode:v9];

  [(CFXCaptureViewController *)self flashModeDidChange];
}

- (void)setTorchModeForFlashMode:(int64_t)a3
{
  int64_t v3 = [(CFXCaptureViewController *)self CFX_captureTorchModeForCAMFlashMode:a3];
  id v4 = +[JFXVideoCameraController sharedInstance];
  [v4 setCaptureTorchMode:v3 completion:0];
}

- (void)flashModeDidChange
{
  if ([(CFXCaptureViewController *)self captureMode] == 2)
  {
    if (CFXCaptureCapabilitiesIsCTMSupported())
    {
      int64_t v3 = [(CFXCaptureViewController *)self controlStatusBar];
      id v4 = [v3 flashIndicator];
      uint64_t v5 = [v4 flashMode];
    }
    else
    {
      int64_t v3 = [(CFXCaptureViewController *)self flashButton];
      uint64_t v5 = [v3 flashMode];
    }

    [(CFXCaptureViewController *)self setTorchModeForFlashMode:v5];
  }
}

- (void)cameraDidStart
{
  if (![(CFXCaptureViewController *)self observingOrientationChanges])
  {
    [(CFXCaptureViewController *)self setObservingOrientationChanges:1];
    int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:self selector:sel_JFX_orientationMonitorDeviceInterfaceOrientationNotification_ name:@"kJFXOrientationMonitorDeviceInterfaceOrientationNotification" object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:self selector:sel_JFX_orientationMonitorInterfaceOrientationNotification_ name:@"kJFXOrientationMonitorInterfaceOrientationNotification" object:0];
  }
  [(CFXCaptureViewController *)self configureCaptureControlsForOrientationWithAnimation:1];
  if ([(CFXCaptureViewController *)self captureMode] != 1)
  {
    [(CFXCaptureViewController *)self CFX_setFrameAndRenderSizes];
    if (CFXCaptureCapabilitiesIsCTMSupported())
    {
      uint64_t v5 = [(CFXCaptureViewController *)self dynamicShutterControl];
      [v5 setEnabled:1];
    }
    else
    {
      CGFloat v6 = [(CFXCaptureViewController *)self delegate];
      uint64_t v5 = [v6 cameraControlsViewControllerForCaptureViewController:self];

      [v5 setShutterButtonEnabled:1];
    }
  }
  id v7 = [(CFXCaptureViewController *)self cameraViewController];
  [v7 startRenderingCameraFrames];
}

- (void)cameraDidStop
{
  if ([(CFXCaptureViewController *)self observingOrientationChanges])
  {
    [(CFXCaptureViewController *)self setObservingOrientationChanges:0];
    int64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self name:@"kJFXOrientationMonitorDeviceInterfaceOrientationNotification" object:0];

    id v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:@"kJFXOrientationMonitorInterfaceOrientationNotification" object:0];
  }
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  CGFloat v6 = [(CFXCaptureViewController *)self cameraViewController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __41__CFXCaptureViewController_cameraDidStop__block_invoke;
  v8[3] = &unk_264C09FA8;
  dispatch_semaphore_t v9 = v5;
  id v7 = v5;
  [v6 stopRenderingCameraFrames:v8];

  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
}

intptr_t __41__CFXCaptureViewController_cameraDidStop__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)effectCompositionDidChange:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXCaptureViewController *)self delegate];
  [v5 captureViewController:self didChangeEffectComposition:v4];
}

- (void)CFX_addEffect:(id)a3 allowImmediateTextEditing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(CFXCaptureViewController *)self removeEffectEditorAnimated:1];
  id v7 = [v6 jtEffect];
  double v8 = +[CFXMediaSettings sharedInstance];
  [v8 renderSize];
  objc_msgSend(v7, "setRenderSize:");

  dispatch_semaphore_t v9 = +[CFXMediaSettings sharedInstance];
  [v9 frameSize];
  objc_msgSend(v7, "setPlayableAspectRatio:", aspectRatioForSize(v10, v11));

  [v7 setPlayableAspectRatioPreservationMode:0];
  double v12 = [v7 renderEffect];
  v27[0] = kDefaultEffectPreviewAnimationRange;
  v27[1] = xmmword_234D62718;
  v27[2] = xmmword_234D62728;
  [v12 setEffectRange:v27];

  if (v4
    && +[JFXEffectEditingUtilities canEditTextForEffect:v7])
  {
    CGFloat v13 = [v6 jtEffect];
    char v14 = 1;
    [v13 setHidden:1];
  }
  else
  {
    char v14 = 0;
  }
  CGFloat v15 = JFXLog_core();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = MEMORY[0x237DD1770]();
    *(_DWORD *)CGAffineTransform buf = 134349056;
    uint64_t v29 = v16;
    _os_log_impl(&dword_234C41000, v15, OS_LOG_TYPE_DEFAULT, "Available memory: %{iec-bytes,public}zu", buf, 0xCu);
  }

  double v17 = [(CFXCaptureViewController *)self cameraViewController];
  [v17 pauseRenderingCameraFrames];

  double v18 = [(CFXCaptureViewController *)self cameraViewController];
  [v18 flushRenderer];

  double v19 = [(CFXCaptureViewController *)self cameraViewController];
  double v20 = [v19 composition];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __68__CFXCaptureViewController_CFX_addEffect_allowImmediateTextEditing___block_invoke;
  v23[3] = &unk_264C0C978;
  v23[4] = self;
  id v24 = v7;
  char v26 = v14;
  id v25 = v6;
  id v21 = v6;
  id v22 = v7;
  [v20 addEffect:v21 completion:v23];
}

void __68__CFXCaptureViewController_CFX_addEffect_allowImmediateTextEditing___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) cameraViewController];
  [v2 resumeRenderingCameraFrames];

  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  CGFloat v13 = __68__CFXCaptureViewController_CFX_addEffect_allowImmediateTextEditing___block_invoke_2;
  char v14 = &unk_264C0C978;
  id v3 = *(id *)(a1 + 40);
  char v18 = *(unsigned char *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 32);
  id v15 = v3;
  uint64_t v16 = v4;
  id v17 = *(id *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], &v11);
  id v5 = *(void **)(a1 + 32);
  id v6 = objc_msgSend(v5, "composition", v11, v12, v13, v14);
  [v5 effectCompositionDidChange:v6];

  id v7 = CFXLog_action();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [*(id *)(a1 + 32) composition];
    dispatch_semaphore_t v9 = [v8 jtEffects];
    double v10 = +[CFXActionLogging actionLogAsJSONForEvent:@"effect added" atLocation:@"live" withEffectStack:v9];
    *(_DWORD *)CGAffineTransform buf = 138543362;
    double v20 = v10;
    _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

void __68__CFXCaptureViewController_CFX_addEffect_allowImmediateTextEditing___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) type] == 2)
  {
    id v2 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 56))
    {
      if (([v2 presentFullScreenTextEditorForEffect:*(void *)(a1 + 32) insertingEffect:1] & 1) == 0)
      {
        id v3 = JFXLog_viewerUI();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)CGAffineTransform buf = 0;
          _os_log_impl(&dword_234C41000, v3, OS_LOG_TYPE_DEFAULT, "Cannot display text editor on insert because its already open", buf, 2u);
        }

        uint64_t v4 = [*(id *)(a1 + 40) cameraViewController];
        id v5 = [v4 composition];
        [v5 removeEffect:*(void *)(a1 + 48) completion:0];
      }
    }
    else if (isStreamingMode([v2 captureMode]))
    {
      id v6 = [*(id *)(a1 + 48) jtEffect];
      [*(id *)(a1 + 40) enableAnimationForOverlayEffect:v6];
    }
  }
}

- (void)addEffect:(id)a3
{
}

- (void)addEffect:(id)a3 allowImmediateTextEditing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = JFXLog_effects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    double v8 = [v6 jtEffect];
    dispatch_semaphore_t v9 = NSStringFromJFXEffectType([v8 type]);
    double v10 = [v6 localizedTitle];
    *(_DWORD *)CGAffineTransform buf = 138543874;
    double v38 = v9;
    __int16 v39 = 2114;
    double v40 = v10;
    __int16 v41 = 1024;
    BOOL v42 = v4;
    _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, allowImmediateTextEditing: %d", buf, 0x1Cu);
  }
  uint64_t v11 = [v6 jtEffect];
  int v12 = [v11 type];

  if (v12 != 2)
  {
    char v18 = [v6 jtEffect];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __64__CFXCaptureViewController_addEffect_allowImmediateTextEditing___block_invoke_2;
    v26[3] = &unk_264C0C9C8;
    v26[4] = self;
    id v27 = v6;
    BOOL v28 = v4;
    id v19 = v6;
    [v18 loadRenderEffectInBackgroundWithCompletionOnMainQueue:v26];

    goto LABEL_13;
  }
  uint64_t v13 = 0x3FD6666666666666;
  if (![(CFXCaptureViewController *)self CFX_canApplyFaceTracking]) {
    goto LABEL_9;
  }
  char v14 = +[JFXVideoCameraController sharedInstance];
  id v15 = [v14 mostRecentARMetadata];

  uint64_t v16 = [v15 faceAnchor];

  if (!v16)
  {

LABEL_9:
    char v17 = 0;
    id v15 = 0;
    goto LABEL_10;
  }
  char v17 = 1;
  uint64_t v13 = 0x3FE399999999999ALL;
LABEL_10:
  double v20 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v19 = [v20 objectForKey:@"CFX_CaptureEffectInsertionSize"];

  if (v19)
  {
    [v19 doubleValue];
    uint64_t v13 = v21;
  }
  id v22 = [v6 jtEffect];
  v29[0] = MEMORY[0x263EF8330];
  v29[1] = 3221225472;
  v29[2] = __64__CFXCaptureViewController_addEffect_allowImmediateTextEditing___block_invoke;
  v29[3] = &unk_264C0C9A0;
  uint64_t v34 = v13;
  char v35 = v17;
  id v30 = v22;
  id v31 = v15;
  double v32 = self;
  id v33 = v6;
  BOOL v36 = v4;
  id v23 = v6;
  id v24 = v15;
  id v25 = v22;
  [v25 loadRenderEffectInBackgroundWithCompletionOnMainQueue:v29];

LABEL_13:
}

uint64_t __64__CFXCaptureViewController_addEffect_allowImmediateTextEditing___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 64);
  uint64_t v3 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int64_t v6 = +[JFXOrientationMonitor interfaceOrientation];
  long long v24 = *MEMORY[0x263F010E0];
  long long v26 = *MEMORY[0x263F010E0];
  uint64_t v7 = *(void *)(MEMORY[0x263F010E0] + 16);
  uint64_t v27 = v7;
  +[JFXEffectEditingUtilities nextNormalizedInsertionPointForOverlay:v4 scaleRelativeToCenterSquare:&v26 atTime:v3 applyTracking:v5 withARMetadata:0 transformAnimation:1 playableMediaContentMode:v2 playableInterfaceOrientation:v6];
  double v9 = v8;
  double v11 = v10;
  double v12 = *(double *)(a1 + 64);
  int v13 = *(unsigned __int8 *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void **)(a1 + 48);
  if (v16) {
    [v16 overlayTransformForLocalViewfinder];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  int64_t v17 = +[JFXOrientationMonitor interfaceOrientation];
  char v18 = +[CFXMediaSettings sharedInstance];
  [v18 frameSize];
  unint64_t v21 = aspectRatioForSize(v19, v20);
  long long v26 = v24;
  uint64_t v27 = v7;
  LODWORD(v23) = 1;
  +[JFXEffectEditingUtilities configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v14, &v26, 1, 1, v13 != 0, 0, v9, v11, v12, 0.0, v15, v25, 0, v23,
    v17,
    v21,
    0);

  return objc_msgSend(*(id *)(a1 + 48), "CFX_addEffect:allowImmediateTextEditing:", *(void *)(a1 + 56), *(unsigned __int8 *)(a1 + 73));
}

uint64_t __64__CFXCaptureViewController_addEffect_allowImmediateTextEditing___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_addEffect:allowImmediateTextEditing:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)addOverlayEffect:(id)a3 atNormalizedPlanePoint:(CGPoint)a4 scale:(double)a5 rotationAngle:(double)a6
{
  CGFloat y = a4.y;
  CGFloat x = a4.x;
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v11 = a3;
  double v12 = JFXLog_effects();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = [v11 jtEffect];
    uint64_t v14 = NSStringFromJFXEffectType([v13 type]);
    uint64_t v15 = [v11 localizedTitle];
    v46.CGFloat x = x;
    v46.CGFloat y = y;
    uint64_t v16 = NSStringFromCGPoint(v46);
    *(_DWORD *)CGAffineTransform buf = 138544386;
    BOOL v36 = v14;
    __int16 v37 = 2114;
    double v38 = v15;
    __int16 v39 = 2114;
    double v40 = v16;
    __int16 v41 = 2048;
    double v42 = a5;
    __int16 v43 = 2048;
    double v44 = a6;
    _os_log_impl(&dword_234C41000, v12, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, point: %{public}@, scale: %f, rotationAngle: %f", buf, 0x34u);
  }
  if ([(CFXCaptureViewController *)self CFX_canApplyFaceTracking])
  {
    int64_t v17 = +[JFXVideoCameraController sharedInstance];
    char v18 = [v17 mostRecentARMetadata];

    id v19 = [v18 faceAnchor];
    BOOL v20 = v19 != 0;

    if (v19) {
      id v19 = v18;
    }
  }
  else
  {
    id v19 = 0;
    BOOL v20 = 0;
  }
  unint64_t v21 = [v11 jtEffect];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __88__CFXCaptureViewController_addOverlayEffect_atNormalizedPlanePoint_scale_rotationAngle___block_invoke;
  _OWORD v25[3] = &unk_264C0C9F0;
  CGFloat v30 = x;
  CGFloat v31 = y;
  double v32 = a5;
  double v33 = a6;
  BOOL v34 = v20;
  id v26 = v21;
  id v27 = v19;
  BOOL v28 = self;
  id v29 = v11;
  id v22 = v11;
  id v23 = v19;
  id v24 = v21;
  [v24 loadRenderEffectInBackgroundWithCompletionOnMainQueue:v25];
}

uint64_t __88__CFXCaptureViewController_addOverlayEffect_atNormalizedPlanePoint_scale_rotationAngle___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 80);
  double v3 = *(double *)(a1 + 88);
  int v4 = *(unsigned __int8 *)(a1 + 96);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void **)(a1 + 48);
  if (v7) {
    [v7 overlayTransformForLocalViewfinder];
  }
  else {
    memset(v19, 0, sizeof(v19));
  }
  int64_t v8 = +[JFXOrientationMonitor interfaceOrientation];
  double v9 = +[CFXMediaSettings sharedInstance];
  [v9 frameSize];
  unint64_t v12 = aspectRatioForSize(v10, v11);
  double v13 = *(double *)(a1 + 64);
  double v14 = *(double *)(a1 + 72);
  long long v17 = *MEMORY[0x263F010E0];
  uint64_t v18 = *(void *)(MEMORY[0x263F010E0] + 16);
  LODWORD(v16) = 1;
  +[JFXEffectEditingUtilities configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "configureOverlayForInsertion:atNormalizedPoint:atTime:isPositionRelativeToCenterSquare:isPositionRelativeToFace:scaleRelativeToCenterSquare:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v5, &v17, 0, 0, v4 != 0, 0, v13, v14, v2, v3, v6, v19, 0, v16,
    v8,
    v12,
    0);

  return objc_msgSend(*(id *)(a1 + 48), "CFX_addEffect:allowImmediateTextEditing:", *(void *)(a1 + 56), 1);
}

- (void)addOverlayEffect:(id)a3 atScreenLocation:(CGPoint)a4 atScreenSize:(CGSize)a5 rotationAngle:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  double y = a4.y;
  double x = a4.x;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v12 = a3;
  double v13 = JFXLog_effects();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = [v12 jtEffect];
    uint64_t v15 = NSStringFromJFXEffectType([v14 type]);
    uint64_t v16 = [v12 localizedTitle];
    v74.double x = x;
    v74.double y = y;
    long long v17 = NSStringFromCGPoint(v74);
    v75.double width = width;
    v75.double height = height;
    uint64_t v18 = NSStringFromCGSize(v75);
    *(_DWORD *)CGAffineTransform buf = 138544386;
    CGAffineTransform v64 = v15;
    __int16 v65 = 2114;
    double v66 = v16;
    __int16 v67 = 2114;
    CGFloat v68 = v17;
    __int16 v69 = 2114;
    double v70 = v18;
    __int16 v71 = 2048;
    double v72 = a6;
    _os_log_impl(&dword_234C41000, v13, OS_LOG_TYPE_DEFAULT, "Adding effect - type: %{public}@, name: %{public}@, screenLocation: %{public}@, screenSize: %{public}@, rotationAngle: %f", buf, 0x34u);
  }
  id v19 = [v12 jtEffect];
  int v20 = [v19 type];

  if (v20 == 2)
  {
    double v51 = a6;
    unint64_t v21 = [(CFXCaptureViewController *)self cameraViewController];
    id v22 = [v21 uncroppedCameraViewfinderPlaceholderView];

    [v22 frame];
    double v24 = v23;
    double v26 = v25;
    +[JFXMediaSettings renderSize];
    double v28 = v27;
    double v30 = v29;
    objc_msgSend(v22, "convertPoint:fromView:", 0, x, y);
    double v33 = CGPointConvertToCoordinateSpace(2uLL, 0, v31, v32, v24, v26, v28, v30);
    objc_msgSend(v22, "convertSize:fromView:", 0, width, height);
    double v36 = CGRectMakeWithSizeAndCenterPoint(v28 * (v34 / v24), v30 * (v35 / v26), v33);
    uint64_t v38 = v37;
    uint64_t v40 = v39;
    uint64_t v42 = v41;
    __int16 v43 = [v12 jtEffect];
    if ([(CFXCaptureViewController *)self CFX_canApplyFaceTracking])
    {
      double v44 = +[JFXVideoCameraController sharedInstance];
      uint64_t v45 = [v44 mostRecentARMetadata];

      id v46 = [v45 faceAnchor];
      BOOL v47 = v46 != 0;

      double v48 = v51;
      if (v46) {
        id v46 = v45;
      }
    }
    else
    {
      BOOL v47 = 0;
      id v46 = 0;
      double v48 = v51;
    }
    v52[0] = MEMORY[0x263EF8330];
    v52[1] = 3221225472;
    v52[2] = __89__CFXCaptureViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle___block_invoke;
    v52[3] = &unk_264C0CA18;
    double v57 = v36;
    uint64_t v58 = v38;
    uint64_t v59 = v40;
    uint64_t v60 = v42;
    double v61 = v48;
    BOOL v62 = v47;
    id v53 = v43;
    id v54 = v46;
    double v55 = self;
    id v56 = v12;
    id v49 = v46;
    id v50 = v43;
    [v50 loadRenderEffectInBackgroundWithCompletionOnMainQueue:v52];
  }
}

uint64_t __89__CFXCaptureViewController_addOverlayEffect_atScreenLocation_atScreenSize_rotationAngle___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 96);
  int v3 = *(unsigned __int8 *)(a1 + 104);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v6 = *(void **)(a1 + 48);
  if (v6) {
    [v6 overlayTransformForLocalViewfinder];
  }
  else {
    memset(v20, 0, sizeof(v20));
  }
  int64_t v7 = +[JFXOrientationMonitor interfaceOrientation];
  int64_t v8 = +[CFXMediaSettings sharedInstance];
  [v8 frameSize];
  unint64_t v11 = aspectRatioForSize(v9, v10);
  double v12 = *(double *)(a1 + 64);
  double v13 = *(double *)(a1 + 72);
  double v14 = *(double *)(a1 + 80);
  double v15 = *(double *)(a1 + 88);
  long long v18 = *MEMORY[0x263F010E0];
  uint64_t v19 = *(void *)(MEMORY[0x263F010E0] + 16);
  LODWORD(v17) = 1;
  +[JFXEffectEditingUtilities configureOverlayForInsertion:inRect:atTime:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "configureOverlayForInsertion:inRect:atTime:rotationAngle:applyTracking:autoDetectTrackingType:withARMetadata:previewViewCorrectionTransform:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", v5, &v18, v3 != 0, 1, v4, v20, v12, v13, v14, v15, v2, 0, v17, v7, v11,
    0);

  return objc_msgSend(*(id *)(a1 + 48), "CFX_addEffect:allowImmediateTextEditing:", *(void *)(a1 + 56), 1);
}

- (void)removeAllEffectsOfType:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a3;
  int64_t v7 = JFXLog_effects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v8 = [v6 identifier];
    *(_DWORD *)CGAffineTransform buf = 138543618;
    double v13 = v8;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "Removing effects - type: %{public}@, animated: %d", buf, 0x12u);
  }
  [(CFXCaptureViewController *)self removeEffectEditorAnimated:v4];
  double v9 = [v6 identifier];

  if (v9 == @"Animoji") {
    [(CFXCaptureViewController *)self removeAnimojiTrackingReticle];
  }
  double v10 = [(CFXCaptureViewController *)self cameraViewController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __60__CFXCaptureViewController_removeAllEffectsOfType_animated___block_invoke;
  v11[3] = &unk_264C09FA8;
  v11[4] = self;
  [v10 removeAllEffectsOfType:v6 completion:v11];
}

void __60__CFXCaptureViewController_removeAllEffectsOfType_animated___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v2 = *(void **)(a1 + 32);
  int v3 = [v2 composition];
  [v2 effectCompositionDidChange:v3];

  BOOL v4 = CFXLog_action();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) composition];
    id v6 = [v5 jtEffects];
    int64_t v7 = +[CFXActionLogging actionLogAsJSONForEvent:@"effects removed" atLocation:@"live" withEffectStack:v6];
    int v8 = 138543362;
    double v9 = v7;
    _os_log_impl(&dword_234C41000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)removeAllEffectsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = JFXLog_effects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CGAffineTransform buf = 67109120;
    BOOL v9 = v3;
    _os_log_impl(&dword_234C41000, v5, OS_LOG_TYPE_DEFAULT, "Removing all effects - animated: %d", buf, 8u);
  }

  [(CFXCaptureViewController *)self removeAnimojiTrackingReticle];
  [(CFXCaptureViewController *)self removeEffectEditorAnimated:v3];
  id v6 = [(CFXCaptureViewController *)self cameraViewController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__CFXCaptureViewController_removeAllEffectsAnimated___block_invoke;
  v7[3] = &unk_264C09FA8;
  v7[4] = self;
  [v6 removeAllEffects:v7];
}

void __53__CFXCaptureViewController_removeAllEffectsAnimated___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 composition];
  [v2 effectCompositionDidChange:v3];

  BOOL v4 = CFXLog_action();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) composition];
    id v6 = [v5 jtEffects];
    int64_t v7 = +[CFXActionLogging actionLogAsJSONForEvent:@"effects removed" atLocation:@"live" withEffectStack:v6];
    int v8 = 138543362;
    BOOL v9 = v7;
    _os_log_impl(&dword_234C41000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)removeEffectsForCameraSwitch
{
  BOOL v3 = JFXLog_effects();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CGAffineTransform buf = 0;
    _os_log_impl(&dword_234C41000, v3, OS_LOG_TYPE_DEFAULT, "Removing face-tracked effects", buf, 2u);
  }

  BOOL v4 = +[CFXEffectType effectTypeWithIdentifier:@"Animoji"];
  [(CFXCaptureViewController *)self removeAllEffectsOfType:v4 animated:1];

  uint64_t v5 = [(CFXCaptureViewController *)self composition];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __56__CFXCaptureViewController_removeEffectsForCameraSwitch__block_invoke;
  v6[3] = &unk_264C09FA8;
  v6[4] = self;
  [v5 removeAllOverlayEffects:v6];
}

void __56__CFXCaptureViewController_removeEffectsForCameraSwitch__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  double v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 composition];
  [v2 effectCompositionDidChange:v3];

  BOOL v4 = CFXLog_action();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) composition];
    id v6 = [v5 jtEffects];
    int64_t v7 = +[CFXActionLogging actionLogAsJSONForEvent:@"effects removed" atLocation:@"live" withEffectStack:v6];
    int v8 = 138543362;
    BOOL v9 = v7;
    _os_log_impl(&dword_234C41000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (id)liveCaptureSnapshot
{
  BOOL v3 = [(CFXCaptureViewController *)self liveCaptureContainer];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = [(CFXCaptureViewController *)self liveCaptureContainerContainer];
  double v13 = objc_msgSend(v12, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v5, v7, v9, v11, *MEMORY[0x263F1D1C0], *(double *)(MEMORY[0x263F1D1C0] + 8), *(double *)(MEMORY[0x263F1D1C0] + 16), *(double *)(MEMORY[0x263F1D1C0] + 24));

  return v13;
}

- (void)showLiveCaptureSnapshotBlurred:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  double v9 = [(CFXCaptureViewController *)self liveCaptureContainerSnapshot];

  if (!v9)
  {
    int64_t v10 = +[JFXOrientationMonitor interfaceOrientation];
    id v11 = objc_alloc(MEMORY[0x263F307D0]);
    double v12 = [(CFXCaptureViewController *)self liveCaptureContainer];
    double v13 = [(CFXCaptureViewController *)self liveCaptureContainer];
    [v13 frame];
    double v15 = v14;
    uint64_t v16 = [(CFXCaptureViewController *)self liveCaptureContainer];
    [v16 frame];
    long long v18 = (void *)[v11 initWithView:v12 desiredAspectRatio:(uint64_t)(v15 / v17)];
    [(CFXCaptureViewController *)self setLiveCaptureContainerSnapshot:v18];

    uint64_t v19 = [(CFXCaptureViewController *)self liveCaptureContainer];
    [v19 origin];
    double v21 = v20;
    double v23 = v22;
    double v24 = [(CFXCaptureViewController *)self liveCaptureContainer];
    [v24 bounds];
    double Width = CGRectGetWidth(v38);
    double v26 = [(CFXCaptureViewController *)self liveCaptureContainer];
    [v26 bounds];
    double Height = CGRectGetHeight(v39);
    double v28 = [(CFXCaptureViewController *)self liveCaptureContainerSnapshot];
    double v29 = v28;
    double v30 = -v21;
    double v31 = -v23;
    if (v10 == 1) {
      double v30 = 0.0;
    }
    else {
      double v31 = 0.0;
    }
    objc_msgSend(v28, "setFrame:", v30, v31, Width, Height);

    double v32 = [(CFXCaptureViewController *)self liveCaptureContainer];
    double v33 = [(CFXCaptureViewController *)self liveCaptureContainerSnapshot];
    [v32 addSubview:v33];
  }
  double v34 = [(CFXCaptureViewController *)self liveCaptureContainerSnapshot];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __79__CFXCaptureViewController_showLiveCaptureSnapshotBlurred_animated_completion___block_invoke;
  v36[3] = &unk_264C0B058;
  id v37 = v8;
  id v35 = v8;
  [v34 setBlurred:v6 animated:v5 style:0 withCompletionBlock:v36];
}

void __79__CFXCaptureViewController_showLiveCaptureSnapshotBlurred_animated_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    dispatch_async(MEMORY[0x263EF83A0], *(dispatch_block_t *)(a1 + 32));
  }
}

- (void)saveLiveCaptureSnapshotForReview
{
  BOOL v3 = [(CFXCaptureViewController *)self liveCaptureContainerSnapshot];

  if (v3)
  {
    id v4 = [(CFXCaptureViewController *)self liveCaptureContainerSnapshot];
    +[CFXPreviewViewController setLiveCaptureSnapshotView:v4];
  }
}

- (void)removeLiveCaptureSnapshot
{
  BOOL v3 = [(CFXCaptureViewController *)self liveCaptureContainerSnapshot];

  if (v3)
  {
    id v4 = [(CFXCaptureViewController *)self liveCaptureContainerSnapshot];
    [v4 removeFromSuperview];

    [(CFXCaptureViewController *)self setLiveCaptureContainerSnapshot:0];
  }
}

- (void)setLiveCapturePresentationFrame:(CGRect)a3 withContentRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  uint64_t v46 = *MEMORY[0x263EF8340];
  int64_t v13 = +[JFXOrientationMonitor interfaceOrientation];
  double v14 = [(CFXCaptureViewController *)self view];
  v34.origin.double x = v11;
  v34.origin.double y = v10;
  v34.size.double width = v9;
  v34.size.double height = v8;
  objc_msgSend(v14, "convertRect:fromView:", 0, v11, v10, v9, v8);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;

  CGFloat v39 = 1.0 - width;
  v47.origin.double x = v16;
  v47.origin.double y = v18;
  v47.size.double width = v20;
  v47.size.double height = v22;
  CGFloat v35 = width;
  CGFloat v37 = CGRectGetWidth(v47) / width;
  v48.origin.double x = v16;
  v48.origin.double y = v18;
  v48.size.double width = v20;
  v48.size.double height = v22;
  CGFloat v36 = height;
  double v41 = v16 - v37 * x;
  rect.origin.double x = x;
  CGFloat v40 = CGRectGetHeight(v48) / height;
  v49.origin.double x = v16;
  v49.origin.double y = v18;
  v49.size.double width = v20;
  v49.size.double height = v22;
  double v23 = CGRectGetWidth(v49);
  v50.origin.double x = x;
  v50.origin.double y = y;
  CGFloat v24 = 1.0 - height;
  v50.size.double width = v39;
  v50.size.double height = v24;
  double v25 = v23 + v37 * CGRectGetWidth(v50);
  v51.origin.double x = v16;
  v51.origin.double y = v18;
  v51.size.double width = v20;
  v51.size.double height = v22;
  double v38 = CGRectGetHeight(v51);
  v52.origin.double x = x;
  CGFloat v33 = y;
  v52.origin.double y = y;
  v52.size.double width = v39;
  v52.size.double height = v24;
  double v26 = v18 - v40 * y;
  double v27 = v38 + v40 * CGRectGetHeight(v52);
  -[CFXCaptureViewController setExternalUncroppedPresentationRect:](self, "setExternalUncroppedPresentationRect:", v41, v26, v25, v27);
  -[CFXCaptureViewController setPresentationRect:](self, "setPresentationRect:", v16, v18, v20, v22);
  double v28 = JFXLog_viewerUI();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    switch(v13)
    {
      case 1:
        double v29 = @"UIInterfaceOrientationPortrait";
        break;
      case 3:
        double v29 = @"UIInterfaceOrientationLandscapeRight";
        break;
      case 4:
        double v29 = @"UIInterfaceOrientationLandscapeLeft";
        break;
      case 2:
        double v29 = @"UIInterfaceOrientationPortraitUpsideDown";
        break;
      default:
        double v29 = 0;
        break;
    }
    double v30 = NSStringFromCGRect(v34);
    v53.origin.double x = rect.origin.x;
    v53.origin.double y = v33;
    v53.size.double width = v35;
    v53.size.double height = v36;
    double v31 = NSStringFromCGRect(v53);
    v54.origin.double x = v41;
    v54.origin.double y = v26;
    v54.size.double width = v25;
    v54.size.double height = v27;
    double v32 = NSStringFromCGRect(v54);
    LODWORD(rect.origin.y) = 138413058;
    *(void *)((char *)&rect.origin.y + 4) = v29;
    WORD2(rect.size.width) = 2112;
    *(void *)((char *)&rect.size.width + 6) = v30;
    HIWORD(rect.size.height) = 2112;
    __int16 v43 = v31;
    __int16 v44 = 2112;
    uint64_t v45 = v32;
    _os_log_impl(&dword_234C41000, v28, OS_LOG_TYPE_DEFAULT, "New presentation rect specified - orientation: %@, presentationRect: %@, contentsRect: %@, uncroppedPresentationRect: %@", (uint8_t *)&rect.origin.y, 0x2Au);
  }
  [(CFXCaptureViewController *)self setCaptureContainerUncroppedFrameWasCalculatedWithContentRect:1];
  [(CFXCaptureViewController *)self CFX_applyAutoRotationCorrectionToEditorViews];
}

- (void)updateUIForDockMagnify:(BOOL)a3 dockHeightDelta:(double)a4
{
  [(CFXCaptureViewController *)self setDockIsMagnified:a3];
  [(CFXCaptureViewController *)self setDockMagnifiedHeightDelta:a4];
  [(CFXCaptureViewController *)self configureUIForOrientation];
}

- (void)updateUIForDevicePosition:(int64_t)a3
{
  if (a3 == 2)
  {
    if ([(CFXCaptureViewController *)self captureMode] != 2)
    {
      BOOL v5 = [MEMORY[0x263F30780] capabilities];
      int v6 = [v5 isFrontFlashSupported];
      goto LABEL_7;
    }
LABEL_5:
    uint64_t v7 = 1;
    goto LABEL_8;
  }
  if (a3 != 1) {
    goto LABEL_5;
  }
  BOOL v5 = [MEMORY[0x263F30780] capabilities];
  int v6 = [v5 isBackFlashSupported];
LABEL_7:
  uint64_t v7 = v6 ^ 1u;

LABEL_8:
  double v8 = [(CFXCaptureViewController *)self flashButton];
  [v8 setHidden:v7];

  double v9 = [(CFXCaptureViewController *)self controlStatusBar];
  double v10 = [v9 flashIndicator];
  [v10 setHidden:v7];

  if (!isStreamingMode([(CFXCaptureViewController *)self captureMode])) {
    [(CFXCaptureViewController *)self configureZoomControl];
  }
  double v11 = +[CFXAnalyticsManager sharedInstance];
  [v11 stopTrackingTimeIntervalEventWithName:@"activefrontcameratime"];

  double v12 = +[CFXAnalyticsManager sharedInstance];
  [v12 stopTrackingTimeIntervalEventWithName:@"activebackcameratime"];

  if (a3)
  {
    if (a3 == 1)
    {
      int64_t v13 = +[CFXAnalyticsManager sharedInstance];
      id v15 = v13;
      double v14 = @"activebackcameratime";
    }
    else
    {
      if (a3 != 2) {
        return;
      }
      int64_t v13 = +[CFXAnalyticsManager sharedInstance];
      id v15 = v13;
      double v14 = @"activefrontcameratime";
    }
  }
  else
  {
    int64_t v13 = +[CFXAnalyticsManager sharedInstance];
    id v15 = v13;
    double v14 = @"activeexternalcameratime";
  }
  [v13 startTrackingTimeIntervalEventWithName:v14];
}

- (CFXEffectBrowserContentPresenterViewController)effectBrowserContentPresenterViewController
{
  BOOL v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 1
    && !self->_effectBrowserContentPresenterViewController
    && [(CFXCaptureViewController *)self captureMode] != 1)
  {
    BOOL v5 = (CFXEffectBrowserContentPresenterViewController *)objc_opt_new();
    effectBrowserContentPresenterViewController = self->_effectBrowserContentPresenterViewController;
    self->_effectBrowserContentPresenterViewController = v5;
  }
  uint64_t v7 = self->_effectBrowserContentPresenterViewController;
  return v7;
}

- (void)configureWithControlsViewController:(id)a3
{
  uint64_t v4 = [(CFXCaptureViewController *)self cameraViewController];
  [v4 setDelegate:self];

  int64_t v5 = [(CFXCaptureViewController *)self captureMode];
  id v6 = [(CFXCaptureViewController *)self cameraViewController];
  [v6 setCaptureMode:v5];
}

- (void)setLiveCaptureViewController:(id)a3
{
  [(CFXCaptureViewController *)self setCameraViewController:a3];
  uint64_t v4 = [(CFXCaptureViewController *)self cameraViewController];
  [v4 setDelegate:self];

  if (+[JFXAnimojiEffectRenderer isSupported])
  {
    int64_t v5 = [(CFXCaptureViewController *)self cameraViewController];
    [v5 setTrackingLossDelegate:self];
  }
  int64_t v6 = [(CFXCaptureViewController *)self captureMode];
  id v7 = [(CFXCaptureViewController *)self cameraViewController];
  [v7 setCaptureMode:v6];
}

- (void)resign
{
}

- (void)updateZoomUIVisibility
{
  uint64_t v3 = [(CFXCaptureViewController *)self CFX_isZoomAllowed] ^ 1;
  uint64_t v4 = [(CFXCaptureViewController *)self zoomSlider];
  [v4 setHidden:v3];

  id v5 = [(CFXCaptureViewController *)self zoomControl];
  [v5 setHidden:v3];
}

- (void)updateZoomUIForCapturing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if ([(CFXCaptureViewController *)self captureMode] == 2)
  {
    if (v4) {
      uint64_t v6 = 3;
    }
    else {
      uint64_t v6 = 0;
    }
    id v7 = [(CFXCaptureViewController *)self zoomControl];
    [v7 setShouldShowZoomDial:0 animationDuration:v6];
  }
  if (v4)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __62__CFXCaptureViewController_updateZoomUIForCapturing_animated___block_invoke;
    v8[3] = &unk_264C09FA8;
    void v8[4] = self;
    +[JTAnimation performAnimation:v8 duration:0 completion:0.3];
  }
}

uint64_t __62__CFXCaptureViewController_updateZoomUIForCapturing_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutZoomUI];
}

- (void)configureZoomControl
{
  uint64_t v3 = [(CFXCaptureViewController *)self zoomControl];
  uint64_t v37 = 0;
  unint64_t v38 = 0;
  uint64_t v36 = 0;
  [(CFXCaptureViewController *)self CFX_getCaptureDevice:&v38 captureDevicePosition:&v37 captureMode:&v36];
  BOOL v4 = [MEMORY[0x263F30780] capabilities];
  uint64_t v5 = v37;
  uint64_t v6 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  BOOL v8 = [(CFXCaptureViewController *)self CFX_isZoomAllowed];
  if (v7 == 1 && v5 == 1) {
    int v10 = 0;
  }
  else {
    int v10 = [v4 shouldAllowCameraToggleForMode:v36 devicePosition:v37 videoConfiguration:0];
  }
  BOOL v11 = v38 <= 7 && v38 == 7;
  BOOL v12 = v38 <= 7 && v38 == 6;
  BOOL v13 = v38 <= 7 && v38 == 4;
  double v14 = +[JFXVideoCameraController sharedInstance];
  [v14 zoomFactor];
  double v16 = v15;

  if (v8)
  {
    [v4 maximumZoomFactorForMode:v36 device:v38 videoConfiguration:0];
    double v18 = v17;
    [MEMORY[0x263F307F0] zoomControlDisplayValueForZoomFactor:v36 mode:v38 device:0 videoConfiguration:1.0];
    double v20 = v19;
    [MEMORY[0x263F307F0] zoomControlDisplayValueForZoomFactor:v36 mode:v38 device:0 videoConfiguration:v18];
    double v22 = v21;
    if (v11)
    {
      [v4 tripleCameraSwitchOverZoomFactorsForDevicePosition:v37];
      double v24 = v23;
      double v26 = v25;
      objc_msgSend(MEMORY[0x263F307F0], "zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:", v36, v38, 0);
      double v28 = v27;
      [MEMORY[0x263F307F0] zoomControlDisplayValueForZoomFactor:v36 mode:v38 device:0 videoConfiguration:v26];
      [v3 configureForTripleDeviceWithZoomFactor:v16 minimumZoomFactor:1.0 displayMinimumZoomFactor:v20 maximumZoomFactor:v18 displayMaximumZoomFactor:v22 switchOverZoomFactor1:v24 displaySwitchOverZoomFactor1:v28 switchOverZoomFactor2:v26 displaySwitchOverZoomFactor2:v29];
    }
    else if (v12 || v13)
    {
      if (v12) {
        [v4 wideDualCameraSwitchOverZoomFactorForDevicePosition:v37];
      }
      else {
        [v4 dualCameraSwitchOverZoomFactorForDevicePosition:v37];
      }
      double v32 = v31;
      objc_msgSend(MEMORY[0x263F307F0], "zoomControlDisplayValueForZoomFactor:mode:device:videoConfiguration:", v36, v38, 0);
      [v3 configureForDualDeviceWithZoomFactor:v16 minimumZoomFactor:1.0 displayMinimumZoomFactor:v20 maximumZoomFactor:v18 displayMaximumZoomFactor:v22 dualCameraSwitchOverZoomFactor:v32 displayDualCameraSwitchOverZoomFactor:v33];
    }
    else if (v5 == 1)
    {
      [v3 configureForZoomSymbolToggle];
      [v3 setZoomButtonSymbol:1 animated:0];
    }
    else
    {
      [v3 configureForSingleCameraPlusToggleWithZoomFactor:v16 minimumZoomFactor:1.0 displayMinimumZoomFactor:v20 maximumZoomFactor:v18 displayMaximumZoomFactor:v21];
    }
  }
  else if (v10)
  {
    switch(v38)
    {
      case 3uLL:
        double v30 = 2.0;
        break;
      case 4uLL:
        BOOL v34 = v36 == 6;
        double v35 = 1.0;
        double v30 = 2.0;
        goto LABEL_34;
      case 5uLL:
        double v30 = 0.5;
        break;
      case 6uLL:
        BOOL v34 = v36 == 6;
        double v35 = 0.5;
        double v30 = 1.0;
LABEL_34:
        if (!v34) {
          double v30 = v35;
        }
        break;
      default:
        double v30 = 1.0;
        break;
    }
    [v3 configureForToggleOnlyWithZoomFactor:1.0 displayZoomFactor:v30];
  }
}

- (BOOL)CFX_isZoomAllowed
{
  if (isStreamingMode([(CFXCaptureViewController *)self captureMode])) {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  [(CFXCaptureViewController *)self CFX_getCaptureDevice:&v12 captureDevicePosition:&v11 captureMode:&v10];
  uint64_t v3 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];
  uint64_t v5 = v11;

  if (v4 == 1 && v5 == 1) {
    return 0;
  }
  uint64_t v7 = [MEMORY[0x263F30780] capabilities];
  char v8 = [v7 isZoomAllowedForMode:v10 device:v12 videoConfiguration:0];

  return v8;
}

- (void)CFX_getCaptureDevice:(int64_t *)a3 captureDevicePosition:(int64_t *)a4 captureMode:(int64_t *)a5
{
  double v9 = +[JFXVideoCameraController sharedInstance];
  uint64_t v10 = [v9 cameraPosition];

  uint64_t v11 = +[JFXVideoCameraController sharedInstance];
  id v12 = [v11 cameraType];

  [(CFXCaptureViewController *)self CFX_getCAMCaptureForPosition:v10 type:v12 captureDevice:a3 captureDevicePosition:a4 captureMode:a5];
}

- (void)CFX_getCAMCaptureForPosition:(int64_t)a3 type:(id)a4 captureDevice:(int64_t *)a5 captureDevicePosition:(int64_t *)a6 captureMode:(int64_t *)a7
{
  id v17 = a4;
  if (CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__onceToken != -1) {
    dispatch_once(&CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__onceToken, &__block_literal_global_55);
  }
  int64_t v12 = a3 == 2;
  BOOL v13 = &CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__frontCameraLookup;
  if (a3 != 2) {
    BOOL v13 = &CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__backCameraLookup;
  }
  id v14 = (id)*v13;
  double v15 = [v14 objectForKeyedSubscript:v17];
  int64_t v16 = [v15 integerValue];

  *a5 = v16;
  *a6 = v12;
  *a7 = [(CFXCaptureViewController *)self captureMode] != 0;
}

void __110__CFXCaptureViewController_CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode___block_invoke()
{
  v11[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263EF9670];
  v10[0] = *MEMORY[0x263EF9658];
  v10[1] = v0;
  v11[0] = &unk_26E801B30;
  v11[1] = &unk_26E801B48;
  uint64_t v1 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  double v2 = (void *)CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__frontCameraLookup;
  CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__frontCameraLookup = v1;

  uint64_t v3 = *MEMORY[0x263EF9628];
  v8[0] = *MEMORY[0x263EF9648];
  v8[1] = v3;
  v9[0] = &unk_26E801B60;
  v9[1] = &unk_26E801B78;
  uint64_t v4 = *MEMORY[0x263EF9660];
  v8[2] = *MEMORY[0x263EF9620];
  v8[3] = v4;
  v9[2] = &unk_26E801B90;
  v9[3] = &unk_26E801BA8;
  uint64_t v5 = *MEMORY[0x263EF9638];
  void v8[4] = v0;
  void v8[5] = v5;
  v9[4] = &unk_26E801BC0;
  v9[5] = &unk_26E801BD8;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:6];
  uint64_t v7 = (void *)CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__backCameraLookup;
  CFX_getCAMCaptureForPosition_type_captureDevice_captureDevicePosition_captureMode__backCameraLookup = v6;
}

- (void)layoutZoomControlRelativeToBottomBarAndPreview:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CFXCaptureViewController *)self delegate];
  id v11 = [v5 cameraControlsViewControllerForCaptureViewController:self];

  uint64_t v6 = (void *)MEMORY[0x263F307F0];
  uint64_t v7 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v8 = objc_msgSend(v7, "cam_initialLayoutStyle");
  double v9 = [v11 bottomBar];
  uint64_t v10 = [(CFXCaptureViewController *)self liveCaptureContainer];
  [v6 layoutZoomControl:v4 forLayoutStyle:v8 bottomBar:v9 previewView:v10];
}

- (void)layoutZoomSliderRelativeToBottomBarAndPreview
{
  uint64_t v3 = [(CFXCaptureViewController *)self delegate];
  id v99 = [v3 cameraControlsViewControllerForCaptureViewController:self];

  id v4 = [v99 bottomBar];
  uint64_t v5 = [(CFXCaptureViewController *)self zoomSlider];
  uint64_t v6 = [v5 superview];

  uint64_t v7 = [v4 backgroundStyle];
  [v4 layoutIfNeeded];
  uint64_t v8 = [v4 shutterButton];
  [v8 frame];
  objc_msgSend(v8, "alignmentRectForFrame:");
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  id v17 = [v8 superview];
  objc_msgSend(v17, "convertRect:toView:", v6, v10, v12, v14, v16);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    double v26 = [MEMORY[0x263F30780] capabilities];
    char v27 = [v26 zoomControlSupported];

    if ((v27 & 1) == 0)
    {
      double v28 = [(CFXCaptureViewController *)self dynamicShutterControl];
      uint64_t v29 = [v28 superview];
      double v30 = [(CFXCaptureViewController *)self dynamicShutterControl];
      [v30 frame];
      objc_msgSend(v29, "convertRect:toView:", v6);
      double v19 = v31;
      double v21 = v32;
      double v23 = v33;
      double v25 = v34;
    }
  }
  [v4 bounds];
  objc_msgSend(v4, "convertRect:toView:", v6);
  double v36 = v35;
  uint64_t v38 = v37;
  uint64_t v40 = v39;
  uint64_t v42 = v41;
  __int16 v43 = [MEMORY[0x263F1C5C0] currentDevice];
  double v90 = v25;
  if (![v43 userInterfaceIdiom])
  {
    CGRect v47 = [MEMORY[0x263F1C920] mainScreen];
    [v47 bounds];
    double v44 = v23;
    double v45 = v21;
    double v46 = v19;
    if ((uint64_t)v48 == 568)
    {
    }
    else
    {
      CGRect v49 = [MEMORY[0x263F1C920] mainScreen];
      [v49 bounds];
      uint64_t v51 = (uint64_t)v50;

      if (v51 != 568) {
        goto LABEL_10;
      }
    }
    double v36 = 0.0;
    *(double *)&uint64_t v42 = 141.0;
    *(double *)&uint64_t v40 = 320.0;
    *(double *)&uint64_t v38 = 427.0;
    goto LABEL_10;
  }
  double v44 = v23;
  double v45 = v21;
  double v46 = v19;

LABEL_10:
  double v95 = *(double *)&v38;
  double v96 = *(double *)&v40;
  double v97 = *(double *)&v42;
  double v98 = v36;
  CGRect v52 = [(CFXCaptureViewController *)self liveCaptureContainer];
  CGRect v53 = [(CFXCaptureViewController *)self liveCaptureContainer];
  [v53 bounds];
  objc_msgSend(v52, "convertRect:toView:", v6);
  uint64_t v93 = v55;
  uint64_t v94 = v54;
  uint64_t v91 = v57;
  uint64_t v92 = v56;

  uint64_t v58 = [(CFXCaptureViewController *)self view];
  [v58 bounds];
  CGFloat v60 = v59;
  CGFloat v62 = v61;
  CGFloat v64 = v63;
  CGFloat v66 = v65;

  v101.origin.double x = v60;
  v101.origin.double y = v62;
  v101.size.double width = v64;
  v101.size.double height = v66;
  double Width = CGRectGetWidth(v101);
  v102.origin.double x = v60;
  v102.origin.double y = v62;
  v102.size.double width = v64;
  v102.size.double height = v66;
  if (Width > CGRectGetHeight(v102))
  {
    CGFloat v68 = [MEMORY[0x263F1C5C0] currentDevice];
    uint64_t v69 = [v68 userInterfaceIdiom];

    if (!v69)
    {
      v103.origin.double x = v60;
      v103.origin.double y = v62;
      v103.size.double width = v64;
      v103.size.double height = v66;
      CGFloat Height = CGRectGetHeight(v103);
      v104.origin.double x = v60;
      v104.origin.double y = v62;
      v104.size.double width = v64;
      v104.size.double height = v66;
      CGFloat v66 = CGRectGetWidth(v104);
      CGFloat v64 = Height;
    }
  }
  [v6 frame];
  double v71 = CGRectGetWidth(v105);
  [v6 frame];
  if (v71 <= CGRectGetHeight(v106)) {
    goto LABEL_16;
  }
  double v72 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v72 userInterfaceIdiom])
  {

LABEL_16:
    double v73 = v46;
    double v74 = v45;
    double v75 = v44;
    double v76 = v90;
    goto LABEL_17;
  }
  long long v80 = [MEMORY[0x263F1C5C0] currentDevice];
  double v73 = v46;
  if ([v80 userInterfaceIdiom])
  {

    double v74 = v45;
    double v75 = v44;
    double v76 = v90;
LABEL_22:
    [v4 frame];
    double v97 = v82;
    double v98 = v81;
    double v95 = v83;
    double v96 = v84;
    goto LABEL_17;
  }
  long long v85 = [MEMORY[0x263F1C920] mainScreen];
  [v85 bounds];
  double v74 = v45;
  double v75 = v44;
  double v76 = v90;
  if ((uint64_t)v86 == 568)
  {
  }
  else
  {
    long long v87 = [MEMORY[0x263F1C920] mainScreen];
    [v87 bounds];
    uint64_t v89 = (uint64_t)v88;

    if (v89 != 568) {
      goto LABEL_22;
    }
  }
LABEL_17:
  double v77 = (void *)MEMORY[0x263F30800];
  double v78 = [(CFXCaptureViewController *)self zoomSlider];
  int64_t v79 = [MEMORY[0x263F1C5C0] currentDevice];
  objc_msgSend(v77, "layoutZoomSlider:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:viewfinderViewAlignmentRect:", v78, objc_msgSend(v79, "cam_initialLayoutStyle"), v7 == 1, v98, v95, v96, v97, v73, v74, v75, v76, v94, v93, v92, v91, *(void *)&v60,
    *(void *)&v62,
    *(void *)&v64,
    *(void *)&v66);
}

- (void)layoutZoomControlForCTM
{
  uint64_t v3 = [(CFXCaptureViewController *)self zoomControl];
  id v39 = [v3 superview];

  id v4 = [(CFXCaptureViewController *)self delegate];
  uint64_t v5 = [v4 cameraControlsViewControllerForCaptureViewController:self];
  uint64_t v6 = [v5 bottomBar];

  [v6 bounds];
  objc_msgSend(v6, "convertRect:toView:", v39);
  double v37 = v8;
  double v38 = v7;
  double v35 = v10;
  double v36 = v9;
  double v11 = [(CFXCaptureViewController *)self dynamicShutterControl];
  double v12 = [v11 superview];
  double v13 = [(CFXCaptureViewController *)self dynamicShutterControl];
  [v13 frame];
  objc_msgSend(v12, "convertRect:toView:", v39);
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  double v22 = [(CFXCaptureViewController *)self liveCaptureContainer];
  double v23 = [(CFXCaptureViewController *)self liveCaptureContainer];
  [v23 bounds];
  objc_msgSend(v22, "convertRect:toView:", v39);
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;

  double v32 = (void *)MEMORY[0x263F307F0];
  double v33 = [(CFXCaptureViewController *)self zoomControl];
  double v34 = [MEMORY[0x263F1C5C0] currentDevice];
  objc_msgSend(v32, "layoutZoomControl:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:", v33, objc_msgSend(v34, "cam_initialLayoutStyle"), 0, v38, v37, v36, v35, v15, v17, v19, v21, v25, v27, v29, v31);
}

- (void)layoutZoomUI
{
  uint64_t v3 = [MEMORY[0x263F30780] capabilities];
  int v4 = [v3 isBackDualSupported];
  int v5 = [v3 zoomControlSupported];
  uint64_t v6 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (!v7)
  {
    double v14 = +[JFXOrientationMonitor keyWindow];
    [v14 bounds];

    +[JFXOrientationMonitor interfaceOrientation];
    int IsCTMSupported = CFXCaptureCapabilitiesIsCTMSupported();
    if ((v4 | IsCTMSupported) == 1)
    {
      int v16 = IsCTMSupported;
      [(CFXCaptureViewController *)self zoomControlFrame];
      v56.origin.double x = v17;
      v56.origin.double y = v18;
      v56.size.double width = v19;
      v56.size.double height = v20;
      if (CGRectEqualToRect(*MEMORY[0x263F001A8], v56))
      {
        if (v16)
        {
          if (v5) {
            [(CFXCaptureViewController *)self layoutZoomControlForCTM];
          }
          else {
            [(CFXCaptureViewController *)self layoutZoomSliderRelativeToBottomBarAndPreview];
          }
        }
        else
        {
          uint64_t v41 = [(CFXCaptureViewController *)self zoomControl];
          [(CFXCaptureViewController *)self layoutZoomControlRelativeToBottomBarAndPreview:v41];
        }
        uint64_t v25 = [(CFXCaptureViewController *)self zoomControl];
        [v25 frame];
        -[CFXCaptureViewController setZoomControlFrame:](self, "setZoomControlFrame:");
        goto LABEL_19;
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v26 = (void *)MEMORY[0x263F5E478];
      [(CFXCaptureViewController *)self zoomControlFrame];
      objc_msgSend(v26, "orientedGeometryForFrame:inBounds:orientation:", 1);
      long long v47 = v53;
      long long v48 = v54;
      long long v49 = v55;
      uint64_t v27 = [(CFXCaptureViewController *)self zoomControl];
      v46[0] = v47;
      v46[1] = v48;
      v46[2] = v49;
      [v27 setTransform:v46];

      double v29 = *((double *)&v52 + 1);
      double v28 = *(double *)&v52;
      uint64_t v30 = [(CFXCaptureViewController *)self zoomControl];
      objc_msgSend(v30, "setCenter:", v28, v29);

      double v32 = *((double *)&v50 + 1);
      double v31 = *(double *)&v50;
      double v34 = *((double *)&v51 + 1);
      double v33 = *(double *)&v51;
      double v35 = [(CFXCaptureViewController *)self zoomControl];
    }
    else
    {
      [(CFXCaptureViewController *)self zoomSliderFrame];
      v57.origin.double x = v21;
      v57.origin.double y = v22;
      v57.size.double width = v23;
      v57.size.double height = v24;
      if (CGRectEqualToRect(*MEMORY[0x263F001A8], v57))
      {
        [(CFXCaptureViewController *)self layoutZoomSliderRelativeToBottomBarAndPreview];
        uint64_t v25 = [(CFXCaptureViewController *)self zoomSlider];
        [v25 frame];
        -[CFXCaptureViewController setZoomSliderFrame:](self, "setZoomSliderFrame:");
LABEL_19:

        goto LABEL_20;
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      double v36 = (void *)MEMORY[0x263F5E478];
      [(CFXCaptureViewController *)self zoomSliderFrame];
      objc_msgSend(v36, "orientedGeometryForFrame:inBounds:orientation:", 1);
      long long v43 = v53;
      long long v44 = v54;
      long long v45 = v55;
      double v37 = [(CFXCaptureViewController *)self zoomSlider];
      v42[0] = v43;
      v42[1] = v44;
      v42[2] = v45;
      [v37 setTransform:v42];

      double v39 = *((double *)&v52 + 1);
      double v38 = *(double *)&v52;
      uint64_t v40 = [(CFXCaptureViewController *)self zoomSlider];
      objc_msgSend(v40, "setCenter:", v38, v39);

      double v32 = *((double *)&v50 + 1);
      double v31 = *(double *)&v50;
      double v34 = *((double *)&v51 + 1);
      double v33 = *(double *)&v51;
      double v35 = [(CFXCaptureViewController *)self zoomSlider];
    }
    double v12 = v35;
    objc_msgSend(v35, "setBounds:", v31, v32, v33, v34);
    goto LABEL_15;
  }
  if (v5)
  {
    double v8 = [(CFXCaptureViewController *)self view];
    [v8 bounds];
    double v10 = v9 * 0.5;

    double v11 = (void *)MEMORY[0x263F307F0];
    double v12 = [(CFXCaptureViewController *)self zoomControl];
    double v13 = [MEMORY[0x263F1C5C0] currentDevice];
    objc_msgSend(v11, "layoutZoomControl:layoutSide:forLayoutStyle:width:marginForZoomButtonFromEdge:marginForZoomDialFromEdge:zoomDialContentMaskingHeight:centerOfZoomControlInContainerView:", v12, 1, objc_msgSend(v13, "cam_initialLayoutStyle"), 375.0, 20.5, 0.0, 0.0, -82.5, v10);

LABEL_15:
    goto LABEL_20;
  }
  [(CFXCaptureViewController *)self layoutZoomSliderRelativeToBottomBarAndPreview];
LABEL_20:
}

- (void)handlePinchGestureRecognizer:(id)a3
{
  id v11 = a3;
  if (!isStreamingMode([(CFXCaptureViewController *)self captureMode])) {
    [(CFXCaptureViewController *)self CFX_handleZoomPinchGestureRecognizer:v11];
  }
  int v4 = [(CFXCaptureViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = [(CFXCaptureViewController *)self delegate];
    uint64_t v7 = [v11 state];
    [v11 scale];
    double v9 = v8;
    [v11 velocity];
    [v6 captureViewController:self presentationRectWasPinchedWithState:v7 scale:v9 velocity:v10];
  }
}

- (double)CFX_maxZoomForCamera
{
  uint64_t v7 = 0;
  uint64_t v8 = 1;
  uint64_t v6 = 0;
  [(CFXCaptureViewController *)self CFX_getCaptureDevice:&v8 captureDevicePosition:&v7 captureMode:&v6];
  double v2 = [MEMORY[0x263F30780] capabilities];
  [v2 maximumZoomFactorForMode:v6 device:v8 videoConfiguration:0];
  double v4 = v3;

  return v4;
}

- (void)zoomSliderValueDidChange:(id)a3 forEvent:(id)a4
{
  id v10 = a3;
  if (([v10 isAutozooming] & 1) == 0)
  {
    [v10 value];
    long double v6 = v5;
    [(CFXCaptureViewController *)self CFX_maxZoomForCamera];
    double v8 = pow(v7, v6);
    double v9 = +[JFXVideoCameraController sharedInstance];
    [v9 rampToZoom:v8 duration:0.25];
  }
}

- (void)zoomSliderDidBeginAutozooming:(id)a3
{
  double v4 = 1.0;
  if (([a3 isMinimumAutozooming] & 1) == 0)
  {
    [(CFXCaptureViewController *)self CFX_maxZoomForCamera];
    *(float *)&double v5 = v5;
    double v4 = *(float *)&v5;
  }
  BOOL v6 = [(CFXCaptureViewController *)self isRecording];
  long double v7 = +[JFXVideoCameraController sharedInstance];
  id v9 = v7;
  double v8 = 0.75;
  if (!v6) {
    double v8 = 1.5;
  }
  [v7 rampToZoom:v4 rate:v8];
}

- (void)zoomSliderDidEndAutozooming:(id)a3
{
  double v4 = +[JFXVideoCameraController sharedInstance];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__CFXCaptureViewController_zoomSliderDidEndAutozooming___block_invoke;
  v5[3] = &unk_264C0CA40;
  v5[4] = self;
  [v4 stopRampToZoom:v5];
}

uint64_t __56__CFXCaptureViewController_zoomSliderDidEndAutozooming___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "CFX_setZoomSliderFromZoomFactor:");
}

- (void)CFX_setZoomSliderFromZoomFactor:(double)a3
{
  [(CFXCaptureViewController *)self CFX_maxZoomForCamera];
  long double v6 = v5;
  long double v7 = log(a3);
  *(float *)&long double v7 = v7 / log(v6);
  id v9 = [(CFXCaptureViewController *)self zoomSlider];
  LODWORD(v8) = LODWORD(v7);
  [v9 setValue:v8];
}

- (void)zoomControl:(id)a3 didChangeZoomFactor:(double)a4 interactionType:(int64_t)a5
{
  id v9 = JFXLog_DebugCapture();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[CFXCaptureViewController zoomControl:didChangeZoomFactor:interactionType:](a2, v9, a4);
  }

  if (a5 == 1)
  {
    uint64_t v17 = 0;
    uint64_t v15 = 0;
    uint64_t v16 = 0;
    [(CFXCaptureViewController *)self CFX_getCaptureDevice:&v17 captureDevicePosition:&v16 captureMode:&v15];
    BOOL v12 = ((v17 & 0xFFFFFFFFFFFFFFFDLL) == 5 || v17 == 6) && a4 == 1.0;
    double v13 = 0.1;
    v14[1] = 3221225472;
    v14[0] = MEMORY[0x263EF8330];
    v14[2] = __76__CFXCaptureViewController_zoomControl_didChangeZoomFactor_interactionType___block_invoke;
    v14[3] = &unk_264C0BB50;
    if (v12) {
      double v13 = 0.2;
    }
    v14[4] = self;
    *(double *)&v14[5] = a4;
    *(double *)&v14[6] = v13;
    +[JTAnimation performAnimation:v14 duration:0 completion:0.15];
  }
  else if (!a5)
  {
    id v10 = +[JFXVideoCameraController sharedInstance];
    [v10 rampToZoom:a4 duration:0.25];
  }
}

void __76__CFXCaptureViewController_zoomControl_didChangeZoomFactor_interactionType___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutZoomUI];
  id v2 = +[JFXVideoCameraController sharedInstance];
  [v2 rampToZoom:*(double *)(a1 + 40) duration:*(double *)(a1 + 48)];
}

- (BOOL)canToggleBetweenZoomFactorsForZoomControl:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = 1;
  uint64_t v5 = 0;
  [(CFXCaptureViewController *)self CFX_getCaptureDevice:&v7 captureDevicePosition:&v6 captureMode:&v5];
  BOOL result = [(CFXCaptureViewController *)self CFX_isZoomAllowed];
  if (v7 != 9) {
    return 0;
  }
  return result;
}

- (void)toggleBetweenZoomFactorsForZoomControl:(id)a3
{
  id v4 = a3;
  if (![(CFXCaptureViewController *)self cameraIsFlipping])
  {
    [(CFXCaptureViewController *)self setCameraIsFlipping:1];
    uint64_t v10 = 0;
    uint64_t v11 = 0;
    uint64_t v9 = 0;
    [(CFXCaptureViewController *)self CFX_getCaptureDevice:&v11 captureDevicePosition:&v10 captureMode:&v9];
    uint64_t v5 = [v4 zoomButtonSymbol];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke;
    v6[3] = &unk_264C0C358;
    BOOL v8 = v5 == 0;
    v6[4] = self;
    id v7 = v4;
    [(CFXCaptureViewController *)self showLiveCaptureSnapshotBlurred:1 animated:1 completion:v6];
  }
}

void __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke(uint64_t a1)
{
  id v2 = +[JFXVideoCameraController sharedInstance];
  uint64_t v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_2;
  v5[3] = &unk_264C0C358;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  char v7 = v3;
  id v6 = v4;
  [v2 setFFCZoom:v3 completion:v5];
}

void __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cameraViewController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_3;
  v5[3] = &unk_264C0C358;
  char v8 = *(unsigned char *)(a1 + 48);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 executeAfterNextFrameIsRendered:v5];
}

uint64_t __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setZoomButtonSymbol:*(unsigned __int8 *)(a1 + 48) animated:1];
  id v2 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_4;
  v4[3] = &unk_264C09FA8;
  v4[4] = v2;
  return [v2 showLiveCaptureSnapshotBlurred:0 animated:1 completion:v4];
}

uint64_t __67__CFXCaptureViewController_toggleBetweenZoomFactorsForZoomControl___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) removeLiveCaptureSnapshot];
  id v2 = *(void **)(a1 + 32);
  return [v2 setCameraIsFlipping:0];
}

- (void)cameraControlsViewControllerEffectsButtonWasTapped:(id)a3
{
  id v4 = [(CFXCaptureViewController *)self delegate];
  [v4 captureViewControllerEffectsButtonWasTapped:self];
}

- (void)cameraControlsViewControllerSwitchCameraButtonWasTapped:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  if (![(CFXCaptureViewController *)self cameraIsFlipping])
  {
    [(CFXCaptureViewController *)self setCameraIsFlipping:1];
    id v4 = [(CFXCaptureViewController *)self zoomControl];
    [v4 setHidden:1];

    uint64_t v5 = [(CFXCaptureViewController *)self zoomSlider];
    [v5 setHidden:1];

    [(CFXCaptureViewController *)self removeEffectEditorAnimated:0];
    id v6 = [CFXViewfinderFlipTransition alloc];
    uint64_t v7 = [(CFXCaptureViewController *)self cameraViewController];
    char v8 = [v7 containerView];
    uint64_t v9 = [(CFXViewfinderFlipTransition *)v6 initWithViewfinderView:v8];
    [(CFXCaptureViewController *)self setViewfinderFlipTransition:v9];

    uint64_t v10 = +[JFXVideoCameraController sharedInstance];
    uint64_t v11 = [v10 cameraPosition];

    BOOL v12 = v11 == 2;
    if (v11 == 2) {
      uint64_t v13 = 1;
    }
    else {
      uint64_t v13 = 2;
    }
    double v14 = JFXLog_viewerUI();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CGAffineTransform buf = 134217984;
      uint64_t v30 = v11;
      _os_log_impl(&dword_234C41000, v14, OS_LOG_TYPE_DEFAULT, "Starting switch camera transition from: %ld", buf, 0xCu);
    }

    uint64_t v15 = dispatch_group_create();
    dispatch_group_enter(v15);
    uint64_t v16 = [(CFXCaptureViewController *)self viewfinderFlipTransition];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke;
    _OWORD v27[3] = &unk_264C09FA8;
    uint64_t v17 = v15;
    double v28 = v17;
    [v16 performFlipTransitionWithDirection:v12 completionHandler:v27];

    CGFloat v18 = [(CFXCaptureViewController *)self cameraViewController];
    [v18 stopRenderingCameraFrames];

    int64_t v19 = +[JFXOrientationMonitor deviceInterfaceOrientation];
    dispatch_group_enter(v17);
    CGFloat v20 = +[JFXVideoCameraController sharedInstance];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_2;
    v26[3] = &unk_264C0BBE8;
    v26[4] = self;
    void v26[5] = v13;
    v26[6] = v19;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_3;
    v23[3] = &unk_264C0CA68;
    CGFloat v24 = v17;
    uint64_t v25 = v13;
    v23[4] = self;
    CGFloat v21 = v17;
    [v20 switchCameraToPosition:v13 applyFFCZoom:1 configureLockedCamera:v26 completion:v23];

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_4;
    block[3] = &unk_264C0A3A0;
    block[4] = self;
    block[5] = v13;
    dispatch_group_notify(v21, MEMORY[0x263EF83A0], block);
  }
}

void __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke(uint64_t a1)
{
}

void __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_2(void *a1, void *a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  id v3 = (void *)a1[4];
  uint64_t v4 = a1[5];
  id v5 = a2;
  id v6 = [v5 deviceType];
  objc_msgSend(v3, "CFX_getCAMCaptureForPosition:type:captureDevice:captureDevicePosition:captureMode:", v4, v6, &v12, &v11, &v10);

  uint64_t v7 = [MEMORY[0x263F30780] capabilities];
  [v7 defaultZoomFactorForMode:v10 device:v12 videoConfiguration:0 captureOrientation:a1[6]];
  double v9 = v8;

  [v5 setVideoZoomFactor:v9];
}

void __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) removeEffectsForCameraSwitch];
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 captureViewController:*(void *)(a1 + 32) switchedToCameraPosition:*(void *)(a1 + 48)];

  id v3 = [*(id *)(a1 + 32) cameraViewController];
  [v3 startRenderingCameraFrames];

  uint64_t v4 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v4);
}

void __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cameraViewController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_5;
  v4[3] = &unk_264C0A3A0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  void v4[5] = v3;
  [v2 executeAfterNextFrameIsRendered:v4];
}

void __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_5(uint64_t a1)
{
  id v2 = +[JFXVideoCameraController sharedInstance];
  [v2 zoomFactor];
  double v4 = v3;

  id v5 = [*(id *)(a1 + 32) zoomControl];
  [v5 setZoomFactor:v4];

  [*(id *)(a1 + 32) updateUIForDevicePosition:*(void *)(a1 + 40)];
  id v6 = [*(id *)(a1 + 32) viewfinderFlipTransition];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_6;
  v8[3] = &unk_264C0A3A0;
  uint64_t v7 = *(void *)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  void v8[5] = v7;
  [v6 completeTransitionToLivePreviewWithCompletionHandler:v8];
}

uint64_t __84__CFXCaptureViewController_cameraControlsViewControllerSwitchCameraButtonWasTapped___block_invoke_6(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v2 = JFXLog_viewerUI();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    double v3 = *(void **)(a1 + 40);
    int v10 = 134217984;
    uint64_t v11 = v3;
    _os_log_impl(&dword_234C41000, v2, OS_LOG_TYPE_DEFAULT, "Finished switch camera transition to: %ld", (uint8_t *)&v10, 0xCu);
  }

  double v4 = CFXLog_action();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) composition];
    id v6 = [v5 jtEffects];
    uint64_t v7 = +[CFXActionLogging actionLogAsJSONForEvent:@"camera flipped" atLocation:@"live" withEffectStack:v6];
    int v10 = 138543362;
    uint64_t v11 = v7;
    _os_log_impl(&dword_234C41000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v10, 0xCu);
  }
  [*(id *)(a1 + 32) updateZoomUIVisibility];
  double v8 = [*(id *)(a1 + 32) delegate];
  [v8 captureViewControllerCameraFlipButtonWasTapped:*(void *)(a1 + 32)];

  return [*(id *)(a1 + 32) setCameraIsFlipping:0];
}

- (void)insertCamBottomBar:(id)a3
{
  id v4 = a3;
  id v6 = [(CFXCaptureViewController *)self view];
  id v5 = [(CFXCaptureViewController *)self topBar];
  [v6 insertSubview:v4 above:v5];
}

- (CGRect)bottomBarCTMControlsFrameForWindowOrientation:(int64_t)a3 bounds:(CGRect)a4
{
  double height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  if ((unint64_t)(a3 - 3) > 1)
  {
    double v9 = a4.size.width;
  }
  else
  {
    double v9 = CGRectGetHeight(a4);
    v21.origin.double x = x;
    v21.origin.double y = y;
    v21.size.CGFloat width = width;
    v21.size.double height = height;
    double height = CGRectGetWidth(v21);
    double x = 0.0;
    double y = 0.0;
  }
  id v10 = objc_alloc(MEMORY[0x263F307C0]);
  uint64_t v11 = [(CFXCaptureViewController *)self dynamicShutterControl];
  [v11 intrinsicContentSize];
  double v14 = objc_msgSend(v10, "initWithReferenceBounds:shutterIntrinsicSize:", x, y, v9, height, v12, v13);

  [v14 viewportFrameForAspectRatio:0 usingAppDrawer:1 accessoryAreaExpanded:0];
  double MaxY = CGRectGetMaxY(v22);
  v23.origin.double x = x;
  v23.origin.double y = y;
  v23.size.CGFloat width = v9;
  v23.size.double height = height;
  CGFloat v16 = CGRectGetWidth(v23);

  double v17 = 0.0;
  double v18 = MaxY;
  double v19 = v16;
  double v20 = height - MaxY;
  result.size.double height = v20;
  result.size.CGFloat width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (void)liveCaptureViewController:(id)a3 didRenderFrame:(id)a4
{
  id v5 = a4;
  id v6 = [(CFXCaptureViewController *)self delegate];
  [v6 captureViewController:self didRenderFrame:v5];

  if ([(CFXCaptureViewController *)self CFX_isRenderingAnimatedOverlaysThatDontLoop])
  {
    uint64_t v7 = objc_opt_new();
    double v8 = [(CFXCaptureViewController *)self runOnceAnimatedOverlays];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    double v13 = __69__CFXCaptureViewController_liveCaptureViewController_didRenderFrame___block_invoke;
    double v14 = &unk_264C0CA90;
    id v15 = v5;
    id v16 = v7;
    id v9 = v7;
    [v8 enumerateObjectsUsingBlock:&v11];

    +[JFXEffectEditingUtilities disableAnimationForEffects:](JFXEffectEditingUtilities, "disableAnimationForEffects:", v9, v11, v12, v13, v14);
    id v10 = [(CFXCaptureViewController *)self runOnceAnimatedOverlays];
    [v10 removeObjectsInArray:v9];
  }
}

void __69__CFXCaptureViewController_liveCaptureViewController_didRenderFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 renderEffect];
  id v5 = v4;
  if (v4)
  {
    [v4 effectRange];
  }
  else
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v16 = 0u;
  }
  *(_OWORD *)&v19.value = v16;
  v19.epoch = v17;

  CMTime time1 = v19;
  *(_OWORD *)&time2.value = CFXEffectPreviewStartAtNextRenderTime;
  time2.epoch = 0;
  if (CMTimeCompare(&time1, &time2))
  {
    memset(&time1, 0, sizeof(time1));
    id v6 = *(void **)(a1 + 32);
    if (v6) {
      [v6 requestTime];
    }
    uint64_t v7 = [v3 renderEffect];
    double v8 = v7;
    if (v7)
    {
      [v7 effectRange];
    }
    else
    {
      memset(v13, 0, sizeof(v13));
      long long v12 = 0u;
    }
    CMTime time2 = *(CMTime *)((char *)v13 + 8);

    memset(&v11, 0, sizeof(v11));
    CMTime lhs = time1;
    CMTime v9 = v19;
    CMTimeSubtract(&v11, &lhs, &v9);
    CMTime lhs = v11;
    CMTime v9 = time2;
    if ((CMTimeCompare(&lhs, &v9) & 0x80000000) == 0) {
      [*(id *)(a1 + 40) addObject:v3];
    }
  }
}

- (BOOL)CFX_isRenderingAnimatedOverlaysThatDontLoop
{
  id v2 = [(CFXCaptureViewController *)self runOnceAnimatedOverlays];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (void)liveCaptureViewController:(id)a3 livePreviewTappedAtNormalizedPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = [(CFXCaptureViewController *)self cameraViewController];
  char v8 = [v7 isCapturing];

  if ((v8 & 1) == 0)
  {
    CMTime v9 = [(CFXCaptureViewController *)self composition];
    id v10 = [v9 jtEffectsForType:2];

    if ([v10 count])
    {
      CMTime v11 = [(CFXCaptureViewController *)self cameraViewController];
      [v11 normalizedMinimumHitTestArea];
      double v13 = v12;
      double v15 = v14;

      long long v17 = *MEMORY[0x263F010E0];
      uint64_t v18 = *(void *)(MEMORY[0x263F010E0] + 16);
      long long v16 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v10, &v17, 1, x, y, v13, v15);
      if (v16) {
        [(CFXCaptureViewController *)self displayEffectEditorForEffect:v16 forMode:0];
      }
    }
  }
}

- (void)liveCaptureViewController:(id)a3 livePreviewPannedAtNormalizedPoint:(CGPoint)a4 gesture:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  if ([v8 state] == 1)
  {
    CMTime v9 = [(CFXCaptureViewController *)self cameraViewController];
    char v10 = [v9 isCapturing];

    if (v10) {
      goto LABEL_49;
    }
  }
  uint64_t v11 = [v8 state];
  if ((unint64_t)(v11 - 3) >= 2)
  {
    if (v11 != 2)
    {
      if (v11 != 1) {
        goto LABEL_49;
      }
      double v12 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.5();
      }

      if ([(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures])
      {
        double v13 = [(CFXCaptureViewController *)self effectEditor];
        double v14 = [v13 editEffect];

        double v15 = [v14 jtEffect];
        long long v16 = CFXLog_DebugEffectEditingUI();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

        if (v17)
        {
          uint64_t v18 = CFXLog_DebugEffectEditingUI();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.4();
          }
        }
        if (v15) {
          goto LABEL_42;
        }
      }
      CMTime v19 = [(CFXCaptureViewController *)self composition];
      double v20 = [v19 jtEffectsForType:2];

      if (![v20 count]) {
        goto LABEL_37;
      }
      CGRect v21 = [(CFXCaptureViewController *)self cameraViewController];
      [v21 normalizedMinimumHitTestArea];
      double v23 = v22;
      double v25 = v24;

      long long v39 = *MEMORY[0x263F010E0];
      uint64_t v40 = *(void *)(MEMORY[0x263F010E0] + 16);
      uint64_t v26 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v20, &v39, 1, x, y, v23, v25);
      if (v26)
      {
        double v15 = (void *)v26;
        uint64_t v27 = CFXLog_DebugEffectEditingUI();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);

        if (!v28)
        {
LABEL_41:

LABEL_42:
          if ([v15 type] == 2)
          {
            unint64_t v36 = [(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] | 1;
            [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v36];
            [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v36];
            if (![(CFXCaptureViewController *)self isEditingEffect]) {
              [(CFXCaptureViewController *)self displayEffectEditorForEffect:v15 forMode:1];
            }
            double v37 = CFXLog_DebugEffectEditingUI();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:]();
            }

            double v38 = [(CFXCaptureViewController *)self effectEditor];
            [v38 handlePanGesture:v8];
          }
          goto LABEL_49;
        }
        double v29 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:]();
        }
      }
      else
      {
LABEL_37:
        double v29 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:]();
        }
        double v15 = 0;
      }

      goto LABEL_41;
    }
    if (([(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] & 1) != 0
      && [(CFXCaptureViewController *)self isEditingEffect])
    {
      double v35 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.7();
      }

      double v34 = [(CFXCaptureViewController *)self effectEditor];
      [v34 handlePanGesture:v8];
    }
    else
    {
      double v34 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.6();
      }
    }
LABEL_36:

    goto LABEL_49;
  }
  if (([(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] & 1) == 0
    || ![(CFXCaptureViewController *)self isEditingEffect])
  {
    double v34 = CFXLog_DebugEffectEditingUI();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.8();
    }
    goto LABEL_36;
  }
  uint64_t v30 = CFXLog_DebugEffectEditingUI();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
    -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:]0();
  }

  uint64_t v31 = [(CFXCaptureViewController *)self effectEditor];
  [v31 handlePanGesture:v8];

  unint64_t v32 = [(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] & 0xFFFFFFFFFFFFFFFELL;
  [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v32];
  [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v32];
  if (![(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures])
  {
    double v33 = CFXLog_DebugEffectEditingUI();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
      -[CFXCaptureViewController liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:].cold.9();
    }

    [(CFXCaptureViewController *)self removeEffectEditorAnimated:1];
  }
LABEL_49:
}

- (void)liveCaptureViewController:(id)a3 livePreviewPinchedAtNormalizedCenterPoint:(CGPoint)a4 gesture:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  if ([v8 state] == 1)
  {
    CMTime v9 = [(CFXCaptureViewController *)self cameraViewController];
    int v10 = [v9 isCapturing];

    if (v10) {
      goto LABEL_45;
    }
  }
  uint64_t v11 = [v8 state];
  if ((unint64_t)(v11 - 3) < 2)
  {
    if (([(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] & 2) != 0
      && [(CFXCaptureViewController *)self isEditingEffect])
    {
      uint64_t v30 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.8();
      }

      uint64_t v31 = [(CFXCaptureViewController *)self effectEditor];
      [v31 handlePinchGesture:v8];

      unint64_t v32 = [(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] & 0xFFFFFFFFFFFFFFFDLL;
      [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v32];
      [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v32];
      if (![(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures])
      {
        double v33 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.7();
        }

        [(CFXCaptureViewController *)self removeEffectEditorAnimated:1];
      }
    }
  }
  else
  {
    if (v11 != 2)
    {
      if (v11 != 1) {
        goto LABEL_44;
      }
      double v12 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.5();
      }

      if ([(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures])
      {
        double v13 = [(CFXCaptureViewController *)self effectEditor];
        double v14 = [v13 editEffect];

        double v15 = [v14 jtEffect];
        long long v16 = CFXLog_DebugEffectEditingUI();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

        if (v17)
        {
          uint64_t v18 = CFXLog_DebugEffectEditingUI();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.4();
          }
        }
        if (v15) {
          goto LABEL_37;
        }
      }
      CMTime v19 = [(CFXCaptureViewController *)self composition];
      double v20 = [v19 jtEffectsForType:2];

      if (![v20 count]) {
        goto LABEL_32;
      }
      CGRect v21 = [(CFXCaptureViewController *)self cameraViewController];
      [v21 normalizedMinimumHitTestArea];
      double v23 = v22;
      double v25 = v24;

      long long v38 = *MEMORY[0x263F010E0];
      uint64_t v39 = *(void *)(MEMORY[0x263F010E0] + 16);
      uint64_t v26 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v20, &v38, 1, x, y, v23, v25);
      if (v26)
      {
        double v15 = (void *)v26;
        uint64_t v27 = CFXLog_DebugEffectEditingUI();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);

        if (!v28)
        {
LABEL_36:

LABEL_37:
          if ([v15 type] == 2)
          {
            unint64_t v35 = [(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] | 2;
            [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v35];
            [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v35];
            if (![(CFXCaptureViewController *)self isEditingEffect]) {
              [(CFXCaptureViewController *)self displayEffectEditorForEffect:v15 forMode:1];
            }
            unint64_t v36 = CFXLog_DebugEffectEditingUI();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
              -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:]();
            }

            double v37 = [(CFXCaptureViewController *)self effectEditor];
            [v37 handlePinchGesture:v8];
          }
LABEL_43:

          goto LABEL_44;
        }
        double v29 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:]();
        }
      }
      else
      {
LABEL_32:
        double v29 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:]();
        }
        double v15 = 0;
      }

      goto LABEL_36;
    }
    if (([(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] & 2) != 0
      && [(CFXCaptureViewController *)self isEditingEffect])
    {
      double v34 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[CFXCaptureViewController liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:].cold.6();
      }

      double v15 = [(CFXCaptureViewController *)self effectEditor];
      [v15 handlePinchGesture:v8];
      goto LABEL_43;
    }
  }
LABEL_44:
  if (([(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] & 2) == 0) {
LABEL_45:
  }
    [(CFXCaptureViewController *)self handlePinchGestureRecognizer:v8];
}

- (void)liveCaptureViewController:(id)a3 livePreviewRotatedAtNormalizedCenterPoint:(CGPoint)a4 gesture:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = a5;
  if ([v8 state] == 1)
  {
    CMTime v9 = [(CFXCaptureViewController *)self cameraViewController];
    char v10 = [v9 isCapturing];

    if (v10) {
      goto LABEL_44;
    }
  }
  uint64_t v11 = [v8 state];
  if ((unint64_t)(v11 - 3) < 2)
  {
    if (([(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] & 4) != 0
      && [(CFXCaptureViewController *)self isEditingEffect])
    {
      uint64_t v30 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.8();
      }

      uint64_t v31 = [(CFXCaptureViewController *)self effectEditor];
      [v31 handleRotateGesture:v8];

      unint64_t v32 = [(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] & 0xFFFFFFFFFFFFFFFBLL;
      [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v32];
      [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v32];
      if (![(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures])
      {
        double v33 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
          -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.7();
        }

        [(CFXCaptureViewController *)self removeEffectEditorAnimated:1];
      }
    }
  }
  else
  {
    if (v11 != 2)
    {
      if (v11 != 1) {
        goto LABEL_44;
      }
      double v12 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.5();
      }

      if ([(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures])
      {
        double v13 = [(CFXCaptureViewController *)self effectEditor];
        double v14 = [v13 editEffect];

        double v15 = [v14 jtEffect];
        long long v16 = CFXLog_DebugEffectEditingUI();
        BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);

        if (v17)
        {
          uint64_t v18 = CFXLog_DebugEffectEditingUI();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
            -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.4();
          }
        }
        if (v15) {
          goto LABEL_37;
        }
      }
      CMTime v19 = [(CFXCaptureViewController *)self composition];
      double v20 = [v19 jtEffectsForType:2];

      if (![v20 count]) {
        goto LABEL_32;
      }
      CGRect v21 = [(CFXCaptureViewController *)self cameraViewController];
      [v21 normalizedMinimumHitTestArea];
      double v23 = v22;
      double v25 = v24;

      long long v39 = *MEMORY[0x263F010E0];
      uint64_t v40 = *(void *)(MEMORY[0x263F010E0] + 16);
      uint64_t v26 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atNormalizedPoint:atTime:adjustForMinimumSize:normalizedMinimumSize:", v20, &v39, 1, x, y, v23, v25);
      if (v26)
      {
        double v15 = (void *)v26;
        uint64_t v27 = CFXLog_DebugEffectEditingUI();
        BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG);

        if (!v28)
        {
LABEL_36:

LABEL_37:
          if ([v15 type] == 2)
          {
            unint64_t v36 = [(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] | 4;
            [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v36];
            [(CFXCaptureViewController *)self setAppliedDirectOverlayEditingGestures:v36];
            if (![(CFXCaptureViewController *)self isEditingEffect]) {
              [(CFXCaptureViewController *)self displayEffectEditorForEffect:v15 forMode:1];
            }
            double v37 = CFXLog_DebugEffectEditingUI();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG)) {
              -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:]();
            }

            long long v38 = [(CFXCaptureViewController *)self effectEditor];
            [v38 handleRotateGesture:v8];
          }
          goto LABEL_44;
        }
        double v29 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:]();
        }
      }
      else
      {
LABEL_32:
        double v29 = CFXLog_DebugEffectEditingUI();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:]();
        }
        double v15 = 0;
      }

      goto LABEL_36;
    }
    if (([(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures] & 4) != 0
      && [(CFXCaptureViewController *)self isEditingEffect])
    {
      double v34 = CFXLog_DebugEffectEditingUI();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
        -[CFXCaptureViewController liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:].cold.6();
      }

      unint64_t v35 = [(CFXCaptureViewController *)self effectEditor];
      [v35 handleRotateGesture:v8];
    }
  }
LABEL_44:
}

- (void)liveCaptureViewController:(id)a3 livePreviewDoubleTappedAtNormalizedCenterPoint:(CGPoint)a4 gesture:(id)a5
{
  id v6 = [(CFXCaptureViewController *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(CFXCaptureViewController *)self delegate];
    [v8 captureViewControllerPresentationRectWasDoubleTapped:self];
  }
}

- (void)setupAnimojiFaceReticleForTrackingLoss
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__CFXCaptureViewController_setupAnimojiFaceReticleForTrackingLoss__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __66__CFXCaptureViewController_setupAnimojiFaceReticleForTrackingLoss__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isShowingAnimojiReticle] & 1) == 0)
  {
    id v2 = -[CFXFaceReticleView initWithFrame:reticleType:]([CFXFaceReticleView alloc], "initWithFrame:reticleType:", 1, 0.0, 0.0, 180.0, 180.0);
    [*(id *)(a1 + 32) setAnimojiTrackingLossReticle:v2];

    BOOL v3 = [*(id *)(a1 + 32) animojiTrackingLossReticle];
    [v3 setUserInteractionEnabled:0];

    id v4 = [*(id *)(a1 + 32) presentationView];
    id v5 = [*(id *)(a1 + 32) animojiTrackingLossReticle];
    [v4 addSubview:v5];

    id v6 = [*(id *)(a1 + 32) presentationView];
    [v6 bounds];
    double CenterPoint = CGRectGetCenterPoint(v7, v8, v9, v10);
    double v13 = v12;
    double v14 = [*(id *)(a1 + 32) animojiTrackingLossReticle];
    objc_msgSend(v14, "setCenter:", CenterPoint, v13);

    double v15 = [*(id *)(a1 + 32) animojiReticleFacePromptView];

    if (!v15)
    {
      long long v16 = *(void **)(a1 + 32);
      [v16 setupFaceInViewPromptLabel];
    }
  }
}

- (void)setupFaceInViewPromptLabel
{
  v64[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [(CFXCaptureViewController *)self setAnimojiReticleFacePromptView:v3];

  id v4 = [MEMORY[0x263F1C550] blackColor];
  id v5 = [v4 colorWithAlphaComponent:0.5];
  id v6 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  [v6 setBackgroundColor:v5];

  CGFloat v7 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  CGFloat v8 = [v7 layer];
  [v8 setCornerRadius:2.0];

  CGFloat v9 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  [v9 setAlpha:0.0];

  CGFloat v10 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  [v10 setUserInteractionEnabled:0];

  uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithSize:", 0.0, 0.0);
  id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v13 = objc_alloc_init(MEMORY[0x263F1C360]);
  double v14 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.75];
  [v13 setShadowColor:v14];

  objc_msgSend(v13, "setShadowOffset:", 0.0, 0.0);
  double v59 = v13;
  [v13 setShadowBlurRadius:3.0];
  id v15 = objc_alloc_init(MEMORY[0x263F1C350]);
  [v15 setAlignment:1];
  CGFloat v60 = v15;
  [v15 setLineBreakMode:0];
  double v61 = [MEMORY[0x263F1C658] systemFontOfSize:*MEMORY[0x263F1D238] weight:14.0 design:*MEMORY[0x263F1D338]];
  CGFloat v62 = [MEMORY[0x263F1C550] whiteColor];
  id v16 = v12;
  [v12 setObject:v62 forKeyedSubscript:*MEMORY[0x263F1C240]];
  [v12 setObject:v61 forKeyedSubscript:*MEMORY[0x263F1C238]];
  [v12 setObject:v15 forKeyedSubscript:*MEMORY[0x263F1C268]];
  uint64_t v58 = v12;
  [v12 setObject:v13 forKeyedSubscript:*MEMORY[0x263F1C280]];
  id v17 = objc_alloc(MEMORY[0x263F086A0]);
  uint64_t v18 = [MEMORY[0x263F086E0] jfxBundle];
  CMTime v19 = [v18 localizedStringForKey:@"BRING_FACE_INTO_VIEW_PROMPT_DISPLAY Name" value:&stru_26E7CDB50 table:0];
  CGRect v57 = (void *)[v17 initWithString:v19 attributes:v16];

  [v11 setAttributedText:v57];
  [v11 sizeToFit];
  double v20 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  [v20 addSubview:v11];

  CGRect v21 = [(CFXCaptureViewController *)self presentationView];
  double v22 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  [v21 addSubview:v22];

  double v23 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v24 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  double v25 = [v24 topAnchor];
  uint64_t v26 = [(CFXCaptureViewController *)self presentationView];
  uint64_t v27 = [v26 topAnchor];
  BOOL v28 = [v25 constraintEqualToAnchor:v27 constant:10.0];
  [(CFXCaptureViewController *)self setFacePromptLabelYConstraint:v28];

  double v29 = (void *)MEMORY[0x263F08938];
  uint64_t v30 = [(CFXCaptureViewController *)self facePromptLabelYConstraint];
  v64[0] = v30;
  uint64_t v31 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  unint64_t v32 = [v31 centerXAnchor];
  double v33 = [(CFXCaptureViewController *)self presentationView];
  double v34 = [v33 centerXAnchor];
  unint64_t v35 = [v32 constraintEqualToAnchor:v34];
  v64[1] = v35;
  unint64_t v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v64 count:2];
  [v29 activateConstraints:v36];

  double v37 = v11;
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  long long v48 = (void *)MEMORY[0x263F08938];
  long long v55 = [v11 leftAnchor];
  CGRect v56 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  long long v54 = [v56 leftAnchor];
  long long v53 = [v55 constraintEqualToAnchor:v54 constant:10.0];
  v63[0] = v53;
  long long v50 = [v11 rightAnchor];
  long long v51 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  long long v49 = [v51 rightAnchor];
  long long v47 = [v50 constraintEqualToAnchor:v49 constant:-10.0];
  v63[1] = v47;
  long long v52 = v11;
  long long v38 = [v11 topAnchor];
  long long v39 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  uint64_t v40 = [v39 topAnchor];
  uint64_t v41 = [v38 constraintEqualToAnchor:v40 constant:3.0];
  v63[2] = v41;
  uint64_t v42 = [v37 bottomAnchor];
  long long v43 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  long long v44 = [v43 bottomAnchor];
  long long v45 = [v42 constraintEqualToAnchor:v44 constant:-3.0];
  v63[3] = v45;
  double v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v63 count:4];
  [v48 activateConstraints:v46];

  [(CFXCaptureViewController *)self updateAnimojiTrackingReticleAndLabelLayout];
}

- (void)showAnimojiFaceReticleForTrackingLoss
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CFXCaptureViewController_showAnimojiFaceReticleForTrackingLoss__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__CFXCaptureViewController_showAnimojiFaceReticleForTrackingLoss__block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isShowingAnimojiReticle] & 1) == 0)
  {
    [*(id *)(a1 + 32) setIsShowingAnimojiReticle:1];
    [*(id *)(a1 + 32) fadeInFaceInViewPromptLabel];
    id v2 = [*(id *)(a1 + 32) animojiTrackingLossReticle];
    [v2 showAndAnimateAnimojiFaceReticle];
  }
}

- (void)hideAnimojiFaceReticleForTrackingGain
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__CFXCaptureViewController_hideAnimojiFaceReticleForTrackingGain__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__CFXCaptureViewController_hideAnimojiFaceReticleForTrackingGain__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isShowingAnimojiReticle])
  {
    [*(id *)(a1 + 32) setIsShowingAnimojiReticle:0];
    id v2 = [*(id *)(a1 + 32) animojiTrackingLossReticle];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __65__CFXCaptureViewController_hideAnimojiFaceReticleForTrackingGain__block_invoke_2;
    v4[3] = &unk_264C09FA8;
    id v5 = v2;
    id v3 = v2;
    [v3 hideAnimojiFaceReticleAnimatedWithCompletion:v4];
    [*(id *)(a1 + 32) fadeOutFaceInViewPromptLabel];
  }
}

uint64_t __65__CFXCaptureViewController_hideAnimojiFaceReticleForTrackingGain__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (BOOL)shouldShowAnimojiFaceReticle
{
  if ([(CFXCaptureViewController *)self isShowingAnimojiReticle])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    id v4 = [(CFXCaptureViewController *)self cameraViewController];
    int v3 = [v4 isCapturing] ^ 1;
  }
  return v3;
}

- (void)fadeInFaceInViewPromptLabel
{
  id v3 = objc_alloc(MEMORY[0x263F1CB78]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __55__CFXCaptureViewController_fadeInFaceInViewPromptLabel__block_invoke;
  v5[3] = &unk_264C09FA8;
  void v5[4] = self;
  id v4 = (void *)[v3 initWithDuration:0 curve:v5 animations:0.5];
  [v4 startAnimationAfterDelay:0.5];
}

void __55__CFXCaptureViewController_fadeInFaceInViewPromptLabel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) animojiReticleFacePromptView];
  [v1 setAlpha:1.0];
}

- (void)fadeOutFaceInViewPromptLabel
{
  id v3 = objc_alloc(MEMORY[0x263F1CB78]);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__CFXCaptureViewController_fadeOutFaceInViewPromptLabel__block_invoke;
  v5[3] = &unk_264C09FA8;
  void v5[4] = self;
  id v4 = (void *)[v3 initWithDuration:0 curve:v5 animations:0.2];
  [v4 startAnimation];
}

void __56__CFXCaptureViewController_fadeOutFaceInViewPromptLabel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) animojiReticleFacePromptView];
  [v1 setAlpha:0.0];
}

- (void)removeAnimojiTrackingReticle
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__CFXCaptureViewController_removeAnimojiTrackingReticle__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __56__CFXCaptureViewController_removeAnimojiTrackingReticle__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) animojiTrackingLossReticle];
  if (v2)
  {
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) animojiReticleFacePromptView];

    if (!v3) {
      return;
    }
  }
  id v4 = [*(id *)(a1 + 32) animojiTrackingLossReticle];
  [v4 removeFromSuperview];

  id v5 = [*(id *)(a1 + 32) animojiReticleFacePromptView];
  [v5 removeFromSuperview];

  [*(id *)(a1 + 32) setAnimojiTrackingLossReticle:0];
  [*(id *)(a1 + 32) setAnimojiReticleFacePromptView:0];
  id v6 = *(void **)(a1 + 32);
  [v6 setIsShowingAnimojiReticle:0];
}

- (void)updateAnimojiTrackingReticleAndLabelLayout
{
  int64_t v3 = [(CFXCaptureViewController *)self captureMode];
  BOOL v4 = (unint64_t)(+[JFXOrientationMonitor interfaceOrientation]- 3) < 2;
  BOOL v5 = v3 == 2 && v4;
  if (v3 == 2)
  {
    id v6 = [MEMORY[0x263F1C5C0] currentDevice];
    BOOL v7 = [v6 userInterfaceIdiom] == 1;
  }
  else
  {
    BOOL v7 = 0;
  }
  CGFloat v8 = [(CFXCaptureViewController *)self animojiTrackingLossReticle];

  if (v8)
  {
    CGFloat v9 = [(CFXCaptureViewController *)self presentationView];
    [v9 bounds];
    double CenterPoint = CGRectGetCenterPoint(v10, v11, v12, v13);
    double v16 = v15;
    id v17 = [(CFXCaptureViewController *)self animojiTrackingLossReticle];
    objc_msgSend(v17, "setCenter:", CenterPoint, v16);
  }
  if (v5 || v7)
  {
    uint64_t v18 = [(CFXCaptureViewController *)self elapsedTimeView];
    [v18 bounds];
    double v20 = v19 + 23.0 + 10.0;
    CGRect v21 = [(CFXCaptureViewController *)self facePromptLabelYConstraint];
    [v21 setConstant:v20];
  }
  else
  {
    uint64_t v18 = [(CFXCaptureViewController *)self facePromptLabelYConstraint];
    [v18 setConstant:10.0];
  }

  double v22 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  [v22 setNeedsUpdateConstraints];

  id v23 = [(CFXCaptureViewController *)self animojiReticleFacePromptView];
  [v23 updateConstraintsIfNeeded];
}

- (CGRect)CFX_cameraViewFinderUncroppedFrame
{
  if ([(CFXCaptureViewController *)self captureContainerUncroppedFrameWasCalculatedWithContentRect])
  {
    [(CFXCaptureViewController *)self externalUncroppedPresentationRect];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    CGFloat v11 = [(CFXCaptureViewController *)self liveCaptureContainer];
    CGFloat v12 = +[CFXMediaSettings sharedInstance];
    [v12 renderSize];
    double v14 = v13;
    double v16 = v15;

    [v11 frame];
    double v4 = CGRectFillRectToAspectInRect(v17, v18, v19, v20, 0.0, 0.0, v14, v16);
    double v6 = v21;
    double v8 = v22;
    double v10 = v23;
  }
  double v24 = v4;
  double v25 = v6;
  double v26 = v8;
  double v27 = v10;
  result.size.double height = v27;
  result.size.CGFloat width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (void)displayEffectEditorForEffect:(id)a3 forMode:(unint64_t)a4
{
  id v6 = a3;
  double v7 = [(CFXCaptureViewController *)self cameraViewController];
  char v8 = [v7 isCapturing];

  if ((v8 & 1) == 0)
  {
    double v9 = [(CFXCaptureViewController *)self effectEditor];

    if (v9)
    {
      double v10 = [(CFXCaptureViewController *)self effectEditor];
      if ([v10 mode] == a4)
      {
        CGFloat v11 = [(CFXCaptureViewController *)self effectEditor];
        CGFloat v12 = [v11 editEffect];
        char v13 = [v12 isEqual:v6];

        if (v13) {
          goto LABEL_18;
        }
      }
      else
      {
      }
      [(CFXCaptureViewController *)self removeEffectEditorAnimated:1];
    }
    if (a4
      || !+[JFXEffectEditingUtilities canEditTextForEffect:v6])
    {
      double v15 = +[CFXEffect effectWithJTEffect:v6];
      double v16 = [JFXPassThroughContainerView alloc];
      double v17 = [(CFXCaptureViewController *)self view];
      [v17 frame];
      double v18 = -[JFXPassThroughContainerView initWithFrame:](v16, "initWithFrame:");
      [(CFXCaptureViewController *)self setEffectEditorContainerView:v18];

      if ([(CFXCaptureViewController *)self isMessagesOnPhone])
      {
        double v19 = [(CFXCaptureViewController *)self nonTransformedContainerView];
        double v20 = [(CFXCaptureViewController *)self effectEditorContainerView];
        [v19 addSubview:v20];
      }
      else
      {
        double v19 = [(CFXCaptureViewController *)self view];
        double v20 = [(CFXCaptureViewController *)self effectEditorContainerView];
        double v21 = [(CFXCaptureViewController *)self topBar];
        [v19 insertSubview:v20 belowSubview:v21];
      }
      double v22 = [[CFXEffectEditorView alloc] initWithMode:a4 delegate:self];
      [(CFXCaptureViewController *)self setEffectEditor:v22];

      [(CFXCaptureViewController *)self CFX_cameraViewFinderUncroppedFrame];
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      double v30 = v29;
      uint64_t v31 = [(CFXCaptureViewController *)self effectEditor];
      objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

      unint64_t v32 = [(CFXCaptureViewController *)self effectEditorContainerView];
      double v33 = [(CFXCaptureViewController *)self effectEditor];
      [v32 addSubview:v33];

      [(CFXCaptureViewController *)self CFX_applyAutoRotationCorrectionToEditorViews];
      double v34 = [(CFXCaptureViewController *)self effectEditor];
      [v34 beginEditingEffect:v15];
    }
    else if (![(CFXCaptureViewController *)self presentFullScreenTextEditorForEffect:v6 insertingEffect:0])
    {
      double v14 = JFXLog_viewerUI();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unint64_t v35 = 0;
        _os_log_impl(&dword_234C41000, v14, OS_LOG_TYPE_DEFAULT, "Request to display text editor for edit ignored because already open", v35, 2u);
      }
    }
  }
LABEL_18:
}

- (void)updateEffectEditorLayout
{
  double v3 = [(CFXCaptureViewController *)self effectEditor];

  if (v3)
  {
    [(CFXCaptureViewController *)self CFX_cameraViewFinderUncroppedFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    CGFloat v12 = [(CFXCaptureViewController *)self effectEditor];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    [(CFXCaptureViewController *)self CFX_applyAutoRotationCorrectionToEditorViews];
  }
}

- (void)removeEffectEditorAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(CFXCaptureViewController *)self effectEditor];

  if (v5)
  {
    double v6 = [(CFXCaptureViewController *)self effectEditor];
    objc_initWeak(&location, v6);

    double v7 = [(CFXCaptureViewController *)self effectEditorContainerView];
    objc_initWeak(&from, v7);

    [(CFXCaptureViewController *)self setEffectEditor:0];
    [(CFXCaptureViewController *)self setEffectEditorContainerView:0];
    id v8 = objc_loadWeakRetained(&location);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __55__CFXCaptureViewController_removeEffectEditorAnimated___block_invoke;
    v9[3] = &unk_264C0CAB8;
    objc_copyWeak(&v10, &location);
    objc_copyWeak(&v11, &from);
    [v8 endEditingAnimated:v3 withCompletionBlock:v9];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

void __55__CFXCaptureViewController_removeEffectEditorAnimated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained removeFromSuperview];

  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 removeFromSuperview];
}

- (BOOL)isEditingEffect
{
  id v2 = [(CFXCaptureViewController *)self effectEditor];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)presentFullScreenTextEditorForEffect:(id)a3 insertingEffect:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(CFXCaptureViewController *)self view];
  [(CFXCaptureViewController *)self CFX_cameraViewFinderUncroppedFrame];
  objc_msgSend(v7, "convertRect:toView:", 0);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  if ([(CFXCaptureViewController *)self isMessagesOnPhone])
  {
    double v16 = [(CFXCaptureViewController *)self cameraControls];
    double v17 = [v16 view];
    [(CFXCaptureViewController *)self CFX_cameraViewFinderUncroppedFrame];
    objc_msgSend(v17, "convertRect:toView:", 0);
    double v9 = v18;
    double v11 = v19;
    double v13 = v20;
    double v15 = v21;
  }
  double v22 = +[CFXEffect effectWithJTEffect:v6];
  BOOL v23 = [(CFXCaptureViewController *)self isMessagesOnPhone];
  double v24 = self;
  if (v23)
  {
    double v24 = [(CFXCaptureViewController *)self cameraControls];
  }
  BOOL v25 = +[CFXFullScreenTextEditViewController displayFullScreenTextEditorForEffect:inViewController:delegate:cameraViewWindowFrame:insertingEffect:](CFXFullScreenTextEditViewController, "displayFullScreenTextEditorForEffect:inViewController:delegate:cameraViewWindowFrame:insertingEffect:", v22, v24, self, v4, v9, v11, v13, v15);
  if (v23) {

  }
  double v26 = [(CFXCaptureViewController *)self effectBrowserContentPresenterViewController];

  if (v26)
  {
    double v27 = [(CFXCaptureViewController *)self view];
    double v28 = [(CFXCaptureViewController *)self effectBrowserContentPresenterViewController];
    double v29 = [v28 view];
    [v27 bringSubviewToFront:v29];
  }
  return v25;
}

- (void)updateFullScreenTextEditorLayout
{
  if (+[CFXFullScreenTextEditViewController isFullScreenTextEditorPresented])
  {
    BOOL v3 = [(CFXCaptureViewController *)self view];
    [(CFXCaptureViewController *)self CFX_cameraViewFinderUncroppedFrame];
    objc_msgSend(v3, "convertRect:toView:", 0);
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    +[CFXFullScreenTextEditViewController notifyCameraViewWindowFrameChanged:](CFXFullScreenTextEditViewController, "notifyCameraViewWindowFrameChanged:", v5, v7, v9, v11);
  }
}

- (BOOL)shouldUseFaceTracking
{
  id v2 = +[JFXVideoCameraController sharedInstance];
  char v3 = [v2 faceTrackingEnabled];

  return v3;
}

- (BOOL)isFaceTrackingDataAvailable
{
  BOOL v2 = [(CFXCaptureViewController *)self shouldUseFaceTracking];
  if (v2)
  {
    LOBYTE(v2) = +[JFXEffectEditingUtilities isFaceTrackingDataAvailable];
  }
  return v2;
}

- (void)enableAnimationForOverlayEffect:(id)a3
{
  v19[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (([v4 forceDisableLooping] & 1) == 0)
  {
    uint64_t v5 = *MEMORY[0x263F614D8];
    v19[0] = *MEMORY[0x263F61538];
    v19[1] = v5;
    uint64_t v6 = *MEMORY[0x263F614E8];
    v19[2] = *MEMORY[0x263F614E0];
    _OWORD v19[3] = v6;
    double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
    double v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    int v9 = [v8 BOOLForKey:@"CFX_DisableFaceTimeAnimationLooping"];

    double v10 = [v4 effectID];
    int v11 = [v7 containsObject:v10];

    if (!v11 || v9)
    {
      [v4 setForceDisableLooping:1];
      id v18 = v4;
      double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v18 count:1];
      long long v15 = CFXEffectPreviewStartAtNextRenderTime;
      uint64_t v16 = 0;
      +[JFXEffectEditingUtilities enableAnimationForEffects:v13 animationStartTime:&v15];

      double v14 = [(CFXCaptureViewController *)self runOnceAnimatedOverlays];
      [v14 addObject:v4];
    }
    else
    {
      [v4 setForceDisableLooping:0];
      id v17 = v4;
      double v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
      long long v15 = CFXEffectPreviewStartAtNextRenderTime;
      uint64_t v16 = 0;
      +[JFXEffectEditingUtilities enableAnimationForEffects:v12 animationStartTime:&v15];

      [v4 setParameter:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F61670]];
    }
  }
}

- (BOOL)passThroughContainerView:(id)a3 shouldHandleTouchWithinView:(id)a4 atPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v8 = a4;
  if (isStreamingMode([(CFXCaptureViewController *)self captureMode])
    && [(CFXCaptureViewController *)self appliedDirectOverlayEditingGestures])
  {
    BOOL v9 = 1;
  }
  else if (isStreamingMode([(CFXCaptureViewController *)self captureMode]) {
         && ([(CFXCaptureViewController *)self cameraViewController],
  }
             double v10 = objc_claimAutoreleasedReturnValue(),
             [v10 containerView],
             id v11 = (id)objc_claimAutoreleasedReturnValue(),
             v11,
             v10,
             v11 == v8))
  {
    double v14 = [(CFXCaptureViewController *)self composition];
    long long v15 = [v14 jtEffectsForType:2];

    if ([v15 count])
    {
      uint64_t v16 = [(CFXCaptureViewController *)self liveCaptureContainer];
      id v17 = [(CFXCaptureViewController *)self view];
      objc_msgSend(v16, "convertPoint:fromView:", v17, x, y);
      double v19 = v18;
      double v21 = v20;

      double v22 = [(CFXCaptureViewController *)self liveCaptureContainer];
      [v22 bounds];
      double v24 = 44.0 / v23;
      double v26 = 44.0 / v25;

      double v27 = [(CFXCaptureViewController *)self liveCaptureContainer];
      [v27 bounds];
      long long v33 = *MEMORY[0x263F010E0];
      uint64_t v34 = *(void *)(MEMORY[0x263F010E0] + 16);
      unint64_t v32 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v15, &v33, 1, v19, v21, v28, v29, v30, v31, v24, v26);

      BOOL v9 = v32 != 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    id v12 = [(CFXCaptureViewController *)self view];
    BOOL v9 = v12 != v8;
  }
  return v9;
}

- (void)updateControlVisibilityAnimated:(BOOL)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice", a3);
  if ([v4 userInterfaceIdiom])
  {
  }
  else
  {
    int64_t v5 = [(CFXCaptureViewController *)self captureMode];

    if (v5 == 2)
    {
      uint64_t v6 = [(CFXCaptureViewController *)self flashButton];
      uint64_t v7 = [v6 isExpanded];

      id v8 = [(CFXCaptureViewController *)self elapsedTimeView];
      [v8 setHidden:v7];

      id v14 = [(CFXCaptureViewController *)self doneButton];
      [v14 setHidden:v7];
      goto LABEL_8;
    }
  }
  if ([(CFXCaptureViewController *)self captureMode] == 2)
  {
    BOOL v9 = [(CFXCaptureViewController *)self topBar];
    uint64_t v10 = [v9 shouldHideElapsedTimeViewForGraphConfiguration:0];
    id v11 = [(CFXCaptureViewController *)self elapsedTimeView];
    [v11 setHidden:v10];
  }
  id v14 = [(CFXCaptureViewController *)self topBar];
  uint64_t v12 = [v14 shouldHideDoneButtonForGraphConfiguration:0];
  double v13 = [(CFXCaptureViewController *)self doneButton];
  [v13 setHidden:v12];

LABEL_8:
}

- (void)JFX_orientationMonitorDeviceInterfaceOrientationNotification:(id)a3
{
  id v4 = a3;
  [(CFXCaptureViewController *)self configureCaptureControlsForOrientationWithAnimation:1];
  int64_t v5 = +[JFXOrientationMonitor deviceInterfaceOrientation];
  uint64_t v6 = [v4 userInfo];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"kJFXOrientationMonitorDeviceInterfaceOrientationPreviousOrientationUserInfoKey"];
  uint64_t v8 = [v7 integerValue];

  if ([(CFXCaptureViewController *)self captureMode] == 1
    && ![(CFXCaptureViewController *)self isExternalCaptureSessionAnExternalCamera])
  {
    [(CFXCaptureViewController *)self CFX_adjustOverlaysForCaptureOrientationChanged:v5 oldCaptureOrientation:v8];
  }
}

- (void)JFX_orientationMonitorInterfaceOrientationNotification:(id)a3
{
  if ([(CFXCaptureViewController *)self captureMode] != 1) {
    [(CFXCaptureViewController *)self CFX_setFrameAndRenderSizes];
  }
  [(CFXCaptureViewController *)self configureUIForOrientation];
}

- (void)doneButtonTapped:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = CFXLog_action();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = [(CFXCaptureViewController *)self composition];
    uint64_t v6 = [v5 jtEffects];
    uint64_t v7 = +[CFXActionLogging actionLogAsJSONForEvent:@"canceled camera session" atLocation:@"live" withEffectStack:v6];
    int v11 = 138543362;
    uint64_t v12 = v7;
    _os_log_impl(&dword_234C41000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);
  }
  uint64_t v8 = [(CFXCaptureViewController *)self cameraViewController];
  [v8 stopRenderingCameraFrames];

  BOOL v9 = [(CFXCaptureViewController *)self delegate];

  if (v9)
  {
    uint64_t v10 = [(CFXCaptureViewController *)self delegate];
    [v10 captureViewControllerDoneButtonWasTapped:self];
  }
}

- (void)CFX_setFrameAndRenderSizes
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  uint64_t v3 = +[JFXOrientationMonitor interfaceOrientation];
  id v4 = +[JFXVideoCameraController sharedInstance];
  uint64_t v5 = [v4 cameraMode];

  [(CFXCaptureViewController *)self captureMode];
  double v6 = JFXUncroppedFrameSizeForCameraModeAndOrientation(v5, v3);
  double v8 = v7;
  double v9 = JFXCroppedFrameSizeForCameraModeAndOrientation(v5, v3);
  double v11 = v10;
  uint64_t v12 = +[CFXMediaSettings sharedInstance];
  objc_msgSend(v12, "setRenderSize:", v9, v11);

  uint64_t v13 = +[CFXMediaSettings sharedInstance];
  objc_msgSend(v13, "setFrameSize:", v6, v8);

  id v14 = JFXLog_camera();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v37.CGFloat width = v6;
    v37.double height = v8;
    long long v15 = NSStringFromCGSize(v37);
    v38.CGFloat width = v9;
    v38.double height = v11;
    uint64_t v16 = NSStringFromCGSize(v38);
    *(_DWORD *)CGAffineTransform buf = 138543618;
    *(void *)&uint8_t buf[4] = v15;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v16;
    _os_log_impl(&dword_234C41000, v14, OS_LOG_TYPE_DEFAULT, "frameSize: %{public}@, renderSize: %{public}@", buf, 0x16u);
  }
  id v17 = objc_alloc_init(CFXEffectComposition);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v29 = self;
  double v18 = [(CFXCaptureViewController *)self composition];
  double v19 = [v18 effects];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v31;
    uint64_t v23 = MEMORY[0x263F010E0];
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v31 != v22) {
          objc_enumerationMutation(v19);
        }
        double v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        double v26 = [v25 jtEffect];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          double v28 = [v25 jtEffect];
          *(_OWORD *)CGAffineTransform buf = *(_OWORD *)v23;
          *(void *)&uint8_t buf[16] = *(void *)(v23 + 16);
          objc_msgSend(v28, "updateRenderSizeMaintainingAppearance:withComponentTime:", buf, v9, v11);
        }
        [(CFXEffectComposition *)v17 addEffect:v25 completion:0];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v21);
  }

  [(CFXCaptureViewController *)v29 setComposition:v17];
}

- (BOOL)isMessagesOnPhone
{
  if ([(CFXCaptureViewController *)self captureMode] == 1) {
    return 0;
  }
  uint64_t v3 = [MEMORY[0x263F1C5C0] currentDevice];
  BOOL v2 = [v3 userInterfaceIdiom] == 0;

  return v2;
}

- (void)CFX_toggleCaptureUI
{
  uint64_t v3 = [(CFXCaptureViewController *)self cameraControls];
  id v4 = [v3 view];
  int v5 = [v4 isHidden];

  if ((CFXCaptureCapabilitiesIsCTMSupported() & 1) == 0)
  {
    if (v5) {
      BOOL v6 = isStreamingMode([(CFXCaptureViewController *)self captureMode]);
    }
    else {
      BOOL v6 = 1;
    }
    double v7 = [(CFXCaptureViewController *)self topBar];
    [v7 setHidden:v6];
  }
  id v9 = [(CFXCaptureViewController *)self cameraControls];
  double v8 = [v9 view];
  [v8 setHidden:v5 ^ 1u];
}

- (int64_t)CFX_captureFlashModeForCAMFlashMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (int64_t)CFX_captureTorchModeForCAMFlashMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (int64_t)CFX_camFlashModeForCaptureFlashMode:(int64_t)a3
{
  int64_t v3 = 1;
  if (a3 != 1) {
    int64_t v3 = 2;
  }
  if (a3) {
    return v3;
  }
  else {
    return 0;
  }
}

- (void)CFX_handleZoomPinchGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  [(CFXCaptureViewController *)self CFX_getCaptureDevice:&v11 captureDevicePosition:&v10 captureMode:&v9];
  if (v10 == 1)
  {
    int v5 = [(CFXCaptureViewController *)self zoomControl];
    BOOL v6 = [(CFXCaptureViewController *)self canToggleBetweenZoomFactorsForZoomControl:v5];

    double v7 = [(CFXCaptureViewController *)self cameraViewController];
    char v8 = [v7 isCapturing];

    if (v6 && (v8 & 1) == 0) {
      [(CFXCaptureViewController *)self CFX_performFrontCameraZoomWithPinchGestureRecognizer:v4];
    }
  }
  else if (!v10)
  {
    [(CFXCaptureViewController *)self CFX_performBackCameraZoomWithPinchGestureRecognizer:v4];
  }
}

- (void)CFX_performBackCameraZoomWithPinchGestureRecognizer:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [v17 state];
  if ((unint64_t)(v4 - 3) >= 3)
  {
    if (v4 == 2)
    {
      [(CFXCaptureViewController *)self zoomFactorAtPinchStart];
      double v11 = v10;
      [v17 scale];
      double v13 = v11 * v12;
      [(CFXCaptureViewController *)self CFX_maxZoomForCamera];
      if (v13 <= v14) {
        double v14 = v13;
      }
      if (v14 >= 1.0) {
        double v15 = v14;
      }
      else {
        double v15 = 1.0;
      }
      uint64_t v16 = [(CFXCaptureViewController *)self zoomControl];
      [v16 setZoomFactor:v15];

      [(CFXCaptureViewController *)self CFX_setZoomSliderFromZoomFactor:v15];
      BOOL v6 = +[JFXVideoCameraController sharedInstance];
      [v6 setZoomFactor:v15];
      goto LABEL_13;
    }
    if (v4 != 1) {
      goto LABEL_14;
    }
    char v8 = +[JFXVideoCameraController sharedInstance];
    [v8 zoomFactor];
    -[CFXCaptureViewController setZoomFactorAtPinchStart:](self, "setZoomFactorAtPinchStart:");

    uint64_t v9 = [(CFXCaptureViewController *)self zoomSlider];
    [v9 makeVisibleAnimated:0];

    int v5 = [(CFXCaptureViewController *)self zoomSlider];
    BOOL v6 = v5;
    uint64_t v7 = 1;
  }
  else
  {
    int v5 = [(CFXCaptureViewController *)self zoomSlider];
    BOOL v6 = v5;
    uint64_t v7 = 0;
  }
  [v5 setVisibilityTimerSuspended:v7];
LABEL_13:

LABEL_14:
}

- (void)CFX_performFrontCameraZoomWithPinchGestureRecognizer:(id)a3
{
  id v13 = a3;
  BOOL v4 = [v13 state] == 1;
  int v5 = v13;
  if (v4)
  {
    [v13 scale];
    if (v6 >= 1.0)
    {
      BOOL v8 = 0;
    }
    else
    {
      uint64_t v7 = [(CFXCaptureViewController *)self zoomControl];
      BOOL v8 = [v7 zoomButtonSymbol] == 1;
    }
    [v13 scale];
    if (v9 <= 1.0)
    {
      BOOL v11 = 0;
    }
    else
    {
      double v10 = [(CFXCaptureViewController *)self zoomControl];
      BOOL v11 = [v10 zoomButtonSymbol] == 0;
    }
    int v5 = v13;
    if (v8 || v11)
    {
      double v12 = [(CFXCaptureViewController *)self zoomControl];
      [(CFXCaptureViewController *)self toggleBetweenZoomFactorsForZoomControl:v12];

      int v5 = v13;
    }
  }
}

- (void)completedVideoRecordWithURL:(id)a3 metadataURL:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(CFXCaptureViewController *)self composition];
  double v9 = [v8 jtEffects];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __68__CFXCaptureViewController_completedVideoRecordWithURL_metadataURL___block_invoke;
  v12[3] = &unk_264C0CAE0;
  id v13 = v6;
  id v14 = v7;
  double v15 = self;
  id v10 = v7;
  id v11 = v6;
  +[CFXClip createClipWithLocalURL:v11 effectStack:v9 isVideo:1 maximumImageDimension:0 completionHandler:v12];
}

void __68__CFXCaptureViewController_completedVideoRecordWithURL_metadataURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__CFXCaptureViewController_completedVideoRecordWithURL_metadataURL___block_invoke_2;
  v7[3] = &unk_264C0C228;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  id v10 = v4;
  uint64_t v11 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v7);
}

void __68__CFXCaptureViewController_completedVideoRecordWithURL_metadataURL___block_invoke_2(uint64_t a1)
{
  BOOL v2 = +[JFXVideoCameraController sharedInstance];
  uint64_t v3 = [v2 cameraPosition];

  id v4 = +[JFXVideoCameraController sharedInstance];
  uint64_t v5 = [v4 cameraMode];

  id v8 = [[CFXMediaItem alloc] initWithCameraMode:v5 clip:*(void *)(a1 + 32) assetMediaURL:*(void *)(a1 + 40) assetMetadataURL:*(void *)(a1 + 48) cameraPosition:v3];
  id v6 = [*(id *)(a1 + 56) cameraViewController];
  [v6 stopRenderingCameraFrames];

  id v7 = [*(id *)(a1 + 56) delegate];
  [v7 captureViewController:*(void *)(a1 + 56) didCaptureMediaItem:v8];

  if (CFXCaptureCapabilitiesIsCTMSupported()
    && [*(id *)(a1 + 56) switchedToVideoMode])
  {
    [*(id *)(a1 + 56) setCaptureMode:0];
    [*(id *)(a1 + 56) setSwitchedToVideoMode:0];
    [*(id *)(a1 + 56) configureCTMUIForCaptureMode];
  }
}

- (CGAffineTransform)overlayTransformForLocalViewfinder
{
  CGRect result = [(CFXCaptureViewController *)self captureMode];
  if (result == (CGAffineTransform *)1)
  {
    unsigned int v5 = +[JFXOrientationMonitor deviceInterfaceOrientation];
    if (v5 > 4) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = qword_234D61828[v5];
    }
    CGFloat v9 = PVCardinalAnglesDouble_0[v6];
    return CGAffineTransformMakeRotation(retstr, v9);
  }
  else
  {
    uint64_t v7 = MEMORY[0x263F000D0];
    long long v8 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&retstr->CGFloat c = v8;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v7 + 32);
  }
  return result;
}

- (void)updateUIForVideoRecording:(BOOL)a3
{
  BOOL v3 = a3;
  -[CFXCaptureViewController setIsRecording:](self, "setIsRecording:");
  double v5 = (double)!v3;
  uint64_t v6 = [(CFXCaptureViewController *)self flashButton];
  [v6 setAlpha:v5];

  uint64_t v7 = [(CFXCaptureViewController *)self doneButton];
  [v7 setAlpha:v5];

  id v9 = [(CFXCaptureViewController *)self controlStatusBar];
  long long v8 = [v9 flashIndicator];
  [v8 setAlpha:v5];
}

- (void)CFX_hideAppStripUpperBackgroundView:(BOOL)a3
{
  BOOL v3 = a3;
  id v12 = [MEMORY[0x263F1C5C0] currentDevice];
  if (![v12 userInterfaceIdiom])
  {
    double v5 = [MEMORY[0x263F1C920] mainScreen];
    [v5 bounds];
    if ((uint64_t)v6 == 568)
    {
    }
    else
    {
      uint64_t v7 = [MEMORY[0x263F1C920] mainScreen];
      [v7 bounds];
      uint64_t v9 = (uint64_t)v8;

      if (v9 != 568) {
        return;
      }
    }
    id v10 = [(CFXCaptureViewController *)self delegate];
    id v12 = [v10 cameraControlsViewControllerForCaptureViewController:self];

    uint64_t v11 = [v12 appStripBackgroundView];
    [v11 setHidden:v3];
  }
}

- (void)startVideoRecording
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  [(CFXCaptureViewController *)self removeEffectEditorAnimated:1];
  [(CFXCaptureViewController *)self removeAnimojiTrackingReticle];
  BOOL v3 = [(CFXCaptureViewController *)self cameraViewController];
  objc_msgSend(v3, "startVideoRecordingWithFlashMode:", -[CFXCaptureViewController flashMode](self, "flashMode"));

  id v4 = [(CFXCaptureViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    double v6 = [(CFXCaptureViewController *)self delegate];
    [v6 captureViewControllerDidStartVideoRecording:self];
  }
  [(CFXCaptureViewController *)self CFX_hideAppStripUpperBackgroundView:1];
  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    uint64_t v7 = [(CFXCaptureViewController *)self elapsedTimeView];
    [v7 setHidden:0];

    double v8 = [(CFXCaptureViewController *)self elapsedTimeView];
    [v8 setBackgroundStyle:1 animated:1];

    uint64_t v16 = 0;
    *(void *)CGAffineTransform buf = 0;
    uint64_t v15 = 0;
    [(CFXCaptureViewController *)self CFX_getCaptureDevice:buf captureDevicePosition:&v16 captureMode:&v15];
    BOOL v9 = v16 != 1;
    id v10 = [(CFXCaptureViewController *)self zoomControl];
    [v10 setEnabled:v9];
  }
  uint64_t v11 = CFXLog_action();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(CFXCaptureViewController *)self composition];
    id v13 = [v12 jtEffects];
    id v14 = +[CFXActionLogging actionLogAsJSONForEvent:@"started video capture" atLocation:@"live" withEffectStack:v13];
    *(_DWORD *)CGAffineTransform buf = 138543362;
    *(void *)&uint8_t buf[4] = v14;
    _os_log_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

- (void)stopVideoRecording:(id)a3
{
  id v4 = a3;
  char v5 = [(CFXCaptureViewController *)self cameraViewController];
  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __47__CFXCaptureViewController_stopVideoRecording___block_invoke;
  id v12 = &unk_264C0A440;
  id v13 = self;
  id v14 = v4;
  id v6 = v4;
  [v5 stopVideoRecording:&v9];

  if (CFXCaptureCapabilitiesIsCTMSupported())
  {
    uint64_t v7 = [(CFXCaptureViewController *)self elapsedTimeView];
    [v7 setBackgroundStyle:3 animated:1];

    double v8 = [(CFXCaptureViewController *)self zoomControl];
    [v8 setEnabled:1];
  }
}

void __47__CFXCaptureViewController_stopVideoRecording___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  void v10[2] = __47__CFXCaptureViewController_stopVideoRecording___block_invoke_2;
  v10[3] = &unk_264C0B2C8;
  id v11 = v5;
  id v12 = v6;
  uint64_t v7 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = v7;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __47__CFXCaptureViewController_stopVideoRecording___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  BOOL v2 = (uint64_t *)(a1 + 32);
  if (*(void *)(a1 + 32))
  {
    BOOL v3 = JFXLog_core();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __47__CFXCaptureViewController_stopVideoRecording___block_invoke_2_cold_1(a1, v2, v3);
    }

    [*(id *)(a1 + 48) completedVideoRecordWithURL:*(void *)(a1 + 32) metadataURL:*(void *)(a1 + 40)];
  }
  id v4 = [*(id *)(a1 + 48) delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [*(id *)(a1 + 48) delegate];
    [v6 captureViewControllerDidStopVideoRecording:*(void *)(a1 + 48)];
  }
  objc_msgSend(*(id *)(a1 + 48), "CFX_hideAppStripUpperBackgroundView:", 0);
  uint64_t v7 = CFXLog_action();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [*(id *)(a1 + 48) composition];
    id v9 = [v8 jtEffects];
    uint64_t v10 = +[CFXActionLogging actionLogAsJSONForEvent:@"finished video capture" atLocation:@"live" withEffectStack:v9];
    int v12 = 138543362;
    uint64_t v13 = v10;
    _os_log_impl(&dword_234C41000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v12, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)JFX_capturePhoto
{
  BOOL v3 = [(CFXCaptureViewController *)self cameraViewController];
  int64_t v4 = [(CFXCaptureViewController *)self flashMode];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke;
  v5[3] = &unk_264C0CB58;
  void v5[4] = self;
  [v3 capturePhotoWithFlashMode:v4 completion:v5];
}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_2;
  v24[3] = &unk_264C0CB08;
  v24[4] = *(void *)(a1 + 32);
  uint64_t v10 = (void (**)(void, void))MEMORY[0x237DD15A0](v24);
  if (!v7 || v9)
  {
    uint64_t v14 = JFXLog_camera();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_cold_1(v9, v14);
    }

    v10[2](v10, 0);
  }
  else
  {
    id v11 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_139;
    block[3] = &unk_264C0B2C8;
    id v12 = v7;
    uint64_t v13 = *(void *)(a1 + 32);
    id v20 = v12;
    uint64_t v21 = v13;
    id v22 = v8;
    uint64_t v23 = v10;
    dispatch_async(v11, block);
  }
  uint64_t v15 = CFXLog_action();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = [*(id *)(a1 + 32) composition];
    id v17 = [v16 jtEffects];
    uint64_t v18 = +[CFXActionLogging actionLogAsJSONForEvent:@"taken photo" atLocation:@"live" withEffectStack:v17];
    *(_DWORD *)CGAffineTransform buf = 138543362;
    double v26 = v18;
    _os_log_impl(&dword_234C41000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_3;
  v5[3] = &unk_264C09F10;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_3(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) cameraViewController];
  [v2 stopRenderingCameraFrames];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 captureViewController:*(void *)(a1 + 32) didCaptureMediaItem:*(void *)(a1 + 40)];
}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_139(id *a1)
{
  BOOL v2 = +[JFXVideoCameraController sharedInstance];
  uint64_t v3 = [v2 cameraMode];

  id v4 = +[JFXVideoCameraController sharedInstance];
  uint64_t v5 = [v4 cameraPosition];

  id v6 = a1[4];
  id v7 = [a1[5] composition];
  id v8 = [v7 jtEffects];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_2_140;
  v9[3] = &unk_264C0CB30;
  uint64_t v13 = v3;
  id v10 = a1[4];
  id v11 = a1[6];
  uint64_t v14 = v5;
  id v12 = a1[7];
  +[CFXClip createClipWithLocalURL:v6 effectStack:v8 isVideo:0 maximumImageDimension:0 completionHandler:v9];
}

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_2_140(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [[CFXMediaItem alloc] initWithCameraMode:a1[7] clip:v3 assetMediaURL:a1[4] assetMetadataURL:a1[5] cameraPosition:a1[8]];

  (*(void (**)(void))(a1[6] + 16))();
}

- (void)CFX_respondToShutterPress
{
  [(CFXCaptureViewController *)self removeEffectEditorAnimated:0];
  [(CFXCaptureViewController *)self removeAnimojiTrackingReticle];
  id v3 = [(CFXCaptureViewController *)self editingOverlayWithGestureGroup];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_group_notify(v3, MEMORY[0x263EF83A0], block);
}

void __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) captureMode];
  id v3 = *(void **)(a1 + 32);
  if (v2 == 2)
  {
    id v4 = [v3 cameraViewController];
    int v5 = [v4 isCapturing];

    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_2;
    v22[3] = &unk_264C0A0C0;
    v22[4] = *(void *)(a1 + 32);
    char v23 = v5;
    id v6 = (void *)MEMORY[0x237DD15A0](v22);
    unsigned int v7 = v5 ^ 1;
    id v8 = [*(id *)(a1 + 32) controlStatusBar];
    id v9 = [v8 flashIndicator];
    [v9 setAlpha:(double)v7];

    id v10 = [*(id *)(a1 + 32) flashButton];
    [v10 setAlpha:(double)v7];

    id v11 = [*(id *)(a1 + 32) doneButton];
    [v11 setAlpha:(double)v7];

    if (v7)
    {
      inCompletionBlock[0] = MEMORY[0x263EF8330];
      inCompletionBlock[1] = 3221225472;
      inCompletionBlock[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_6;
      inCompletionBlock[3] = &unk_264C0A3C8;
      inCompletionBlock[4] = *(void *)(a1 + 32);
      double v19 = v6;
      id v17 = v6;
      AudioServicesPlaySystemSoundWithCompletion(0x45Du, inCompletionBlock);
      uint64_t v16 = v19;
    }
    else
    {
      id v12 = *(void **)(a1 + 32);
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_4;
      _OWORD v20[3] = &unk_264C0A3F0;
      uint64_t v21 = v6;
      id v13 = v6;
      [v12 stopVideoRecording:v20];
      uint64_t v14 = [*(id *)(a1 + 32) elapsedTimeView];
      [v14 resetTimer];

      uint64_t v15 = [*(id *)(a1 + 32) elapsedTimeView];
      [v15 endTimer];

      uint64_t v16 = v21;
    }
  }
  else
  {
    objc_msgSend(v3, "JFX_capturePhoto");
  }
}

void __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 100000000);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_3;
  v3[3] = &unk_264C0A0C0;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);
}

uint64_t __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateZoomUIForCapturing:*(unsigned char *)(a1 + 40) == 0 animated:1];
}

void __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_4(uint64_t a1)
{
  inCompletionBlock[0] = MEMORY[0x263EF8330];
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_5;
  inCompletionBlock[3] = &unk_264C0A3F0;
  id v2 = *(id *)(a1 + 32);
  AudioServicesPlaySystemSoundWithCompletion(0x45Eu, inCompletionBlock);
}

uint64_t __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_6(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_7;
  v2[3] = &unk_264C0A3C8;
  id v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x263EF83A0], v2);
}

uint64_t __53__CFXCaptureViewController_CFX_respondToShutterPress__block_invoke_7(uint64_t a1)
{
  [*(id *)(a1 + 32) startVideoRecording];
  id v2 = [*(id *)(a1 + 32) elapsedTimeView];
  [v2 startTimer];

  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)configureCTMUIForCaptureMode
{
  int64_t v3 = [(CFXCaptureViewController *)self captureMode];
  BOOL v4 = v3 == 2;
  BOOL v5 = v3 != 2;
  BOOL v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  [(CFXCaptureViewController *)self dynamicShutterSettings];
  id v6 = [(CFXCaptureViewController *)self elapsedTimeView];
  [v6 setHidden:v5];

  *(void *)&long long v12 = v4;
  *((void *)&v12 + 1) = v5;
  BOOL v16 = v4;
  BOOL v11 = v4;
  void v10[2] = v14;
  v10[3] = v15;
  v10[0] = v12;
  v10[1] = v13;
  [(CFXCaptureViewController *)self setDynamicShutterSettings:v10];
  unsigned int v7 = [(CFXCaptureViewController *)self dynamicShutterControl];
  [(CFXCaptureViewController *)self dynamicShutterSettings];
  [v7 setSettings:v9 animated:0];

  id v8 = [(CFXCaptureViewController *)self dynamicShutterControl];
  [v8 resetAnimated:0];
}

- (void)returnCTMUIToPhotoMode
{
  if (CFXCaptureCapabilitiesIsCTMSupported()
    && [(CFXCaptureViewController *)self switchedToVideoMode])
  {
    [(CFXCaptureViewController *)self setCaptureMode:0];
    [(CFXCaptureViewController *)self setSwitchedToVideoMode:0];
    [(CFXCaptureViewController *)self configureCTMUIForCaptureMode];
  }
}

- (BOOL)needsBlackBackgroundForCTMControls
{
  return ![(CFXCaptureViewController *)self captureMode]
      && [(CFXCaptureViewController *)self aspectRatioCrop] != 1;
}

- (void)dynamicShutterControlStopLockedRecording
{
  int64_t v3 = [(CFXCaptureViewController *)self delegate];
  id v5 = [v3 cameraControlsViewControllerForCaptureViewController:self];

  BOOL v4 = [v5 flipButton];
  [v4 setAlpha:1.0];

  [(CFXCaptureViewController *)self CFX_respondToShutterPress];
}

- (void)dynamicShutterControlDidShortPress:(id)a3
{
  id v4 = a3;
  if (![(CFXCaptureViewController *)self captureMode]) {
    [v4 setEnabled:0];
  }
  [(CFXCaptureViewController *)self CFX_respondToShutterPress];
}

- (void)dynamicShutterControlDidStart:(id)a3
{
  id v4 = [(CFXCaptureViewController *)self delegate];
  id v8 = [v4 cameraControlsViewControllerForCaptureViewController:self];

  id v5 = [v8 flipButton];
  [v5 setAlpha:0.0];

  if (![(CFXCaptureViewController *)self captureMode])
  {
    [(CFXCaptureViewController *)self setCaptureMode:2];
    [(CFXCaptureViewController *)self setSwitchedToVideoMode:1];
  }
  id v6 = [(CFXCaptureViewController *)self controlStatusBar];
  unsigned int v7 = [v6 flashIndicator];
  -[CFXCaptureViewController setTorchModeForFlashMode:](self, "setTorchModeForFlashMode:", [v7 flashMode]);

  [(CFXCaptureViewController *)self CFX_respondToShutterPress];
}

- (void)controlStatusBar:(id)a3 didCreateIndicatorForType:(unint64_t)a4
{
  if (!a4)
  {
    id v5 = [a3 flashIndicator];
    [v5 setFlashMode:2];
  }
}

- (void)controlStatusBar:(id)a3 didReceiveTapInIndicatorForType:(unint64_t)a4
{
  if (!a4) {
    [(CFXCaptureViewController *)self toggleCTMFlashButton];
  }
}

- (CFXCaptureViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CFXCaptureViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CFXControlsViewController)cameraControls
{
  return self->_cameraControls;
}

- (void)setCameraControls:(id)a3
{
}

- (void)setEffectBrowserContentPresenterViewController:(id)a3
{
}

- (int64_t)aspectRatioCrop
{
  return self->_aspectRatioCrop;
}

- (int64_t)captureMode
{
  return self->_captureMode;
}

- (void)setComposition:(id)a3
{
}

- (UIView)nonTransformedContainerView
{
  return self->_nonTransformedContainerView;
}

- (void)setNonTransformedContainerView:(id)a3
{
}

- (NSLayoutConstraint)captureControlsContainerHeightConstraint
{
  return self->_captureControlsContainerHeightConstraint;
}

- (void)setCaptureControlsContainerHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)captureControlsContainerWidthConstraint
{
  return self->_captureControlsContainerWidthConstraint;
}

- (void)setCaptureControlsContainerWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)captureControlsContainerTrailingConstraint
{
  return self->_captureControlsContainerTrailingConstraint;
}

- (void)setCaptureControlsContainerTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)captureControlsContainerLeadingConstraint
{
  return self->_captureControlsContainerLeadingConstraint;
}

- (void)setCaptureControlsContainerLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)captureControlsContainerTopConstraint
{
  return self->_captureControlsContainerTopConstraint;
}

- (void)setCaptureControlsContainerTopConstraint:(id)a3
{
}

- (UIView)liveCaptureContainer
{
  return self->_liveCaptureContainer;
}

- (void)setLiveCaptureContainer:(id)a3
{
}

- (UIView)liveCaptureContainerContainer
{
  return self->_liveCaptureContainerContainer;
}

- (void)setLiveCaptureContainerContainer:(id)a3
{
}

- (UIView)cameraControlsContainerView
{
  return self->_cameraControlsContainerView;
}

- (void)setCameraControlsContainerView:(id)a3
{
}

- (NSLayoutConstraint)topBarTopConstraint
{
  return self->_topBarTopConstraint;
}

- (void)setTopBarTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)topBarContaineHeightConstraint
{
  return self->_topBarContaineHeightConstraint;
}

- (void)setTopBarContaineHeightConstraint:(id)a3
{
}

- (CAMTopBar)topBar
{
  return self->_topBar;
}

- (void)setTopBar:(id)a3
{
}

- (CAMElapsedTimeView)elapsedTimeView
{
  return self->_elapsedTimeView;
}

- (void)setElapsedTimeView:(id)a3
{
}

- (PUReviewScreenDoneButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (CAMFlashButton)flashButton
{
  return self->_flashButton;
}

- (void)setFlashButton:(id)a3
{
}

- (CFXViewfinderFlipTransition)viewfinderFlipTransition
{
  return self->_viewfinderFlipTransition;
}

- (void)setViewfinderFlipTransition:(id)a3
{
}

- (CAMSnapshotView)liveCaptureContainerSnapshot
{
  return self->_liveCaptureContainerSnapshot;
}

- (void)setLiveCaptureContainerSnapshot:(id)a3
{
}

- (CAMZoomControl)zoomControl
{
  return self->_zoomControl;
}

- (void)setZoomControl:(id)a3
{
}

- (CAMZoomSlider)zoomSlider
{
  return self->_zoomSlider;
}

- (void)setZoomSlider:(id)a3
{
}

- (double)zoomFactorAtPinchStart
{
  return self->_zoomFactorAtPinchStart;
}

- (void)setZoomFactorAtPinchStart:(double)a3
{
  self->_zoomFactorAtPinchStart = a3;
}

- (BOOL)isRecording
{
  return self->_isRecording;
}

- (void)setIsRecording:(BOOL)a3
{
  self->_isRecording = a3;
}

- (BOOL)observingOrientationChanges
{
  return self->_observingOrientationChanges;
}

- (void)setObservingOrientationChanges:(BOOL)a3
{
  self->_observingOrientationChanges = a3;
}

- (unint64_t)appliedDirectOverlayEditingGestures
{
  return self->_appliedDirectOverlayEditingGestures;
}

- (void)setAppliedDirectOverlayEditingGestures:(unint64_t)a3
{
  self->_appliedDirectOverlayEditingGestures = a3;
}

- (BOOL)dockIsMagnified
{
  return self->_dockIsMagnified;
}

- (void)setDockIsMagnified:(BOOL)a3
{
  self->_dockIsMagnified = a3;
}

- (double)dockMagnifiedHeightDelta
{
  return self->_dockMagnifiedHeightDelta;
}

- (void)setDockMagnifiedHeightDelta:(double)a3
{
  self->_dockMagnifiedHeightDelta = a3;
}

- (CGRect)zoomControlFrame
{
  double x = self->_zoomControlFrame.origin.x;
  double y = self->_zoomControlFrame.origin.y;
  double width = self->_zoomControlFrame.size.width;
  double height = self->_zoomControlFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setZoomControlFrame:(CGRect)a3
{
  self->_zoomControlFrame = a3;
}

- (CGRect)zoomSliderFrame
{
  double x = self->_zoomSliderFrame.origin.x;
  double y = self->_zoomSliderFrame.origin.y;
  double width = self->_zoomSliderFrame.size.width;
  double height = self->_zoomSliderFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setZoomSliderFrame:(CGRect)a3
{
  self->_zoomSliderFrame = a3;
}

- (BOOL)captureContainerUncroppedFrameWasCalculatedWithContentRect
{
  return self->_captureContainerUncroppedFrameWasCalculatedWithContentRect;
}

- (void)setCaptureContainerUncroppedFrameWasCalculatedWithContentRect:(BOOL)a3
{
  self->_captureContainerUncroppedFrameWasCalculatedWithContentRect = a3;
}

- (BOOL)cameraIsFlipping
{
  return self->_cameraIsFlipping;
}

- (void)setCameraIsFlipping:(BOOL)a3
{
  self->_cameraIsFlipping = a3;
}

- (JFXPassThroughContainerView)effectEditorContainerView
{
  return self->_effectEditorContainerView;
}

- (void)setEffectEditorContainerView:(id)a3
{
}

- (CGRect)presentationRect
{
  double x = self->_presentationRect.origin.x;
  double y = self->_presentationRect.origin.y;
  double width = self->_presentationRect.size.width;
  double height = self->_presentationRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPresentationRect:(CGRect)a3
{
  self->_presentationRect = a3;
}

- (CGRect)externalUncroppedPresentationRect
{
  double x = self->_externalUncroppedPresentationRect.origin.x;
  double y = self->_externalUncroppedPresentationRect.origin.y;
  double width = self->_externalUncroppedPresentationRect.size.width;
  double height = self->_externalUncroppedPresentationRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setExternalUncroppedPresentationRect:(CGRect)a3
{
  self->_externalUncroppedPresentationRect = a3;
}

- (BOOL)configuredForOrientation
{
  return self->_configuredForOrientation;
}

- (void)setConfiguredForOrientation:(BOOL)a3
{
  self->_configuredForOrientation = a3;
}

- (CFXFaceReticleView)animojiTrackingLossReticle
{
  return self->_animojiTrackingLossReticle;
}

- (void)setAnimojiTrackingLossReticle:(id)a3
{
}

- (UIView)animojiReticleFacePromptView
{
  return self->_animojiReticleFacePromptView;
}

- (void)setAnimojiReticleFacePromptView:(id)a3
{
}

- (BOOL)isShowingAnimojiReticle
{
  return self->_isShowingAnimojiReticle;
}

- (void)setIsShowingAnimojiReticle:(BOOL)a3
{
  self->_isShowingAnimojiReticle = a3;
}

- (NSLayoutConstraint)facePromptLabelYConstraint
{
  return self->_facePromptLabelYConstraint;
}

- (void)setFacePromptLabelYConstraint:(id)a3
{
}

- (UIView)presentationView
{
  return self->_presentationView;
}

- (void)setPresentationView:(id)a3
{
}

- (CAMViewfinderReticleView)reticleView
{
  return self->_reticleView;
}

- (void)setReticleView:(id)a3
{
}

- (UIView)bottomControlsContainer
{
  return self->_bottomControlsContainer;
}

- (void)setBottomControlsContainer:(id)a3
{
}

- (CAMDynamicShutterControl)dynamicShutterControl
{
  return self->_dynamicShutterControl;
}

- (void)setDynamicShutterControl:(id)a3
{
}

- (CAMControlStatusBar)controlStatusBar
{
  return self->_controlStatusBar;
}

- (void)setControlStatusBar:(id)a3
{
}

- ($76EADD4ED24426C67044446678BAA581)dynamicShutterSettings
{
  long long v3 = *(_OWORD *)&self[20].var7;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[20].var5;
  *(_OWORD *)&retstr->var6 = v3;
  retstr->var8 = self[21].var0;
  long long v4 = *(_OWORD *)&self[20].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[20].var1;
  *(_OWORD *)&retstr->var2 = v4;
  return self;
}

- (void)setDynamicShutterSettings:(id *)a3
{
  *(_OWORD *)&self->_dynamicShutterSettings.tapBehavior = *(_OWORD *)&a3->var0;
  long long v4 = *(_OWORD *)&a3->var4;
  long long v3 = *(_OWORD *)&a3->var6;
  long long v5 = *(_OWORD *)&a3->var2;
  self->_dynamicShutterSettings.idleColor = a3->var8;
  *(_OWORD *)&self->_dynamicShutterSettings.allowsZoom = v4;
  *(_OWORD *)&self->_dynamicShutterSettings.ringStyle = v3;
  *(_OWORD *)&self->_dynamicShutterSettings.dragRightBehavior = v5;
}

- (BOOL)switchedToVideoMode
{
  return self->_switchedToVideoMode;
}

- (void)setSwitchedToVideoMode:(BOOL)a3
{
  self->_switchedToVideoMode = a3;
}

- (JFXThreadSafeArray)runOnceAnimatedOverlays
{
  return self->_runOnceAnimatedOverlays;
}

- (void)setRunOnceAnimatedOverlays:(id)a3
{
}

- (CFXLiveCaptureViewController)cameraViewController
{
  return self->_cameraViewController;
}

- (void)setCameraViewController:(id)a3
{
}

- (OS_dispatch_group)editingOverlayWithGestureGroup
{
  return self->_editingOverlayWithGestureGroup;
}

- (void)setEditingOverlayWithGestureGroup:(id)a3
{
}

- (BOOL)isExternalCaptureSessionAnExternalCamera
{
  return self->_isExternalCaptureSessionAnExternalCamera;
}

- (void)setIsExternalCaptureSessionAnExternalCamera:(BOOL)a3
{
  self->_isExternalCaptureSessionAnExternalCamera = a3;
}

- (CFXEffectEditorView)effectEditor
{
  return self->_effectEditor;
}

- (void)setEffectEditor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effectEditor, 0);
  objc_storeStrong((id *)&self->_editingOverlayWithGestureGroup, 0);
  objc_storeStrong((id *)&self->_cameraViewController, 0);
  objc_storeStrong((id *)&self->_runOnceAnimatedOverlays, 0);
  objc_storeStrong((id *)&self->_controlStatusBar, 0);
  objc_storeStrong((id *)&self->_dynamicShutterControl, 0);
  objc_storeStrong((id *)&self->_bottomControlsContainer, 0);
  objc_storeStrong((id *)&self->_reticleView, 0);
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_storeStrong((id *)&self->_facePromptLabelYConstraint, 0);
  objc_storeStrong((id *)&self->_animojiReticleFacePromptView, 0);
  objc_storeStrong((id *)&self->_animojiTrackingLossReticle, 0);
  objc_storeStrong((id *)&self->_effectEditorContainerView, 0);
  objc_storeStrong((id *)&self->_zoomSlider, 0);
  objc_storeStrong((id *)&self->_zoomControl, 0);
  objc_storeStrong((id *)&self->_liveCaptureContainerSnapshot, 0);
  objc_storeStrong((id *)&self->_viewfinderFlipTransition, 0);
  objc_storeStrong((id *)&self->_flashButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_elapsedTimeView, 0);
  objc_storeStrong((id *)&self->_topBar, 0);
  objc_storeStrong((id *)&self->_topBarContaineHeightConstraint, 0);
  objc_storeStrong((id *)&self->_topBarTopConstraint, 0);
  objc_storeStrong((id *)&self->_cameraControlsContainerView, 0);
  objc_storeStrong((id *)&self->_liveCaptureContainerContainer, 0);
  objc_storeStrong((id *)&self->_liveCaptureContainer, 0);
  objc_storeStrong((id *)&self->_captureControlsContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_captureControlsContainerLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_captureControlsContainerTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_captureControlsContainerWidthConstraint, 0);
  objc_storeStrong((id *)&self->_captureControlsContainerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_nonTransformedContainerView, 0);
  objc_storeStrong((id *)&self->_composition, 0);
  objc_storeStrong((id *)&self->_effectBrowserContentPresenterViewController, 0);
  objc_storeStrong((id *)&self->_cameraControls, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)effectEditorViewDidBeginEditing:(id)a3
{
  long long v3 = [(CFXCaptureViewController *)self editingOverlayWithGestureGroup];
  dispatch_group_enter(v3);
}

- (void)effectEditorViewDidEndEditing:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(CFXCaptureViewController *)self effectEditor];

  if (v5 == v4) {
    [(CFXCaptureViewController *)self removeEffectEditorAnimated:1];
  }
  if (isStreamingMode([(CFXCaptureViewController *)self captureMode]))
  {
    id v6 = [(CFXCaptureViewController *)self composition];
    unsigned int v7 = [v6 jtEffectsForType:2];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = v7;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v15;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v8);
          }
          -[CFXCaptureViewController enableAnimationForOverlayEffect:](self, "enableAnimationForOverlayEffect:", *(void *)(*((void *)&v14 + 1) + 8 * v12++), (void)v14);
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
  long long v13 = [(CFXCaptureViewController *)self editingOverlayWithGestureGroup];
  dispatch_group_leave(v13);
}

- (id)effectEditorView:(id)a3 effectAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  id v8 = [(CFXCaptureViewController *)self composition];
  uint64_t v9 = [v8 jtEffectsForType:2];

  if ([v9 count])
  {
    [v7 bounds];
    double v11 = 44.0 / v10;
    double v13 = 44.0 / v12;
    [v7 bounds];
    long long v21 = *MEMORY[0x263F010E0];
    uint64_t v22 = *(void *)(MEMORY[0x263F010E0] + 16);
    uint64_t v18 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v9, &v21, 1, x, y, v14, v15, v16, v17, v11, v13);
    if (v18)
    {
      uint64_t v19 = +[CFXEffect effectWithJTEffect:v18];
    }
    else
    {
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }

  return v19;
}

- (BOOL)effectEditorView:(id)a3 isEffectAtPoint:(CGPoint)a4 effect:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  v27[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  double v10 = [v9 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v12 = [v9 jtEffect];
    [v8 bounds];
    double v14 = 44.0 / v13;
    v27[0] = v12;
    double v16 = 44.0 / v15;
    double v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:1];
    [v8 bounds];
    long long v25 = *MEMORY[0x263F010E0];
    uint64_t v26 = *(void *)(MEMORY[0x263F010E0] + 16);
    uint64_t v22 = +[JFXEffectEditingUtilities hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:](JFXEffectEditingUtilities, "hitTestOverlaysAtPosterFrame:atPoint:relativeToBounds:atTime:adjustForMinimumSize:normalizedMinimumSize:", v17, &v25, 1, x, y, v18, v19, v20, v21, v14, v16);

    BOOL v23 = v22 != 0;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (void)effectEditorView:(id)a3 didEditTextForEffect:(id)a4 newText:(id)a5
{
  id v6 = a5;
  id v7 = [a4 jtEffect];
  +[JFXEffectEditingUtilities updateEffectText:v7 newText:v6];
}

- (void)effectEditorView:(id)a3 didRemoveEffect:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = JFXLog_effects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 jtEffect];
    id v8 = NSStringFromJFXEffectType([v7 type]);
    id v9 = [v5 localizedTitle];
    *(_DWORD *)CGAffineTransform buf = 138543618;
    double v13 = v8;
    __int16 v14 = 2114;
    double v15 = v9;
    _os_log_impl(&dword_234C41000, v6, OS_LOG_TYPE_DEFAULT, "Removing effect - type: %{public}@, name: %{public}@", buf, 0x16u);
  }
  double v10 = [(CFXCaptureViewController *)self composition];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __85__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_didRemoveEffect___block_invoke;
  void v11[3] = &unk_264C09FA8;
  v11[4] = self;
  [v10 removeEffect:v5 completion:v11];
}

void __85__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_didRemoveEffect___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v2 = *(void **)(a1 + 32);
  long long v3 = [v2 composition];
  [v2 effectCompositionDidChange:v3];

  id v4 = CFXLog_action();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [*(id *)(a1 + 32) composition];
    id v6 = [v5 jtEffects];
    id v7 = +[CFXActionLogging actionLogAsJSONForEvent:@"effect removed" atLocation:@"live" withEffectStack:v6];
    int v8 = 138543362;
    id v9 = v7;
    _os_log_impl(&dword_234C41000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v8, 0xCu);
  }
}

- (CGPoint)effectEditorView:(id)a3 spacingBetweenCenterPointOfEffect:(id)a4 point:(CGPoint)a5 relativeToBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v10 = a5.y;
  double v11 = a5.x;
  double v12 = objc_msgSend(a4, "jtEffect", a3);
  long long v19 = *MEMORY[0x263F010E0];
  uint64_t v20 = *(void *)(MEMORY[0x263F010E0] + 16);
  +[JFXEffectEditingUtilities spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:](JFXEffectEditingUtilities, "spacingBetweenCenterPointOfEffect:point:relativeToBounds:atTime:", v12, &v19, v11, v10, x, y, width, height);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double y = v18;
  result.double x = v17;
  return result;
}

- (void)effectEditorView:(id)a3 didMoveEffect:(id)a4 withTouchPoint:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  double v11 = +[JFXVideoCameraController sharedInstance];
  double v12 = [v11 mostRecentARMetadata];

  double v13 = [v10 jtEffect];
  if ([v13 type] == 2
    && [(CFXCaptureViewController *)self shouldUseFaceTracking])
  {
    double v14 = [v12 faceAnchor];

    if (v14)
    {
      double v15 = [v10 jtEffect];
      double v16 = [v15 trackingProps];
      uint64_t v17 = [v16 trackingType];

      [v9 bounds];
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      uint64_t v26 = [v12 faceAnchor];
      int64_t v27 = +[JFXOrientationMonitor interfaceOrientation];
      uint64_t v28 = [v15 playableAspectRatio];
      uint64_t v29 = [v15 playableAspectRatioPreservationMode];
      long long v37 = *MEMORY[0x263F010E0];
      long long v33 = v37;
      uint64_t v38 = *(void *)(MEMORY[0x263F010E0] + 16);
      uint64_t v30 = v38;
      int64_t v31 = +[JFXEffectEditingUtilities trackingTypeForOverlayPointIntersectionWithFaceRect:atTime:relativeTo:defaultTrackingType:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:](JFXEffectEditingUtilities, "trackingTypeForOverlayPointIntersectionWithFaceRect:atTime:relativeTo:defaultTrackingType:faceAnchor:transformAnimation:playableMediaContentMode:playableInterfaceOrientation:playableAspectRatio:playableAspectRatioPreservationMode:", &v37, v17, v26, 0, 1, v27, x, y, v19, v21, v23, v25, v28, v29);

      int64_t v32 = +[JFXOrientationMonitor interfaceOrientation];
      long long v37 = v33;
      uint64_t v38 = v30;
      if (+[JFXEffectEditingUtilities makeOverlayTrackedMaintainingAppearance:v15 atTime:&v37 newTrackingType:v31 arMetadata:v12 playableInterfaceOrientation:v32])
      {
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __98__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_didMoveEffect_withTouchPoint___block_invoke;
        block[3] = &unk_264C09F10;
        id v35 = v9;
        id v36 = v15;
        dispatch_async(MEMORY[0x263EF83A0], block);
      }
    }
  }
  else
  {
  }
}

void __98__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_didMoveEffect_withTouchPoint___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) trackingProps];
  objc_msgSend(v1, "notifyEffectTrackingDidChangeToType:", objc_msgSend(v2, "trackingType"));
}

- (void)effectEditorView:(id)a3 didTransformEffect:(id)a4 transform:(CGAffineTransform *)a5 relativeToBounds:(CGRect)a6
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  double v11 = objc_msgSend(a4, "jtEffect", a3);
  long long v12 = *(_OWORD *)&a5->c;
  v15[0] = *(_OWORD *)&a5->a;
  v15[1] = v12;
  v15[2] = *(_OWORD *)&a5->tx;
  long long v13 = *MEMORY[0x263F010E0];
  uint64_t v14 = *(void *)(MEMORY[0x263F010E0] + 16);
  +[JFXEffectEditingUtilities addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:](JFXEffectEditingUtilities, "addTransformToEffect:transform:relativeToBounds:time:restrictToBounds:", v11, v15, &v13, 1, x, y, width, height);
}

- (CGRect)effectEditorView:(id)a3 frameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v9 = a4;
  id v10 = [v9 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v12 = [v9 jtEffect];
    long long v25 = *MEMORY[0x263F010E0];
    uint64_t v26 = *(void *)(MEMORY[0x263F010E0] + 16);
    objc_msgSend(v12, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v25, 1, 1, 1, x, y, width, height);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v14 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGRect)effectEditorView:(id)a3 hitAreaBoundingFrameForEffect:(id)a4 adjustForMinimumSize:(BOOL)a5 relativeToBounds:(CGRect)a6
{
  BOOL v6 = a5;
  id v8 = a4;
  id v9 = [v8 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    double v11 = [v8 jtEffect];
    long long v12 = [(CFXCaptureViewController *)self cameraViewController];
    [v12 normalizedMinimumHitTestArea];
    long long v25 = *MEMORY[0x263F010E0];
    uint64_t v26 = *(void *)(MEMORY[0x263F010E0] + 16);
    objc_msgSend(v11, "hitAreaBoundingFrameAtTime:forcePosterFrame:includeDropShadow:adjustForMinimumSize:normalizedMinimumSize:relativeTo:basisOrigin:", &v25, 1, 1, v6, 1);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
  }
  else
  {
    double v14 = *MEMORY[0x263F001A8];
    double v16 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v20 = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v21 = v14;
  double v22 = v16;
  double v23 = v18;
  double v24 = v20;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (id)effectEditorView:(id)a3 overlayEffectFrameForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  id v7 = objc_msgSend(a4, "jtEffect", a3, a5.origin.x, a5.origin.y);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v10 = *MEMORY[0x263F010E0];
    uint64_t v11 = *(void *)(MEMORY[0x263F010E0] + 16);
    id v8 = +[JFXOverlayEffectFrame frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:](JFXOverlayEffectFrame, "frameWithEffect:relativeToSize:origin:time:forcePosterFrame:includeDropShadow:includeTextFrames:", v7, 1, &v10, 1, 1, 1, width, height);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)removeButtonRelativeBoundsIsViewSpace
{
  return 0;
}

- (CGPoint)effectEditorView:(id)a3 removeButtonPositionForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a4;
  long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v28.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v28.CGFloat c = v11;
  *(_OWORD *)&v28.tdouble x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  int64_t v12 = +[JFXOrientationMonitor deviceInterfaceOrientation];
  int64_t v13 = +[JFXOrientationMonitor interfaceOrientation];
  if ([(CFXCaptureViewController *)self captureMode] == 1) {
    [(CFXCaptureViewController *)self overlayTransformForLocalViewfinder];
  }
  if (v12 != v13)
  {
    double v14 = 0.0;
    double v15 = 0.0;
    if (v12 != 1)
    {
      if (v12 == 3)
      {
        double v15 = 1.57079633;
      }
      else if (v12 == 4)
      {
        double v15 = -1.57079633;
      }
      else
      {
        double v15 = 3.14159265;
        if (v12 != 2) {
          double v15 = 0.0;
        }
      }
    }
    if (v13 != 1)
    {
      if (v13 == 3)
      {
        double v14 = 1.57079633;
      }
      else if (v13 == 4)
      {
        double v14 = -1.57079633;
      }
      else
      {
        double v14 = 3.14159265;
        if (v13 != 2) {
          double v14 = 0.0;
        }
      }
    }
    double v16 = v15 - v14;
    double v17 = JFXLog_viewerUI();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      switch(v12)
      {
        case 1:
          long long v25 = @"UIInterfaceOrientationPortrait";
          break;
        case 3:
          long long v25 = @"UIInterfaceOrientationLandscapeRight";
          break;
        case 4:
          long long v25 = @"UIInterfaceOrientationLandscapeLeft";
          break;
        default:
          long long v25 = @"UIInterfaceOrientationPortraitUpsideDown";
          if (v12 != 2) {
            long long v25 = 0;
          }
          break;
      }
      switch(v13)
      {
        case 1:
          uint64_t v26 = @"UIInterfaceOrientationPortrait";
          break;
        case 3:
          uint64_t v26 = @"UIInterfaceOrientationLandscapeRight";
          break;
        case 4:
          uint64_t v26 = @"UIInterfaceOrientationLandscapeLeft";
          break;
        default:
          uint64_t v26 = @"UIInterfaceOrientationPortraitUpsideDown";
          if (v13 != 2) {
            uint64_t v26 = 0;
          }
          break;
      }
      LODWORD(v29.a) = 138412802;
      *(void *)((char *)&v29.a + 4) = v25;
      WORD2(v29.b) = 2112;
      *(void *)((char *)&v29.b + 6) = v26;
      HIWORD(v29.c) = 2048;
      v29.d = v16;
      _os_log_debug_impl(&dword_234C41000, v17, OS_LOG_TYPE_DEBUG, "removeButtonPositionForEffect deviceOrientation %@ windowInterfaceOrientation %@ rotation %f", (uint8_t *)&v29, 0x20u);
    }

    CGAffineTransform v27 = v28;
    CGAffineTransformRotate(&v29, &v27, v16);
    CGAffineTransform v28 = v29;
  }
  double v18 = [v10 jtEffect];
  *(_OWORD *)&v27.a = *MEMORY[0x263F010E0];
  v27.CGFloat c = *(CGFloat *)(MEMORY[0x263F010E0] + 16);
  CGAffineTransform v29 = v28;
  +[JFXEffectEditingUtilities removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:](JFXEffectEditingUtilities, "removeButtonPositionForEffect:atTime:atPosterFrameRelativeToBounds:viewCorrectionTransform:", v18, &v27, &v29, x, y, width, height);
  double v20 = v19;
  double v22 = v21;

  double v23 = v20;
  double v24 = v22;
  result.double y = v24;
  result.double x = v23;
  return result;
}

- (id)effectEditorView:(id)a3 textEditingPropertiesForEffect:(id)a4 relativeToBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v9 = objc_msgSend(a4, "jtEffect", a3);
  long long v12 = *MEMORY[0x263F010E0];
  uint64_t v13 = *(void *)(MEMORY[0x263F010E0] + 16);
  id v10 = +[JFXEffectEditingUtilities newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:](JFXEffectEditingUtilities, "newTextEditingPropertiesForEffect:relativeTo:atTime:withNewText:", v9, &v12, 0, x, y, width, height);

  return v10;
}

- (id)effectEditorView:(id)a3 textForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  id v5 = +[JFXEffectEditingUtilities textForEffect:v4];

  return v5;
}

- (void)effectEditorView:(id)a3 didBeginEditingTextForEffect:(id)a4
{
  objc_msgSend(a4, "jtEffect", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  +[JFXEffectEditingUtilities beginTextEditingForEffect:v4];
}

- (void)effectEditorView:(id)a3 didEndEditingTextForEffect:(id)a4 wasCancelled:(BOOL)a5
{
  id v5 = a4;
  BOOL v6 = [v5 jtEffect];
  +[JFXEffectEditingUtilities updateEffectToDefaultTextIfEmpty:v6];

  id v7 = [v5 jtEffect];

  +[JFXEffectEditingUtilities endTextEditingForEffect:v7];
}

- (BOOL)effectEditorView:(id)a3 shouldEditTextForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  BOOL v5 = +[JFXEffectEditingUtilities canEditTextForEffect:v4];

  return v5;
}

- (BOOL)effectEditorView:(id)a3 presentCustomTextEditingUI:(id)a4
{
  BOOL v5 = objc_msgSend(a4, "jtEffect", a3);
  [(CFXCaptureViewController *)self presentFullScreenTextEditorForEffect:v5 insertingEffect:0];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __96__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_presentCustomTextEditingUI___block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
  return 1;
}

uint64_t __96__CFXCaptureViewController_EffectEditingAdditions__effectEditorView_presentCustomTextEditingUI___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeEffectEditorAnimated:1];
}

- (unint64_t)effectEditorView:(id)a3 maximumTextLengthForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  unint64_t v5 = +[JFXEffectEditingUtilities maximumTextLengthForEffect:v4];

  return v5;
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingDataAvailableForEffect:(id)a4
{
  id v4 = objc_msgSend(a4, "jtEffect", a3);
  int v5 = [v4 type];

  if (v5 != 2) {
    return 0;
  }
  return +[JFXEffectEditingUtilities isFaceTrackingDataAvailable];
}

- (BOOL)effectEditorView:(id)a3 isFaceTrackingEffect:(id)a4
{
  id v4 = a4;
  int v5 = [v4 jtEffect];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v4 jtEffect];
    char v8 = [v7 isCurrentlyTracking];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)fullScreenTextEditViewController:(id)a3 shouldDisableEditingAnimationForEffect:(id)a4
{
  memset(&v5[1], 0, sizeof(CGAffineTransform));
  [(CFXCaptureViewController *)self overlayTransformForLocalViewfinder];
  v5[0] = v5[1];
  return !CGAffineTransformIsIdentity(v5);
}

- (void)fullScreenTextEditViewController:(id)a3 didBeginAnimationBeforeEditingEffect:(id)a4 completion:(id)a5
{
  id v7 = a5;
  char v8 = [a4 jtEffect];
  [v8 setHidden:1];

  id v9 = [(CFXCaptureViewController *)self cameraViewController];
  [v9 executeAfterNextFrameIsRendered:v7];
}

- (void)fullScreenTextEditViewController:(id)a3 didBeginEditingEffect:(id)a4
{
  objc_msgSend(a4, "jtEffect", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setHidden:1];
}

- (void)fullScreenTextEditViewController:(id)a3 willBeginAnimationAfterEditingEffect:(id)a4 updatedText:(id)a5
{
  id v6 = a5;
  id v7 = [a4 jtEffect];
  +[JFXEffectEditingUtilities updateEffectText:v7 newText:v6];
}

- (void)fullScreenTextEditViewController:(id)a3 didFinishAnimationAfterEditingEffect:(id)a4 completion:(id)a5
{
  id v7 = a5;
  char v8 = [a4 jtEffect];
  [v8 setHidden:0];

  id v9 = [(CFXCaptureViewController *)self cameraViewController];
  [v9 executeAfterNextFrameIsRendered:v7];
}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingEffect:(id)a4 withUpdatedText:(id)a5
{
  id v13 = a4;
  id v7 = a5;
  char v8 = [v13 jtEffect];
  +[JFXEffectEditingUtilities updateEffectText:v8 newText:v7];

  id v9 = [v13 jtEffect];
  [v9 setHidden:0];

  if (isStreamingMode([(CFXCaptureViewController *)self captureMode]))
  {
    id v10 = [v13 jtEffect];
    int v11 = [v10 type];

    if (v11 == 2)
    {
      long long v12 = [v13 jtEffect];
      [(CFXCaptureViewController *)self enableAnimationForOverlayEffect:v12];
    }
  }
}

- (void)fullScreenTextEditViewController:(id)a3 didFinishEditingByRemovingEffect:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = JFXLog_effects();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 jtEffect];
    char v8 = NSStringFromJFXEffectType([v7 type]);
    id v9 = [v5 localizedTitle];
    *(_DWORD *)CGAffineTransform buf = 138543618;
    double v17 = v8;
    __int16 v18 = 2114;
    double v19 = v9;
    _os_log_impl(&dword_234C41000, v6, OS_LOG_TYPE_DEFAULT, "Removing effect - type: %{public}@, name: %{public}@", buf, 0x16u);
  }
  id v10 = [(CFXCaptureViewController *)self composition];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __118__CFXCaptureViewController_EffectEditingAdditions__fullScreenTextEditViewController_didFinishEditingByRemovingEffect___block_invoke;
  _OWORD v15[3] = &unk_264C09FA8;
  v15[4] = self;
  [v10 removeEffect:v5 completion:v15];

  int v11 = CFXLog_action();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    long long v12 = [(CFXCaptureViewController *)self composition];
    id v13 = [v12 jtEffects];
    double v14 = +[CFXActionLogging actionLogAsJSONForEvent:@"effect removed" atLocation:@"live" withEffectStack:v13];
    *(_DWORD *)CGAffineTransform buf = 138543362;
    double v17 = v14;
    _os_log_impl(&dword_234C41000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
}

void __118__CFXCaptureViewController_EffectEditingAdditions__fullScreenTextEditViewController_didFinishEditingByRemovingEffect___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [v1 composition];
  [v1 effectCompositionDidChange:v2];
}

- (int64_t)faceTrackingInterfaceOrientationForfullScreenTextEditViewController:(id)a3
{
  return +[JFXOrientationMonitor interfaceOrientation];
}

- (void)CFX_executeBlockAfterNextFrameRendered:(id)a3
{
  id v4 = a3;
  id v5 = [(CFXCaptureViewController *)self cameraViewController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke;
  v7[3] = &unk_264C0A3C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 executeAfterNextFrameIsRendered:v7];
}

void __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) cameraViewController];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke_2;
  v3[3] = &unk_264C0A3F0;
  id v4 = *(id *)(a1 + 40);
  [v2 executeAfterNextFrameIsRendered:v3];
}

void __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke_3;
  block[3] = &unk_264C0A3F0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __91__CFXCaptureViewController_EffectEditingAdditions__CFX_executeBlockAfterNextFrameRendered___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)zoomControl:(const char *)a1 didChangeZoomFactor:(NSObject *)a2 interactionType:(double)a3 .cold.1(const char *a1, NSObject *a2, double a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = NSStringFromSelector(a1);
  OUTLINED_FUNCTION_3();
  __int16 v7 = 2048;
  double v8 = a3;
  _os_log_debug_impl(&dword_234C41000, a2, OS_LOG_TYPE_DEBUG, "---- %@: actualZoomFactor=%.3f", v6, 0x16u);
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pan gesture begin - apply pan", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pan gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "capture direct pan gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "capture direct pan gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pan gesture begin", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pan gesture changed - ignored because not currently editing", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pan gesture changed - apply pan", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pan gesture finished - ignored because not currently editing", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pan gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPannedAtNormalizedPoint:gesture:.cold.10()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pan gesture finished - apply pan", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pinch gesture begin - apply pinch", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pinch gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "capture direct pinch gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "capture direct pinch gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pinch gesture begin", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pinch gesture changed - apply pinch", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pinch gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewPinchedAtNormalizedCenterPoint:gesture:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct pinch gesture finished - apply pinch", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct rotate gesture begin - apply rotate", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct rotated gesture begin - did not find hit test effect", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.3()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "capture direct rotated gesture begin - found hit test effect: %@", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.4()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "capture direct rotated gesture begin - found effect already being edited: %@", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.5()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct rotate gesture begin", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.6()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct rotate gesture changed - apply rotate", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.7()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct rotate gesture finished - no more gestures applied, ending effect editing", v2, v3, v4, v5, v6);
}

- (void)liveCaptureViewController:livePreviewRotatedAtNormalizedCenterPoint:gesture:.cold.8()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "capture direct rotate gesture finished - apply rotate", v2, v3, v4, v5, v6);
}

void __47__CFXCaptureViewController_stopVideoRecording___block_invoke_2_cold_1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = &stru_26E7CDB50;
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    uint8_t v6 = &stru_26E7CDB50;
  }
  else {
    uint8_t v6 = @"(ONLY)";
  }
  uint64_t v7 = *a2;
  if (v5)
  {
    uint64_t v4 = [NSString stringWithFormat:@"\n\nmetadata written to: %@", v5];
  }
  *(_DWORD *)CGAffineTransform buf = 138412802;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  uint64_t v11 = v7;
  __int16 v12 = 2112;
  id v13 = v4;
  _os_log_debug_impl(&dword_234C41000, log, OS_LOG_TYPE_DEBUG, "successful video %@ written to %@%@", buf, 0x20u);
  if (v5) {
}
  }

void __44__CFXCaptureViewController_JFX_capturePhoto__block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 localizedDescription];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_234C41000, a2, OS_LOG_TYPE_ERROR, "failed to take still: %@{public}", v4, 0xCu);
}

@end