@interface CAMPreviewViewController
- ($4AAF98A9092C2FA9448861FB2530D732)_geometryAnimationParametersForViewType:(SEL)a3;
- (BOOL)_allowUserToChangeFocusAndExposure;
- (BOOL)_canModifyExposureBias;
- (BOOL)_canShowWhileLocked;
- (BOOL)_cinematicIsFixedFocusLocked;
- (BOOL)_cinematicSubjectIsTrackingLocked;
- (BOOL)_disableAllIndicators;
- (BOOL)_disableDelayedFadeOutForFaces;
- (BOOL)_disableIndicatorGeometryAnimations;
- (BOOL)_externalLockNeedsCurrentFacesToAppear;
- (BOOL)_focusOnPoint:(CGPoint)a3 shouldShowFocusAndExposureIndicator:(BOOL)a4;
- (BOOL)_isChangingGraphConfiguration;
- (BOOL)_isExposureTargetBiasAtBaseline:(float)a3;
- (BOOL)_isFocusAndExposureLockedByUserOrExternally;
- (BOOL)_isFullyAutomaticFocus:(id)a3 andExposure:(id)a4;
- (BOOL)_isFullyAutomaticFocusAndExposure;
- (BOOL)_isLongPressingToLock;
- (BOOL)_isPanningExposureBias;
- (BOOL)_isPortraitEffectActive;
- (BOOL)_isShowingContinuousIndicator;
- (BOOL)_isShowingFocusIndicator:(id)a3;
- (BOOL)_isShowingIndicatorsOfType:(id)a3;
- (BOOL)_mrcIndicatorButtonContainsTouch:(id)a3;
- (BOOL)_setCinematicFocusForMetadataObject:(id)a3 atPoint:(CGPoint)a4 useFixedOpticalFocus:(BOOL)a5 useHardFocus:(BOOL)a6;
- (BOOL)_shouldAllowFaceIndicators;
- (BOOL)_shouldAllowMRCIndicators;
- (BOOL)_shouldAllowTextRegionIndicators;
- (BOOL)_shouldDisableAspectRatioToggle;
- (BOOL)_shouldDisableFocusUI;
- (BOOL)_shouldResetFocusAndExposureForSubjectAreaDidChange;
- (BOOL)_shouldShowCinematicModeIndicatorViews;
- (BOOL)_shouldShowContinuousIndicator;
- (BOOL)_shouldShowIndicatorsAsInactive;
- (BOOL)_shouldShowPortraitModeIndicatorViews;
- (BOOL)_shouldShowPortraitModeTrackedSubjectIndicatorsForLightingType:(int64_t)a3;
- (BOOL)_shouldShowStageLightOverlayViewForMode:(int64_t)a3 device:(int64_t)a4 lightingType:(int64_t)a5 shallowDepthOfFieldStatus:(int64_t)a6 stagePreviewStatus:(int64_t)a7;
- (BOOL)_shouldSuppressExistingFaceIndicators;
- (BOOL)_shouldSuppressNewFaces;
- (BOOL)_shouldSuppressNewPortraitModeTrackedSubjectIndicators;
- (BOOL)_shouldUpdateIndicatorSizeFrom:(CGSize)a3 to:(CGSize)a4 minimumAreaChangeThreshold:(double)a5 minimumAreaFractionChangeThreshold:(double)a6;
- (BOOL)_showExposureBiasSliderForPointView;
- (BOOL)_userLockedFocusAndExposure;
- (BOOL)captureController:(id)a3 shouldResetFocusAndExposureAfterCaptureForType:(int64_t)a4;
- (BOOL)captureController:(id)a3 shouldResetFocusAndExposureForReason:(int64_t)a4;
- (BOOL)captureControllerUserHasAdjustedExposureTargetBiasFromBaseline:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isFocusAndExposureExternallyLocked;
- (BOOL)isFocusLockedByUser;
- (BOOL)isFocusLockedOnCinematicSubject;
- (BOOL)isShowingPointIndicator;
- (BOOL)isShowingStandardControls;
- (BOOL)shouldUsePortraitStyleIndicatorsInPhotoMode;
- (CAMCaptureGraphConfiguration)_graphConfiguration;
- (CAMExposureResult)_lastExposureResult;
- (CAMFocusIndicatorView)_continuousIndicator;
- (CAMFocusIndicatorView)_externalFocusLockIndicator;
- (CAMFocusIndicatorView)_pointIndicator;
- (CAMFocusResult)_lastFocusResult;
- (CAMMachineReadableCodeResult)cachedSignificantMRCResult;
- (CAMMotionController)_motionController;
- (CAMPreviewViewController)initWithCaptureController:(id)a3 motionController:(id)a4 timelapseController:(id)a5;
- (CAMPreviewViewController)initWithCoder:(id)a3;
- (CAMPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CAMPreviewViewControllerDelegate)delegate;
- (CAMStageLightOverlayView)_stageLightOverlayView;
- (CAMTextRegionResult)cachedSignificantTextRegionResult;
- (CAMTimelapseController)_timelapseController;
- (CEKSubjectIndicatorView)_portraitModeCenteredIndicatorView;
- (CGPoint)pointOfInterestInNormalizedCaptureDeviceSpace;
- (CGRect)normalizedZoomPIPRect;
- (CUCaptureController)_captureController;
- (NSArray)cachedMRCResults;
- (NSArray)cachedTextRegionResults;
- (NSDate)_lastExposureBiasModificationTime;
- (NSDate)_lastFocusIndictorStartTime;
- (NSDate)_lastTapToFocusTime;
- (NSMapTable)_metadataObjectsForView;
- (NSMutableDictionary)_indicatorViewsByType;
- (UILongPressGestureRecognizer)_longPressToLockGestureRecognizer;
- (UIPanGestureRecognizer)_exposureBiasPanGestureRecognizer;
- (UIPanGestureRecognizer)activeExposureBiasPanGestureRecognizer;
- (UITapGestureRecognizer)_aspectRatioToggleDoubleTapGestureRecognizer;
- (UITapGestureRecognizer)_tapToFocusAndExposeGestureRecognizer;
- (double)_effectiveExposureBiasMovementForTranslation:(CGPoint)a3;
- (double)_exposureBiasForVirtualSliderPosition:(double)a3;
- (double)_exposureBiasVirtualSliderExponent;
- (double)_exposureBiasVirtualSliderPointsForFirstStop;
- (double)_virtualSliderPositionForExposureBias:(double)a3;
- (double)captureControllerDelayBeforeResettingFocusAndExposureAfterCapture:(id)a3;
- (float)_exposureBiasPanStartValue;
- (float)_exposureTargetBiasMaximum;
- (float)_exposureTargetBiasMinimum;
- (float)baselineExposureBias;
- (float)baselineExposureValueForCaptureController:(id)a3;
- (float)cachedExposureTargetBias;
- (float)totalExposureBias;
- (id)_cinematicModeIndicatorViewAtPoint:(CGPoint)a3;
- (id)_focusIndicatorViewsWithExposureBiasSliders;
- (id)_groupIDForMetadataObject:(id)a3;
- (int)_exposureBiasSide;
- (int64_t)_device;
- (int64_t)_devicePosition;
- (int64_t)_interfaceOrientation;
- (int64_t)_largeStyleForPointIndicator;
- (int64_t)_mode;
- (int64_t)_styleForPointIndicator;
- (int64_t)layoutStyle;
- (int64_t)lightingType;
- (int64_t)shallowDepthOfFieldStatus;
- (int64_t)stagePreviewStatus;
- (unint64_t)_currentFacesCount;
- (void)_activateFocusIndicator:(id)a3;
- (void)_addIndicatorView:(id)a3 forType:(id)a4 identifier:(id)a5 underlyingMetadataObject:(id)a6;
- (void)_animateIfNeededWithParameters:(id *)a3 animations:(id)a4 completion:(id)a5;
- (void)_animateView:(id)a3 type:(id)a4 withCenter:(CGPoint)a5 bounds:(CGRect)a6 transform:(CGAffineTransform *)a7;
- (void)_applicationDidEnterBackground;
- (void)_cancelDelayedActions;
- (void)_cancelDelayedFadeOutOfViewType:(id)a3;
- (void)_cancelDelayedFocusAndExposureLock;
- (void)_cancelDelayedHideOrDeactivateForFocusIndicator:(id)a3;
- (void)_captureOrientationChanged:(id)a3;
- (void)_createAspectRatioToggleDoubleTapGestureRecognizerIfNecessary;
- (void)_createCommonGestureRecognizersIfNecessary;
- (void)_createContinuousIndicatorIfNecessary;
- (void)_createExposureBiasPanGestureRecognizerIfNecessary;
- (void)_createExternalFocusLockIndicatorIfNecessary;
- (void)_createLongPressToLockGestureRecognizersIfNecessary;
- (void)_createPointIndicatorIfNecessary;
- (void)_createPortraitModeCenteredIndicatorViewIfNecessary;
- (void)_createStageLightOverlayViewIfNeededWillAnimate:(BOOL)a3;
- (void)_createTapToFocusAndExposeGestureRecognizerIfNecessary;
- (void)_deactivateFocusIndicator:(id)a3;
- (void)_deactivateFocusIndicator:(id)a3 afterDelay:(double)a4;
- (void)_didChangeGraphConfigurationAnimated:(BOOL)a3;
- (void)_fadeInView:(id)a3 withDuration:(double)a4;
- (void)_fadeOutAndRemoveIndicatorView:(id)a3 forType:(id)a4 identifier:(id)a5 withDuration:(double)a6;
- (void)_fadeOutAndRemoveIndicatorViewsOfType:(id)a3 withDuration:(double)a4;
- (void)_fadeOutIndicatorsOfViewType:(id)a3;
- (void)_fadeOutIndicatorsOfViewType:(id)a3 afterDelay:(double)a4;
- (void)_fadeOutView:(id)a3 withDuration:(double)a4 completion:(id)a5;
- (void)_finishFocusingLockedPointOfInterestIndicator;
- (void)_handleAspectRatioToggleDoubleTap:(id)a3;
- (void)_handleExposureBiasPan:(id)a3;
- (void)_handleFocusTapForPointInPreviewView:(CGPoint)a3;
- (void)_handleLongPressToLock:(id)a3;
- (void)_handleSignificantMRCIndicatorButtonTapped:(id)a3;
- (void)_handleTapToFocusAndExpose:(id)a3;
- (void)_hideAllCinematicIndicatorsAnimated:(BOOL)a3;
- (void)_hideAllFocusIndicatorsAnimated:(BOOL)a3;
- (void)_hideAllFocusIndicatorsExceptForIndicator:(id)a3;
- (void)_hideFocusIndicator:(id)a3;
- (void)_hideFocusIndicator:(id)a3 afterDelay:(double)a4;
- (void)_hideFocusIndicator:(id)a3 animated:(BOOL)a4;
- (void)_hideIndicatorsOfViewType:(id)a3 animated:(BOOL)a4;
- (void)_hidePortraitModeTrackedSubjectIndicatorsAnimated:(BOOL)a3;
- (void)_initializeExposureBiasParametersForFocusIndicatorView:(id)a3;
- (void)_initializeExposureBiasSliderParameters;
- (void)_lockFocusAndExposure;
- (void)_lockFocusAndExposureAfterDelay:(double)a3;
- (void)_removeIndicatorViewForType:(id)a3 identifier:(id)a4;
- (void)_resetCachedTimes;
- (void)_resetFaceTracking;
- (void)_scaleDownLockedPointOfInterest;
- (void)_scalePortraitModeFocusIndicators;
- (void)_setChangingGraphConfiguration:(BOOL)a3;
- (void)_setCinematicIsFixedFocusLocked:(BOOL)a3;
- (void)_setCinematicIsFixedFocusLocked:(BOOL)a3 shouldAnimate:(BOOL)a4;
- (void)_setCinematicSubjectIsTrackingLocked:(BOOL)a3;
- (void)_setCinematicSubjectIsTrackingLocked:(BOOL)a3 shouldAnimate:(BOOL)a4;
- (void)_setCurrentFacesCount:(unint64_t)a3;
- (void)_setExposureBiasVirtualSliderExponent:(double)a3;
- (void)_setExposureBiasVirtualSliderPointsForFirstStop:(double)a3;
- (void)_setExternalLockNeedsCurrentFacesToAppear:(BOOL)a3;
- (void)_setFocusIndicatorsPulsing:(BOOL)a3;
- (void)_setGraphConfiguration:(id)a3;
- (void)_setLastExposureBiasModifiedTime:(id)a3;
- (void)_setLastExposureResult:(id)a3;
- (void)_setLastFocusIndictorStartTime:(id)a3;
- (void)_setLastFocusResult:(id)a3;
- (void)_setLastTapToFocusTime:(id)a3;
- (void)_setShouldSuppressExistingFaceIndicators:(BOOL)a3;
- (void)_setUserLockedFocusAndExposure:(BOOL)a3;
- (void)_setUserLockedFocusAndExposure:(BOOL)a3 shouldAnimate:(BOOL)a4;
- (void)_showIndicatorAtPointOfInterest:(CGPoint)a3;
- (void)_showLockedAtPointOfInterest:(CGPoint)a3;
- (void)_showUIForResetFocusAndExposure;
- (void)_subjectGroupResultsFromMetadataObjects:(id)a3 nonFixedFocusResults:(id *)a4 fixedFocusResults:(id *)a5;
- (void)_updateCaptureControllerExposureTargetBias;
- (void)_updateCinematicModeViewsForResults:(id)a3;
- (void)_updateCinematicModeViewsForTrackingChange;
- (void)_updateExposureBiasPanGestureRecognizerForOrientation;
- (void)_updateExposureBiasSideAnimated:(BOOL)a3;
- (void)_updateExposureBiasViews;
- (void)_updateExposureBiasViews:(id)a3;
- (void)_updateFaceIndicatorsForResults:(id)a3;
- (void)_updateForOrientationAnimated:(BOOL)a3;
- (void)_updateIndicatorsForMetadataObjectResults:(id)a3 allowNewAndReappearingIndicators:(BOOL)a4 viewType:(id)a5 viewClass:(Class)a6 geometryCallback:(id)a7 minimumAreaChangeThreshold:(double)a8 minimumAreaFractionChangeThreshold:(double)a9;
- (void)_updateIndicatorsForMetadataObjectResults:(id)a3 allowNewAndReappearingIndicators:(BOOL)a4 viewType:(id)a5 viewClass:(Class)a6 geometryCallback:(id)a7 minimumAreaChangeThreshold:(double)a8 minimumAreaFractionChangeThreshold:(double)a9 viewInitializerCallback:(id)a10;
- (void)_updateMRCIndicatorsAnimated:(BOOL)a3;
- (void)_updateMRCIndicatorsIfNecessaryAnimated:(BOOL)a3;
- (void)_updatePhotoModeIndicatorsStyle;
- (void)_updatePortraitModeViewsAnimated:(BOOL)a3;
- (void)_updatePortraitModeViewsForResults:(id)a3;
- (void)_updatePreviewIndicatorClippingStyleForGraphConfiguration:(id)a3;
- (void)_updatePreviewViewAspectMode;
- (void)_updateTextRegionIndicators;
- (void)_updateTextRegionIndicatorsIfNecessary;
- (void)_updateUIForCenteredContrastBasedFocusDidEnd;
- (void)_validateExposureTargetBiasFromExposureResult:(id)a3;
- (void)_validateInternalProperties;
- (void)_validateLastExposureBiasModificationTime;
- (void)_willChangeGraphConfiguration;
- (void)captureController:(id)a3 didOutputExposureResult:(id)a4;
- (void)captureController:(id)a3 didOutputFaceResults:(id)a4 headResults:(id)a5 bodyResults:(id)a6 salientObjectResults:(id)a7;
- (void)captureController:(id)a3 didOutputFocusResult:(id)a4;
- (void)captureControllerWillResetFocusAndExposure:(id)a3;
- (void)dealloc;
- (void)didChangeToGraphConfiguration:(id)a3 animated:(BOOL)a4;
- (void)focusOnNormalizedPoint:(CGPoint)a3;
- (void)loadView;
- (void)notifyCaptureSessionDidStopRunning;
- (void)notifyDidStopCapture;
- (void)notifyShutterButtonPressed;
- (void)notifyWillStartCapturing;
- (void)setBaselineExposureBias:(float)a3;
- (void)setCachedExposureTargetBias:(float)a3;
- (void)setCachedMRCResults:(id)a3;
- (void)setCachedSignificantMRCResult:(id)a3;
- (void)setCachedSignificantTextRegionResult:(id)a3;
- (void)setCachedTextRegionResults:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFocusAndExposureExternallyLocked:(BOOL)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setLightingType:(int64_t)a3;
- (void)setLightingType:(int64_t)a3 animated:(BOOL)a4;
- (void)setNormalizedZoomPIPRect:(CGRect)a3;
- (void)setShallowDepthOfFieldStatus:(int64_t)a3;
- (void)setShallowDepthOfFieldStatus:(int64_t)a3 stagePreviewStatus:(int64_t)a4;
- (void)setShouldUsePortraitStyleIndicatorsInPhotoMode:(BOOL)a3;
- (void)setShowingStandardControls:(BOOL)a3;
- (void)setStagePreviewStatus:(int64_t)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)willChangeToGraphConfiguration:(id)a3;
@end

@implementation CAMPreviewViewController

- (CAMPreviewViewController)initWithCaptureController:(id)a3 motionController:(id)a4 timelapseController:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v22.receiver = self;
  v22.super_class = (Class)CAMPreviewViewController;
  v12 = [(CAMPreviewViewController *)&v22 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    [(CAMPreviewViewController *)v12 _initializeExposureBiasSliderParameters];
    v13->_showingStandardControls = 1;
    objc_storeStrong((id *)&v13->__captureController, a3);
    objc_storeStrong((id *)&v13->__motionController, a4);
    objc_storeWeak((id *)&v13->__timelapseController, v11);
    [(CUCaptureController *)v13->__captureController setFocusDelegate:v13];
    [(CUCaptureController *)v13->__captureController setExposureDelegate:v13];
    v14 = [MEMORY[0x263F08A00] defaultCenter];
    [v14 addObserver:v13 selector:sel__captureOrientationChanged_ name:@"CAMMotionControllerCaptureOrientationChangedNotification" object:0];

    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:v13 selector:sel__applicationDidEnterBackground name:*MEMORY[0x263F83330] object:0];

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    indicatorViewsByType = v13->__indicatorViewsByType;
    v13->__indicatorViewsByType = v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:517 valueOptions:0 capacity:6];
    metadataObjectsForView = v13->__metadataObjectsForView;
    v13->__metadataObjectsForView = (NSMapTable *)v18;

    v13->__disableDelayedFadeOutForFaces = CFPreferencesGetAppBooleanValue(@"CAMDebugDisableDelayedFadeOutForFaces", @"com.apple.camera", 0) != 0;
    v13->__disableIndicatorGeometryAnimations = CFPreferencesGetAppBooleanValue(@"CAMDebugDisablePreviewIndicatorViewAnimations", @"com.apple.camera", 0) != 0;
    v13->__disableAllIndicators = CFPreferencesGetAppBooleanValue(@"CAMDebugDisablePreviewIndicators", @"com.apple.camera", 0) != 0;
    [(CAMPreviewViewController *)v13 _resetFaceTracking];
    v20 = v13;
  }

  return v13;
}

- (void)_initializeExposureBiasSliderParameters
{
  [(CAMPreviewViewController *)self _setExposureBiasVirtualSliderExponent:1.4];
  [(CAMPreviewViewController *)self _setExposureBiasVirtualSliderPointsForFirstStop:120.0];
}

- (void)_setExposureBiasVirtualSliderExponent:(double)a3
{
  self->__exposureBiasVirtualSliderExponent = a3;
}

- (void)_setExposureBiasVirtualSliderPointsForFirstStop:(double)a3
{
  self->__exposureBiasVirtualSliderPointsForFirstStop = a3;
}

- (void)_resetFaceTracking
{
  [(CAMPreviewViewController *)self _setCurrentFacesCount:0];
  [(CAMPreviewViewController *)self _setShouldSuppressExistingFaceIndicators:0];
  [(CAMPreviewViewController *)self _fadeOutIndicatorsOfViewType:@"face" afterDelay:0.0];
}

- (void)setDelegate:(id)a3
{
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(CAMPreviewViewController *)self _hideAllFocusIndicatorsAnimated:0];
  }
}

- (void)loadView
{
  v3 = [CAMPreviewView alloc];
  v5 = -[CAMPreviewView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if ([(CAMPreviewViewController *)self _disableAllIndicators])
  {
    v4 = [(CAMPreviewView *)v5 indicatorContainerView];
    [v4 setHidden:1];
  }
  [(CAMPreviewViewController *)self setView:v5];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewViewController;
  [(CAMPreviewViewController *)&v5 viewDidLoad];
  [(CAMPreviewViewController *)self _createCommonGestureRecognizersIfNecessary];
  int64_t v3 = [(CAMPreviewViewController *)self _interfaceOrientation];
  v4 = [(CAMPreviewViewController *)self previewView];
  [v4 setOrientation:v3];
}

- (void)_createCommonGestureRecognizersIfNecessary
{
  [(CAMPreviewViewController *)self _createTapToFocusAndExposeGestureRecognizerIfNecessary];
  [(CAMPreviewViewController *)self _createLongPressToLockGestureRecognizersIfNecessary];
  [(CAMPreviewViewController *)self _createExposureBiasPanGestureRecognizerIfNecessary];
  int64_t v3 = [MEMORY[0x263F82B60] mainScreen];
  BOOL v4 = CAMIsTallScreen(v3);

  if (!v4)
  {
    [(CAMPreviewViewController *)self _createAspectRatioToggleDoubleTapGestureRecognizerIfNecessary];
  }
}

- (void)_createTapToFocusAndExposeGestureRecognizerIfNecessary
{
  if (!self->__tapToFocusAndExposeGestureRecognizer)
  {
    int64_t v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleTapToFocusAndExpose_];
    tapToFocusAndExposeGestureRecognizer = self->__tapToFocusAndExposeGestureRecognizer;
    self->__tapToFocusAndExposeGestureRecognizer = v3;

    [(UITapGestureRecognizer *)self->__tapToFocusAndExposeGestureRecognizer setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)self->__tapToFocusAndExposeGestureRecognizer setNumberOfTouchesRequired:1];
    [(UITapGestureRecognizer *)self->__tapToFocusAndExposeGestureRecognizer setDelegate:self];
    id v5 = [(CAMPreviewViewController *)self view];
    [v5 addGestureRecognizer:self->__tapToFocusAndExposeGestureRecognizer];
  }
}

- (void)_createLongPressToLockGestureRecognizersIfNecessary
{
  if (!self->__longPressToLockGestureRecognizer)
  {
    int64_t v3 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__handleLongPressToLock_];
    longPressToLockGestureRecognizer = self->__longPressToLockGestureRecognizer;
    self->__longPressToLockGestureRecognizer = v3;

    [(UILongPressGestureRecognizer *)self->__longPressToLockGestureRecognizer setMinimumPressDuration:0.5];
    [(UILongPressGestureRecognizer *)self->__longPressToLockGestureRecognizer setCancelsTouchesInView:0];
    [(UILongPressGestureRecognizer *)self->__longPressToLockGestureRecognizer setDelaysTouchesEnded:0];
    [(UILongPressGestureRecognizer *)self->__longPressToLockGestureRecognizer setDelegate:self];
    id v5 = [(CAMPreviewViewController *)self view];
    [v5 addGestureRecognizer:self->__longPressToLockGestureRecognizer];
  }
}

- (void)_createExposureBiasPanGestureRecognizerIfNecessary
{
  if (!self->__exposureBiasPanGestureRecognizer)
  {
    int64_t v3 = (UIPanGestureRecognizer *)[objc_alloc(MEMORY[0x263F82A00]) initWithTarget:self action:sel__handleExposureBiasPan_];
    exposureBiasPanGestureRecognizer = self->__exposureBiasPanGestureRecognizer;
    self->__exposureBiasPanGestureRecognizer = v3;

    [(UIPanGestureRecognizer *)self->__exposureBiasPanGestureRecognizer _setCanPanHorizontally:0];
    [(UIPanGestureRecognizer *)self->__exposureBiasPanGestureRecognizer _setCanPanVertically:1];
    [(UIPanGestureRecognizer *)self->__exposureBiasPanGestureRecognizer setCancelsTouchesInView:0];
    [(UIPanGestureRecognizer *)self->__exposureBiasPanGestureRecognizer setDelaysTouchesEnded:0];
    [(UIPanGestureRecognizer *)self->__exposureBiasPanGestureRecognizer setDelegate:self];
    id v5 = [(CAMPreviewViewController *)self view];
    [v5 addGestureRecognizer:self->__exposureBiasPanGestureRecognizer];

    [(CAMPreviewViewController *)self _updateExposureBiasPanGestureRecognizerForOrientation];
  }
}

- (void)_updateExposureBiasPanGestureRecognizerForOrientation
{
  unint64_t v3 = [(CAMPreviewViewController *)self _interfaceOrientation] - 3;
  BOOL v4 = v3 > 1;
  [(UIPanGestureRecognizer *)self->__exposureBiasPanGestureRecognizer _setCanPanHorizontally:v3 < 2];
  exposureBiasPanGestureRecognizer = self->__exposureBiasPanGestureRecognizer;
  [(UIPanGestureRecognizer *)exposureBiasPanGestureRecognizer _setCanPanVertically:v4];
}

- (int64_t)_interfaceOrientation
{
  v2 = [(CAMPreviewViewController *)self _motionController];
  int64_t v3 = [v2 captureOrientation];

  return v3;
}

- (CAMMotionController)_motionController
{
  return self->__motionController;
}

- (BOOL)isFocusLockedByUser
{
  if ([(CAMFocusResult *)self->__lastFocusResult deviceSupportsFocus]
    && [(CAMPreviewViewController *)self _isFocusAndExposureLockedByUserOrExternally])
  {
    return 1;
  }
  return [(CAMPreviewViewController *)self _cinematicIsFixedFocusLocked];
}

- (int64_t)_mode
{
  v2 = [(CAMPreviewViewController *)self _graphConfiguration];
  int64_t v3 = [v2 mode];

  return v3;
}

- (BOOL)_userLockedFocusAndExposure
{
  return self->__userLockedFocusAndExposure;
}

- (NSArray)cachedMRCResults
{
  return self->_cachedMRCResults;
}

- (void)setLightingType:(int64_t)a3
{
}

- (void)setLightingType:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_lightingType != a3)
  {
    self->_lightingType = a3;
    if (!-[CAMPreviewViewController _shouldShowPortraitModeTrackedSubjectIndicatorsForLightingType:](self, "_shouldShowPortraitModeTrackedSubjectIndicatorsForLightingType:"))[(CAMPreviewViewController *)self _hidePortraitModeTrackedSubjectIndicatorsAnimated:0]; {
    [(CAMPreviewViewController *)self _updatePortraitModeViewsAnimated:1];
    }
  }
}

- (void)_updatePortraitModeViewsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CAMPreviewViewController *)self _shouldShowStageLightOverlayViewForMode:[(CAMPreviewViewController *)self _mode] device:[(CAMPreviewViewController *)self _device] lightingType:[(CAMPreviewViewController *)self lightingType] shallowDepthOfFieldStatus:[(CAMPreviewViewController *)self shallowDepthOfFieldStatus] stagePreviewStatus:[(CAMPreviewViewController *)self stagePreviewStatus]];
  if (v5)
  {
    [(CAMPreviewViewController *)self _createStageLightOverlayViewIfNeededWillAnimate:v3];
    BOOL v6 = [(CAMPreviewViewController *)self _shouldShowStageLightOverlayActive];
    v7 = [(CAMPreviewViewController *)self _stageLightOverlayView];
    [v7 setActive:v6 animated:v3];

    int64_t v8 = [(CAMPreviewViewController *)self _interfaceOrientation];
    id v9 = [(CAMPreviewViewController *)self _stageLightOverlayView];
    [v9 setOrientation:v8 animated:v3];
  }
  id v10 = [(CAMPreviewViewController *)self _stageLightOverlayView];
  [v10 setVisible:v5 animated:v3];

  BOOL v11 = [(CAMPreviewViewController *)self _shouldShowIndicatorsAsInactive];
  v12 = [(CAMPreviewViewController *)self _indicatorViewsByType];
  v13 = [v12 objectForKeyedSubscript:@"portraitSubject"];

  v38[0] = MEMORY[0x263EF8330];
  v38[1] = 3221225472;
  v38[2] = __61__CAMPreviewViewController__updatePortraitModeViewsAnimated___block_invoke;
  v38[3] = &__block_descriptor_33_e33_v32__0__NSString_8__UIView_16_B24l;
  BOOL v39 = v11;
  [v13 enumerateKeysAndObjectsUsingBlock:v38];
  v14 = [(CAMPreviewViewController *)self _pointIndicator];
  int v15 = [v14 isInactive];
  [v14 setInactive:v11];
  if (v15 && !v11) {
    [v14 startScalingWithExpansionWidth:1 duration:10.0 repeatCount:0.3];
  }
  BOOL v16 = [(CAMPreviewViewController *)self _shouldShowPortraitModeIndicatorViews];
  int v17 = [(CAMPreviewViewController *)self isShowingPointIndicator];
  uint64_t v18 = [v13 count];
  int64_t v19 = [(CAMPreviewViewController *)self _device];
  if ((unint64_t)(v19 - 1) > 0xA) {
    uint64_t v20 = 0;
  }
  else {
    uint64_t v20 = qword_209C7BA30[v19 - 1];
  }
  v21 = +[CAMCaptureCapabilities capabilities];
  int v22 = [v21 isSingleCameraPortraitModeSupportedForDevicePosition:v20];

  unint64_t v23 = [(CAMPreviewViewController *)self lightingType] - 7;
  int v24 = v16 & v22;
  if (v18) {
    int v24 = 0;
  }
  if (v23 < 0xFFFFFFFFFFFFFFFDLL) {
    int v25 = v24 & ~v17;
  }
  else {
    int v25 = 0;
  }
  if (v25 == 1)
  {
    v26 = [(CAMPreviewViewController *)self _portraitModeCenteredIndicatorView];

    if (!v26)
    {
      [(CAMPreviewViewController *)self _createPortraitModeCenteredIndicatorViewIfNecessary];
      v27 = [(CAMPreviewViewController *)self view];
      [v27 layoutIfNeeded];
    }
  }
  v28 = [(CAMPreviewViewController *)self _portraitModeCenteredIndicatorView];
  int v29 = [v28 isInactive];
  [v28 alpha];
  double v31 = v30;
  objc_msgSend(v28, "setInactive:", -[CAMPreviewViewController _isPortraitEffectActive](self, "_isPortraitEffectActive") ^ 1);
  if (v25 && ([v28 isInactive] & 1) != 0)
  {
    if (v31 == 0.0) {
      char v32 = 0;
    }
    else {
      char v32 = v29;
    }
    int v33 = [v28 isInactive];
    if ((v32 & 1) == 0)
    {
      LODWORD(v34) = 0.5;
      LODWORD(v35) = 0.5;
      LODWORD(v36) = 1.0;
      v37 = [MEMORY[0x263F15808] functionWithControlPoints:v34 :0.0 :v35 :v36];
      [v28 startScalingWithExpansionWidth:-1 duration:v37 repeatCount:8.0 timingFunction:0.75];

      goto LABEL_27;
    }
  }
  else
  {
    int v33 = [v28 isInactive];
  }
  if ((v29 & ~v33) == 1) {
    [v28 stopScalingWithDuration:0.2];
  }
LABEL_27:
  [v28 setHidden:v25 ^ 1u animated:v3];
}

- (int64_t)_device
{
  v2 = [(CAMPreviewViewController *)self _graphConfiguration];
  int64_t v3 = [v2 device];

  return v3;
}

- (int64_t)lightingType
{
  return self->_lightingType;
}

- (int64_t)shallowDepthOfFieldStatus
{
  return self->_shallowDepthOfFieldStatus;
}

- (CAMStageLightOverlayView)_stageLightOverlayView
{
  return self->__stageLightOverlayView;
}

- (BOOL)_shouldShowIndicatorsAsInactive
{
  BOOL v3 = [(CAMPreviewViewController *)self _shouldShowPortraitModeIndicatorViews];
  return v3 & ![(CAMPreviewViewController *)self _isPortraitEffectActive];
}

- (BOOL)_shouldShowPortraitModeIndicatorViews
{
  int64_t v3 = [(CAMPreviewViewController *)self _mode];
  BOOL v4 = ![(CAMPreviewViewController *)self _isChangingGraphConfiguration];
  return v3 == 6 && v4;
}

- (BOOL)_isPortraitEffectActive
{
  unint64_t v2 = [(CAMPreviewViewController *)self shallowDepthOfFieldStatus];
  return (v2 < 0xF) & (0x6202u >> v2);
}

- (CAMFocusIndicatorView)_pointIndicator
{
  return self->__pointIndicator;
}

- (void)_updatePreviewViewAspectMode
{
  id v8 = +[CAMCaptureCapabilities capabilities];
  int64_t v3 = [(CAMPreviewViewController *)self _mode];
  if ([v8 isPreviewAspectRatioToggleSupportedForMode:v3])
  {
    BOOL v4 = +[CAMUserPreferences preferences];
    uint64_t v5 = [v4 previewViewAspectModeForMode:v3];
  }
  else if ([v8 isSpatialOverCaptureSupported])
  {
    uint64_t v5 = ~(objc_msgSend(v8, "spatialOverCaptureSupportForMode:device:", -[CAMPreviewViewController _mode](self, "_mode"), -[CAMPreviewViewController _device](self, "_device")) >> 1) & 1;
  }
  else
  {
    uint64_t v5 = 0;
  }
  BOOL v6 = [(CAMPreviewViewController *)self previewView];
  v7 = [v6 videoPreviewView];
  [v7 setPreviewViewAspectMode:v5];
}

- (void)captureController:(id)a3 didOutputExposureResult:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 exposureMode];
  [v5 pointOfInterest];
  double v8 = v7;
  double v10 = v9;
  int v11 = [v5 exposureDidEnd];
  [(CAMPreviewViewController *)self _setLastExposureResult:v5];
  char v12 = [v5 deviceSupportsFocus];

  if (v12) {
    return;
  }
  if (v6 == 2 && v8 == 0.5 && v10 == 0.5)
  {
    v13 = [(CAMPreviewViewController *)self _pointIndicator];
    [(CAMPreviewViewController *)self _hideFocusIndicator:v13 animated:0];
LABEL_10:

    goto LABEL_11;
  }
  BOOL v14 = [(CAMPreviewViewController *)self _isLongPressingToLock];
  if (v11
    && !v14
    && ![(CAMPreviewViewController *)self _isFocusAndExposureLockedByUserOrExternally])
  {
    v13 = [(CAMPreviewViewController *)self _pointIndicator];
    [(CAMPreviewViewController *)self _deactivateFocusIndicator:v13 afterDelay:1.2];
    goto LABEL_10;
  }
LABEL_11:
  if (v11)
  {
    [(CAMPreviewViewController *)self _fadeOutIndicatorsOfViewType:@"face" afterDelay:0.5];
  }
}

- (void)_setLastExposureResult:(id)a3
{
  id v5 = (CAMExposureResult *)a3;
  p_lastExposureResult = &self->__lastExposureResult;
  if (self->__lastExposureResult != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_lastExposureResult, a3);
    p_lastExposureResult = (CAMExposureResult **)[(CAMPreviewViewController *)self _validateInternalProperties];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_lastExposureResult, v5);
}

- (void)_validateInternalProperties
{
  int64_t v3 = [(CAMPreviewViewController *)self _lastExposureResult];
  [(CAMPreviewViewController *)self _validateExposureTargetBiasFromExposureResult:v3];

  [(CAMPreviewViewController *)self _validateLastExposureBiasModificationTime];
  [(CAMPreviewViewController *)self _validateUserLockedFocusAndExposure];
}

- (CAMExposureResult)_lastExposureResult
{
  return self->__lastExposureResult;
}

- (void)_validateExposureTargetBiasFromExposureResult:(id)a3
{
  [a3 exposureTargetBias];
  BOOL v4 = -[CAMPreviewViewController _isExposureTargetBiasAtBaseline:](self, "_isExposureTargetBiasAtBaseline:");
  [(CAMPreviewViewController *)self cachedExposureTargetBias];
  if (v4 && v5 != 0.0 && ![(CAMPreviewViewController *)self _isPanningExposureBias])
  {
    [(CAMPreviewViewController *)self setCachedExposureTargetBias:0.0];
  }
}

- (void)_validateLastExposureBiasModificationTime
{
  uint64_t v3 = [(CAMPreviewViewController *)self _lastExposureBiasModificationTime];
  if (v3)
  {
    BOOL v4 = (void *)v3;
    BOOL v5 = [(CAMPreviewViewController *)self _isFullyAutomaticFocusAndExposure];

    if (v5)
    {
      [(CAMPreviewViewController *)self _setLastExposureBiasModifiedTime:0];
    }
  }
}

- (NSDate)_lastExposureBiasModificationTime
{
  return self->__lastExposureBiasModificationTime;
}

- (void)captureController:(id)a3 didOutputFocusResult:(id)a4
{
  id v18 = a4;
  [(CAMPreviewViewController *)self _setLastFocusResult:v18];
  BOOL v5 = [(CAMPreviewViewController *)self _timelapseController];
  [v5 setLastFocusResult:v18];
  if (-[CAMPreviewViewController _mode](self, "_mode") != 7 && [v18 deviceSupportsFocus])
  {
    uint64_t v6 = [v18 focusMode];
    int v7 = [v18 contrastBasedFocusDidStart];
    int v8 = [v18 contrastBasedFocusDidEnd];
    [v18 pointOfInterest];
    double v10 = v9;
    double v12 = v11;
    BOOL v13 = [(CAMPreviewViewController *)self _isLongPressingToLock];
    BOOL v15 = v10 == 0.5 && v6 == 3;
    BOOL v16 = v12 == 0.5 && v15;
    if (v7)
    {
      if (v16) {
        [(CAMPreviewViewController *)self _showUIForResetFocusAndExposure];
      }
      [(CAMPreviewViewController *)self _setFocusIndicatorsPulsing:1];
    }
    if (v8)
    {
      if (v16)
      {
        [(CAMPreviewViewController *)self _updateUIForCenteredContrastBasedFocusDidEnd];
        [(CAMPreviewViewController *)self _setFocusIndicatorsPulsing:0];
      }
      else
      {
        [(CAMPreviewViewController *)self _setFocusIndicatorsPulsing:0];
        if (!v13
          && ![(CAMPreviewViewController *)self _isFocusAndExposureLockedByUserOrExternally])
        {
          int v17 = [(CAMPreviewViewController *)self _pointIndicator];
          [(CAMPreviewViewController *)self _deactivateFocusIndicator:v17 afterDelay:1.2];
        }
      }
      [(CAMPreviewViewController *)self _fadeOutIndicatorsOfViewType:@"face" afterDelay:0.5];
    }
  }
}

- (void)_setLastFocusResult:(id)a3
{
  BOOL v5 = (CAMFocusResult *)a3;
  p_lastFocusResult = &self->__lastFocusResult;
  if (self->__lastFocusResult != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)p_lastFocusResult, a3);
    p_lastFocusResult = (CAMFocusResult **)[(CAMPreviewViewController *)self _validateInternalProperties];
    BOOL v5 = v7;
  }
  MEMORY[0x270F9A758](p_lastFocusResult, v5);
}

- (CAMTimelapseController)_timelapseController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__timelapseController);
  return (CAMTimelapseController *)WeakRetained;
}

- (UILongPressGestureRecognizer)_longPressToLockGestureRecognizer
{
  return self->__longPressToLockGestureRecognizer;
}

- (void)captureControllerWillResetFocusAndExposure:(id)a3
{
  [(CAMPreviewViewController *)self _setUserLockedFocusAndExposure:0];
  [(CAMPreviewViewController *)self _setCinematicIsFixedFocusLocked:0];
  [(CAMPreviewViewController *)self _setCinematicSubjectIsTrackingLocked:0];
  if ([(CAMPreviewViewController *)self _isFullyAutomaticFocusAndExposure])
  {
    BOOL v4 = [(CAMPreviewViewController *)self _pointIndicator];
    [(CAMPreviewViewController *)self _hideFocusIndicator:v4 animated:0];
  }
  else
  {
    [(CAMPreviewViewController *)self _showUIForResetFocusAndExposure];
    if ([(CAMPreviewViewController *)self _shouldShowPortraitModeIndicatorViews])
    {
      [(CAMPreviewViewController *)self _scalePortraitModeFocusIndicators];
      goto LABEL_7;
    }
    BOOL v4 = [(CAMPreviewViewController *)self _continuousIndicator];
    [v4 setPulsing:1];
    BOOL v5 = [(CAMPreviewViewController *)self _continuousIndicator];
    [(CAMPreviewViewController *)self _hideFocusIndicator:v5 afterDelay:0.8];
  }
LABEL_7:
  id v6 = [(CAMPreviewViewController *)self delegate];
  [v6 previewViewControllerWillResetFocusOrExposure:self];
}

- (void)_showUIForResetFocusAndExposure
{
  if (![(CAMPreviewViewController *)self _shouldDisableFocusUI]
    && [(CAMPreviewViewController *)self isShowingStandardControls])
  {
    id v3 = [(CAMPreviewViewController *)self _continuousIndicator];
    [(CAMPreviewViewController *)self _hideAllFocusIndicatorsExceptForIndicator:v3];
    BOOL v4 = [(CAMPreviewViewController *)self _shouldShowContinuousIndicator];
    if ([(CAMPreviewViewController *)self _shouldShowPortraitModeIndicatorViews])
    {
      [(CAMPreviewViewController *)self _updatePortraitModeViewsAnimated:1];
    }
    else if (v4)
    {
      BOOL v5 = [(CAMPreviewViewController *)self _isShowingContinuousIndicator];
      if (!v3)
      {
        [(CAMPreviewViewController *)self _createContinuousIndicatorIfNecessary];
        id v3 = [(CAMPreviewViewController *)self _continuousIndicator];
      }
      [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:v3];
      if (!v5)
      {
        id v6 = [MEMORY[0x263EFF910] date];
        [(CAMPreviewViewController *)self _setLastFocusIndictorStartTime:v6];

        [v3 startScalingWithExpansionWidth:1 duration:31.0 repeatCount:0.3];
      }
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __59__CAMPreviewViewController__showUIForResetFocusAndExposure__block_invoke;
      aBlock[3] = &unk_263FA0208;
      id v3 = v3;
      id v9 = v3;
      int v7 = _Block_copy(aBlock);
      [MEMORY[0x263F82E00] animateWithDuration:6 delay:v7 options:0 animations:0.25 completion:0.0];
    }
  }
}

- (BOOL)_shouldDisableFocusUI
{
  BOOL v3 = [(CAMPreviewViewController *)self _isChangingGraphConfiguration];
  return [(CAMPreviewViewController *)self layoutStyle] == 2 || v3;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (BOOL)isShowingStandardControls
{
  return self->_showingStandardControls;
}

- (CAMFocusIndicatorView)_continuousIndicator
{
  return self->__continuousIndicator;
}

- (void)_hideAllFocusIndicatorsExceptForIndicator:(id)a3
{
  id v6 = a3;
  id v4 = [(CAMPreviewViewController *)self _continuousIndicator];
  if (v4 != v6) {
    [(CAMPreviewViewController *)self _hideFocusIndicator:v4 animated:0];
  }
  id v5 = [(CAMPreviewViewController *)self _pointIndicator];
  if (v5 != v6) {
    [(CAMPreviewViewController *)self _hideFocusIndicator:v5 animated:0];
  }
}

- (BOOL)_shouldShowContinuousIndicator
{
  unint64_t v3 = [(CAMPreviewViewController *)self _mode];
  LOBYTE(v4) = 1;
  if (v3 <= 8)
  {
    if (((1 << v3) & 0x187) != 0)
    {
      id v5 = [(CAMPreviewViewController *)self _captureController];
      int v4 = [v5 isCapturingVideo] ^ 1;
    }
    else
    {
      LOBYTE(v4) = v3 != 3;
    }
  }
  int64_t v6 = [(CAMPreviewViewController *)self _device];
  if ((0x781u >> (v6 - 1))) {
    char v7 = 0;
  }
  else {
    char v7 = v4;
  }
  if ((unint64_t)(v6 - 1) <= 0xA) {
    char v8 = v7;
  }
  else {
    char v8 = v4;
  }
  return v8 & ~[(CAMPreviewViewController *)self _isShowingIndicatorsOfType:@"face"];
}

- (void)_createContinuousIndicatorIfNecessary
{
  if (!self->__continuousIndicator)
  {
    unint64_t v3 = [[CAMFocusIndicatorView alloc] initWithStyle:0];
    continuousIndicator = self->__continuousIndicator;
    self->__continuousIndicator = v3;

    [(CAMFocusIndicatorView *)self->__continuousIndicator setDelegate:self];
    id v5 = [(CAMPreviewViewController *)self previewView];
    [v5 setContinuousIndicator:self->__continuousIndicator];
  }
}

- (void)_cancelDelayedHideOrDeactivateForFocusIndicator:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    +[CAMPreviewViewController cancelPreviousPerformRequestsWithTarget:self selector:sel__hideFocusIndicator_ object:v4];
    +[CAMPreviewViewController cancelPreviousPerformRequestsWithTarget:self selector:sel__deactivateFocusIndicator_ object:v4];
  }
}

- (void)_setLastFocusIndictorStartTime:(id)a3
{
}

uint64_t __59__CAMPreviewViewController__showUIForResetFocusAndExposure__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_hideFocusIndicator:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:v6];
    if (a4 <= 0.0) {
      id v6 = (id)[(CAMPreviewViewController *)self _hideFocusIndicator:v8];
    }
    else {
      id v6 = (id)[(CAMPreviewViewController *)self performSelector:sel__hideFocusIndicator_ withObject:v8 afterDelay:a4];
    }
    id v7 = v8;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)_hideFocusIndicator:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:v6];
    [v6 setPulsing:0];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__CAMPreviewViewController__hideFocusIndicator_animated___block_invoke;
    aBlock[3] = &unk_263FA0208;
    id v7 = v6;
    id v16 = v7;
    id v8 = (void (**)(void))_Block_copy(aBlock);
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    double v12 = __57__CAMPreviewViewController__hideFocusIndicator_animated___block_invoke_2;
    BOOL v13 = &unk_263FA0430;
    id v14 = v7;
    id v9 = (void (**)(void *, uint64_t))_Block_copy(&v10);
    if (v4)
    {
      objc_msgSend(MEMORY[0x263F82E00], "animateWithDuration:delay:options:animations:completion:", 6, v8, v9, 0.25, 0.0, v10, v11, v12, v13);
    }
    else
    {
      v8[2](v8);
      v9[2](v9, 1);
    }
  }
}

- (void)_setFocusIndicatorsPulsing:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CAMPreviewViewController *)self _shouldDisableFocusUI]
    && [(CAMPreviewViewController *)self isShowingStandardControls])
  {
    if ([(CAMPreviewViewController *)self _shouldShowPortraitModeIndicatorViews])
    {
      id v5 = [(CAMPreviewViewController *)self _portraitModeCenteredIndicatorView];
      [v5 setPulsing:v3];
      id v6 = [(CAMPreviewViewController *)self _indicatorViewsByType];
      id v7 = [v6 objectForKeyedSubscript:@"portraitSubject"];

      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __55__CAMPreviewViewController__setFocusIndicatorsPulsing___block_invoke;
      v9[3] = &__block_descriptor_33_e33_v32__0__NSString_8__UIView_16_B24l;
      BOOL v10 = v3;
      [v7 enumerateKeysAndObjectsUsingBlock:v9];
    }
    else
    {
      id v5 = [(CAMPreviewViewController *)self _continuousIndicator];
      [v5 setPulsing:v3];
    }

    id v8 = [(CAMPreviewViewController *)self _pointIndicator];
    [v8 setPulsing:v3];
  }
}

- (void)_updateUIForCenteredContrastBasedFocusDidEnd
{
  if (![(CAMPreviewViewController *)self _shouldShowPortraitModeIndicatorViews])
  {
    id v7 = [(CAMPreviewViewController *)self _lastFocusIndictorStartTime];
    BOOL v3 = [MEMORY[0x263EFF910] date];
    [v3 timeIntervalSinceDate:v7];
    double v5 = v4;

    id v6 = [(CAMPreviewViewController *)self _continuousIndicator];
    [(CAMPreviewViewController *)self _hideFocusIndicator:v6 afterDelay:0.8 - v5];
  }
}

- (NSDate)_lastFocusIndictorStartTime
{
  return self->__lastFocusIndictorStartTime;
}

- (void)_hideFocusIndicator:(id)a3
{
}

uint64_t __57__CAMPreviewViewController__hideFocusIndicator_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

- (UIPanGestureRecognizer)activeExposureBiasPanGestureRecognizer
{
  if ([(CAMPreviewViewController *)self _canModifyExposureBias])
  {
    BOOL v3 = [(CAMPreviewViewController *)self _exposureBiasPanGestureRecognizer];
  }
  else
  {
    BOOL v3 = 0;
  }
  return (UIPanGestureRecognizer *)v3;
}

- (BOOL)_canModifyExposureBias
{
  if ([(CAMPreviewViewController *)self _shouldDisableFocusUI]) {
    goto LABEL_5;
  }
  BOOL v3 = [(CAMPreviewViewController *)self isShowingStandardControls];
  if (v3)
  {
    double v4 = +[CAMCaptureCapabilities capabilities];
    int v5 = objc_msgSend(v4, "isTapAndBiasSupportedForMode:", -[CAMPreviewViewController _mode](self, "_mode"));

    if (!v5 || [(CAMPreviewViewController *)self _isFullyAutomaticFocusAndExposure])
    {
LABEL_5:
      LOBYTE(v3) = 0;
      return v3;
    }
    BOOL v3 = [(CAMPreviewViewController *)self isShowingPointIndicator];
    if (v3) {
      LOBYTE(v3) = ![(CUCaptureController *)self->__captureController isCapturingTimelapse];
    }
  }
  return v3;
}

- (BOOL)_isFullyAutomaticFocusAndExposure
{
  return [(CAMPreviewViewController *)self _isFullyAutomaticFocus:self->__lastFocusResult andExposure:self->__lastExposureResult];
}

- (BOOL)_isFullyAutomaticFocus:(id)a3 andExposure:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  BOOL v9 = 1;
  if (!v6 || !v7) {
    goto LABEL_12;
  }
  if ([v6 deviceSupportsFocus])
  {
    if ([v6 focusMode] != 3)
    {
LABEL_11:
      BOOL v9 = 0;
      goto LABEL_12;
    }
    [v6 pointOfInterest];
    BOOL v9 = 0;
    if (v11 != 0.5 || v10 != 0.5) {
      goto LABEL_12;
    }
  }
  if ([v8 exposureMode] != 2) {
    goto LABEL_11;
  }
  [v8 pointOfInterest];
  BOOL v9 = 0;
  if (v13 == 0.5 && v12 == 0.5)
  {
    [v8 exposureTargetBias];
    BOOL v9 = -[CAMPreviewViewController _isExposureTargetBiasAtBaseline:](self, "_isExposureTargetBiasAtBaseline:");
  }
LABEL_12:

  return v9;
}

- (void)notifyShutterButtonPressed
{
}

- (void)notifyWillStartCapturing
{
  unint64_t v3 = [(CAMPreviewViewController *)self _mode];
  if (v3 <= 9)
  {
    if (((1 << v3) & 0x251) != 0)
    {
      double v4 = [(CAMPreviewViewController *)self _continuousIndicator];
      [(CAMPreviewViewController *)self _hideFocusIndicator:v4 animated:0];

      [(CAMPreviewViewController *)self _hideIndicatorsOfViewType:@"face" animated:0];
    }
    else if (v3 == 3)
    {
      [(CAMPreviewViewController *)self _hideAllFocusIndicatorsAnimated:0];
    }
  }
}

- (double)captureControllerDelayBeforeResettingFocusAndExposureAfterCapture:(id)a3
{
  unint64_t v4 = [(CAMPreviewViewController *)self _mode];
  double result = 0.0;
  if (v4 <= 9 && ((1 << v4) & 0x251) != 0)
  {
    [(CAMPreviewViewController *)self cachedExposureTargetBias];
    BOOL v7 = v6 == 0.0;
    double result = 1.0;
    if (!v7) {
      return 1.5;
    }
  }
  return result;
}

- (void)notifyDidStopCapture
{
  unint64_t v3 = [(CAMPreviewViewController *)self _mode];
  if (v3 <= 8 && ((1 << v3) & 0x187) != 0)
  {
    id v6 = [(CAMPreviewViewController *)self _captureController];
    char v4 = [v6 isCapturingVideo];
    char v5 = [v6 isCapturingBurst];
    if ((v4 & 1) == 0 && (v5 & 1) == 0) {
      [(CAMPreviewViewController *)self _resetFaceTracking];
    }
  }
}

- (BOOL)captureController:(id)a3 shouldResetFocusAndExposureForReason:(int64_t)a4
{
  BOOL v6 = [(CAMPreviewViewController *)self _isFocusAndExposureLockedByUserOrExternally];
  switch(a4)
  {
    case 0:
      if (v6) {
        goto LABEL_4;
      }
      BOOL result = [(CAMPreviewViewController *)self _shouldResetFocusAndExposureForSubjectAreaDidChange];
      break;
    case 1:
      BOOL result = (v6 | [(CAMPreviewViewController *)self _isFullyAutomaticFocusAndExposure]) ^ 1;
      break;
    case 2:
    case 3:
      BOOL result = !v6;
      break;
    default:
LABEL_4:
      BOOL result = 0;
      break;
  }
  return result;
}

- (void)_applicationDidEnterBackground
{
  [(CAMPreviewViewController *)self _hideAllFocusIndicatorsAnimated:0];
  [(CAMPreviewViewController *)self _setUserLockedFocusAndExposure:0 shouldAnimate:0];
}

- (void)_hideAllFocusIndicatorsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(CAMPreviewViewController *)self _continuousIndicator];
  [(CAMPreviewViewController *)self _hideFocusIndicator:v5 animated:v3];

  BOOL v6 = [(CAMPreviewViewController *)self _pointIndicator];
  [(CAMPreviewViewController *)self _hideFocusIndicator:v6 animated:v3];

  BOOL v7 = [(CAMPreviewViewController *)self _externalFocusLockIndicator];
  [(CAMPreviewViewController *)self _hideFocusIndicator:v7 animated:v3];

  [(CAMPreviewViewController *)self _hideIndicatorsOfViewType:@"face" animated:v3];
  [(CAMPreviewViewController *)self _hideIndicatorsOfViewType:@"MRC" animated:v3];
  [(CAMPreviewViewController *)self _hideIndicatorsOfViewType:@"textRegion" animated:v3];
  [(CAMPreviewViewController *)self _hidePortraitModeTrackedSubjectIndicatorsAnimated:v3];
  [(CAMPreviewViewController *)self _hideAllCinematicIndicatorsAnimated:v3];
  [(CAMPreviewViewController *)self _updateCinematicModeViewsForTrackingChange];
}

- (void)_setUserLockedFocusAndExposure:(BOOL)a3 shouldAnimate:(BOOL)a4
{
  if (self->__userLockedFocusAndExposure != a3)
  {
    BOOL v4 = a4;
    self->__userLockedFocusAndExposure = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained previewViewControllerDidChangeFocusOrExposureLocked:self shouldAnimate:v4];
  }
}

- (void)notifyCaptureSessionDidStopRunning
{
  [(CAMPreviewViewController *)self _hidePortraitModeTrackedSubjectIndicatorsAnimated:0];
  [(CAMPreviewViewController *)self _hideAllCinematicIndicatorsAnimated:0];
  [(CAMPreviewViewController *)self _resetFaceTracking];
}

- (CAMPreviewViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  -[CAMPreviewViewController doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4);
  return [(CAMPreviewViewController *)self initWithCaptureController:0 motionController:0 timelapseController:0];
}

- (CAMPreviewViewController)initWithCoder:(id)a3
{
  [(CAMPreviewViewController *)self doesNotRecognizeSelector:a2];
  return [(CAMPreviewViewController *)self initWithCaptureController:0 motionController:0 timelapseController:0];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(CUCaptureController *)self->__captureController setFocusDelegate:0];
  [(CUCaptureController *)self->__captureController setExposureDelegate:0];
  [(CAMFocusIndicatorView *)self->__continuousIndicator setDelegate:0];
  [(CAMFocusIndicatorView *)self->__pointIndicator setDelegate:0];
  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewController;
  [(CAMPreviewViewController *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewController;
  [(CAMPreviewViewController *)&v4 viewWillDisappear:a3];
  [(CAMPreviewViewController *)self _cancelDelayedActions];
}

- (void)_cancelDelayedActions
{
  [(CAMPreviewViewController *)self _cancelDelayedFocusAndExposureLock];
  [(CAMPreviewViewController *)self _cancelDelayedFadeOutOfViewType:@"face"];
  [(CAMPreviewViewController *)self _cancelDelayedFadeOutOfViewType:@"MRC"];
  [(CAMPreviewViewController *)self _cancelDelayedFadeOutOfViewType:@"textRegion"];
  [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:self->__continuousIndicator];
  [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:self->__pointIndicator];
  [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:self->__externalFocusLockIndicator];
  captureController = self->__captureController;
  [(CUCaptureController *)captureController cancelDelayedFocusAndExposureReset];
}

- (void)_createPointIndicatorIfNecessary
{
  if (!self->__pointIndicator)
  {
    BOOL v3 = [[CAMFocusIndicatorView alloc] initWithStyle:[(CAMPreviewViewController *)self _styleForPointIndicator]];
    pointIndicator = self->__pointIndicator;
    self->__pointIndicator = v3;

    [(CAMFocusIndicatorView *)self->__pointIndicator setDelegate:self];
    id v5 = [(CAMPreviewViewController *)self previewView];
    [v5 setPointIndicator:self->__pointIndicator];
    [(CAMPreviewViewController *)self _initializeExposureBiasParametersForFocusIndicatorView:self->__pointIndicator];
  }
}

- (void)_createExternalFocusLockIndicatorIfNecessary
{
  if (!self->__externalFocusLockIndicator)
  {
    BOOL v3 = [[CAMFocusIndicatorView alloc] initWithStyle:1];
    externalFocusLockIndicator = self->__externalFocusLockIndicator;
    self->__externalFocusLockIndicator = v3;

    id v5 = self->__externalFocusLockIndicator;
    id v6 = [(CAMPreviewViewController *)self previewView];
    [v6 setExternalFocusLockIndicator:v5];
  }
}

- (void)_createStageLightOverlayViewIfNeededWillAnimate:(BOOL)a3
{
  if (!self->__stageLightOverlayView)
  {
    BOOL v3 = a3;
    id v5 = objc_alloc_init(CAMStageLightOverlayView);
    stageLightOverlayView = self->__stageLightOverlayView;
    self->__stageLightOverlayView = v5;

    [(CAMStageLightOverlayView *)self->__stageLightOverlayView setVisible:0];
    BOOL v7 = self->__stageLightOverlayView;
    id v8 = [(CAMPreviewViewController *)self previewView];
    [v8 setStageLightOverlayView:v7];

    if (v3)
    {
      id v9 = [(CAMPreviewViewController *)self previewView];
      [v9 layoutIfNeeded];
    }
  }
}

- (int64_t)_devicePosition
{
  unint64_t v2 = [(CAMPreviewViewController *)self _graphConfiguration];
  int64_t v3 = [v2 devicePosition];

  return v3;
}

- (void)willChangeToGraphConfiguration:(id)a3
{
  [(CAMPreviewViewController *)self _setGraphConfiguration:a3];
  [(CAMPreviewViewController *)self _willChangeGraphConfiguration];
}

- (void)didChangeToGraphConfiguration:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CAMPreviewViewController *)self _setGraphConfiguration:v6];
  [(CAMPreviewViewController *)self _didChangeGraphConfigurationAnimated:v4];
  BOOL v7 = [v6 mode] == 4;
  id v8 = [(CAMPreviewViewController *)self previewView];
  id v9 = [v8 videoPreviewView];

  [v9 setSquare:v7 animated:v4];
  [(CAMPreviewViewController *)self _updatePreviewViewAspectMode];
  [(CAMPreviewViewController *)self _updatePreviewIndicatorClippingStyleForGraphConfiguration:v6];
}

- (void)_willChangeGraphConfiguration
{
  [(CAMPreviewViewController *)self _setChangingGraphConfiguration:1];
  [(CAMPreviewViewController *)self _resetCachedTimes];
  [(CAMPreviewViewController *)self _hideAllFocusIndicatorsAnimated:0];
  [(CAMPreviewViewController *)self _resetFaceTracking];
}

- (void)_didChangeGraphConfigurationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMPreviewViewController *)self _setChangingGraphConfiguration:0];
  [(CAMPreviewViewController *)self _updatePortraitModeViewsAnimated:v3];
}

- (void)_resetCachedTimes
{
  [(CAMPreviewViewController *)self _setLastTapToFocusTime:0];
  [(CAMPreviewViewController *)self _setLastExposureBiasModifiedTime:0];
  [(CAMPreviewViewController *)self _setLastFocusIndictorStartTime:0];
}

- (void)_createAspectRatioToggleDoubleTapGestureRecognizerIfNecessary
{
  if (!self->__aspectRatioToggleDoubleTapGestureRecognizer)
  {
    BOOL v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleAspectRatioToggleDoubleTap_];
    aspectRatioToggleDoubleTapGestureRecognizer = self->__aspectRatioToggleDoubleTapGestureRecognizer;
    self->__aspectRatioToggleDoubleTapGestureRecognizer = v3;

    [(UITapGestureRecognizer *)self->__aspectRatioToggleDoubleTapGestureRecognizer setCancelsTouchesInView:0];
    [(UITapGestureRecognizer *)self->__aspectRatioToggleDoubleTapGestureRecognizer setDelaysTouchesEnded:0];
    [(UITapGestureRecognizer *)self->__aspectRatioToggleDoubleTapGestureRecognizer setNumberOfTapsRequired:2];
    [(UITapGestureRecognizer *)self->__aspectRatioToggleDoubleTapGestureRecognizer setDelegate:self];
    id v5 = [(CAMPreviewViewController *)self view];
    [v5 addGestureRecognizer:self->__aspectRatioToggleDoubleTapGestureRecognizer];
  }
}

- (void)_updateForOrientationAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMPreviewViewController *)self _updateExposureBiasPanGestureRecognizerForOrientation];
  [(CAMPreviewViewController *)self _updatePortraitModeViewsAnimated:v3];
  [(CAMPreviewViewController *)self _updateMRCIndicatorsIfNecessaryAnimated:v3];
  id v5 = [(CAMPreviewViewController *)self previewView];
  objc_msgSend(v5, "setOrientation:animated:", -[CAMPreviewViewController _interfaceOrientation](self, "_interfaceOrientation"), v3);
}

uint64_t __55__CAMPreviewViewController__setFocusIndicatorsPulsing___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setPulsing:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_scalePortraitModeFocusIndicators
{
  if (![(CAMPreviewViewController *)self _shouldDisableFocusUI]
    && [(CAMPreviewViewController *)self isShowingStandardControls]
    && [(CAMPreviewViewController *)self _shouldShowPortraitModeIndicatorViews])
  {
    id v5 = [(CAMPreviewViewController *)self _portraitModeCenteredIndicatorView];
    [v5 startScalingWithExpansionWidth:2 duration:8.0 repeatCount:0.35];
    BOOL v3 = [(CAMPreviewViewController *)self _indicatorViewsByType];
    BOOL v4 = [v3 objectForKeyedSubscript:@"portraitSubject"];

    [v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_52];
  }
}

uint64_t __61__CAMPreviewViewController__scalePortraitModeFocusIndicators__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 startScalingWithExpansionWidth:2 duration:10.0 repeatCount:0.35];
}

uint64_t __57__CAMPreviewViewController__hideFocusIndicator_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAllAnimations:1];
}

- (BOOL)_isShowingFocusIndicator:(id)a3
{
  [a3 alpha];
  return v3 > 0.0;
}

- (BOOL)_isShowingContinuousIndicator
{
  unint64_t v2 = self;
  double v3 = [(CAMPreviewViewController *)self _continuousIndicator];
  LOBYTE(v2) = [(CAMPreviewViewController *)v2 _isShowingFocusIndicator:v3];

  return (char)v2;
}

- (BOOL)isShowingPointIndicator
{
  unint64_t v2 = self;
  double v3 = [(CAMPreviewViewController *)self _pointIndicator];
  LOBYTE(v2) = [(CAMPreviewViewController *)v2 _isShowingFocusIndicator:v3];

  return (char)v2;
}

- (void)_activateFocusIndicator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:v4];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__CAMPreviewViewController__activateFocusIndicator___block_invoke;
    aBlock[3] = &unk_263FA0208;
    id v7 = v4;
    id v5 = _Block_copy(aBlock);
    [MEMORY[0x263F82E00] animateWithDuration:6 delay:v5 options:0 animations:0.25 completion:0.0];
  }
}

uint64_t __52__CAMPreviewViewController__activateFocusIndicator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_deactivateFocusIndicator:(id)a3 afterDelay:(double)a4
{
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
    [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:v6];
    [v8 setPulsing:0];
    if (a4 <= 0.0) {
      id v6 = (id)[(CAMPreviewViewController *)self _deactivateFocusIndicator:v8];
    }
    else {
      id v6 = (id)[(CAMPreviewViewController *)self performSelector:sel__deactivateFocusIndicator_ withObject:v8 afterDelay:a4];
    }
    id v7 = v8;
  }
  MEMORY[0x270F9A758](v6, v7);
}

- (void)_deactivateFocusIndicator:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:v4];
    [v4 setPulsing:0];
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__CAMPreviewViewController__deactivateFocusIndicator___block_invoke;
    aBlock[3] = &unk_263FA0208;
    id v7 = v4;
    id v5 = _Block_copy(aBlock);
    [MEMORY[0x263F82E00] animateWithDuration:6 delay:v5 options:0 animations:0.25 completion:0.0];
  }
}

uint64_t __54__CAMPreviewViewController__deactivateFocusIndicator___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alpha];
  if (v3 > 0.0)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 setAlpha:0.36];
  }
  return result;
}

- (CGPoint)pointOfInterestInNormalizedCaptureDeviceSpace
{
  double v3 = [(CAMPreviewViewController *)self previewView];
  id v4 = [(CAMPreviewViewController *)self _pointIndicator];
  double v5 = 0.5;
  double v6 = 0.5;
  if ([(CAMPreviewViewController *)self isShowingPointIndicator])
  {
    id v7 = [v4 superview];
    [v4 center];
    objc_msgSend(v7, "convertPoint:toView:", v3);
    double v9 = v8;
    double v11 = v10;

    objc_msgSend(v3, "captureDevicePointOfInterestForPoint:", v9, v11);
    double v6 = v12;
    double v5 = v13;
  }

  double v14 = v6;
  double v15 = v5;
  result.y = v15;
  result.x = v14;
  return result;
}

- (void)_showIndicatorAtPointOfInterest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(CAMPreviewViewController *)self _shouldDisableFocusUI])
  {
    if ([(CAMPreviewViewController *)self isShowingStandardControls])
    {
      [(CAMPreviewViewController *)self _createPointIndicatorIfNecessary];
      double v6 = [(CAMPreviewViewController *)self _pointIndicator];
      id v7 = (void *)MEMORY[0x263F82E00];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __60__CAMPreviewViewController__showIndicatorAtPointOfInterest___block_invoke;
      v21[3] = &unk_263FA0408;
      v21[4] = self;
      id v8 = v6;
      id v22 = v8;
      [v7 performWithoutAnimation:v21];
      double v9 = [(CAMPreviewViewController *)self previewView];
      objc_msgSend(v9, "indicatePointOfInterest:", x, y);
      [(CAMPreviewViewController *)self _hideAllFocusIndicatorsExceptForIndicator:v8];
      [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:v8];
      [(CAMPreviewViewController *)self _hideIndicatorsOfViewType:@"face" animated:1];
      [(CAMPreviewViewController *)self _hidePortraitModeTrackedSubjectIndicatorsAnimated:1];
      double v10 = [v8 layer];
      double v11 = NSStringFromSelector(sel_opacity);
      [v10 removeAnimationForKey:v11];

      [v8 startScalingWithExpansionWidth:1 duration:37.0 repeatCount:0.2];
      [v8 setPulsing:1];
      double v12 = [MEMORY[0x263EFF910] date];
      [(CAMPreviewViewController *)self _setLastFocusIndictorStartTime:v12];

      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      int v17 = __60__CAMPreviewViewController__showIndicatorAtPointOfInterest___block_invoke_2;
      id v18 = &unk_263FA0408;
      id v19 = v8;
      uint64_t v20 = self;
      id v13 = v8;
      double v14 = _Block_copy(&v15);
      objc_msgSend(MEMORY[0x263F82E00], "animateWithDuration:delay:options:animations:completion:", 2, v14, 0, 0.25, 0.0, v15, v16, v17, v18);
    }
  }
}

uint64_t __60__CAMPreviewViewController__showIndicatorAtPointOfInterest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "setStyle:", objc_msgSend(*(id *)(a1 + 32), "_styleForPointIndicator"));
  objc_msgSend(*(id *)(a1 + 40), "setShowExposureBias:", objc_msgSend(*(id *)(a1 + 32), "_showExposureBiasSliderForPointView"));
  [*(id *)(a1 + 40) setAlpha:0.0];
  uint64_t v2 = [*(id *)(a1 + 32) _shouldShowIndicatorsAsInactive];
  double v3 = *(void **)(a1 + 40);
  return [v3 setInactive:v2];
}

uint64_t __60__CAMPreviewViewController__showIndicatorAtPointOfInterest___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 _updatePortraitModeViewsAnimated:1];
}

- (int64_t)_styleForPointIndicator
{
  if ([(CAMPreviewViewController *)self _mode] == 6) {
    return 4;
  }
  else {
    return 2;
  }
}

- (int64_t)_largeStyleForPointIndicator
{
  if ([(CAMPreviewViewController *)self _mode] == 6) {
    return 3;
  }
  else {
    return 0;
  }
}

- (void)_showLockedAtPointOfInterest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if (![(CAMPreviewViewController *)self _shouldDisableFocusUI])
  {
    if ([(CAMPreviewViewController *)self isShowingStandardControls])
    {
      [(CAMPreviewViewController *)self _createPointIndicatorIfNecessary];
      double v6 = [(CAMPreviewViewController *)self _pointIndicator];
      id v7 = (void *)MEMORY[0x263F82E00];
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __57__CAMPreviewViewController__showLockedAtPointOfInterest___block_invoke;
      v21[3] = &unk_263FA0408;
      v21[4] = self;
      id v8 = v6;
      id v22 = v8;
      [v7 performWithoutAnimation:v21];
      [(CAMPreviewViewController *)self _hideAllFocusIndicatorsExceptForIndicator:v8];
      [(CAMPreviewViewController *)self _cancelDelayedHideOrDeactivateForFocusIndicator:v8];
      [(CAMPreviewViewController *)self _hideIndicatorsOfViewType:@"face" animated:1];
      [(CAMPreviewViewController *)self _hidePortraitModeTrackedSubjectIndicatorsAnimated:1];
      double v9 = [(CAMPreviewViewController *)self previewView];
      objc_msgSend(v9, "indicatePointOfInterest:", x, y);
      double v10 = [v8 layer];
      double v11 = NSStringFromSelector(sel_opacity);
      [v10 removeAnimationForKey:v11];

      [v8 setPulsing:1];
      double v12 = [MEMORY[0x263EFF910] date];
      [(CAMPreviewViewController *)self _setLastFocusIndictorStartTime:v12];

      uint64_t v15 = MEMORY[0x263EF8330];
      uint64_t v16 = 3221225472;
      int v17 = __57__CAMPreviewViewController__showLockedAtPointOfInterest___block_invoke_2;
      id v18 = &unk_263FA0408;
      id v19 = v8;
      uint64_t v20 = self;
      id v13 = v8;
      double v14 = _Block_copy(&v15);
      objc_msgSend(MEMORY[0x263F82E00], "animateWithDuration:delay:options:animations:completion:", 2, v14, 0, 0.25, 0.0, v15, v16, v17, v18);
    }
  }
}

uint64_t __57__CAMPreviewViewController__showLockedAtPointOfInterest___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "setStyle:", objc_msgSend(*(id *)(a1 + 32), "_largeStyleForPointIndicator"));
  [*(id *)(a1 + 40) setShowExposureBias:0];
  [*(id *)(a1 + 40) setAlpha:0.0];
  uint64_t v2 = [*(id *)(a1 + 32) _shouldShowIndicatorsAsInactive];
  double v3 = *(void **)(a1 + 40);
  return [v3 setInactive:v2];
}

uint64_t __57__CAMPreviewViewController__showLockedAtPointOfInterest___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 _updatePortraitModeViewsAnimated:1];
}

- (void)_finishFocusingLockedPointOfInterestIndicator
{
  id v2 = [(CAMPreviewViewController *)self _pointIndicator];
  [v2 startScalingWithExpansionWidth:2 duration:31.0 repeatCount:0.3];
  [v2 setPulsing:0];
}

- (void)_scaleDownLockedPointOfInterest
{
  int64_t v3 = [(CAMPreviewViewController *)self _styleForPointIndicator];
  id v4 = [(CAMPreviewViewController *)self _pointIndicator];
  objc_initWeak(&location, v4);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__CAMPreviewViewController__scaleDownLockedPointOfInterest__block_invoke;
  v5[3] = &unk_263FA0868;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  [v4 setStyle:v3 animated:1 completion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __59__CAMPreviewViewController__scaleDownLockedPointOfInterest__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setShowExposureBias:", objc_msgSend(*(id *)(a1 + 32), "_showExposureBiasSliderForPointView"));
}

- (void)_fadeInView:(id)a3 withDuration:(double)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__CAMPreviewViewController__fadeInView_withDuration___block_invoke;
  v7[3] = &unk_263FA0208;
  id v8 = v5;
  id v6 = v5;
  +[CAMView animateIfNeededWithDuration:6 options:v7 animations:0 completion:a4];
}

uint64_t __53__CAMPreviewViewController__fadeInView_withDuration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)_fadeOutView:(id)a3 withDuration:(double)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __65__CAMPreviewViewController__fadeOutView_withDuration_completion___block_invoke;
  v13[3] = &unk_263FA0208;
  id v14 = v7;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __65__CAMPreviewViewController__fadeOutView_withDuration_completion___block_invoke_2;
  v11[3] = &unk_263FA1EE0;
  id v12 = v8;
  id v9 = v8;
  id v10 = v7;
  +[CAMView animateIfNeededWithDuration:6 options:v13 animations:v11 completion:a4];
}

uint64_t __65__CAMPreviewViewController__fadeOutView_withDuration_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __65__CAMPreviewViewController__fadeOutView_withDuration_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- ($4AAF98A9092C2FA9448861FB2530D732)_geometryAnimationParametersForViewType:(SEL)a3
{
  id v6 = a4;
  int v7 = [v6 isEqual:@"textRegion"];
  int v8 = [v6 isEqual:@"MRC"];

  double v9 = 0.6;
  if (v8) {
    double v9 = 0.15;
  }
  if (v7) {
    double v10 = 0.3;
  }
  else {
    double v10 = 0.4;
  }
  if (v7) {
    double v11 = 0.3;
  }
  else {
    double v11 = v9;
  }
  uint64_t result = ($4AAF98A9092C2FA9448861FB2530D732 *)[(CAMPreviewViewController *)self _disableIndicatorGeometryAnimations];
  double v13 = 0.0;
  if (result) {
    double v14 = 0.0;
  }
  else {
    double v14 = v10;
  }
  if (!result) {
    double v13 = v11;
  }
  retstr->var0.var0 = v13;
  retstr->var0.var1 = 2;
  retstr->var0.var2 = (v7 | v8) ^ 1;
  *(_DWORD *)(&retstr->var0.var2 + 1) = 0;
  *((_DWORD *)&retstr->var0.var2 + 1) = 0;
  *(_OWORD *)&retstr->var0.var3 = xmmword_209C7BA00;
  retstr->var1.var0 = v14;
  *(_OWORD *)&retstr->var1.var1 = xmmword_209C7BA10;
  *(_OWORD *)&retstr->var1.var3 = xmmword_209C7BA00;
  return result;
}

- (void)_animateIfNeededWithParameters:(id *)a3 animations:(id)a4 completion:(id)a5
{
  double var0 = a3->var0;
  if (a3->var2) {
    +[CAMView animateIfNeededWithDuration:a3->var1 usingSpringWithDamping:a4 initialSpringVelocity:a5 options:var0 animations:a3->var3 completion:a3->var4];
  }
  else {
    +[CAMView animateIfNeededWithDuration:a3->var1 options:a4 animations:a5 completion:var0];
  }
}

- (void)_animateView:(id)a3 type:(id)a4 withCenter:(CGPoint)a5 bounds:(CGRect)a6 transform:(CGAffineTransform *)a7
{
  double height = a6.size.height;
  double width = a6.size.width;
  double y = a6.origin.y;
  double x = a6.origin.x;
  CGFloat v12 = a5.y;
  CGFloat v13 = a5.x;
  id v16 = a3;
  long long v45 = 0u;
  memset(v46, 0, sizeof(v46));
  long long v44 = 0u;
  [(CAMPreviewViewController *)self _geometryAnimationParametersForViewType:a4];
  v40[0] = MEMORY[0x263EF8330];
  v40[1] = 3221225472;
  v40[2] = __74__CAMPreviewViewController__animateView_type_withCenter_bounds_transform___block_invoke;
  v40[3] = &unk_263FA2BC8;
  id v17 = v16;
  id v41 = v17;
  CGFloat v42 = v13;
  CGFloat v43 = v12;
  long long v37 = v44;
  long long v38 = v45;
  uint64_t v39 = v46[0];
  [(CAMPreviewViewController *)self _animateIfNeededWithParameters:&v37 animations:v40 completion:0];
  id v18 = [v17 layer];
  id v19 = [v18 valueForKeyPath:@"transform.rotation.z"];
  [v19 doubleValue];
  double v21 = v20;

  double v22 = atan2(a7->b, a7->a);
  double v23 = vabdd_f64(v22, v21);
  if (v23 <= vabdd_f64(v22, v21 + 1.57079633) && v23 <= vabdd_f64(v22, v21 + -1.57079633))
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __74__CAMPreviewViewController__animateView_type_withCenter_bounds_transform___block_invoke_2;
    v27[3] = &unk_263FA4A80;
    id v28 = v17;
    double v29 = x;
    double v30 = y;
    double v31 = width;
    double v32 = height;
    long long v26 = *(_OWORD *)&a7->c;
    long long v33 = *(_OWORD *)&a7->a;
    long long v34 = v26;
    long long v35 = *(_OWORD *)&a7->tx;
    long long v37 = *(_OWORD *)&v46[1];
    long long v38 = *(_OWORD *)&v46[3];
    uint64_t v39 = v46[5];
    [(CAMPreviewViewController *)self _animateIfNeededWithParameters:&v37 animations:v27 completion:0];
  }
  else
  {
    long long v24 = *(_OWORD *)&a7->c;
    v36[0] = *(_OWORD *)&a7->a;
    long long v25 = *(_OWORD *)&a7->tx;
    v36[1] = v24;
    v36[2] = v25;
    [v17 setTransform:v36];
    objc_msgSend(v17, "setBounds:", x, y, width, height);
  }
}

uint64_t __74__CAMPreviewViewController__animateView_type_withCenter_bounds_transform___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __74__CAMPreviewViewController__animateView_type_withCenter_bounds_transform___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  long long v2 = *(_OWORD *)(a1 + 88);
  v4[0] = *(_OWORD *)(a1 + 72);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 104);
  [*(id *)(a1 + 32) setTransform:v4];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updatePreviewIndicatorClippingStyleForGraphConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = +[CAMCaptureCapabilities capabilities];
  uint64_t v6 = [v4 mode];
  uint64_t v7 = [v4 device];

  LODWORD(v4) = [v5 spatialOverCaptureSupportForMode:v6 device:v7];
  id v8 = [(CAMPreviewViewController *)self previewView];
  [v8 setIndicatorClippingStyle:~(v4 >> 1) & 1];
}

- (void)_addIndicatorView:(id)a3 forType:(id)a4 identifier:(id)a5 underlyingMetadataObject:(id)a6
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    CGFloat v12 = [(CAMPreviewViewController *)self _indicatorViewsByType];
    CGFloat v13 = [v12 objectForKeyedSubscript:v10];

    if (!v13)
    {
      CGFloat v13 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      double v14 = [(CAMPreviewViewController *)self _indicatorViewsByType];
      [v14 setObject:v13 forKeyedSubscript:v10];
    }
    id v15 = [v13 objectForKeyedSubscript:v11];
    id v16 = v15;
    if (v15 && v15 != v9)
    {
      [v15 removeFromSuperview];
      id v17 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138543618;
        id v21 = v10;
        __int16 v22 = 2114;
        id v23 = v11;
        _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "Removed an existing client-managed view that shares the same identifier as a view that is being added (type/identifier: %{public}@/%{public}@", (uint8_t *)&v20, 0x16u);
      }
    }
    id v18 = [(CAMPreviewViewController *)self previewView];
    id v19 = [v18 indicatorContainerView];
    [v19 addSubview:v9];

    [v13 setObject:v9 forKeyedSubscript:v11];
  }
  else
  {
    CGFloat v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138543618;
      id v21 = v10;
      __int16 v22 = 2114;
      id v23 = v11;
      _os_log_impl(&dword_2099F8000, v13, OS_LOG_TYPE_DEFAULT, "Trying to add nil view for type/identifier: %{public}@/%{public}@", (uint8_t *)&v20, 0x16u);
    }
  }
}

- (void)_removeIndicatorViewForType:(id)a3 identifier:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = [(CAMPreviewViewController *)self _indicatorViewsByType];
  id v8 = [v7 objectForKeyedSubscript:v12];

  uint64_t v9 = [v8 count];
  id v10 = [v8 objectForKeyedSubscript:v6];
  [v10 removeFromSuperview];
  [v8 setObject:0 forKeyedSubscript:v6];

  uint64_t v11 = [v8 count];
  if (v9 == 1 && !v11 && [v12 isEqualToString:@"portraitSubject"]) {
    [(CAMPreviewViewController *)self _updatePortraitModeViewsAnimated:1];
  }
}

- (void)_fadeOutAndRemoveIndicatorView:(id)a3 forType:(id)a4 identifier:(id)a5 withDuration:(double)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  CGFloat v13 = [(CAMPreviewViewController *)self _metadataObjectsForView];
  [v13 removeObjectForKey:v10];

  [v10 alpha];
  if (v14 != 0.0)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __91__CAMPreviewViewController__fadeOutAndRemoveIndicatorView_forType_identifier_withDuration___block_invoke;
    v15[3] = &unk_263FA0A60;
    id v16 = v10;
    id v17 = self;
    id v18 = v11;
    id v19 = v12;
    [(CAMPreviewViewController *)self _fadeOutView:v16 withDuration:v15 completion:a6];
  }
}

uint64_t __91__CAMPreviewViewController__fadeOutAndRemoveIndicatorView_forType_identifier_withDuration___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) alpha];
  if (v3 == 0.0)
  {
    id v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    return [v4 _removeIndicatorViewForType:v5 identifier:v6];
  }
  return result;
}

- (void)_fadeOutAndRemoveIndicatorViewsOfType:(id)a3 withDuration:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [(CAMPreviewViewController *)self _indicatorViewsByType];
  id v8 = [v7 objectForKeyedSubscript:v6];
  uint64_t v9 = (void *)[v8 copy];

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__CAMPreviewViewController__fadeOutAndRemoveIndicatorViewsOfType_withDuration___block_invoke;
  v11[3] = &unk_263FA6118;
  void v11[4] = self;
  id v12 = v6;
  double v13 = a4;
  id v10 = v6;
  [v9 enumerateKeysAndObjectsUsingBlock:v11];
}

uint64_t __79__CAMPreviewViewController__fadeOutAndRemoveIndicatorViewsOfType_withDuration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _fadeOutAndRemoveIndicatorView:a3 forType:*(void *)(a1 + 40) identifier:a2 withDuration:*(double *)(a1 + 48)];
}

- (void)_updateIndicatorsForMetadataObjectResults:(id)a3 allowNewAndReappearingIndicators:(BOOL)a4 viewType:(id)a5 viewClass:(Class)a6 geometryCallback:(id)a7 minimumAreaChangeThreshold:(double)a8 minimumAreaFractionChangeThreshold:(double)a9
{
}

- (void)_updateIndicatorsForMetadataObjectResults:(id)a3 allowNewAndReappearingIndicators:(BOOL)a4 viewType:(id)a5 viewClass:(Class)a6 geometryCallback:(id)a7 minimumAreaChangeThreshold:(double)a8 minimumAreaFractionChangeThreshold:(double)a9 viewInitializerCallback:(id)a10
{
  void (**v16)(_OWORD *__return_ptr, id, void *);
  void (**v17)(void);
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  uint64_t j;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  uint64_t v54;
  BOOL v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  void *v65;
  id v66;
  void (**v70)(void);
  id obj;
  id v72;
  uint64_t v73;
  void *v74;
  BOOL v75;
  _OWORD v76[3];
  _OWORD v77[3];
  _OWORD v78[3];
  long long v79;
  long long v80;
  long long v81;
  long long v82;
  long long v83;
  long long v84;
  long long v85;
  void v86[4];
  id v87;
  CAMPreviewViewController *v88;
  id v89;
  long long v90;
  long long v91;
  long long v92;
  long long v93;
  unsigned char v94[128];
  unsigned char v95[128];
  uint64_t v96;

  v75 = a4;
  v96 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a5;
  id v16 = (void (**)(_OWORD *__return_ptr, id, void *))a7;
  id v17 = (void (**)(void))a10;
  id v18 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  v90 = 0u;
  v91 = 0u;
  v92 = 0u;
  v93 = 0u;
  id v19 = v14;
  int v20 = [v19 countByEnumeratingWithState:&v90 objects:v95 count:16];
  if (v20)
  {
    id v21 = v20;
    __int16 v22 = *(void *)v91;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(void *)v91 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = [*(id *)(*((void *)&v90 + 1) + 8 * i) uniqueIdentifier];
        [v18 addObject:v24];
      }
      id v21 = [v19 countByEnumeratingWithState:&v90 objects:v95 count:16];
    }
    while (v21);
  }
  v70 = v17;

  long long v25 = [(CAMPreviewViewController *)self _indicatorViewsByType];
  long long v26 = [v25 objectForKeyedSubscript:v15];
  v27 = (void *)[v26 copy];

  v86[0] = MEMORY[0x263EF8330];
  v86[1] = 3221225472;
  v86[2] = __225__CAMPreviewViewController__updateIndicatorsForMetadataObjectResults_allowNewAndReappearingIndicators_viewType_viewClass_geometryCallback_minimumAreaChangeThreshold_minimumAreaFractionChangeThreshold_viewInitializerCallback___block_invoke;
  v86[3] = &unk_263FA6140;
  v66 = v18;
  v87 = v66;
  v88 = self;
  v72 = v15;
  v89 = v72;
  v74 = v27;
  [v27 enumerateKeysAndObjectsUsingBlock:v86];
  v84 = 0u;
  v85 = 0u;
  v82 = 0u;
  v83 = 0u;
  obj = v19;
  id v28 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
  if (v28)
  {
    double v29 = v28;
    v73 = *(void *)v83;
    double v30 = *MEMORY[0x263F001A8];
    double v31 = *(double *)(MEMORY[0x263F001A8] + 8);
    do
    {
      for (j = 0; j != v29; ++j)
      {
        if (*(void *)v83 != v73) {
          objc_enumerationMutation(obj);
        }
        long long v33 = *(void **)(*((void *)&v82 + 1) + 8 * j);
        long long v34 = objc_msgSend(v33, "uniqueIdentifier", v66);
        v80 = 0u;
        v81 = 0u;
        v79 = 0u;
        memset(v78, 0, sizeof(v78));
        v16[2](v78, v16, v33);
        UIRectCenteredAboutPointScale();
        double v36 = v35;
        long long v38 = v37;
        v40 = v39;
        CGFloat v42 = v41;
        CGFloat v43 = [(CAMPreviewViewController *)self previewView];
        long long v44 = [(CAMPreviewViewController *)self previewView];
        long long v45 = [v44 indicatorContainerView];
        objc_msgSend(v43, "convertRect:toView:", v45, v36, v38, v40, v42);
        v47 = v46;
        v49 = v48;
        v51 = v50;
        v53 = v52;

        v54 = [v74 objectForKeyedSubscript:v34];
        if (v54) {
          v55 = 1;
        }
        else {
          v55 = !v75;
        }
        if (v55)
        {
          v56 = (void *)v54;
          if (v54)
          {
            UIRectGetCenter();
            v58 = v57;
            v60 = v59;
            [v56 bounds];
            v62 = v61;
            v64 = v63;
            if (!-[CAMPreviewViewController _shouldUpdateIndicatorSizeFrom:to:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:](self, "_shouldUpdateIndicatorSizeFrom:to:minimumAreaChangeThreshold:minimumAreaFractionChangeThreshold:", v61, v63, v51, v53, a8, a9))
            {
              v51 = v62;
              v53 = v64;
            }
            if (v75) {
              [(CAMPreviewViewController *)self _fadeInView:v56 withDuration:0.25];
            }
            v76[0] = v79;
            v76[1] = v80;
            v76[2] = v81;
            -[CAMPreviewViewController _animateView:type:withCenter:bounds:transform:](self, "_animateView:type:withCenter:bounds:transform:", v56, v72, v76, v58, v60, v30, v31, v51, v53);
          }
        }
        else
        {
          v56 = objc_msgSend([a6 alloc], "initWithFrame:", v47, v49, v51, v53);
          if (v70) {
            v70[2]();
          }
          v77[0] = v79;
          v77[1] = v80;
          v77[2] = v81;
          [v56 setTransform:v77];
          [v56 layoutIfNeeded];
          [(CAMPreviewViewController *)self _addIndicatorView:v56 forType:v72 identifier:v34 underlyingMetadataObject:v33];
          [v56 setAlpha:0.0];
          [(CAMPreviewViewController *)self _fadeInView:v56 withDuration:0.25];
        }
        v65 = [(CAMPreviewViewController *)self _metadataObjectsForView];
        [v65 setObject:v33 forKey:v56];
      }
      double v29 = [obj countByEnumeratingWithState:&v82 objects:v94 count:16];
    }
    while (v29);
  }
}

void __225__CAMPreviewViewController__updateIndicatorsForMetadataObjectResults_allowNewAndReappearingIndicators_viewType_viewClass_geometryCallback_minimumAreaChangeThreshold_minimumAreaFractionChangeThreshold_viewInitializerCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:v6] & 1) == 0) {
    [*(id *)(a1 + 40) _fadeOutAndRemoveIndicatorView:v5 forType:*(void *)(a1 + 48) identifier:v6 withDuration:0.15];
  }
}

- (BOOL)_isShowingIndicatorsOfType:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMPreviewViewController *)self _indicatorViewsByType];
  id v6 = [v5 objectForKeyedSubscript:v4];

  LOBYTE(v5) = [v6 count] != 0;
  return (char)v5;
}

- (void)_fadeOutIndicatorsOfViewType:(id)a3 afterDelay:(double)a4
{
  id v8 = a3;
  BOOL v6 = [(CAMPreviewViewController *)self _disableDelayedFadeOutForFaces];
  BOOL v7 = a4 <= 0.0 || !v6;
  if ((v7 || ([v8 isEqualToString:@"face"] & 1) == 0)
    && (![(CAMPreviewViewController *)self isFocusAndExposureExternallyLocked]
     || ([v8 isEqualToString:@"face"] & 1) == 0))
  {
    [(CAMPreviewViewController *)self _cancelDelayedFadeOutOfViewType:v8];
    [(CAMPreviewViewController *)self performSelector:sel__fadeOutIndicatorsOfViewType_ withObject:v8 afterDelay:a4];
  }
}

- (void)_cancelDelayedFadeOutOfViewType:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__fadeOutIndicatorsOfViewType_ object:v4];
}

- (void)_fadeOutIndicatorsOfViewType:(id)a3
{
}

- (void)_hideIndicatorsOfViewType:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  [(CAMPreviewViewController *)self _cancelDelayedFadeOutOfViewType:v7];
  if ([v7 isEqualToString:@"face"]) {
    [(CAMPreviewViewController *)self _setShouldSuppressExistingFaceIndicators:1];
  }
  double v6 = 0.0;
  if (v4) {
    double v6 = 0.75;
  }
  [(CAMPreviewViewController *)self _fadeOutAndRemoveIndicatorViewsOfType:v7 withDuration:v6];
}

- (BOOL)_shouldSuppressNewFaces
{
  long long v2 = self;
  double v3 = [(CAMPreviewViewController *)self _captureController];
  BOOL v4 = [(CAMPreviewViewController *)v2 isShowingPointIndicator];
  LOBYTE(v2) = [(CAMPreviewViewController *)v2 _isFocusAndExposureLockedByUserOrExternally];
  LOBYTE(v2) = v4 | v2 | [v3 isCapturingVideo];

  return (char)v2;
}

- (void)captureController:(id)a3 didOutputFaceResults:(id)a4 headResults:(id)a5 bodyResults:(id)a6 salientObjectResults:(id)a7
{
  id v18 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = a7;
  if (![(CAMPreviewViewController *)self _shouldDisableFocusUI]
    && [(CAMPreviewViewController *)self isShowingStandardControls])
  {
    if ([v18 count] && objc_msgSend(v12, "count"))
    {
      id v14 = [v18 arrayByAddingObjectsFromArray:v12];
    }
    else if ([v18 count])
    {
      id v14 = v18;
    }
    else
    {
      id v14 = v12;
    }
    id v15 = v14;
    if ([v13 count])
    {
      uint64_t v16 = [v15 arrayByAddingObjectsFromArray:v13];

      id v15 = (void *)v16;
    }
    if ([v11 count])
    {
      uint64_t v17 = [v15 arrayByAddingObjectsFromArray:v11];

      id v15 = (void *)v17;
    }
    if ([(CAMPreviewViewController *)self _shouldAllowFaceIndicators]) {
      [(CAMPreviewViewController *)self _updateFaceIndicatorsForResults:v15];
    }
    [(CAMPreviewViewController *)self _updatePortraitModeViewsForResults:v15];
    [(CAMPreviewViewController *)self _updateCinematicModeViewsForResults:v15];
  }
}

- (void)_updateFaceIndicatorsForResults:(id)a3
{
  id v4 = a3;
  if (![(CAMPreviewViewController *)self isFocusAndExposureExternallyLocked]
    || [(CAMPreviewViewController *)self _externalLockNeedsCurrentFacesToAppear])
  {
    uint64_t v5 = [v4 count];
    double v6 = [(CAMPreviewViewController *)self _graphConfiguration];
    uint64_t v7 = [v6 mode];

    if (v7) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = [(CAMPreviewViewController *)self shouldUsePortraitStyleIndicatorsInPhotoMode];
    }
    BOOL v9 = [(CAMPreviewViewController *)self _externalLockNeedsCurrentFacesToAppear];
    [(CAMPreviewViewController *)self _setExternalLockNeedsCurrentFacesToAppear:0];
    if (v8) {
      [(CAMPreviewViewController *)self _cancelDelayedFadeOutOfViewType:@"face"];
    }
    if (v9)
    {
      [(CAMPreviewViewController *)self _cancelDelayedFadeOutOfViewType:@"face"];
      [(CAMPreviewViewController *)self _setCurrentFacesCount:v5];
      [(CAMPreviewViewController *)self _setShouldSuppressExistingFaceIndicators:0];
    }
    else if ([(CAMPreviewViewController *)self _currentFacesCount] != v5)
    {
      if ([(CAMPreviewViewController *)self _shouldSuppressNewFaces])
      {
        [(CAMPreviewViewController *)self _setCurrentFacesCount:0];
      }
      else
      {
        [(CAMPreviewViewController *)self _setShouldSuppressExistingFaceIndicators:0];
        [(CAMPreviewViewController *)self _setCurrentFacesCount:v5];
        if (!v8) {
          [(CAMPreviewViewController *)self _fadeOutIndicatorsOfViewType:@"face" afterDelay:1.5];
        }
      }
    }
    uint64_t v10 = [(CAMPreviewViewController *)self _shouldSuppressExistingFaceIndicators] ^ 1;
    uint64_t v11 = objc_opt_class();
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __60__CAMPreviewViewController__updateFaceIndicatorsForResults___block_invoke;
    v14[3] = &unk_263FA6168;
    v14[4] = self;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__CAMPreviewViewController__updateFaceIndicatorsForResults___block_invoke_2;
    v13[3] = &unk_263FA6190;
    void v13[4] = self;
    [(CAMPreviewViewController *)self _updateIndicatorsForMetadataObjectResults:v4 allowNewAndReappearingIndicators:v10 viewType:@"face" viewClass:v11 geometryCallback:v14 minimumAreaChangeThreshold:v13 minimumAreaFractionChangeThreshold:2500.0 viewInitializerCallback:0.21];
    if (![(CAMPreviewViewController *)self _shouldSuppressExistingFaceIndicators]&& v5)
    {
      id v12 = [(CAMPreviewViewController *)self _continuousIndicator];
      [(CAMPreviewViewController *)self _hideFocusIndicator:v12 animated:0];
    }
  }
}

void __60__CAMPreviewViewController__updateFaceIndicatorsForResults___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v15 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v6 = *(void **)(a1 + 32);
  if (isKindOfClass)
  {
    id v7 = v15;
    BOOL v8 = [v6 previewView];
    [v8 faceIndicatorFrameForFaceResult:v7];
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    BOOL v8 = [v6 previewView];
    [v8 frameForMetadataObjectResult:v15];
    double v10 = v13;
    double v12 = v14;
  }

  CAMViewGeometryForFrame(a3, v10, v12);
}

void __60__CAMPreviewViewController__updateFaceIndicatorsForResults___block_invoke_2(uint64_t a1, void *a2)
{
  long long v2 = *(void **)(a1 + 32);
  id v4 = a2;
  if ([v2 shouldUsePortraitStyleIndicatorsInPhotoMode]) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 1;
  }
  [v4 setShape:v3 shouldUseCrosshairForAnimation:0 animated:0];
}

- (void)setShouldUsePortraitStyleIndicatorsInPhotoMode:(BOOL)a3
{
  if (self->_shouldUsePortraitStyleIndicatorsInPhotoMode != a3)
  {
    self->_shouldUsePortraitStyleIndicatorsInPhotoMode = a3;
    if (a3) {
      [(CAMPreviewViewController *)self _setCurrentFacesCount:0];
    }
    else {
      [(CAMPreviewViewController *)self _fadeOutIndicatorsOfViewType:@"face" afterDelay:1.5];
    }
    id v4 = [(CAMPreviewViewController *)self _graphConfiguration];
    uint64_t v5 = [v4 mode];

    if (!v5)
    {
      [(CAMPreviewViewController *)self _updatePhotoModeIndicatorsStyle];
    }
  }
}

- (void)_updatePhotoModeIndicatorsStyle
{
  uint64_t v3 = [(CAMPreviewViewController *)self _indicatorViewsByType];
  id v4 = [v3 objectForKeyedSubscript:@"face"];

  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__CAMPreviewViewController__updatePhotoModeIndicatorsStyle__block_invoke;
  v5[3] = &unk_263FA61B8;
  v5[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v5];
}

void __59__CAMPreviewViewController__updatePhotoModeIndicatorsStyle__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([*(id *)(a1 + 32) shouldUsePortraitStyleIndicatorsInPhotoMode]) {
      uint64_t v4 = 2;
    }
    else {
      uint64_t v4 = 1;
    }
    [v5 setShape:v4 shouldUseCrosshairForAnimation:0 animated:1];
  }
}

- (BOOL)_shouldAllowFaceIndicators
{
  unint64_t v2 = [(CAMPreviewViewController *)self _mode];
  return (v2 < 0xA) & (0x33Fu >> v2);
}

- (BOOL)_shouldShowCinematicModeIndicatorViews
{
  int64_t v3 = [(CAMPreviewViewController *)self _mode];
  BOOL v4 = ![(CAMPreviewViewController *)self _isChangingGraphConfiguration];
  return v3 == 7 && v4;
}

- (void)_updateCinematicModeViewsForResults:(id)a3
{
  id v4 = a3;
  if ([(CAMPreviewViewController *)self _shouldShowCinematicModeIndicatorViews]&& ![(CAMPreviewViewController *)self isFocusAndExposureExternallyLocked])
  {
    id v12 = 0;
    id v11 = 0;
    [(CAMPreviewViewController *)self _subjectGroupResultsFromMetadataObjects:v4 nonFixedFocusResults:&v12 fixedFocusResults:&v11];
    id v5 = v12;
    id v6 = v11;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __64__CAMPreviewViewController__updateCinematicModeViewsForResults___block_invoke;
    aBlock[3] = &unk_263FA6168;
    void aBlock[4] = self;
    id v7 = _Block_copy(aBlock);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __64__CAMPreviewViewController__updateCinematicModeViewsForResults___block_invoke_2;
    v9[3] = &unk_263FA6168;
    void v9[4] = self;
    BOOL v8 = _Block_copy(v9);
    [(CAMPreviewViewController *)self _updateIndicatorsForMetadataObjectResults:v5 allowNewAndReappearingIndicators:1 viewType:@"cinematicSubject" viewClass:objc_opt_class() geometryCallback:v7 minimumAreaChangeThreshold:2500.0 minimumAreaFractionChangeThreshold:0.21];
    [(CAMPreviewViewController *)self _updateIndicatorsForMetadataObjectResults:v6 allowNewAndReappearingIndicators:1 viewType:@"cinematicFixedFocus" viewClass:objc_opt_class() geometryCallback:v8 minimumAreaChangeThreshold:2500.0 minimumAreaFractionChangeThreshold:0.21];
    [(CAMPreviewViewController *)self _updateCinematicModeViewsForTrackingChange];
  }
}

void __64__CAMPreviewViewController__updateCinematicModeViewsForResults___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v12 = [v4 previewView];
  [MEMORY[0x263F30698] minimumSuggestedBounds];
  objc_msgSend(v12, "frameForSubjectGroupResult:minimumSize:", v5, v6, v7);
  double v9 = v8;
  double v11 = v10;

  CAMViewGeometryForFrame(a3, v9, v11);
}

void __64__CAMPreviewViewController__updateCinematicModeViewsForResults___block_invoke_2(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v10 = [v4 previewView];
  objc_msgSend(v10, "frameForMetadataObjectResult:fixedSize:", v5, 75.0, 75.0);
  double v7 = v6;
  double v9 = v8;

  CAMViewGeometryForFrame(a3, v7, v9);
}

- (void)_subjectGroupResultsFromMetadataObjects:(id)a3 nonFixedFocusResults:(id *)a4 fixedFocusResults:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v22 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v21 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        double v14 = [(CAMPreviewViewController *)self _groupIDForMetadataObject:v13];
        id v15 = [v7 objectForKey:v14];

        if (v15)
        {
          uint64_t v16 = [v7 objectForKeyedSubscript:v14];
          [v16 addObject:v13];
        }
        else
        {
          uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v13, 0);
          [v7 setObject:v16 forKeyedSubscript:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v10);
  }

  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __107__CAMPreviewViewController__subjectGroupResultsFromMetadataObjects_nonFixedFocusResults_fixedFocusResults___block_invoke;
  v25[3] = &unk_263FA61E0;
  id v26 = v21;
  id v27 = v22;
  id v17 = v22;
  id v18 = v21;
  [v7 enumerateKeysAndObjectsUsingBlock:v25];
  id v19 = v18;
  *a5 = v19;
  id v20 = v17;
  *a4 = v20;
}

void __107__CAMPreviewViewController__subjectGroupResultsFromMetadataObjects_nonFixedFocusResults_fixedFocusResults___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = [CAMSubjectGroupResult alloc];
  uint64_t v8 = [v6 integerValue];

  uint64_t v11 = [(CAMSubjectGroupResult *)v7 initWithMetadataObjects:v5 groupID:v8];
  char v9 = [(CAMSubjectGroupResult *)v11 syntheticFocusMode];
  uint64_t v10 = 32;
  if ((v9 & 4) == 0) {
    uint64_t v10 = 40;
  }
  [*(id *)(a1 + v10) addObject:v11];
}

- (id)_groupIDForMetadataObject:(id)a3
{
  int64_t v3 = [a3 underlyingMetadataObject];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 groupID] != -1)
  {
    uint64_t v4 = [v3 groupID];
LABEL_6:
    uint64_t v5 = v4;
    goto LABEL_14;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [v3 faceID];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = [v3 bodyID] + 1000;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v3 objectID] + 2000;
    }
    else
    {
      uint64_t v5 = arc4random_uniform(0x3E8u);
      id v6 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)char v9 = 0;
        _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Trying to group a metadata object that is not a body, assigning a random groupID", v9, 2u);
      }
    }
  }
LABEL_14:
  id v7 = [NSNumber numberWithInteger:v5];

  return v7;
}

- (id)_cinematicModeIndicatorViewAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v42 = *MEMORY[0x263EF8340];
  if ([(CAMPreviewViewController *)self _shouldShowCinematicModeIndicatorViews])
  {
    id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
    id v7 = [(CAMPreviewViewController *)self _indicatorViewsByType];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"cinematicSubject"];

    char v9 = [(CAMPreviewViewController *)self previewView];
    uint64_t v10 = [(CAMPreviewViewController *)self previewView];
    uint64_t v11 = [v10 indicatorContainerView];
    objc_msgSend(v9, "convertPoint:toView:", v11, x, y);
    uint64_t v13 = v12;
    uint64_t v15 = v14;

    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __63__CAMPreviewViewController__cinematicModeIndicatorViewAtPoint___block_invoke;
    v37[3] = &unk_263FA6208;
    uint64_t v39 = v13;
    uint64_t v40 = v15;
    id v16 = v6;
    id v38 = v16;
    [v8 enumerateKeysAndObjectsUsingBlock:v37];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v17 = v16;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      id v20 = 0;
      uint64_t v21 = *(void *)v34;
      double v22 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v17);
          }
          uint64_t v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          objc_msgSend(v24, "frame", (void)v33);
          CGFloat v25 = v44.origin.x;
          CGFloat v26 = v44.origin.y;
          CGFloat width = v44.size.width;
          CGFloat height = v44.size.height;
          double v29 = CGRectGetWidth(v44);
          v45.origin.double x = v25;
          v45.origin.double y = v26;
          v45.size.CGFloat width = width;
          v45.size.CGFloat height = height;
          double v30 = v29 * CGRectGetHeight(v45);
          if (v22 > v30)
          {
            id v31 = v24;

            id v20 = v31;
            double v22 = v30;
          }
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v19);
    }
    else
    {
      id v20 = 0;
    }
  }
  else
  {
    id v20 = 0;
  }
  return v20;
}

void __63__CAMPreviewViewController__cinematicModeIndicatorViewAtPoint___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  [v4 frame];
  if (CGRectContainsPoint(v6, *(CGPoint *)(a1 + 40))) {
    [*(id *)(a1 + 32) addObject:v4];
  }
}

- (void)_updateCinematicModeViewsForTrackingChange
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ([(CAMPreviewViewController *)self _shouldShowCinematicModeIndicatorViews])
  {
    int64_t v3 = [(CAMPreviewViewController *)self _indicatorViewsByType];
    id v4 = [v3 objectForKeyedSubscript:@"cinematicSubject"];

    uint64_t v5 = [(CAMPreviewViewController *)self _indicatorViewsByType];
    CGRect v6 = [v5 objectForKeyedSubscript:@"cinematicFixedFocus"];

    id v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v4];
    [v7 addEntriesFromDictionary:v6];
    uint64_t v8 = [(CAMPreviewViewController *)self _metadataObjectsForView];
    uint64_t v32 = 0;
    long long v33 = &v32;
    uint64_t v34 = 0x3032000000;
    long long v35 = __Block_byref_object_copy__28;
    long long v36 = __Block_byref_object_dispose__28;
    char v9 = NSString;
    uint64_t v10 = [v7 allKeys];
    objc_msgSend(v9, "stringWithFormat:", @"Tracking %ld cinematic subject indicators\n", objc_msgSend(v10, "count"));
    id v37 = (id)objc_claimAutoreleasedReturnValue();

    uint64_t v28 = 0;
    double v29 = &v28;
    uint64_t v30 = 0x2020000000;
    char v31 = 0;
    uint64_t v24 = 0;
    CGFloat v25 = &v24;
    uint64_t v26 = 0x2020000000;
    char v27 = 0;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __70__CAMPreviewViewController__updateCinematicModeViewsForTrackingChange__block_invoke;
    v19[3] = &unk_263FA6230;
    id v11 = v8;
    id v20 = v11;
    uint64_t v21 = &v28;
    double v22 = &v32;
    id v23 = &v24;
    [v7 enumerateKeysAndObjectsUsingBlock:v19];
    if (([(id)v33[5] isEqualToString:cinematicLogString] & 1) == 0)
    {
      objc_storeStrong((id *)&cinematicLogString, (id)v33[5]);
      uint64_t v12 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v39 = cinematicLogString;
        _os_log_impl(&dword_2099F8000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@\n", buf, 0xCu);
      }
    }
    int v13 = *((unsigned __int8 *)v29 + 24);
    int v14 = *((unsigned __int8 *)v25 + 24);
    if (*((unsigned char *)v29 + 24)) {
      BOOL v15 = v14 == 0;
    }
    else {
      BOOL v15 = 0;
    }
    uint64_t v16 = v15;
    [(CAMPreviewViewController *)self _setCinematicSubjectIsTrackingLocked:v16 shouldAnimate:1];
    if (v13) {
      BOOL v17 = v14 == 0;
    }
    else {
      BOOL v17 = 1;
    }
    uint64_t v18 = !v17;
    [(CAMPreviewViewController *)self _setCinematicIsFixedFocusLocked:v18 shouldAnimate:1];

    _Block_object_dispose(&v24, 8);
    _Block_object_dispose(&v28, 8);
    _Block_object_dispose(&v32, 8);
  }
  else
  {
    [(CAMPreviewViewController *)self _setCinematicSubjectIsTrackingLocked:0 shouldAnimate:1];
    [(CAMPreviewViewController *)self _setCinematicIsFixedFocusLocked:0 shouldAnimate:1];
  }
}

void __70__CAMPreviewViewController__updateCinematicModeViewsForTrackingChange__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v24 = a3;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "objectForKey:");
  if (objc_opt_respondsToSelector())
  {
    char v5 = [v4 syntheticFocusMode];
    BOOL v6 = (v5 & 1) == 0;
    BOOL v7 = (v5 & 4) == 0;
    int v8 = 1;
    if ((v5 & 2) != 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      int v8 = 0;
    }
  }
  else
  {
    BOOL v7 = 1;
    int v8 = 1;
    BOOL v6 = 1;
  }
  char v9 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  uint64_t v10 = [v4 uniqueIdentifier];
  id v11 = [v4 underlyingMetadataObject];
  uint64_t v12 = [v11 type];
  uint64_t v13 = [v9 stringByAppendingFormat:@"%@ type:%@ ", v10, v12];
  uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
  BOOL v15 = *(void **)(v14 + 40);
  *(void *)(v14 + 40) = v13;

  if (v7)
  {
    uint64_t v16 = 2;
    if (v6) {
      uint64_t v16 = 0;
    }
    BOOL v17 = @"is Primary Cinematic Subject with soft focus";
    if (v6) {
      BOOL v17 = @"is inactive indicator";
    }
    if (v8) {
      uint64_t v18 = v16;
    }
    else {
      uint64_t v18 = 1;
    }
    if (v8) {
      uint64_t v19 = v17;
    }
    else {
      uint64_t v19 = @"is Primary Cinematic Subject with hard focus";
    }
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    id v20 = @"is hard fixed focus point";
    if (v8) {
      id v20 = @"is soft fixed focus point";
    }
    uint64_t v19 = v20;
    uint64_t v18 = 0;
  }
  [v24 setHidden:0];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_23;
    }
    uint64_t v18 = 3;
  }
  [v24 setShape:v18 animated:1];
LABEL_23:
  uint64_t v21 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) stringByAppendingFormat:@"%@\n", v19];
  uint64_t v22 = *(void *)(*(void *)(a1 + 48) + 8);
  id v23 = *(void **)(v22 + 40);
  *(void *)(v22 + 40) = v21;
}

- (void)_updatePortraitModeViewsForResults:(id)a3
{
  id v4 = a3;
  if ([(CAMPreviewViewController *)self _shouldShowPortraitModeIndicatorViews])
  {
    if (![(CAMPreviewViewController *)self _shouldSuppressNewPortraitModeTrackedSubjectIndicators])
    {
      unint64_t v5 = [v4 count];
      BOOL v6 = v5 < 2;
      if (v5 >= 2) {
        double v7 = 2500.0;
      }
      else {
        double v7 = 0.0;
      }
      if (v5 >= 2) {
        double v8 = 0.21;
      }
      else {
        double v8 = 0.0;
      }
      uint64_t v9 = objc_opt_class();
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __63__CAMPreviewViewController__updatePortraitModeViewsForResults___block_invoke;
      v10[3] = &unk_263FA6258;
      BOOL v11 = v6;
      v10[4] = self;
      [(CAMPreviewViewController *)self _updateIndicatorsForMetadataObjectResults:v4 allowNewAndReappearingIndicators:1 viewType:@"portraitSubject" viewClass:v9 geometryCallback:v10 minimumAreaChangeThreshold:v7 minimumAreaFractionChangeThreshold:v8];
    }
    [(CAMPreviewViewController *)self _updatePortraitModeViewsAnimated:1];
  }
}

void __63__CAMPreviewViewController__updatePortraitModeViewsForResults___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v16 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v16;
    int v6 = *(unsigned __int8 *)(a1 + 40);
    double v7 = [*(id *)(a1 + 32) previewView];
    double v8 = v7;
    if (v6) {
      [v7 fixedSizeSubjectIndicatorFrameForFaceResult:v5];
    }
    else {
      [v7 faceIndicatorFrameForFaceResult:v5];
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v14 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v15 = *(double *)(MEMORY[0x263F001A8] + 24);
      goto LABEL_11;
    }
    id v11 = v16;
    int v12 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v13 = [*(id *)(a1 + 32) previewView];
    double v8 = v13;
    if (v12) {
      [v13 fixedSizeSubjectIndicatorFrameForBodyResult:v11];
    }
    else {
      [v13 frameForMetadataObjectResult:v11];
    }
  }
  double v14 = v9;
  double v15 = v10;

LABEL_11:
  CAMViewGeometryForFrame(a3, v14, v15);
}

- (BOOL)_shouldUpdateIndicatorSizeFrom:(CGSize)a3 to:(CGSize)a4 minimumAreaChangeThreshold:(double)a5 minimumAreaFractionChangeThreshold:(double)a6
{
  double v6 = a3.width * a3.height;
  double v7 = a4.width * a4.height;
  double v8 = a6 + 1.0;
  BOOL v9 = v6 <= 0.0 || v7 / v6 >= v8;
  double v10 = vabdd_f64(v7, v6);
  BOOL v11 = v7 > 0.0 && v6 / v7 >= v8;
  if (v10 < a5) {
    return 0;
  }
  if (v11) {
    return 1;
  }
  return v9;
}

- (void)_hidePortraitModeTrackedSubjectIndicatorsAnimated:(BOOL)a3
{
}

- (void)setCachedMRCResults:(id)a3
{
  id v5 = (NSArray *)a3;
  p_cachedMRCResults = &self->_cachedMRCResults;
  if (self->_cachedMRCResults != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_cachedMRCResults, a3);
    p_cachedMRCResults = (NSArray **)[(CAMPreviewViewController *)self _updateMRCIndicatorsIfNecessaryAnimated:0];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_cachedMRCResults, v5);
}

- (void)setCachedSignificantMRCResult:(id)a3
{
  id v5 = (CAMMachineReadableCodeResult *)a3;
  p_cachedSignificantMRCResult = &self->_cachedSignificantMRCResult;
  if (self->_cachedSignificantMRCResult != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_cachedSignificantMRCResult, a3);
    [(CAMPreviewViewController *)self _updateMRCIndicatorsIfNecessaryAnimated:0];
    p_cachedSignificantMRCResult = (CAMMachineReadableCodeResult **)[(CAMPreviewViewController *)self _updateTextRegionIndicatorsIfNecessary];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_cachedSignificantMRCResult, v5);
}

- (BOOL)_shouldAllowMRCIndicators
{
  return ([(CAMPreviewViewController *)self _mode] & 0xFFFFFFFFFFFFFFFBLL) == 0;
}

- (void)_updateMRCIndicatorsIfNecessaryAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CAMPreviewViewController *)self _shouldDisableFocusUI]
    && [(CAMPreviewViewController *)self isShowingStandardControls]
    && ![(CAMPreviewViewController *)self isFocusAndExposureExternallyLocked]
    && [(CAMPreviewViewController *)self _shouldAllowMRCIndicators])
  {
    [(CAMPreviewViewController *)self _updateMRCIndicatorsAnimated:v3];
    [(CAMPreviewViewController *)self _fadeOutIndicatorsOfViewType:@"MRC" afterDelay:0.3];
  }
}

- (void)_updateMRCIndicatorsAnimated:(BOOL)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = [(CAMPreviewViewController *)self cachedSignificantMRCResult];
  id v5 = v4;
  if (v4)
  {
    double v6 = [v4 uniqueIdentifier];
  }
  else
  {
    double v6 = &stru_26BD78BA0;
  }
  double v7 = [(CAMPreviewViewController *)self cachedSignificantTextRegionResult];
  if (v7)
  {
    double v8 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    double v8 = [(CAMPreviewViewController *)self cachedMRCResults];
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v9 = v8;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
  BOOL v11 = v9;
  if (v10)
  {
    uint64_t v12 = v10;
    uint64_t v13 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v9);
        }
        double v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v16 = [v15 uniqueIdentifier];
        if ([v16 isEqualToString:v6])
        {
          int v17 = [v15 isOfSignificantSize];

          if (v17)
          {
            char v31 = v15;
            BOOL v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v31 count:1];

            goto LABEL_19;
          }
        }
        else
        {
        }
      }
      uint64_t v12 = [v9 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
    BOOL v11 = v9;
  }
LABEL_19:

  uint64_t v18 = objc_opt_class();
  v26[0] = MEMORY[0x263EF8330];
  v26[1] = 3221225472;
  v26[2] = __57__CAMPreviewViewController__updateMRCIndicatorsAnimated___block_invoke;
  v26[3] = &unk_263FA6168;
  v26[4] = self;
  [(CAMPreviewViewController *)self _updateIndicatorsForMetadataObjectResults:v11 allowNewAndReappearingIndicators:1 viewType:@"MRC" viewClass:v18 geometryCallback:v26 minimumAreaChangeThreshold:0.0 minimumAreaFractionChangeThreshold:0.0];
  uint64_t v19 = [(CAMPreviewViewController *)self _indicatorViewsByType];
  id v20 = [v19 objectForKeyedSubscript:@"MRC"];
  uint64_t v21 = (void *)[v20 copy];

  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __57__CAMPreviewViewController__updateMRCIndicatorsAnimated___block_invoke_2;
  v23[3] = &unk_263FA6280;
  id v24 = v6;
  CGFloat v25 = self;
  uint64_t v22 = v6;
  [v21 enumerateKeysAndObjectsUsingBlock:v23];
}

void __57__CAMPreviewViewController__updateMRCIndicatorsAnimated___block_invoke(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v10 = [v4 previewView];
  [v10 frameForMetadataObjectResult:v5];
  double v7 = v6;
  double v9 = v8;

  CAMViewGeometryForFrame(a3, v7, v9);
}

void __57__CAMPreviewViewController__updateMRCIndicatorsAnimated___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v13 = a3;
  id v5 = a2;
  int v6 = [v13 isInactive];
  int v7 = [v5 isEqualToString:*(void *)(a1 + 32)];

  [v13 setInactive:v7 ^ 1u];
  if (v6 && v7)
  {
    double v8 = +[CAMCaptureCapabilities capabilities];
    if ([v8 isImageAnalysisSupported]) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }

    [v13 startScalingWithExpansionWidth:v9 duration:10.0 repeatCount:0.2];
  }
  if (v7)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    BOOL v11 = sel__handleSignificantMRCIndicatorButtonTapped_;
    uint64_t v12 = v13;
  }
  else
  {
    uint64_t v12 = v13;
    uint64_t v10 = 0;
    BOOL v11 = 0;
  }
  [v12 setTitleTarget:v10 action:v11];
}

- (void)_handleSignificantMRCIndicatorButtonTapped:(id)a3
{
  id v5 = [(CAMPreviewViewController *)self delegate];
  id v4 = [(CAMPreviewViewController *)self cachedSignificantMRCResult];
  [v5 previewViewController:self didSelectMRCResult:v4];
}

- (BOOL)_mrcIndicatorButtonContainsTouch:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMPreviewViewController *)self _indicatorViewsByType];
  int v6 = [v5 objectForKeyedSubscript:@"MRC"];

  int v7 = [(CAMPreviewViewController *)self cachedSignificantMRCResult];
  double v8 = [v7 uniqueIdentifier];
  uint64_t v9 = [v6 objectForKeyedSubscript:v8];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v9;
    [v4 locationInView:v10];
    char v11 = objc_msgSend(v10, "pointInside:withEvent:", 0);
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (void)setCachedSignificantTextRegionResult:(id)a3
{
  id v5 = (CAMTextRegionResult *)a3;
  p_cachedSignificantTextRegionResult = &self->_cachedSignificantTextRegionResult;
  if (self->_cachedSignificantTextRegionResult != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)p_cachedSignificantTextRegionResult, a3);
    [(CAMPreviewViewController *)self _updateTextRegionIndicatorsIfNecessary];
    p_cachedSignificantTextRegionResult = (CAMTextRegionResult **)[(CAMPreviewViewController *)self _updateMRCIndicatorsIfNecessaryAnimated:0];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_cachedSignificantTextRegionResult, v5);
}

- (void)setCachedTextRegionResults:(id)a3
{
  id v5 = (NSArray *)a3;
  p_cachedTextRegionResults = &self->_cachedTextRegionResults;
  if (self->_cachedTextRegionResults != v5)
  {
    int v7 = v5;
    objc_storeStrong((id *)p_cachedTextRegionResults, a3);
    p_cachedTextRegionResults = (NSArray **)[(CAMPreviewViewController *)self _updateTextRegionIndicatorsIfNecessary];
    id v5 = v7;
  }
  MEMORY[0x270F9A758](p_cachedTextRegionResults, v5);
}

- (void)_updateTextRegionIndicatorsIfNecessary
{
  if (![(CAMPreviewViewController *)self _shouldDisableFocusUI]
    && [(CAMPreviewViewController *)self isShowingStandardControls]
    && [(CAMPreviewViewController *)self _shouldAllowTextRegionIndicators])
  {
    [(CAMPreviewViewController *)self _updateTextRegionIndicators];
    [(CAMPreviewViewController *)self _fadeOutIndicatorsOfViewType:@"textRegion" afterDelay:0.3];
  }
}

- (BOOL)_shouldAllowTextRegionIndicators
{
  BOOL v3 = +[CAMCaptureCapabilities capabilities];
  if (objc_msgSend(v3, "isImageAnalysisSupportedForMode:devicePosition:", -[CAMPreviewViewController _mode](self, "_mode"), -[CAMPreviewViewController _devicePosition](self, "_devicePosition")))BOOL v4 = !-[CAMPreviewViewController isFocusAndExposureExternallyLocked](self, "isFocusAndExposureExternallyLocked"); {
  else
  }
    LOBYTE(v4) = 0;

  return v4;
}

- (void)_updateTextRegionIndicators
{
  v31[1] = *MEMORY[0x263EF8340];
  BOOL v3 = [(CAMPreviewViewController *)self cachedSignificantTextRegionResult];
  BOOL v4 = v3;
  if (v3)
  {
    id v5 = [v3 uniqueIdentifier];
  }
  else
  {
    id v5 = &stru_26BD78BA0;
  }
  int v6 = [(CAMPreviewViewController *)self cachedSignificantMRCResult];
  if (v6)
  {
    int v7 = (void *)MEMORY[0x263EFFA68];
  }
  else
  {
    int v7 = [(CAMPreviewViewController *)self cachedTextRegionResults];
  }

  double v8 = +[CAMCaptureCapabilities capabilities];
  int v9 = [v8 imageAnalysisShowsInactiveTextRegions];

  if ((v9 & 1) == 0)
  {
    v28[0] = MEMORY[0x263EF8330];
    v28[1] = 3221225472;
    v28[2] = __55__CAMPreviewViewController__updateTextRegionIndicators__block_invoke;
    v28[3] = &unk_263FA62A8;
    long long v29 = v5;
    uint64_t v10 = [v7 indexOfObjectPassingTest:v28];
    uint64_t v11 = MEMORY[0x263EFFA68];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL && v7)
    {
      uint64_t v12 = [v7 objectAtIndexedSubscript:v10];
      v31[0] = v12;
      uint64_t v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];

      int v7 = (void *)v12;
    }

    int v7 = (void *)v11;
  }
  uint64_t v13 = objc_opt_class();
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __55__CAMPreviewViewController__updateTextRegionIndicators__block_invoke_2;
  v27[3] = &unk_263FA6168;
  void v27[4] = self;
  [(CAMPreviewViewController *)self _updateIndicatorsForMetadataObjectResults:v7 allowNewAndReappearingIndicators:1 viewType:@"textRegion" viewClass:v13 geometryCallback:v27 minimumAreaChangeThreshold:0.0 minimumAreaFractionChangeThreshold:0.0];
  if (v9)
  {
    double v14 = [(CAMPreviewViewController *)self _indicatorViewsByType];
    double v15 = [v14 objectForKeyedSubscript:@"textRegion"];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v16 = v15;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v23 objects:v30 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v24 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v21 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v22 = objc_msgSend(v16, "objectForKeyedSubscript:", v21, (void)v23);
          objc_msgSend(v22, "setInactive:", objc_msgSend(v21, "isEqualToString:", v5) ^ 1);
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v23 objects:v30 count:16];
      }
      while (v18);
    }
  }
}

uint64_t __55__CAMPreviewViewController__updateTextRegionIndicators__block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = [a2 uniqueIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void __55__CAMPreviewViewController__updateTextRegionIndicators__block_invoke_2(uint64_t a1@<X0>, void *a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  int v6 = [v4 previewView];
  [v6 frameForTextRegionResult:v5];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  [v6 viewportFrame];
  CGRect v22 = CGRectInset(v19, 3.0, 3.0);
  v20.origin.double x = v8;
  v20.origin.double y = v10;
  v20.size.CGFloat width = v12;
  v20.size.CGFloat height = v14;
  CGRect v21 = CGRectIntersection(v20, v22);
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  objc_msgSend(v5, "baselineAngle", CAMViewGeometryForFrame((uint64_t)a3, v21.size.width, v21.size.height).n128_f64[0]);
  double v16 = v15;

  CGAffineTransformMakeRotation(&v18, -v16);
  long long v17 = *(_OWORD *)&v18.c;
  a3[3] = *(_OWORD *)&v18.a;
  a3[4] = v17;
  a3[5] = *(_OWORD *)&v18.tx;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  uint64_t v4 = (UITapGestureRecognizer *)a3;
  id v5 = [(CAMPreviewViewController *)self _captureController];
  char v6 = [v5 isCapturingLowLightImage];

  if (v6)
  {
    LOBYTE(self) = 0;
  }
  else if ((UITapGestureRecognizer *)self->__exposureBiasPanGestureRecognizer == v4)
  {
    double v7 = [(CAMPreviewViewController *)self previewView];
    CGFloat v8 = [v7 pointIndicator];

    double v9 = [(CAMPreviewViewController *)self delegate];
    int v10 = [v9 previewViewControllerShouldRestrictExposureBiasPanToTouchesNearSlider:self];

    if (v8 && v10)
    {
      [(UITapGestureRecognizer *)v4 locationInView:v7];
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      double v15 = [v7 pointIndicator];
      [v15 boundsIncludingExposureBiasSlider];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;

      uint64_t v24 = [v7 pointIndicator];
      objc_msgSend(v7, "convertRect:fromView:", v24, v17, v19, v21, v23);

      UIRectCenteredIntegralRectScale();
      v26.double x = v12;
      v26.double y = v14;
      LODWORD(v24) = CGRectContainsPoint(v27, v26);
      LODWORD(self) = [(CAMPreviewViewController *)self _canModifyExposureBias] & v24;
    }
    else
    {
      LOBYTE(self) = [(CAMPreviewViewController *)self _canModifyExposureBias];
    }
  }
  else if (self->__tapToFocusAndExposeGestureRecognizer == v4 {
         || (UITapGestureRecognizer *)self->__longPressToLockGestureRecognizer == v4)
  }
  {
    LOBYTE(self) = [(CAMPreviewViewController *)self _allowUserToChangeFocusAndExposure];
  }
  else if (self->__aspectRatioToggleDoubleTapGestureRecognizer == v4)
  {
    LODWORD(self) = ![(CAMPreviewViewController *)self _shouldDisableAspectRatioToggle];
  }
  else
  {
    LOBYTE(self) = 1;
  }

  return (char)self;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  char v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  if (self->__tapToFocusAndExposeGestureRecognizer == v6
    || (UITapGestureRecognizer *)self->__longPressToLockGestureRecognizer == v6
    || (aspectRatioToggleDoubleTapGestureRecognizer = self->__aspectRatioToggleDoubleTapGestureRecognizer,
        aspectRatioToggleDoubleTapGestureRecognizer == v6))
  {
    int v10 = [(CAMPreviewViewController *)self previewView];
    [v7 locationInView:v10];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    [v10 bounds];
    CGRect v19 = CGRectInset(v18, 10.0, 10.0);
    v17.double x = v12;
    v17.double y = v14;
    int v9 = CGRectContainsPoint(v19, v17);

    aspectRatioToggleDoubleTapGestureRecognizer = self->__aspectRatioToggleDoubleTapGestureRecognizer;
  }
  else
  {
    int v9 = 1;
  }
  if (aspectRatioToggleDoubleTapGestureRecognizer == v6) {
    v9 &= ~[(CAMPreviewViewController *)self _shouldDisableAspectRatioToggle];
  }
  char v15 = v9 & ~[(CAMPreviewViewController *)self _mrcIndicatorButtonContainsTouch:v7];

  return v15;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  char v6 = (UITapGestureRecognizer *)a3;
  id v7 = (UITapGestureRecognizer *)a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = [WeakRetained previewViewController:self gestureRecognizer:v6 shouldRequireFailureOfGestureRecognizer:v7];

  if (v9)
  {
    LOBYTE(v10) = 1;
  }
  else if (self->__tapToFocusAndExposeGestureRecognizer == v6 {
         && self->__aspectRatioToggleDoubleTapGestureRecognizer == v7)
  }
  {
    BOOL v10 = ![(CAMPreviewViewController *)self _shouldDisableAspectRatioToggle];
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (BOOL)_allowUserToChangeFocusAndExposure
{
  BOOL v3 = [(CUCaptureController *)self->__captureController shouldAllowUserToChangeFocusAndExposure];
  if (v3)
  {
    if ([(CAMPreviewViewController *)self _shouldDisableFocusUI]) {
      LOBYTE(v3) = 0;
    }
    else {
      LOBYTE(v3) = ![(CAMPreviewViewController *)self isFocusAndExposureExternallyLocked];
    }
  }
  return v3;
}

- (BOOL)_focusOnPoint:(CGPoint)a3 shouldShowFocusAndExposureIndicator:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  if ([(CAMPreviewViewController *)self _allowUserToChangeFocusAndExposure])
  {
    CGFloat v8 = [(CAMPreviewViewController *)self previewView];
    [v8 bounds];
    v24.double x = x;
    v24.double y = y;
    if (CGRectContainsPoint(v25, v24))
    {
      objc_msgSend(v8, "captureDevicePointOfInterestForPoint:", x, y);
      if (v9 >= 0.0)
      {
        double v11 = v9;
        if (v9 <= 1.0)
        {
          double v12 = v10;
          if (v10 >= 0.0 && v10 <= 1.0)
          {
            [(CAMPreviewViewController *)self _setUserLockedFocusAndExposure:0];
            double v13 = [MEMORY[0x263EFF910] date];
            [(CAMPreviewViewController *)self _setLastTapToFocusTime:v13];

            CGFloat v14 = +[CAMCaptureCapabilities capabilities];
            int v15 = objc_msgSend(v14, "isTapToExposeSupportedForMode:", -[CAMPreviewViewController _mode](self, "_mode"));

            captureController = self->__captureController;
            if (v15) {
              -[CUCaptureController focusAndExposeAtPoint:lockFocus:resetExposureTargetBias:](captureController, "focusAndExposeAtPoint:lockFocus:resetExposureTargetBias:", 1, 1, v11, v12);
            }
            else {
              -[CUCaptureController focusAtPoint:lockFocus:](captureController, "focusAtPoint:lockFocus:", 1, v11, v12);
            }
            if (v4) {
              -[CAMPreviewViewController _showIndicatorAtPointOfInterest:](self, "_showIndicatorAtPointOfInterest:", v11, v12);
            }
            [(CAMPreviewViewController *)self setCachedExposureTargetBias:0.0];
            BOOL v17 = 1;
            goto LABEL_16;
          }
        }
      }
      CGRect v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v22 = 0;
        CGRect v19 = "Ignoring tap outside of the preview layer area";
        double v20 = (uint8_t *)&v22;
        goto LABEL_14;
      }
    }
    else
    {
      CGRect v18 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = 0;
        CGRect v19 = "Ignoring tap outside of the preview view bounds";
        double v20 = (uint8_t *)&v23;
LABEL_14:
        _os_log_impl(&dword_2099F8000, v18, OS_LOG_TYPE_DEFAULT, v19, v20, 2u);
      }
    }

    BOOL v17 = 0;
LABEL_16:

    return v17;
  }
  return 0;
}

- (BOOL)_setCinematicFocusForMetadataObject:(id)a3 atPoint:(CGPoint)a4 useFixedOpticalFocus:(BOOL)a5 useHardFocus:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  uint64_t v49 = *MEMORY[0x263EF8340];
  id v11 = a3;
  double v12 = [(CAMPreviewViewController *)self previewView];
  objc_msgSend(v12, "captureDevicePointOfInterestForPoint:", x, y);
  double v15 = v13;
  BOOL v16 = v13 < 0.0 || v13 > 1.0;
  if (v16 || ((v17 = v14, v14 >= 0.0) ? (BOOL v18 = v14 > 1.0) : (BOOL v18 = 1), v18))
  {
    CGRect v19 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2099F8000, v19, OS_LOG_TYPE_DEFAULT, "Ignoring tap request for cinematic tracker outside of the preview layer area", buf, 2u);
    }

    BOOL v20 = 0;
  }
  else
  {
    double v21 = os_log_create("com.apple.camera", "Camera");
    BOOL v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v22)
      {
        __int16 v23 = [v11 description];
        v50.double x = x;
        v50.double y = y;
        uint64_t v24 = NSStringFromCGPoint(v50);
        id v38 = (void *)v24;
        v51.double x = v15;
        v51.double y = v17;
        NSStringFromCGPoint(v51);
        CGRect v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
        CGPoint v26 = @"YES";
        if (!v7) {
          CGPoint v26 = @"NO";
        }
        CGRect v27 = v26;
        long long v28 = @"YES";
        if (!v6) {
          long long v28 = @"NO";
        }
        *(_DWORD *)buf = 138544386;
        uint64_t v40 = v23;
        __int16 v41 = 2114;
        uint64_t v42 = v24;
        __int16 v43 = 2114;
        CGRect v44 = v25;
        __int16 v45 = 2114;
        v46 = v27;
        __int16 v47 = 2114;
        v48 = v28;
        long long v29 = v48;
        _os_log_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEFAULT, "Cinematic: Tapped on CinematicSubjectView, attempting to set cinematic focus on:%{public}@ at point:%{public}@, normalized point:%{public}@, useFixedOpticalFocus:%{public}@, hardFocus:%{public}@", buf, 0x34u);
      }
      long long v30 = [(CAMPreviewViewController *)self _captureController];
      objc_msgSend(v30, "setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:", v11, v7, v6, v15, v17);
    }
    else
    {
      if (v22)
      {
        v52.double x = x;
        v52.double y = y;
        char v31 = NSStringFromCGPoint(v52);
        v53.double x = v15;
        v53.double y = v17;
        uint64_t v32 = NSStringFromCGPoint(v53);
        uint64_t v33 = @"NO";
        if (v7) {
          uint64_t v33 = @"YES";
        }
        uint64_t v34 = v33;
        long long v35 = @"NO";
        if (v6) {
          long long v35 = @"YES";
        }
        long long v36 = v35;
        *(_DWORD *)buf = 138544130;
        uint64_t v40 = v31;
        __int16 v41 = 2114;
        uint64_t v42 = (uint64_t)v32;
        __int16 v43 = 2114;
        CGRect v44 = v34;
        __int16 v45 = 2114;
        v46 = v36;
        _os_log_impl(&dword_2099F8000, v21, OS_LOG_TYPE_DEFAULT, "Cinematic: Tapped outside of CinematicSubjectView, attempting to set cinematic focus at point:%{public}@, normalized point:%{public}@ , useFixedOpticalFocus:%{public}@, hardFocus:%{public}@", buf, 0x2Au);
      }
      long long v30 = [(CAMPreviewViewController *)self _captureController];
      objc_msgSend(v30, "setCinematicFocusAtPoint:useFixedOpticalFocus:useHardFocus:", v7, v6, v15, v17);
    }

    [(CAMPreviewViewController *)self _setUserLockedFocusAndExposure:0];
    BOOL v20 = 1;
  }

  return v20;
}

- (void)_handleTapToFocusAndExpose:(id)a3
{
  id v4 = a3;
  id v9 = [(CAMPreviewViewController *)self previewView];
  [v4 locationInView:v9];
  double v6 = v5;
  double v8 = v7;

  -[CAMPreviewViewController _handleFocusTapForPointInPreviewView:](self, "_handleFocusTapForPointInPreviewView:", v6, v8);
}

- (void)_handleFocusTapForPointInPreviewView:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  -[CAMPreviewViewController _cinematicModeIndicatorViewAtPoint:](self, "_cinematicModeIndicatorViewAtPoint:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    double v6 = [(CAMPreviewViewController *)self _metadataObjectsForView];
    double v7 = [v6 objectForKey:v13];

    if (objc_opt_respondsToSelector()) {
      uint64_t v8 = [v7 syntheticFocusMode] & 1;
    }
    else {
      uint64_t v8 = 0;
    }
    BOOL v9 = -[CAMPreviewViewController _setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:](self, "_setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:", v7, 0, v8, x, y);
    double v10 = [(CAMPreviewViewController *)self _continuousIndicator];
    [(CAMPreviewViewController *)self _hideFocusIndicator:v10 animated:1];

    id v11 = [(CAMPreviewViewController *)self _pointIndicator];
    [(CAMPreviewViewController *)self _hideFocusIndicator:v11 animated:1];

    if (!v9) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if ([(CAMPreviewViewController *)self _mode] == 7)
  {
    if (!-[CAMPreviewViewController _setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:](self, "_setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:", 0, 0, 0, x, y))goto LABEL_10; {
LABEL_9:
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained previewViewControllerDidChangeFocusOrExposure:self];

    goto LABEL_10;
  }
  if (-[CAMPreviewViewController _focusOnPoint:shouldShowFocusAndExposureIndicator:](self, "_focusOnPoint:shouldShowFocusAndExposureIndicator:", 1, x, y))
  {
    goto LABEL_9;
  }
LABEL_10:
}

- (BOOL)_isLongPressingToLock
{
  unint64_t v2 = [(CAMPreviewViewController *)self _longPressToLockGestureRecognizer];
  uint64_t v3 = [v2 state];

  return (unint64_t)(v3 - 1) < 2;
}

- (void)_handleLongPressToLock:(id)a3
{
  id v4 = a3;
  if ([(CAMPreviewViewController *)self _allowUserToChangeFocusAndExposure])
  {
    double v5 = [(CAMPreviewViewController *)self previewView];
    uint64_t v6 = [v4 state];
    if ((unint64_t)(v6 - 3) >= 3)
    {
      if (v6 == 1)
      {
        [(CAMPreviewViewController *)self _cancelDelayedFocusAndExposureLock];
        [v4 locationInView:v5];
        double v9 = v8;
        double v11 = v10;
        objc_msgSend(v5, "captureDevicePointOfInterestForPoint:");
        double v13 = v12;
        double v15 = v14;
        [(CAMPreviewViewController *)self _setUserLockedFocusAndExposure:0];
        [(CAMPreviewViewController *)self setCachedExposureTargetBias:0.0];
        BOOL v16 = [MEMORY[0x263EFF910] date];
        [(CAMPreviewViewController *)self _setLastTapToFocusTime:v16];

        if ([(CAMPreviewViewController *)self _mode] == 7)
        {
          -[CAMPreviewViewController _setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:](self, "_setCinematicFocusForMetadataObject:atPoint:useFixedOpticalFocus:useHardFocus:", 0, 1, 1, v9, v11);
        }
        else
        {
          -[CUCaptureController focusAndExposeAtPoint:lockFocus:resetExposureTargetBias:](self->__captureController, "focusAndExposeAtPoint:lockFocus:resetExposureTargetBias:", 1, 1, v15, v13);
          -[CAMPreviewViewController _showLockedAtPointOfInterest:](self, "_showLockedAtPointOfInterest:", v15, v13);
          [(CAMPreviewViewController *)self _lockFocusAndExposureAfterDelay:1.0];
        }
      }
    }
    else
    {
      [(CAMPreviewViewController *)self _cancelDelayedFocusAndExposureLock];
      [(CAMPreviewViewController *)self _scaleDownLockedPointOfInterest];
      double v7 = [(CAMPreviewViewController *)self _pointIndicator];
      [(CAMPreviewViewController *)self _deactivateFocusIndicator:v7 afterDelay:1.2];
    }
  }
}

- (void)_lockFocusAndExposureAfterDelay:(double)a3
{
  [(CAMPreviewViewController *)self _cancelDelayedFocusAndExposureLock];
  [(CAMPreviewViewController *)self performSelector:sel__lockFocusAndExposure withObject:0 afterDelay:a3];
}

- (void)_cancelDelayedFocusAndExposureLock
{
  uint64_t v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__lockFocusAndExposure object:0];
}

- (void)_lockFocusAndExposure
{
  [(CAMPreviewViewController *)self _cancelDelayedFocusAndExposureLock];
  id v5 = [(CAMPreviewViewController *)self _captureController];
  [(CAMPreviewViewController *)self _setUserLockedFocusAndExposure:1];
  [v5 forceDisableSubjectAreaChangeMonitoring];
  uint64_t v3 = +[CAMCaptureCapabilities capabilities];
  int v4 = objc_msgSend(v3, "isTapToExposeSupportedForMode:", -[CAMPreviewViewController _mode](self, "_mode"));

  if (v4) {
    [v5 changeToLockedExposure];
  }
  [(CAMPreviewViewController *)self _finishFocusingLockedPointOfInterestIndicator];
}

- (void)setCachedExposureTargetBias:(float)a3
{
  if (self->_cachedExposureTargetBias != a3)
  {
    self->_cachedExposureTargetBias = a3;
    [(CAMPreviewViewController *)self _updateExposureBiasViews];
  }
}

- (BOOL)_showExposureBiasSliderForPointView
{
  uint64_t v3 = +[CAMCaptureCapabilities capabilities];
  LOBYTE(self) = objc_msgSend(v3, "isTapAndBiasSupportedForMode:", -[CAMPreviewViewController _mode](self, "_mode"));

  return (char)self;
}

- (float)_exposureTargetBiasMinimum
{
  [(CAMPreviewViewController *)self _exposureTargetBiasMaximum];
  return -v2;
}

- (float)_exposureTargetBiasMaximum
{
  float v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"CAMExposureBiasMax"];

  if (v3)
  {
    [v3 doubleValue];
    if (v4 <= 0.0)
    {
      float v6 = 4.0;
    }
    else
    {
      float v5 = v4;
      float v6 = v5;
    }
  }
  else
  {
    float v6 = 4.0;
  }

  return v6;
}

- (int)_exposureBiasSide
{
  int64_t v2 = [(CAMPreviewViewController *)self _interfaceOrientation];
  if ((unint64_t)(v2 - 2) > 2) {
    return 0;
  }
  else {
    return dword_209C7BA20[v2 - 2];
  }
}

- (void)_initializeExposureBiasParametersForFocusIndicatorView:(id)a3
{
  v6[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(v4, "setExposureBiasSide:animated:", -[CAMPreviewViewController _exposureBiasSide](self, "_exposureBiasSide"), 0);
  v6[0] = v4;
  float v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];

  [(CAMPreviewViewController *)self _updateExposureBiasViews:v5];
}

- (void)_updateExposureBiasViews
{
  id v3 = [(CAMPreviewViewController *)self _focusIndicatorViewsWithExposureBiasSliders];
  [(CAMPreviewViewController *)self _updateExposureBiasViews:v3];
}

- (void)_updateExposureBiasViews:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(CAMPreviewViewController *)self cachedExposureTargetBias];
  float v6 = v5;
  [(CAMPreviewViewController *)self _exposureTargetBiasMinimum];
  float v8 = v7;
  [(CAMPreviewViewController *)self _exposureTargetBiasMaximum];
  float v10 = v9;
  [(CAMPreviewViewController *)self _virtualSliderPositionForExposureBias:v8];
  double v12 = v11;
  [(CAMPreviewViewController *)self _virtualSliderPositionForExposureBias:v10];
  double v14 = v13;
  [(CAMPreviewViewController *)self _virtualSliderPositionForExposureBias:v6];
  double v16 = v15;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v17 = v4;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v18)
  {
    uint64_t v20 = v18;
    uint64_t v21 = *(void *)v30;
    float v22 = v12;
    float v23 = v14;
    float v24 = v16;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v17);
        }
        CGPoint v26 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        *(float *)&double v19 = v22;
        objc_msgSend(v26, "setExposureBiasMinimum:", v19, (void)v29);
        *(float *)&double v27 = v23;
        [v26 setExposureBiasMaximum:v27];
        *(float *)&double v28 = v24;
        [v26 setExposureBiasValue:v28];
      }
      uint64_t v20 = [v17 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v20);
  }
}

- (id)_focusIndicatorViewsWithExposureBiasSliders
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(CAMPreviewViewController *)self _pointIndicator];
  if (v4) {
    [v3 addObject:v4];
  }

  return v3;
}

- (BOOL)_isPanningExposureBias
{
  exposureBiasPanGestureRecognizer = self->__exposureBiasPanGestureRecognizer;
  if (exposureBiasPanGestureRecognizer) {
    LOBYTE(exposureBiasPanGestureRecognizer) = (unint64_t)([(UIPanGestureRecognizer *)exposureBiasPanGestureRecognizer state]- 1) < 2;
  }
  return (char)exposureBiasPanGestureRecognizer;
}

- (void)_handleExposureBiasPan:(id)a3
{
  id v20 = a3;
  id v4 = [(CAMPreviewViewController *)self _captureController];
  uint64_t v5 = [v20 state];
  if ((unint64_t)(v5 - 3) >= 3)
  {
    if ((unint64_t)(v5 - 1) > 1) {
      goto LABEL_14;
    }
    if ([v20 state] == 1)
    {
      [(CAMPreviewViewController *)self cachedExposureTargetBias];
      self->__exposureBiasPanStartValue = v7;
      float v8 = [(CAMPreviewViewController *)self _pointIndicator];
      [(CAMPreviewViewController *)self _activateFocusIndicator:v8];
      unint64_t v9 = [(CAMPreviewViewController *)self _mode];
      if (v9 <= 9 && ((1 << v9) & 0x251) != 0) {
        [v4 changeToLockedExposure];
      }
    }
    float v6 = [(CAMPreviewViewController *)self _pointIndicator];
    [v20 translationInView:v6];
    -[CAMPreviewViewController _effectiveExposureBiasMovementForTranslation:](self, "_effectiveExposureBiasMovementForTranslation:");
    double v11 = v10;
    [(CAMPreviewViewController *)self _virtualSliderPositionForExposureBias:self->__exposureBiasPanStartValue];
    [(CAMPreviewViewController *)self _exposureBiasForVirtualSliderPosition:v11 + v12];
    double v14 = v13;
    [(CAMPreviewViewController *)self _exposureTargetBiasMinimum];
    float v16 = v15;
    [(CAMPreviewViewController *)self _exposureTargetBiasMaximum];
    double v18 = v16;
    if (v14 >= v16)
    {
      double v17 = *(float *)&v17;
      double v18 = v14;
      if (v14 > v17) {
        double v18 = v17;
      }
    }
    *(float *)&double v17 = v18;
    [(CAMPreviewViewController *)self setCachedExposureTargetBias:v17];
    [(CAMPreviewViewController *)self _updateCaptureControllerExposureTargetBias];
    double v19 = [MEMORY[0x263EFF910] date];
    [(CAMPreviewViewController *)self _setLastExposureBiasModifiedTime:v19];
  }
  else
  {
    [(CAMPreviewViewController *)self _updateExposureBiasViews];
    float v6 = [(CAMPreviewViewController *)self _pointIndicator];
    [(CAMPreviewViewController *)self _deactivateFocusIndicator:v6 afterDelay:1.2];
  }

LABEL_14:
}

- (double)_effectiveExposureBiasMovementForTranslation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  switch([(CAMPreviewViewController *)self _exposureBiasSide])
  {
    case 0:
      double x = -y;
      break;
    case 1:
      double x = y;
      break;
    case 2:
      double x = -x;
      break;
    case 3:
      return x;
    default:
      double x = 0.0;
      break;
  }
  return x;
}

- (double)_virtualSliderPositionForExposureBias:(double)a3
{
  double v5 = -a3;
  if (a3 >= 0.0) {
    long double v6 = a3;
  }
  else {
    long double v6 = v5;
  }
  [(CAMPreviewViewController *)self _exposureBiasVirtualSliderPointsForFirstStop];
  double v8 = v7;
  [(CAMPreviewViewController *)self _exposureBiasVirtualSliderExponent];
  double result = v8 * (1.0 - pow(v9, v6)) / (1.0 - v9);
  if (a3 < 0.0) {
    return -result;
  }
  return result;
}

- (double)_exposureBiasForVirtualSliderPosition:(double)a3
{
  double v5 = -a3;
  if (a3 >= 0.0) {
    double v6 = a3;
  }
  else {
    double v6 = v5;
  }
  [(CAMPreviewViewController *)self _exposureBiasVirtualSliderPointsForFirstStop];
  double v8 = v7;
  [(CAMPreviewViewController *)self _exposureBiasVirtualSliderExponent];
  long double v10 = v9;
  double v11 = log(1.0 - v6 * (1.0 - v9) / v8);
  double result = v11 / log(v10);
  if (a3 < 0.0) {
    return -result;
  }
  return result;
}

- (BOOL)captureController:(id)a3 shouldResetFocusAndExposureAfterCaptureForType:(int64_t)a4
{
  return (unint64_t)(a4 - 2) < 3;
}

- (BOOL)_shouldResetFocusAndExposureForSubjectAreaDidChange
{
  if ([(CAMPreviewViewController *)self _isPanningExposureBias]
    || [(CAMPreviewViewController *)self _isLongPressingToLock])
  {
    return 0;
  }
  id v4 = [(CAMPreviewViewController *)self _lastExposureBiasModificationTime];
  if (v4)
  {
    double v5 = [MEMORY[0x263EFF910] date];
    [v5 timeIntervalSinceDate:v4];
    double v7 = v6;

    if (v7 < 1.5)
    {
      BOOL v3 = 0;
      goto LABEL_9;
    }
    [(CAMPreviewViewController *)self _setLastExposureBiasModifiedTime:0];
  }
  BOOL v3 = 1;
LABEL_9:
  double v8 = [(CAMPreviewViewController *)self _lastTapToFocusTime];
  if (v8)
  {
    double v9 = [MEMORY[0x263EFF910] date];
    [v9 timeIntervalSinceDate:v8];
    double v11 = v10;

    if (v11 >= 1.0) {
      [(CAMPreviewViewController *)self _setLastTapToFocusTime:0];
    }
    else {
      BOOL v3 = 0;
    }
  }

  return v3;
}

- (BOOL)captureControllerUserHasAdjustedExposureTargetBiasFromBaseline:(id)a3
{
  [(CAMPreviewViewController *)self cachedExposureTargetBias];
  return v3 != 0.0;
}

- (float)baselineExposureValueForCaptureController:(id)a3
{
  -[CAMPreviewViewController setCachedExposureTargetBias:](self, "setCachedExposureTargetBias:", a3, 0.0);
  [(CAMPreviewViewController *)self baselineExposureBias];
  return result;
}

- (void)_hideAllCinematicIndicatorsAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMPreviewViewController *)self _hideIndicatorsOfViewType:@"cinematicSubject" animated:a3];
  [(CAMPreviewViewController *)self _hideIndicatorsOfViewType:@"cinematicFixedFocus" animated:v3];
}

- (void)_setCinematicSubjectIsTrackingLocked:(BOOL)a3
{
}

- (void)_setCinematicSubjectIsTrackingLocked:(BOOL)a3 shouldAnimate:(BOOL)a4
{
  if (self->__cinematicSubjectIsTrackingLocked != a3)
  {
    BOOL v4 = a4;
    self->__cinematicSubjectIsTrackingLocked = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained previewViewControllerDidChangeFocusOrExposureLocked:self shouldAnimate:v4];
  }
}

- (BOOL)isFocusLockedOnCinematicSubject
{
  if ([(CAMPreviewViewController *)self _mode] != 7) {
    return 0;
  }
  return [(CAMPreviewViewController *)self _cinematicSubjectIsTrackingLocked];
}

- (void)_setCinematicIsFixedFocusLocked:(BOOL)a3
{
}

- (void)_setCinematicIsFixedFocusLocked:(BOOL)a3 shouldAnimate:(BOOL)a4
{
  if (self->__cinematicIsFixedFocusLocked != a3)
  {
    BOOL v4 = a4;
    self->__cinematicIsFixedFocusLocked = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained previewViewControllerDidChangeFocusOrExposureLocked:self shouldAnimate:v4];
  }
}

- (void)_setUserLockedFocusAndExposure:(BOOL)a3
{
}

- (void)setFocusAndExposureExternallyLocked:(BOOL)a3
{
  if (self->_focusAndExposureExternallyLocked != a3)
  {
    self->_focusAndExposureExternallyLocked = a3;
    if (a3)
    {
      BOOL v4 = [(CAMPreviewViewController *)self _pointIndicator];
      if ([(CAMPreviewViewController *)self _isShowingFocusIndicator:v4])
      {
        if (![(CAMPreviewViewController *)self _userLockedFocusAndExposure])
        {
          [(CAMPreviewViewController *)self _activateFocusIndicator:v4];
          [(CAMPreviewViewController *)self _deactivateFocusIndicator:v4 afterDelay:1.2];
          [v4 startScalingWithExpansionWidth:2 duration:31.0 repeatCount:0.3];
        }
      }
      else if ([(CAMPreviewViewController *)self _currentFacesCount])
      {
        [(CAMPreviewViewController *)self _setExternalLockNeedsCurrentFacesToAppear:1];
      }
      else if (![(CAMPreviewViewController *)self _isShowingIndicatorsOfType:@"portraitSubject"]&& ![(CAMPreviewViewController *)self _isShowingIndicatorsOfType:@"cinematicSubject"]&& ![(CAMPreviewViewController *)self _isShowingIndicatorsOfType:@"cinematicFixedFocus"])
      {
        [(CAMPreviewViewController *)self _createExternalFocusLockIndicatorIfNecessary];
        double v7 = [(CAMPreviewViewController *)self _externalFocusLockIndicator];
        [v7 setAlpha:0.0];
        double v8 = (void *)MEMORY[0x263F82E00];
        v11[0] = MEMORY[0x263EF8330];
        v11[1] = 3221225472;
        v11[2] = __64__CAMPreviewViewController_setFocusAndExposureExternallyLocked___block_invoke;
        v11[3] = &unk_263FA0208;
        id v12 = v7;
        id v9 = v7;
        [v8 animateWithDuration:v11 animations:0.25];
        [v9 startScalingWithExpansionWidth:2 duration:31.0 repeatCount:0.3];
        [(CAMPreviewViewController *)self _deactivateFocusIndicator:v9 afterDelay:1.2];
      }
      double v6 = [(CAMPreviewViewController *)self _captureController];
      [v6 changeToLockedFocusAndExposure];
    }
    else
    {
      uint64_t v5 = MEMORY[0x263EFFA68];
      [(CAMPreviewViewController *)self _updateFaceIndicatorsForResults:MEMORY[0x263EFFA68]];
      [(CAMPreviewViewController *)self _updatePortraitModeViewsForResults:v5];
      [(CAMPreviewViewController *)self _updateCinematicModeViewsForResults:v5];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __64__CAMPreviewViewController_setFocusAndExposureExternallyLocked___block_invoke_2;
      v10[3] = &unk_263FA0208;
      v10[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v10 animations:0.25];
      if ([(CAMPreviewViewController *)self _userLockedFocusAndExposure]) {
        return;
      }
      double v6 = [(CAMPreviewViewController *)self _captureController];
      [v6 resetFocusAndExposure];
    }
  }
}

uint64_t __64__CAMPreviewViewController_setFocusAndExposureExternallyLocked___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __64__CAMPreviewViewController_setFocusAndExposureExternallyLocked___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _externalFocusLockIndicator];
  [v1 setAlpha:0.0];
}

- (BOOL)_isFocusAndExposureLockedByUserOrExternally
{
  if ([(CAMPreviewViewController *)self _userLockedFocusAndExposure]) {
    return 1;
  }
  return [(CAMPreviewViewController *)self isFocusAndExposureExternallyLocked];
}

- (void)setBaselineExposureBias:(float)a3
{
  if (self->_baselineExposureBias != a3)
  {
    self->_baselineExposureBias = a3;
    [(CAMPreviewViewController *)self _updateCaptureControllerExposureTargetBias];
  }
}

- (BOOL)_isExposureTargetBiasAtBaseline:(float)a3
{
  [(CAMPreviewViewController *)self baselineExposureBias];
  return vabds_f32(a3, v4) < 0.01;
}

- (float)totalExposureBias
{
  [(CAMPreviewViewController *)self cachedExposureTargetBias];
  float v4 = v3;
  [(CAMPreviewViewController *)self baselineExposureBias];
  float v6 = v4 + v5;
  [(CAMPreviewViewController *)self _exposureTargetBiasMinimum];
  float v8 = v7;
  [(CAMPreviewViewController *)self _exposureTargetBiasMaximum];
  return fminf(fmaxf(v8, v6), v9);
}

- (void)_updateCaptureControllerExposureTargetBias
{
  [(CAMPreviewViewController *)self totalExposureBias];
  int v4 = v3;
  id v6 = [(CAMPreviewViewController *)self _captureController];
  LODWORD(v5) = v4;
  [v6 changeExposureTargetBias:v5];
}

- (BOOL)_shouldDisableAspectRatioToggle
{
  int64_t v2 = self;
  int64_t v3 = [(CAMPreviewViewController *)self _mode];
  LOBYTE(v2) = [(CAMPreviewViewController *)v2 _isChangingGraphConfiguration];
  int v4 = +[CAMCaptureCapabilities capabilities];
  LOBYTE(v3) = [v4 isPreviewAspectRatioToggleSupportedForMode:v3];

  return v2 | v3 ^ 1;
}

- (void)_handleAspectRatioToggleDoubleTap:(id)a3
{
  id v10 = [(CAMPreviewViewController *)self previewView];
  int v4 = [v10 videoPreviewView];
  uint64_t v5 = [v4 previewViewAspectMode];
  uint64_t v6 = 1;
  if (v5) {
    uint64_t v6 = v5;
  }
  if (v5 == 1) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = v6;
  }
  [v4 setPreviewViewAspectMode:v7];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained previewViewControllerDidChangeVideoFillAspectRatio:self];

  float v9 = +[CAMUserPreferences preferences];
  objc_msgSend(v9, "setPreviewViewAspectMode:forMode:", v7, -[CAMPreviewViewController _mode](self, "_mode"));
}

- (void)_captureOrientationChanged:(id)a3
{
  BOOL v4 = +[CAMApplication appOrPlugInState] == 0;
  [(CAMPreviewViewController *)self _updateForOrientationAnimated:v4];
  [(CAMPreviewViewController *)self _updateExposureBiasSideAnimated:v4];
}

- (void)_updateExposureBiasSideAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(CAMPreviewViewController *)self _exposureBiasSide];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(CAMPreviewViewController *)self _focusIndicatorViewsWithExposureBiasSliders];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([(CAMPreviewViewController *)self _isShowingFocusIndicator:v11])
        {
          [(CAMPreviewViewController *)self _activateFocusIndicator:v11];
          [(CAMPreviewViewController *)self _deactivateFocusIndicator:v11 afterDelay:1.2];
        }
        [v11 setExposureBiasSide:v5 animated:v3];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)focusOnNormalizedPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v11 = [(CAMPreviewViewController *)self previewView];
  [v11 bounds];
  CGFloat v6 = v13.origin.x;
  CGFloat v7 = v13.origin.y;
  CGFloat width = v13.size.width;
  CGFloat height = v13.size.height;
  double v10 = x * CGRectGetWidth(v13);
  v14.origin.double x = v6;
  v14.origin.double y = v7;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  -[CAMPreviewViewController _handleFocusTapForPointInPreviewView:](self, "_handleFocusTapForPointInPreviewView:", v10, y * CGRectGetHeight(v14));
}

- (void)setShowingStandardControls:(BOOL)a3
{
  if (self->_showingStandardControls != a3)
  {
    self->_showingStandardControls = a3;
    [(CAMPreviewViewController *)self _hideAllFocusIndicatorsAnimated:0];
  }
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3
{
  if (self->_shallowDepthOfFieldStatus != a3)
  {
    self->_shallowDepthOfFieldStatus = a3;
    [(CAMPreviewViewController *)self _updatePortraitModeViewsAnimated:1];
  }
}

- (void)setStagePreviewStatus:(int64_t)a3
{
  if (self->_stagePreviewStatus != a3)
  {
    self->_stagePreviewStatus = a3;
    [(CAMPreviewViewController *)self _updatePortraitModeViewsAnimated:1];
  }
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3 stagePreviewStatus:(int64_t)a4
{
  if (self->_stagePreviewStatus != a4 || self->_shallowDepthOfFieldStatus != a3)
  {
    self->_stagePreviewStatus = a4;
    self->_shallowDepthOfFieldStatus = a3;
    [(CAMPreviewViewController *)self _updatePortraitModeViewsAnimated:1];
  }
}

- (void)_createPortraitModeCenteredIndicatorViewIfNecessary
{
  if (!self->__portraitModeCenteredIndicatorView)
  {
    id v3 = objc_alloc(MEMORY[0x263F30700]);
    BOOL v4 = (CEKSubjectIndicatorView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    portraitModeCenteredIndicatorView = self->__portraitModeCenteredIndicatorView;
    self->__portraitModeCenteredIndicatorView = v4;

    [(CEKSubjectIndicatorView *)self->__portraitModeCenteredIndicatorView setHidden:1 animated:0];
    id v6 = [(CAMPreviewViewController *)self previewView];
    [v6 setCenteredSubjectIndicatorView:self->__portraitModeCenteredIndicatorView];
  }
}

- (BOOL)_shouldShowStageLightOverlayViewForMode:(int64_t)a3 device:(int64_t)a4 lightingType:(int64_t)a5 shallowDepthOfFieldStatus:(int64_t)a6 stagePreviewStatus:(int64_t)a7
{
  if ((unint64_t)(a4 - 1) > 0xA) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = qword_209C7BA30[a4 - 1];
  }
  id v11 = +[CAMCaptureCapabilities capabilities];
  char v12 = [v11 isLightingControlSupportedForMode:a3];

  CGRect v13 = +[CAMCaptureCapabilities capabilities];
  char v14 = [v13 isLivePreviewSupportedForLightingType:a5 devicePosition:v10];

  char v15 = v14 ^ 1;
  if ((unint64_t)(a5 - 4) < 3 && a7 == 1) {
    char v15 = 1;
  }
  return v12 & v15;
}

- (BOOL)_shouldShowPortraitModeTrackedSubjectIndicatorsForLightingType:(int64_t)a3
{
  return (unint64_t)(a3 - 7) < 0xFFFFFFFFFFFFFFFDLL;
}

- (BOOL)_shouldSuppressNewPortraitModeTrackedSubjectIndicators
{
  BOOL v3 = [(CAMPreviewViewController *)self isShowingPointIndicator];
  BOOL v4 = [(CAMPreviewViewController *)self _isFocusAndExposureLockedByUserOrExternally];
  int v5 = v4 | ![(CAMPreviewViewController *)self _shouldShowPortraitModeTrackedSubjectIndicatorsForLightingType:[(CAMPreviewViewController *)self lightingType]];
  if (v3) {
    return 1;
  }
  else {
    return v5;
  }
}

void __61__CAMPreviewViewController__updatePortraitModeViewsAnimated___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  int v4 = [v5 isInactive];
  [v5 setInactive:*(unsigned __int8 *)(a1 + 32)];
  if (v4 && !*(unsigned char *)(a1 + 32)) {
    [v5 startScalingWithExpansionWidth:1 duration:10.0 repeatCount:0.3];
  }
}

- (CGRect)normalizedZoomPIPRect
{
  int64_t v2 = [(CAMPreviewViewController *)self previewView];
  [v2 normalizedZoomPIPRect];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setNormalizedZoomPIPRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(CAMPreviewViewController *)self previewView];
  objc_msgSend(v7, "setNormalizedZoomPIPRect:", x, y, width, height);
}

- (CAMPreviewViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMPreviewViewControllerDelegate *)WeakRetained;
}

- (BOOL)isFocusAndExposureExternallyLocked
{
  return self->_focusAndExposureExternallyLocked;
}

- (float)baselineExposureBias
{
  return self->_baselineExposureBias;
}

- (float)cachedExposureTargetBias
{
  return self->_cachedExposureTargetBias;
}

- (int64_t)stagePreviewStatus
{
  return self->_stagePreviewStatus;
}

- (BOOL)shouldUsePortraitStyleIndicatorsInPhotoMode
{
  return self->_shouldUsePortraitStyleIndicatorsInPhotoMode;
}

- (CAMMachineReadableCodeResult)cachedSignificantMRCResult
{
  return self->_cachedSignificantMRCResult;
}

- (CAMTextRegionResult)cachedSignificantTextRegionResult
{
  return self->_cachedSignificantTextRegionResult;
}

- (NSArray)cachedTextRegionResults
{
  return self->_cachedTextRegionResults;
}

- (CUCaptureController)_captureController
{
  return self->__captureController;
}

- (CAMCaptureGraphConfiguration)_graphConfiguration
{
  return self->__graphConfiguration;
}

- (void)_setGraphConfiguration:(id)a3
{
}

- (BOOL)_isChangingGraphConfiguration
{
  return self->__changingGraphConfiguration;
}

- (void)_setChangingGraphConfiguration:(BOOL)a3
{
  self->__changingGraphConfiguration = a3;
}

- (CAMFocusIndicatorView)_externalFocusLockIndicator
{
  return self->__externalFocusLockIndicator;
}

- (NSMutableDictionary)_indicatorViewsByType
{
  return self->__indicatorViewsByType;
}

- (NSMapTable)_metadataObjectsForView
{
  return self->__metadataObjectsForView;
}

- (BOOL)_cinematicSubjectIsTrackingLocked
{
  return self->__cinematicSubjectIsTrackingLocked;
}

- (BOOL)_cinematicIsFixedFocusLocked
{
  return self->__cinematicIsFixedFocusLocked;
}

- (CAMFocusResult)_lastFocusResult
{
  return self->__lastFocusResult;
}

- (NSDate)_lastTapToFocusTime
{
  return self->__lastTapToFocusTime;
}

- (void)_setLastTapToFocusTime:(id)a3
{
}

- (unint64_t)_currentFacesCount
{
  return self->__currentFacesCount;
}

- (void)_setCurrentFacesCount:(unint64_t)a3
{
  self->__currentFacesCount = a3;
}

- (BOOL)_shouldSuppressExistingFaceIndicators
{
  return self->__shouldSuppressExistingFaceIndicators;
}

- (void)_setShouldSuppressExistingFaceIndicators:(BOOL)a3
{
  self->__shouldSuppressExistingFaceIndicators = a3;
}

- (BOOL)_externalLockNeedsCurrentFacesToAppear
{
  return self->__externalLockNeedsCurrentFacesToAppear;
}

- (void)_setExternalLockNeedsCurrentFacesToAppear:(BOOL)a3
{
  self->__externalLockNeedsCurrentFacesToAppear = a3;
}

- (UITapGestureRecognizer)_tapToFocusAndExposeGestureRecognizer
{
  return self->__tapToFocusAndExposeGestureRecognizer;
}

- (UIPanGestureRecognizer)_exposureBiasPanGestureRecognizer
{
  return self->__exposureBiasPanGestureRecognizer;
}

- (UITapGestureRecognizer)_aspectRatioToggleDoubleTapGestureRecognizer
{
  return self->__aspectRatioToggleDoubleTapGestureRecognizer;
}

- (float)_exposureBiasPanStartValue
{
  return self->__exposureBiasPanStartValue;
}

- (double)_exposureBiasVirtualSliderExponent
{
  return self->__exposureBiasVirtualSliderExponent;
}

- (double)_exposureBiasVirtualSliderPointsForFirstStop
{
  return self->__exposureBiasVirtualSliderPointsForFirstStop;
}

- (void)_setLastExposureBiasModifiedTime:(id)a3
{
}

- (CEKSubjectIndicatorView)_portraitModeCenteredIndicatorView
{
  return self->__portraitModeCenteredIndicatorView;
}

- (BOOL)_disableDelayedFadeOutForFaces
{
  return self->__disableDelayedFadeOutForFaces;
}

- (BOOL)_disableIndicatorGeometryAnimations
{
  return self->__disableIndicatorGeometryAnimations;
}

- (BOOL)_disableAllIndicators
{
  return self->__disableAllIndicators;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__motionController, 0);
  objc_storeStrong((id *)&self->__stageLightOverlayView, 0);
  objc_storeStrong((id *)&self->__portraitModeCenteredIndicatorView, 0);
  objc_storeStrong((id *)&self->__lastExposureBiasModificationTime, 0);
  objc_storeStrong((id *)&self->__aspectRatioToggleDoubleTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__exposureBiasPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__longPressToLockGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__tapToFocusAndExposeGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__lastTapToFocusTime, 0);
  objc_storeStrong((id *)&self->__lastExposureResult, 0);
  objc_storeStrong((id *)&self->__lastFocusResult, 0);
  objc_storeStrong((id *)&self->__lastFocusIndictorStartTime, 0);
  objc_storeStrong((id *)&self->__metadataObjectsForView, 0);
  objc_storeStrong((id *)&self->__indicatorViewsByType, 0);
  objc_storeStrong((id *)&self->__externalFocusLockIndicator, 0);
  objc_storeStrong((id *)&self->__pointIndicator, 0);
  objc_storeStrong((id *)&self->__continuousIndicator, 0);
  objc_storeStrong((id *)&self->__graphConfiguration, 0);
  objc_destroyWeak((id *)&self->__timelapseController);
  objc_storeStrong((id *)&self->__captureController, 0);
  objc_storeStrong((id *)&self->_cachedTextRegionResults, 0);
  objc_storeStrong((id *)&self->_cachedSignificantTextRegionResult, 0);
  objc_storeStrong((id *)&self->_cachedMRCResults, 0);
  objc_storeStrong((id *)&self->_cachedSignificantMRCResult, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_focusOnPoint:(uint64_t)a3 shouldShowFocusAndExposureIndicator:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_setCinematicFocusForMetadataObject:(uint64_t)a3 atPoint:(uint64_t)a4 useFixedOpticalFocus:(uint64_t)a5 useHardFocus:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_handleLongPressToLock:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end