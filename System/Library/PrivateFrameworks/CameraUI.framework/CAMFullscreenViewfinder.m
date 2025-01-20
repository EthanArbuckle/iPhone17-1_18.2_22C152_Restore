@interface CAMFullscreenViewfinder
+ (Class)layerClass;
+ (id)darkControlBackgroundColor;
+ (id)lightControlBackgroundColor;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBadgeTray;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3 margin:(id)a4;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3 margins:(id)a4;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3 margins:(id)a4 aroundFrame:(CGSize)a5;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForInstructionLabel:(SEL)a3 belowInstructionLabelGeometry:(id)a4 elapsedTimeViewGeometry:(id *)a5;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForLandscapeLightingBadge;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForMRCButton;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleIntensitySliderExpanded:(SEL)a3;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleNameBadge:(SEL)a3;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleSlider2DExpanded:(SEL)a3;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleSlider2DExpanded:(SEL)a3 orientation:(BOOL)a4;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleValuesPlatterView;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForTextInteractionInsertWithViewport:(SEL)a3;
- (AVSpatialOverCaptureVideoPreviewLayer)_overCapturePreviewLayer;
- (BOOL)_isControlDrawerPresentedModally;
- (BOOL)_isTouch:(id)a3 withinView:(id)a4 padding:(double)a5;
- (BOOL)_isUsingCreativeCameraControls;
- (BOOL)_shouldAnimateSmartStyleIntensitySliderChangeFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4;
- (BOOL)_shouldAnimateSmartStyleSlider2DChangeFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4;
- (BOOL)_shouldShowControls;
- (BOOL)_shouldShowSmartStyleIntensitySlider;
- (BOOL)_shouldShowSmartStyleValuesPlatter;
- (BOOL)_shouldShowSpatialCaptureRecordingIndicator;
- (BOOL)_shouldShowSpotlightControlPanel;
- (BOOL)_shouldShowZoomControl;
- (BOOL)_showControlDrawer;
- (BOOL)_showFilterNameBadge;
- (BOOL)_showLandscapeLightingBadge;
- (BOOL)_showModeView;
- (BOOL)_showPortraitControls;
- (BOOL)_showSemanticStylePicker;
- (BOOL)_showSmartStyleNameBadge;
- (BOOL)_showSmartStylePicker;
- (BOOL)_wantsSpotlightControlPanelForControl:(int64_t)a3;
- (BOOL)_wantsSpotlightSmartStyleStatusIndicatorForControl:(int64_t)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isApertureSliderVisible;
- (BOOL)isControlDrawerAllowed;
- (BOOL)isControlDrawerExpanded;
- (BOOL)isControlDrawerPresentedModallyWithControlType:(int64_t)a3;
- (BOOL)isElapsedTimeViewVisible;
- (BOOL)isExposureSliderVisible;
- (BOOL)isExternalStorageButtonVisible;
- (BOOL)isFilterScrubberVisible;
- (BOOL)isFlipButtonVisible;
- (BOOL)isImageAnalysisButtonVisible;
- (BOOL)isIntensitySliderVisible;
- (BOOL)isLegibilityBackgroundsVisible;
- (BOOL)isLowLightSliderVisible;
- (BOOL)isModeSwitchVisible;
- (BOOL)isModeUIAllowed;
- (BOOL)isOrientationInstructionBackgroundBlurred;
- (BOOL)isOrientationInstructionVisible;
- (BOOL)isOverlayStyleControlActive;
- (BOOL)isPortraitControlsAllowed;
- (BOOL)isPreviewAlignmentGuideVisible;
- (BOOL)isReticleAnimating;
- (BOOL)isSemanticStyleControlVisible;
- (BOOL)isSharedLibraryImageWellIndicatorVisible;
- (BOOL)isShutterButtonVisible;
- (BOOL)isSmartStylePickerVisible;
- (BOOL)isSpatialCaptureRecordingIndicatorVisible;
- (BOOL)isSystemOverlayVisible;
- (BOOL)isTimerIndicatorVisible;
- (BOOL)isZoomControlVisible;
- (BOOL)lightingNameBadgesHidden;
- (BOOL)requestPreviewUpdateForSemanticStyleAnimated:(BOOL)a3;
- (BOOL)shouldAccessibilityGestureBeginForHUDManager:(id)a3;
- (BOOL)smartStyleControlsVisible;
- (BOOL)useHoldStillStereoLowLightInstruction;
- (BOOL)useSlowerTrueVideoTransitionAnimationDuration;
- (BOOL)wantsSmartStyleIntensitySlider;
- (BOOL)wantsSmartStylePicker;
- (BOOL)wantsSmartStyleResetButton;
- (CAMAutoMacroButton)autoMacroButton;
- (CAMBadgeTray)badgeTray;
- (CAMCircleButton)_previewSuggestionButton;
- (CAMControlDrawer)controlDrawer;
- (CAMControlStatusBar)controlStatusBar;
- (CAMCreativeCameraButton)creativeCameraButton;
- (CAMDepthEffectSuggestionButton)depthEffectSuggestionButton;
- (CAMDeviceTooHotInstructionLabel)deviceTooHotInstructionLabel;
- (CAMDisabledModeOverlayView)disabledModeOverlayView;
- (CAMDynamicShutterControl)shutterControl;
- (CAMElapsedTimeView)elapsedTimeView;
- (CAMExternalStorageButton)externalStorageButton;
- (CAMFilterNameBadge)filterNameBadge;
- (CAMFlashCompromisedInstructionLabel)flashCompromisedInstructionLabel;
- (CAMFlipButton)flipButton;
- (CAMFreeResourcesInstructionLabel)freeResourcesInstructionLabel;
- (CAMFullscreenModeSelector)modeSelector;
- (CAMFullscreenViewfinder)initWithMetalContext:(id)a3 useCreativeCameraControls:(BOOL)a4;
- (CAMFullscreenViewfinderDelegate)delegate;
- (CAMFullscreenViewfinderLayout)_layout;
- (CAMImageAnalysisButton)imageAnalysisButton;
- (CAMImageAnalysisInstructionLabel)imageAnalysisInstructionLabel;
- (CAMImageWell)imageWell;
- (CAMInterfaceModulationView)_modulatingContentView;
- (CAMLowLightInstructionLabel)_lowLightInstructionLabel;
- (CAMMachineReadableCodeButton)machineReadableCodeButton;
- (CAMMaxRecordingTimeInstructionLabel)maxRecordingTimeInstructionLabel;
- (CAMModeDial)modeDial;
- (CAMModeIndicatorView)modeIndicator;
- (CAMOrientationInstructionView)_orientationInstructionView;
- (CAMPanoramaView)panoramaView;
- (CAMPhotoVideoModeSwitch)photoVideoModeSwitch;
- (CAMPortraitModeInstructionLabel)portraitInstructionLabel;
- (CAMPreviewAlignmentGuide)previewAlignmentGuide;
- (CAMPreviewView)previewView;
- (CAMQRCodeInstructionLabel)qrCodeInstructionLabel;
- (CAMSemanticStylePicker)semanticStylePicker;
- (CAMSemanticStylePicker)smartStylePicker;
- (CAMSharedLibraryBadge)sharedLibraryInstructionLabel;
- (CAMSharedLibraryImageWellIndicatorView)sharedLibraryImageWellIndicatorView;
- (CAMSmartStyleCategoryInstructionLabel)smartStyleCategoryInstructionLabel;
- (CAMSmartStyleNameBadge)smartStyleNameBadge;
- (CAMSmartStyleStatusIndicator)spotlightSmartStyleStatusIndicator;
- (CAMSpatialCaptureButton)spatialCaptureButton;
- (CAMSpatialCaptureInstructionLabel)spatialCaptureInstructionLabel;
- (CAMSpatialCaptureRecordingIndicator)spatialCaptureRecordingIndicator;
- (CAMSpotlightControlPanel)spotlightControlPanel;
- (CAMTimerIndicatorView)timerIndicator;
- (CAMViewfinderReticleView)_reticleView;
- (CAMZoomControl)zoomControl;
- (CAMZoomSlider)zoomSlider;
- (CEKAdditiveAnimator)_viewportAnimator;
- (CEKLightingControl)lightingControl;
- (CEKLightingNameBadge)lightingNameBadge;
- (CGRect)_currentFourThreeViewportFrame;
- (CGRect)_frameForActionInfoView;
- (CGRect)_frameForBottomLegibilityBackground;
- (CGRect)_frameForContentClippingContainer;
- (CGRect)_frameForControlDrawer;
- (CGRect)_frameForExternalStorageButton;
- (CGRect)_frameForFlipButton;
- (CGRect)_frameForLightingControl;
- (CGRect)_frameForModeView;
- (CGRect)_frameForPreviewOverlaysInViewport:(CGRect)a3;
- (CGRect)_frameForPreviewView;
- (CGRect)_frameForReticleViewport;
- (CGRect)_frameForSpatialRecordingIndicatorWithElapsedTimeViewGeometry:(id *)a3 orientation:(int64_t)a4;
- (CGRect)_frameForSpotlightControlPanel;
- (CGRect)_frameForTransientContentView;
- (CGRect)_imageAnalysisButtonAlignmentRectForCenterY:(double)a3;
- (CGRect)_imageAnalysisButtonFrameForCenterY:(double)a3;
- (CGRect)_imageAnalysisButtonFrameForZoomControl:(id)a3 zoomSlider:(id)a4;
- (CGRect)_previewSuggestionButtonFrameForCenterY:(double)a3;
- (CGRect)_previewSuggestionButtonFrameForZoomControl:(id)a3 zoomSlider:(id)a4;
- (CGSize)_smartStyleSlider2DSize;
- (CGSize)panoramaCaptureSize;
- (NSMutableArray)_createdPrimaryInstructionLabels;
- (NSMutableArray)_createdSecondaryInstructionLabels;
- (NSMutableArray)_semanticStyleBadges;
- (NSMutableDictionary)_badgesForSpotlightControls;
- (NSMutableDictionary)_descriptionOverlayViewByKey;
- (NSMutableDictionary)_instructionLabelByValue;
- (NSTimer)_transientViewTimer;
- (PEPhotoStyleDPad)smartStyleSlider2D;
- (PEPhotoStylePaletteSlider)smartStyleIntensitySlider;
- (PEPhotoStyleValuesPlatterView)smartStyleValuesPlatterView;
- (UILongPressGestureRecognizer)modeSelectorGestureRecognizer;
- (UITapGestureRecognizer)_smartStylesDismissalTapGestureRecognizer;
- (UIView)_bottomLegibilityBackground;
- (UIView)_contentClippingContainer;
- (UIView)_contentView;
- (UIView)_contentViewBelowShutter;
- (UIView)_modeClippingView;
- (UIView)_previewContainerView;
- (UIView)_textInteractionBackground;
- (UIView)_transientCaptureContentView;
- (VKTextLiftingView)textInteractionInsert;
- (double)_additionalBottomPaddingForLightingControl;
- (double)_centerYForZoomControl:(id)a3 zoomSlider:(id)a4;
- (double)_legibilityBackgroundAlpha;
- (double)_trueVideoAnimationDuration;
- (double)_trueVideoModeSwitchFromCaptureAnimationDurationOverride;
- (double)_trueVideoModeSwitchToCaptureAnimationDurationOverride;
- (id)_visibleInstructionLabelForInstructionLabelValue:(int64_t)a3;
- (id)descriptionOverlayViewForKey:(id)a3;
- (id)hudItemForAccessibilityHUDManager:(id)a3;
- (id)touchingRecognizersToCancel;
- (int)presentationStyleForAppearingThumbnailImage;
- (int64_t)_smartStyleIntensitySliderLayoutOrientationForOrientation:(int64_t)a3;
- (int64_t)_viewportAspectRatioForControlsOverPreview;
- (int64_t)deviceOrientation;
- (int64_t)material;
- (int64_t)orientation;
- (int64_t)previewViewOrientation;
- (int64_t)shallowDepthOfFieldStatus;
- (int64_t)spotlightControl;
- (int64_t)stereoCaptureStatus;
- (int64_t)viewportAspectRatio;
- (int64_t)visibleInstructionLabel;
- (int64_t)visibleSecondaryInstructionLabel;
- (int64_t)visibleSuggestionButtonType;
- (unint64_t)_badgeFontStyle;
- (unint64_t)_inFlightLayoutAnimationCount;
- (unint64_t)interfaceModulation;
- (unint64_t)trueVideoState;
- (unint64_t)zoomStyle;
- (void)_animateQuietUIActive:(BOOL)a3 animations:(id)a4 completion:(id)a5;
- (void)_applyTextInsertContentInsets;
- (void)_createExternalStorageButton;
- (void)_createViewIfNeededForInstructionLabel:(int64_t)a3 isPrimary:(BOOL)a4;
- (void)_ensureBlurFilterForContentView:(id)a3;
- (void)_handleDirectionIndicatorTapped;
- (void)_handleSmartStylesDismissalTapGestureRecognizer:(id)a3;
- (void)_handleTransientViewTimerFired:(id)a3;
- (void)_hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated:(BOOL)a3;
- (void)_insertBackgroundSubview:(id)a3;
- (void)_iterateViewsForHUDManager:(id)a3 withItemFoundBlock:(id)a4;
- (void)_layoutPanoramaView;
- (void)_layoutSemanticStyleMaskedBadges;
- (void)_layoutSmartStyleNameBadge;
- (void)_layoutSmartStylesControls;
- (void)_layoutSpotlightSmartStyleStatusIndicator;
- (void)_layoutViewportWithFrame:(CGRect)a3 previewFrame:(CGRect)a4;
- (void)_layoutViewportWithFrame:(CGRect)a3 previewFrame:(CGRect)a4 trueVideoTransitionPercentComplete:(double)a5;
- (void)_layoutZoomControls;
- (void)_loadFilterControlsIfNeeded;
- (void)_loadPortraitControlsIfNeeded;
- (void)_loadSemanticStyleControlsIfNeeded;
- (void)_loadSmartStyleControlsIfNeeded;
- (void)_setAutoMacroButton:(id)a3;
- (void)_setBottomLegibilityBackground:(id)a3;
- (void)_setControlDrawer:(id)a3;
- (void)_setControlDrawerPresentedModally:(BOOL)a3;
- (void)_setDepthEffectSuggestionButton:(id)a3;
- (void)_setDeviceTooHotInstructionLabel:(id)a3;
- (void)_setFlashCompromisedInstructionLabel:(id)a3;
- (void)_setFreeResourcesInstructionLabel:(id)a3;
- (void)_setImageAnalysisInstructionLabel:(id)a3;
- (void)_setLowLightInstructionLabel:(id)a3;
- (void)_setMachineReadableCodeButton:(id)a3;
- (void)_setMaxRecordingTimeInstructionLabel:(id)a3;
- (void)_setNeedsLayoutAnimated:(BOOL)a3;
- (void)_setOrientationInstructionView:(id)a3;
- (void)_setOverCapturePreviewLayer:(id)a3;
- (void)_setPortraitInstructionLabel:(id)a3;
- (void)_setPreviewAlignmentGuide:(id)a3;
- (void)_setQRCodeInstructionLabel:(id)a3;
- (void)_setSharedLibraryImageWellIndicatorView:(id)a3;
- (void)_setSmartStyleControlsVisible:(BOOL)a3 animated:(BOOL)a4 notifyDelegate:(BOOL)a5;
- (void)_setSpatialCaptureButton:(id)a3;
- (void)_setSpatialCaptureInstructionLabel:(id)a3;
- (void)_setSpatialCaptureRecordingIndicator:(id)a3;
- (void)_setSpotlightControlPanel:(id)a3;
- (void)_setTextInteractionBackground:(id)a3;
- (void)_setTimerIndicator:(id)a3;
- (void)_setTransientViewTimer:(id)a3;
- (void)_setViewportAnimatorFrame:(CGRect)a3;
- (void)_setViewportAnimatorFrame:(CGRect)a3 withDuration:(double)a4 timingCurve:(id)a5;
- (void)_setZoomControl:(id)a3;
- (void)_setZoomSlider:(id)a3;
- (void)_showSpotlightSmartStyleStatusIndicatorIfNeededAnimated:(BOOL)a3;
- (void)_transitionView:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5;
- (void)_transitionView:(id)a3 isFlippingInPlace:(BOOL)a4;
- (void)_updateContentView:(id)a3 forQuietUIActive:(BOOL)a4;
- (void)_updateDisabledModeOverlayViewportFrame:(CGRect)a3;
- (void)_updateForLayoutCompleted;
- (void)_updateGeometryForElapsedTimeAndInstructionLabels;
- (void)_updateLightingControlClipping;
- (void)_updateModeDialClippingForViewportFrame:(CGRect)a3;
- (void)_updatePortraitControlsHighlightAnimated:(BOOL)a3;
- (void)_updatePreviewAlignmentGuideForViewportFrame:(CGRect)a3;
- (void)_updatePreviewLayerForPreviewFrame:(CGRect)a3 viewportFrame:(CGRect)a4 trueVideoTransitionPercentComplete:(double)a5;
- (void)_updateQuietUIAnimated:(BOOL)a3;
- (void)_updateReticleForViewportFrame:(CGRect)a3;
- (void)_updateSemanticStylePicker:(id)a3 forViewportFrame:(CGRect)a4;
- (void)_updateSubviewsVisibilityAnimated:(BOOL)a3;
- (void)_updateTintColors;
- (void)adoptMachineReadableCodeButton:(id)a3 fromOriginalParent:(id)a4 animated:(BOOL)a5;
- (void)animator:(id)a3 didUpdateValuesForKeys:(id)a4;
- (void)controlDrawer:(id)a3 didChangeExpanded:(BOOL)a4 forControlType:(int64_t)a5 animated:(BOOL)a6 updatePreferredDrawerControl:(BOOL)a7;
- (void)dismissMachineReadableCodeButtonAnimated:(BOOL)a3;
- (void)dismissModalControlDrawerIfNeededForReason:(int64_t)a3;
- (void)layoutSubviews;
- (void)machineReadableCodeButtonDidTapDismiss:(id)a3;
- (void)prepareForResumingUsingCrossfade;
- (void)presentControlDrawerModally:(BOOL)a3 forReason:(int64_t)a4 controlType:(int64_t)a5;
- (void)reloadSemanticStyleBadgesDelayIfNeeded:(BOOL)a3;
- (void)removeInflightBlurAnimations;
- (void)selectedByAccessibilityHUDManager:(id)a3;
- (void)semanticStylePickerDidChangeSelectedStyle:(id)a3;
- (void)semanticStylePickerDidScroll:(id)a3;
- (void)setControlDrawerAllowed:(BOOL)a3 modeUIAllowed:(BOOL)a4 animated:(BOOL)a5;
- (void)setControlDrawerExpanded:(BOOL)a3;
- (void)setControlDrawerExpanded:(BOOL)a3 forReason:(int64_t)a4;
- (void)setControlDrawerExpanded:(BOOL)a3 forReason:(int64_t)a4 animated:(BOOL)a5;
- (void)setDelegate:(id)a3;
- (void)setDescriptionOverlayView:(id)a3 forKey:(id)a4;
- (void)setDeviceOrientation:(int64_t)a3;
- (void)setDeviceOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setDisabledModeOverlayView:(id)a3;
- (void)setElapsedTimeViewVisible:(BOOL)a3;
- (void)setElapsedTimeViewVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setExternalStorageButtonVisible:(BOOL)a3;
- (void)setExternalStorageButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setFlipButtonVisible:(BOOL)a3;
- (void)setFlipButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setImageAnalysisButton:(id)a3;
- (void)setImageAnalysisButtonVisible:(BOOL)a3;
- (void)setImageAnalysisButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setInterfaceModulation:(unint64_t)a3;
- (void)setInterfaceModulation:(unint64_t)a3 animated:(BOOL)a4;
- (void)setLegibilityBackgroundsVisible:(BOOL)a3;
- (void)setLegibilityBackgroundsVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setLightingNameBadgesHidden:(BOOL)a3;
- (void)setLightingNameBadgesHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setMaterial:(int64_t)a3;
- (void)setMaterial:(int64_t)a3 withDuration:(double)a4;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setOrientationInstructionBackgroundBlurred:(BOOL)a3;
- (void)setOrientationInstructionBackgroundBlurred:(BOOL)a3 animated:(BOOL)a4;
- (void)setOrientationInstructionVisible:(BOOL)a3;
- (void)setOrientationInstructionVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setOverlayStyleControlActive:(BOOL)a3;
- (void)setOverlayStyleControlActive:(BOOL)a3 animated:(BOOL)a4;
- (void)setPanoramaCaptureSize:(CGSize)a3;
- (void)setPanoramaView:(id)a3;
- (void)setPhotoVideoModeSwitchVisible:(BOOL)a3;
- (void)setPhotoVideoModeSwitchVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setPortraitControlsAllowed:(BOOL)a3;
- (void)setPortraitControlsAllowed:(BOOL)a3 animated:(BOOL)a4;
- (void)setPreviewAlignmentGuideVisible:(BOOL)a3;
- (void)setPreviewAlignmentGuideVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setPreviewView:(id)a3;
- (void)setPreviewViewOrientation:(int64_t)a3;
- (void)setShallowDepthOfFieldStatus:(int64_t)a3;
- (void)setShallowDepthOfFieldStatus:(int64_t)a3 animated:(BOOL)a4;
- (void)setSharedLibraryImageWellIndicatorVisible:(BOOL)a3;
- (void)setSharedLibraryImageWellIndicatorVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setShutterControlVisible:(BOOL)a3;
- (void)setShutterControlVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setSmartStyleControlsVisible:(BOOL)a3;
- (void)setSmartStyleControlsVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setSpatialCaptureRecordingIndicatorVisible:(BOOL)a3;
- (void)setSpatialCaptureRecordingIndicatorVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setSpotlightControl:(int64_t)a3 animated:(BOOL)a4;
- (void)setStereoCaptureStatus:(int64_t)a3;
- (void)setStereoCaptureStatus:(int64_t)a3 animated:(BOOL)a4;
- (void)setStereoCaptureStatus:(int64_t)a3 useHoldStillStereoLowLightInstruction:(BOOL)a4 animated:(BOOL)a5;
- (void)setSystemOverlayVisible:(BOOL)a3;
- (void)setSystemOverlayVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setTextInteractionInsert:(id)a3;
- (void)setTimerIndicatorVisible:(BOOL)a3;
- (void)setTimerIndicatorVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setTrueVideoState:(unint64_t)a3;
- (void)setUseHoldStillStereoLowLightInstruction:(BOOL)a3;
- (void)setUseSlowerTrueVideoTransitionAnimationDuration:(BOOL)a3;
- (void)setViewportAspectRatio:(int64_t)a3;
- (void)setViewportAspectRatio:(int64_t)a3 animated:(BOOL)a4;
- (void)setVisibleInstructionLabel:(int64_t)a3;
- (void)setVisibleInstructionLabel:(int64_t)a3 animated:(BOOL)a4;
- (void)setVisibleInstructionLabel:(int64_t)a3 visibleSecondaryInstructionLabel:(int64_t)a4 animated:(BOOL)a5;
- (void)setVisiblePreviewSuggestionButton:(int64_t)a3 animated:(BOOL)a4;
- (void)setVisibleSecondaryInstructionLabel:(int64_t)a3;
- (void)setVisibleSuggestionButtonType:(int64_t)a3;
- (void)setWantsSmartStyleIntensitySlider:(BOOL)a3;
- (void)setWantsSmartStyleIntensitySlider:(BOOL)a3 animated:(BOOL)a4;
- (void)setWantsSmartStylePicker:(BOOL)a3;
- (void)setWantsSmartStylePicker:(BOOL)a3 animated:(BOOL)a4;
- (void)setWantsSmartStyleResetButton:(BOOL)a3;
- (void)setWantsSmartStyleResetButton:(BOOL)a3 animated:(BOOL)a4;
- (void)setZoomControlVisible:(BOOL)a3;
- (void)setZoomControlVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setZoomStyle:(unint64_t)a3;
- (void)set_inFlightLayoutAnimationCount:(unint64_t)a3;
- (void)set_smartStylesDismissalTapGestureRecognizer:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CAMFullscreenViewfinder

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (CAMFullscreenViewfinder)initWithMetalContext:(id)a3 useCreativeCameraControls:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v77.receiver = self;
  v77.super_class = (Class)CAMFullscreenViewfinder;
  double v7 = *MEMORY[0x263F001A8];
  double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 24);
  v11 = -[CAMFullscreenViewfinder initWithFrame:](&v77, sel_initWithFrame_, *MEMORY[0x263F001A8], v8, v9, v10);
  if (v11)
  {
    v12 = [MEMORY[0x263F825C8] blackColor];
    [(CAMFullscreenViewfinder *)v11 setBackgroundColor:v12];

    v11->_controlDrawerAllowed = 1;
    v11->_modeUIAllowed = 1;
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v7, v8, v9, v10);
    previewContainerView = v11->__previewContainerView;
    v11->__previewContainerView = (UIView *)v13;

    v15 = v11->__previewContainerView;
    v16 = [MEMORY[0x263F825C8] blackColor];
    [(UIView *)v15 setBackgroundColor:v16];

    v17 = [CAMDynamicShutterControl alloc];
    v18 = [v6 device];
    id v76 = v6;
    v19 = [v6 commandQueue];
    uint64_t v20 = [(CAMDynamicShutterControl *)v17 initWithMetalDevice:v18 commandQueue:v19];
    shutterControl = v11->_shutterControl;
    v11->_shutterControl = (CAMDynamicShutterControl *)v20;

    v11->_shutterControlVisible = 1;
    uint64_t v22 = +[CAMFlipButton flipButtonOverContent];
    flipButton = v11->_flipButton;
    v11->_flipButton = (CAMFlipButton *)v22;

    [(CAMFlipButton *)v11->_flipButton setExclusiveTouch:1];
    v11->_flipButtonVisible = 1;
    v24 = -[CAMPhotoVideoModeSwitch initWithFrame:]([CAMPhotoVideoModeSwitch alloc], "initWithFrame:", v7, v8, v9, v10);
    photoVideoModeSwitch = v11->_photoVideoModeSwitch;
    v11->_photoVideoModeSwitch = v24;

    [(CAMPhotoVideoModeSwitch *)v11->_photoVideoModeSwitch setExclusiveTouch:1];
    v26 = objc_alloc_init(CAMControlStatusBar);
    controlStatusBar = v11->_controlStatusBar;
    v11->_controlStatusBar = v26;

    [(CAMControlStatusBar *)v11->_controlStatusBar setDirectionIndicatorVisible:1];
    v28 = [(CAMControlStatusBar *)v11->_controlStatusBar directionIndicator];
    [v28 setExclusiveTouch:1];

    v29 = [(CAMControlStatusBar *)v11->_controlStatusBar directionIndicator];
    [v29 addTarget:v11 action:sel__handleDirectionIndicatorTapped forControlEvents:192];

    v30 = objc_alloc_init(CAMBadgeTray);
    badgeTray = v11->_badgeTray;
    v11->_badgeTray = v30;

    [(CAMBadgeTray *)v11->_badgeTray setUserInteractionEnabled:0];
    v11->__usingCreativeCameraControls = v4;
    if (v4)
    {
      v32 = [[CAMCreativeCameraButton alloc] initForOverContent];
      creativeCameraButton = v11->_creativeCameraButton;
      v11->_creativeCameraButton = v32;

      [(CAMCreativeCameraButton *)v11->_creativeCameraButton setExclusiveTouch:1];
    }
    else
    {
      v34 = [[CAMImageWell alloc] initWithLayoutStyle:4];
      imageWell = v11->_imageWell;
      v11->_imageWell = v34;

      [(CAMImageWell *)v11->_imageWell setExclusiveTouch:1];
      [(CAMImageWell *)v11->_imageWell setPresentationDelegate:v11];
    }
    v36 = -[CAMViewfinderReticleView initWithFrame:]([CAMViewfinderReticleView alloc], "initWithFrame:", v7, v8, v9, v10);
    reticleView = v11->__reticleView;
    v11->__reticleView = v36;

    [(CAMFullscreenViewfinder *)v11 addSubview:v11->__previewContainerView];
    [(CAMFullscreenViewfinder *)v11 addSubview:v11->__reticleView];
    v38 = objc_alloc_init(CAMNonInteractiveContainer);
    contentClippingContainer = v11->__contentClippingContainer;
    v11->__contentClippingContainer = &v38->super;

    [(UIView *)v11->__contentClippingContainer setClipsToBounds:1];
    [(CAMFullscreenViewfinder *)v11 addSubview:v11->__contentClippingContainer];
    v40 = [[CAMInterfaceModulationView alloc] initWithHostingView:v11];
    modulatingContentView = v11->__modulatingContentView;
    v11->__modulatingContentView = v40;

    [(UIView *)v11->__contentClippingContainer addSubview:v11->__modulatingContentView];
    v42 = objc_alloc_init(CAMNonInteractiveContainer);
    transientCaptureContentView = v11->__transientCaptureContentView;
    v11->__transientCaptureContentView = &v42->super;

    v44 = [[CAMInterfaceModulationView alloc] initWithHostingView:v11];
    contentView = v11->__contentView;
    v11->__contentView = &v44->super;

    v46 = [[CAMInterfaceModulationView alloc] initWithHostingView:v11];
    contentViewBelowShutter = v11->__contentViewBelowShutter;
    v11->__contentViewBelowShutter = &v46->super;

    [(CAMInterfaceModulationView *)v11->__modulatingContentView addSubview:v11->__contentViewBelowShutter];
    [(CAMInterfaceModulationView *)v11->__modulatingContentView addSubview:v11->_shutterControl];
    [(CAMInterfaceModulationView *)v11->__modulatingContentView addSubview:v11->_badgeTray];
    [(CAMInterfaceModulationView *)v11->__modulatingContentView addSubview:v11->__transientCaptureContentView];
    [(UIView *)v11->__transientCaptureContentView addSubview:v11->_imageWell];
    [(CAMInterfaceModulationView *)v11->__modulatingContentView addSubview:v11->__contentView];
    [(UIView *)v11->__contentView addSubview:v11->_controlStatusBar];
    [(UIView *)v11->__contentView addSubview:v11->_flipButton];
    [(UIView *)v11->__contentView addSubview:v11->_creativeCameraButton];
    [(UIView *)v11->__contentView addSubview:v11->_photoVideoModeSwitch];
    v48 = +[CAMCaptureCapabilities capabilities];
    if ([v48 useCTMModeSelector])
    {
      v49 = objc_alloc_init(CAMFullscreenModeSelector);
      modeSelector = v11->_modeSelector;
      v11->_modeSelector = v49;

      [(UIView *)v11->__contentView addSubview:v11->_modeSelector];
      v51 = -[CAMModeIndicatorView initWithFrame:]([CAMModeIndicatorView alloc], "initWithFrame:", v7, v8, v9, v10);
      modeIndicator = v11->_modeIndicator;
      v11->_modeIndicator = v51;

      [(UIView *)v11->__contentView addSubview:v11->_modeIndicator];
      uint64_t v53 = [objc_alloc(MEMORY[0x263F82938]) initWithTarget:v11->_modeSelector action:sel_handlePress_];
      modeSelectorGestureRecognizer = v11->_modeSelectorGestureRecognizer;
      v11->_modeSelectorGestureRecognizer = (UILongPressGestureRecognizer *)v53;

      [(UILongPressGestureRecognizer *)v11->_modeSelectorGestureRecognizer setMinimumPressDuration:0.0];
      [(UILongPressGestureRecognizer *)v11->_modeSelectorGestureRecognizer setCancelsTouchesInView:0];
      [(UILongPressGestureRecognizer *)v11->_modeSelectorGestureRecognizer setDelaysTouchesEnded:0];
      [(CAMFullscreenViewfinder *)v11 addGestureRecognizer:v11->_modeSelectorGestureRecognizer];
    }
    else
    {
      v55 = [[CAMModeDial alloc] initWithLayoutStyle:4];
      modeDial = v11->_modeDial;
      v11->_modeDial = v55;

      [(CAMModeDial *)v11->_modeDial setExclusiveTouch:1];
      v57 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
      modeClippingView = v11->__modeClippingView;
      v11->__modeClippingView = v57;

      [(UIView *)v11->__modeClippingView setClipsToBounds:1];
      [(UIView *)v11->__contentView addSubview:v11->__modeClippingView];
      [(UIView *)v11->__modeClippingView addSubview:v11->_modeDial];
    }
    id v6 = v76;
    v59 = (CEKAdditiveAnimator *)objc_alloc_init(MEMORY[0x263F30668]);
    viewportAnimator = v11->__viewportAnimator;
    v11->__viewportAnimator = v59;

    [(CEKAdditiveAnimator *)v11->__viewportAnimator setDelegate:v11];
    v61 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    descriptionOverlayViewByKey = v11->__descriptionOverlayViewByKey;
    v11->__descriptionOverlayViewByKey = v61;

    v63 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    instructionLabelByValue = v11->__instructionLabelByValue;
    v11->__instructionLabelByValue = v63;

    v65 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    createdPrimaryInstructionLabels = v11->__createdPrimaryInstructionLabels;
    v11->__createdPrimaryInstructionLabels = v65;

    v67 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    createdSecondaryInstructionLabels = v11->__createdSecondaryInstructionLabels;
    v11->__createdSecondaryInstructionLabels = v67;

    v69 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    badgesForSpotlightControls = v11->__badgesForSpotlightControls;
    v11->__badgesForSpotlightControls = v69;

    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"CAMTrueVideoModeSwitchToCaptureDuration", @"com.apple.camera", 0);
    double v72 = 0.0;
    double v73 = 0.0;
    if (AppIntegerValue >= 1) {
      double v73 = (double)AppIntegerValue / 1000.0;
    }
    v11->__trueVideoModeSwitchToCaptureAnimationDurationOverride = v73;
    CFIndex v74 = CFPreferencesGetAppIntegerValue(@"CAMTrueVideoModeSwitchFromCaptureDuration", @"com.apple.camera", 0);
    if (v74 >= 1) {
      double v72 = (double)v74 / 1000.0;
    }
    v11->__trueVideoModeSwitchFromCaptureAnimationDurationOverride = v72;
  }
  return v11;
}

- (void)_insertBackgroundSubview:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(CAMFullscreenViewfinder *)self _previewContainerView];
    [(CAMFullscreenViewfinder *)self insertSubview:v4 aboveSubview:v5];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v6 = [a3 preferredContentSizeCategory];
  id v4 = [(CAMFullscreenViewfinder *)self traitCollection];
  id v5 = [v4 preferredContentSizeCategory];

  if (v5 != v6 && ([v5 isEqualToString:v6] & 1) == 0) {
    [(CAMFullscreenViewfinder *)self setNeedsLayout];
  }
}

- (void)_updateGeometryForElapsedTimeAndInstructionLabels
{
  uint64_t v79 = *MEMORY[0x263EF8340];
  [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CAMFullscreenViewfinder *)self elapsedTimeView];
  if (v11) {
    BOOL v12 = [(CAMFullscreenViewfinder *)self isElapsedTimeViewVisible];
  }
  else {
    BOOL v12 = 0;
  }
  uint64_t v13 = [(CAMFullscreenViewfinder *)self _layout];
  long long v75 = 0u;
  long long v76 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  int64_t v14 = [(CAMFullscreenViewfinder *)self orientation];
  BOOL v15 = [(CAMFullscreenViewfinder *)self isSystemOverlayVisible];
  if (v13)
  {
    objc_msgSend(v13, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", v11, v14, v15, v4, v6, v8, v10);
  }
  else
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    long long v71 = 0u;
    long long v72 = 0u;
  }
  if (v12)
  {
    long long v67 = v73;
    long long v68 = v74;
    long long v69 = v75;
    long long v70 = v76;
    long long v65 = v71;
    long long v66 = v72;
    CAMViewSetGeometry(v11, (uint64_t)&v65);
    long long v67 = v73;
    long long v68 = v74;
    long long v69 = v75;
    long long v70 = v76;
    long long v16 = v71;
    long long v17 = v72;
  }
  else
  {
    long long v67 = xmmword_209C7B610;
    long long v68 = xmmword_209C7B620;
    long long v69 = xmmword_209C7B630;
    long long v70 = xmmword_209C7B640;
    long long v16 = CAMViewGeometryZero;
    long long v17 = xmmword_209C7B600;
  }
  long long v65 = v16;
  long long v66 = v17;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v18 = [(CAMFullscreenViewfinder *)self _createdPrimaryInstructionLabels];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v61 objects:v78 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v62;
    long long v36 = xmmword_209C7B620;
    long long v37 = xmmword_209C7B610;
    long long v34 = xmmword_209C7B640;
    long long v35 = xmmword_209C7B630;
    long long v32 = xmmword_209C7B600;
    long long v33 = CAMViewGeometryZero;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v62 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v51 = v37;
        long long v52 = v36;
        long long v53 = v35;
        long long v54 = v34;
        long long v49 = v33;
        long long v50 = v32;
        long long v45 = v67;
        long long v46 = v68;
        long long v47 = v69;
        long long v48 = v70;
        long long v43 = v65;
        long long v44 = v66;
        -[CAMFullscreenViewfinder _geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:](self, "_geometryForInstructionLabel:belowInstructionLabelGeometry:elapsedTimeViewGeometry:", v23, &v49, &v43, v32, v33, v34, v35, v36, v37);
        long long v51 = v57;
        long long v52 = v58;
        long long v53 = v59;
        long long v54 = v60;
        long long v49 = v55;
        long long v50 = v56;
        CAMApplyAnimationSensitiveGeometryToView((double *)&v49, v23);
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v61 objects:v78 count:16];
    }
    while (v20);
  }

  v24 = [(CAMFullscreenViewfinder *)self _visibleInstructionLabelForInstructionLabelValue:[(CAMFullscreenViewfinder *)self visibleInstructionLabel]];
  v25 = v24;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  if (v24)
  {
    CAMViewGetGeometry(v24, (uint64_t)&v55);
  }
  else
  {
    long long v57 = xmmword_209C7B610;
    long long v58 = xmmword_209C7B620;
    long long v59 = xmmword_209C7B630;
    long long v60 = xmmword_209C7B640;
    long long v55 = CAMViewGeometryZero;
    long long v56 = xmmword_209C7B600;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v26 = [(CAMFullscreenViewfinder *)self _createdSecondaryInstructionLabels];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v39 objects:v77 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v40;
    do
    {
      for (uint64_t j = 0; j != v28; ++j)
      {
        if (*(void *)v40 != v29) {
          objc_enumerationMutation(v26);
        }
        v31 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v45 = v57;
        long long v46 = v58;
        long long v47 = v59;
        long long v48 = v60;
        long long v43 = v55;
        long long v44 = v56;
        v38[2] = v67;
        v38[3] = v68;
        v38[4] = v69;
        v38[5] = v70;
        v38[0] = v65;
        v38[1] = v66;
        [(CAMFullscreenViewfinder *)self _geometryForInstructionLabel:v31 belowInstructionLabelGeometry:&v43 elapsedTimeViewGeometry:v38];
        long long v45 = v51;
        long long v46 = v52;
        long long v47 = v53;
        long long v48 = v54;
        long long v43 = v49;
        long long v44 = v50;
        CAMApplyAnimationSensitiveGeometryToView((double *)&v43, v31);
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v39 objects:v77 count:16];
    }
    while (v28);
  }
}

- (void)_layoutViewportWithFrame:(CGRect)a3 previewFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  unint64_t v13 = [(CAMFullscreenViewfinder *)self trueVideoState];
  double v14 = 0.0;
  if (v13 == 2) {
    double v14 = 1.0;
  }
  -[CAMFullscreenViewfinder _layoutViewportWithFrame:previewFrame:trueVideoTransitionPercentComplete:](self, "_layoutViewportWithFrame:previewFrame:trueVideoTransitionPercentComplete:", v11, v10, v9, v8, x, y, width, height, *(void *)&v14);
}

- (void)_layoutViewportWithFrame:(CGRect)a3 previewFrame:(CGRect)a4 trueVideoTransitionPercentComplete:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  double v8 = a3.size.height;
  double v9 = a3.size.width;
  double v10 = a3.origin.y;
  double v11 = a3.origin.x;
  -[CAMFullscreenViewfinder _updateReticleForViewportFrame:](self, "_updateReticleForViewportFrame:");
  -[CAMFullscreenViewfinder _updatePreviewLayerForPreviewFrame:viewportFrame:trueVideoTransitionPercentComplete:](self, "_updatePreviewLayerForPreviewFrame:viewportFrame:trueVideoTransitionPercentComplete:", x, y, width, height, v11, v10, v9, v8, *(void *)&a5);
  -[CAMFullscreenViewfinder _updateModeDialClippingForViewportFrame:](self, "_updateModeDialClippingForViewportFrame:", v11, v10, v9, v8);
  -[CAMFullscreenViewfinder _updatePreviewAlignmentGuideForViewportFrame:](self, "_updatePreviewAlignmentGuideForViewportFrame:", v11, v10, v9, v8);
  unint64_t v13 = [(CAMFullscreenViewfinder *)self semanticStylePicker];
  -[CAMFullscreenViewfinder _updateSemanticStylePicker:forViewportFrame:](self, "_updateSemanticStylePicker:forViewportFrame:", v13, v11, v10, v9, v8);

  double v14 = [(CAMFullscreenViewfinder *)self smartStylePicker];
  -[CAMFullscreenViewfinder _updateSemanticStylePicker:forViewportFrame:](self, "_updateSemanticStylePicker:forViewportFrame:", v14, v11, v10, v9, v8);

  -[CAMFullscreenViewfinder _updateDisabledModeOverlayViewportFrame:](self, "_updateDisabledModeOverlayViewportFrame:", v11, v10, v9, v8);
  BOOL v15 = [(CAMFullscreenViewfinder *)self _overCapturePreviewLayer];
  if (!v15)
  {
    long long v16 = [(CAMFullscreenViewfinder *)self previewView];
    [v16 bounds];
    double v11 = v17;
    double v10 = v18;
    double v9 = v19;
    double v8 = v20;
  }
  uint64_t v21 = [(CAMFullscreenViewfinder *)self previewView];
  objc_msgSend(v21, "setViewportFrame:", v11, v10, v9, v8);

  uint64_t v22 = [(CAMFullscreenViewfinder *)self _descriptionOverlayViewByKey];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __100__CAMFullscreenViewfinder__layoutViewportWithFrame_previewFrame_trueVideoTransitionPercentComplete___block_invoke;
  v24[3] = &__block_descriptor_64_e55_v32__0___NSCopying__8__CAMDescriptionOverlayView_16_B24l;
  *(double *)&v24[4] = v11;
  *(double *)&v24[5] = v10;
  *(double *)&v24[6] = v9;
  *(double *)&v24[7] = v8;
  [v22 enumerateKeysAndObjectsUsingBlock:v24];
}

uint64_t __100__CAMFullscreenViewfinder__layoutViewportWithFrame_previewFrame_trueVideoTransitionPercentComplete___block_invoke(double *a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setViewportFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)layoutSubviews
{
  [(CAMFullscreenViewfinder *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CAMFullscreenViewfinder *)self shutterControl];
  BOOL v12 = [(CAMFullscreenViewfinder *)self _layout];
  if (!v12)
  {
    v275.origin.double x = v4;
    v275.origin.double y = v6;
    v275.size.double width = v8;
    v275.size.double height = v10;
    if (CGRectIsEmpty(v275))
    {
      BOOL v12 = 0;
    }
    else
    {
      unint64_t v13 = [CAMFullscreenViewfinderLayout alloc];
      [v11 intrinsicContentSize];
      BOOL v12 = -[CAMFullscreenViewfinderLayout initWithReferenceBounds:shutterIntrinsicSize:](v13, "initWithReferenceBounds:shutterIntrinsicSize:", v4, v6, v8, v10, v14, v15);
      objc_storeStrong((id *)&self->__layout, v12);
    }
  }
  -[CAMFullscreenViewfinderLayout setReferenceBounds:](v12, "setReferenceBounds:", v4, v6, v8, v10);
  [v11 intrinsicContentSize];
  -[CAMFullscreenViewfinderLayout setShutterIntrinsicSize:](v12, "setShutterIntrinsicSize:");
  long long v16 = [(CAMFullscreenViewfinder *)self window];
  double v17 = [v16 screen];
  [v17 scale];
  -[CAMFullscreenViewfinderLayout setScreenScale:](v12, "setScreenScale:");

  [(CAMFullscreenViewfinder *)self _frameForPreviewView];
  double v250 = v19;
  double v252 = v18;
  double v247 = v21;
  double v248 = v20;
  [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
  CGFloat v256 = v23;
  CGFloat v257 = v22;
  CGFloat v254 = v25;
  CGFloat v255 = v24;
  -[CAMFullscreenViewfinder _setViewportAnimatorFrame:](self, "_setViewportAnimatorFrame:");
  v26 = [(CAMFullscreenViewfinder *)self _previewContainerView];
  objc_msgSend(v26, "setFrame:", v4, v6, v8, v10);

  [(CAMFullscreenViewfinder *)self _frameForContentClippingContainer];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  long long v35 = [(CAMFullscreenViewfinder *)self _contentClippingContainer];
  objc_msgSend(v35, "setFrame:", v28, v30, v32, v34);

  long long v36 = [(CAMFullscreenViewfinder *)self _modulatingContentView];
  long long v37 = [v36 superview];
  -[CAMFullscreenViewfinder convertRect:toView:](self, "convertRect:toView:", v37, v4, v6, v8, v10);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  long long v46 = [(CAMFullscreenViewfinder *)self _modulatingContentView];
  objc_msgSend(v46, "setFrame:", v39, v41, v43, v45);

  long long v47 = [(CAMFullscreenViewfinder *)self _contentView];
  objc_msgSend(v47, "setBounds:", v4, v6, v8, v10);

  UIRectGetCenter();
  double v49 = v48;
  double v51 = v50;
  long long v52 = [(CAMFullscreenViewfinder *)self _contentView];
  objc_msgSend(v52, "setCenter:", v49, v51);

  [(CAMFullscreenViewfinder *)self _frameForTransientContentView];
  double v54 = v53;
  double v56 = v55;
  double v58 = v57;
  double v60 = v59;
  long long v61 = [(CAMFullscreenViewfinder *)self _transientCaptureContentView];
  objc_msgSend(v61, "setFrame:", v54, v56, v58, v60);

  long long v62 = [(CAMFullscreenViewfinder *)self _contentViewBelowShutter];
  objc_msgSend(v62, "setBounds:", v4, v6, v8, v10);

  UIRectGetCenter();
  double v64 = v63;
  double v66 = v65;
  long long v67 = [(CAMFullscreenViewfinder *)self _contentViewBelowShutter];
  objc_msgSend(v67, "setCenter:", v64, v66);

  long long v68 = [(CAMFullscreenViewfinder *)self previewView];
  objc_msgSend(v68, "setFrame:", v252, v250, v248, v247);

  [(CAMFullscreenViewfinderLayout *)v12 frameForControlStatusBar];
  double v70 = v69;
  double v72 = v71;
  double v74 = v73;
  double v76 = v75;
  objc_super v77 = [(CAMFullscreenViewfinder *)self controlStatusBar];
  objc_msgSend(v77, "setFrame:", v70, v72, v74, v76);

  [(CAMFullscreenViewfinder *)self _frameForFlipButton];
  double v79 = v78;
  double v81 = v80;
  double v83 = v82;
  double v85 = v84;
  v86 = [(CAMFullscreenViewfinder *)self flipButton];
  objc_msgSend(v86, "setFrame:", v79, v81, v83, v85);

  v87 = [(CAMFullscreenViewfinder *)self badgeTray];
  [(CAMFullscreenViewfinder *)self _geometryForBadgeTray];
  CAMViewSetGeometry(v87, (uint64_t)v274);

  v88 = [(CAMFullscreenViewfinder *)self _transientCaptureContentView];
  [v88 bounds];
  double v90 = v89;
  double v92 = v91;
  double v94 = v93;
  double v96 = v95;
  v97 = [(CAMFullscreenViewfinder *)self imageWell];
  objc_msgSend(v97, "setFrame:", v90, v92, v94, v96);

  v98 = [(CAMFullscreenViewfinder *)self modeSelector];
  objc_msgSend(v98, "setFrame:", v4, v6, v8, v10);

  v99 = [(CAMFullscreenViewfinder *)self _reticleView];
  objc_msgSend(v99, "setFrame:", v4, v6, v8, v10);

  v100 = [(CAMFullscreenViewfinder *)self timerIndicator];
  CAMViewGeometryForOrientedFrame(1, (uint64_t)v273, v257, v256, v255, v254);
  CAMViewSetGeometry(v100, (uint64_t)v273);

  v101 = [(CAMFullscreenViewfinder *)self _layout];
  v102 = [(CAMFullscreenViewfinder *)self creativeCameraButton];
  [v101 frameForBottomLeftControl:v102];
  double v104 = v103;
  double v106 = v105;
  double v108 = v107;
  double v110 = v109;
  v111 = [(CAMFullscreenViewfinder *)self creativeCameraButton];
  objc_msgSend(v111, "setFrame:", v104, v106, v108, v110);

  v112 = [(CAMFullscreenViewfinder *)self _layout];
  v113 = [(CAMFullscreenViewfinder *)self sharedLibraryImageWellIndicatorView];
  v114 = [(CAMFullscreenViewfinder *)self imageWell];
  [v112 frameForBottomControl:v113 betweenShutterAndLeftControl:v114];
  double v116 = v115;
  double v118 = v117;
  double v120 = v119;
  double v122 = v121;
  v123 = [(CAMFullscreenViewfinder *)self sharedLibraryImageWellIndicatorView];
  objc_msgSend(v123, "setFrame:", v116, v118, v120, v122);

  v124 = [(CAMFullscreenViewfinder *)self _descriptionOverlayViewByKey];
  v272[0] = MEMORY[0x263EF8330];
  v272[1] = 3221225472;
  v272[2] = __41__CAMFullscreenViewfinder_layoutSubviews__block_invoke;
  v272[3] = &__block_descriptor_64_e55_v32__0___NSCopying__8__CAMDescriptionOverlayView_16_B24l;
  *(double *)&v272[4] = v4;
  *(double *)&v272[5] = v6;
  *(double *)&v272[6] = v8;
  *(double *)&v272[7] = v10;
  [v124 enumerateKeysAndObjectsUsingBlock:v272];

  v125 = [(CAMFullscreenViewfinder *)self flipButton];
  [v125 center];
  [v11 setLockButtonCenterRightInset:v8 - v126];

  v127 = [(CAMFullscreenViewfinder *)self imageWell];
  if (v127)
  {
    v128 = [(CAMFullscreenViewfinder *)self _transientCaptureContentView];
    [v128 frame];
    double MidX = CGRectGetMidX(v276);
  }
  else
  {
    v128 = [(CAMFullscreenViewfinder *)self creativeCameraButton];
    [v128 center];
  }
  [v11 setPauseResumeButtonCenterLeftInset:MidX];

  v246 = v12;
  [(CAMFullscreenViewfinderLayout *)v12 frameForShutterControl:v11];
  objc_msgSend(v11, "setFrame:");
  v130 = [(CAMFullscreenViewfinder *)self _viewportAnimator];
  char v131 = [v130 isAnimating];

  if ((v131 & 1) == 0) {
    -[CAMFullscreenViewfinder _layoutViewportWithFrame:previewFrame:](self, "_layoutViewportWithFrame:previewFrame:", v257, v256, v255, v254, v252, v250, v248, v247);
  }
  v132 = [(CAMFullscreenViewfinder *)self previewView];
  -[CAMFullscreenViewfinder _frameForPreviewOverlaysInViewport:](self, "_frameForPreviewOverlaysInViewport:", v257, v256, v255, v254);
  objc_msgSend(v132, "convertRect:fromView:", self);
  double v134 = v133;
  double v136 = v135;
  double v138 = v137;
  double v140 = v139;
  v141 = [(CAMFullscreenViewfinder *)self previewView];
  objc_msgSend(v141, "setOverlayFrame:", v134, v136, v138, v140);

  [(CAMFullscreenViewfinder *)self _frameForModeView];
  double v143 = v142;
  double v145 = v144;
  double v147 = v146;
  double v149 = v148;
  v150 = [(CAMFullscreenViewfinder *)self modeDial];
  objc_msgSend(v150, "setFrame:", v143, v145, v147, v149);

  [(CAMFullscreenViewfinder *)self _layoutZoomControls];
  v151 = [(CAMFullscreenViewfinder *)self imageAnalysisButton];
  uint64_t v152 = [(CAMFullscreenViewfinder *)self zoomSlider];
  uint64_t v153 = [(CAMFullscreenViewfinder *)self zoomControl];
  v154 = [(CAMFullscreenViewfinder *)self traitCollection];
  v155 = [v154 preferredContentSizeCategory];
  +[CAMZoomButton circleDiameterForContentSize:v155];
  double v157 = v156;

  [v151 setBackgroundDiameter:v157];
  v253 = (void *)v153;
  [(CAMFullscreenViewfinder *)self _imageAnalysisButtonFrameForZoomControl:v153 zoomSlider:v152];
  objc_msgSend(v151, "setFrame:");
  v158 = [(CAMFullscreenViewfinder *)self machineReadableCodeButton];
  if (v158)
  {
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v158, "setHitTestInsets:");
    [(CAMFullscreenViewfinder *)self _geometryForMRCButton];
    CAMViewSetGeometry(v158, (uint64_t)v271);
  }
  v159 = [(CAMFullscreenViewfinder *)self _textInteractionBackground];
  objc_msgSend(v159, "setFrame:", v4, v6, v8, v10);

  v160 = [(CAMFullscreenViewfinder *)self textInteractionInsert];
  -[CAMFullscreenViewfinder _geometryForTextInteractionInsertWithViewport:](self, "_geometryForTextInteractionInsertWithViewport:", v257, v256, v255, v254);
  CAMViewSetGeometry(v160, (uint64_t)v270);
  [v151 backgroundDiameter];
  objc_msgSend(v160, "setPreferredQuickActionButtonHeight:");
  v161 = [v160 actionInfoView];
  if (v161)
  {
    [(CAMFullscreenViewfinder *)self _frameForActionInfoView];
    objc_msgSend(v161, "setFrame:");
  }
  [(CAMFullscreenViewfinder *)self _applyTextInsertContentInsets];
  v251 = (void *)v152;
  [(CAMFullscreenViewfinder *)self _previewSuggestionButtonFrameForZoomControl:v253 zoomSlider:v152];
  double v163 = v162;
  double v165 = v164;
  double v167 = v166;
  double v169 = v168;
  v170 = [(CAMFullscreenViewfinder *)self autoMacroButton];
  objc_msgSend(v170, "setFrame:", v163, v165, v167, v169);

  v171 = [(CAMFullscreenViewfinder *)self depthEffectSuggestionButton];
  objc_msgSend(v171, "setFrame:", v163, v165, v167, v169);

  v172 = [(CAMFullscreenViewfinder *)self controlDrawer];
  if (v172)
  {
    [(CAMFullscreenViewfinder *)self _frameForControlDrawer];
    objc_msgSend(v172, "setFrame:");
  }
  v173 = [(CAMFullscreenViewfinder *)self _bottomLegibilityBackground];
  if (v173)
  {
    [(CAMFullscreenViewfinder *)self _frameForBottomLegibilityBackground];
    objc_msgSend(v173, "setFrame:");
  }
  [(CAMFullscreenViewfinder *)self _updateGeometryForElapsedTimeAndInstructionLabels];
  [(CAMFullscreenViewfinder *)self _frameForExternalStorageButton];
  double v175 = v174;
  double v177 = v176;
  double v179 = v178;
  double v181 = v180;
  v182 = [(CAMFullscreenViewfinder *)self externalStorageButton];
  objc_msgSend(v182, "setFrame:", v175, v177, v179, v181);

  [(CAMFullscreenViewfinder *)self _frameForSpotlightControlPanel];
  double v184 = v183;
  double v186 = v185;
  double v188 = v187;
  double v190 = v189;
  v191 = [(CAMFullscreenViewfinder *)self spotlightControlPanel];
  objc_msgSend(v191, "setFrame:", v184, v186, v188, v190);

  v192 = [(CAMFullscreenViewfinder *)self lightingControl];

  if (v192)
  {
    [(CAMFullscreenViewfinder *)self _additionalBottomPaddingForLightingControl];
    double v194 = v193;
    v195 = [(CAMFullscreenViewfinder *)self lightingControl];
    [v195 setAdditionalBottomPadding:v194];

    [(CAMFullscreenViewfinder *)self _frameForLightingControl];
    double v197 = v196;
    double v199 = v198;
    double v201 = v200;
    double v203 = v202;
    v204 = [(CAMFullscreenViewfinder *)self lightingControl];
    objc_msgSend(v204, "setFrame:", v197, v199, v201, v203);

    long long v268 = 0u;
    long long v269 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    long long v264 = 0u;
    long long v265 = 0u;
    [(CAMFullscreenViewfinder *)self _geometryForLandscapeLightingBadge];
    v205 = [(CAMFullscreenViewfinder *)self lightingNameBadge];
    long long v260 = v266;
    long long v261 = v267;
    long long v262 = v268;
    long long v263 = v269;
    long long v258 = v264;
    long long v259 = v265;
    CAMApplyAnimationSensitiveGeometryToView((double *)&v258, v205);
  }
  v206 = [(CAMFullscreenViewfinder *)self filterNameBadge];

  if (v206)
  {
    v207 = [(CAMFullscreenViewfinder *)self filterNameBadge];
    long long v268 = 0u;
    long long v269 = 0u;
    long long v266 = 0u;
    long long v267 = 0u;
    long long v264 = 0u;
    long long v265 = 0u;
    [(CAMFullscreenViewfinder *)self _geometryForBottomCenteredView:v207];
    long long v260 = v266;
    long long v261 = v267;
    long long v262 = v268;
    long long v263 = v269;
    long long v258 = v264;
    long long v259 = v265;
    CAMApplyAnimationSensitiveGeometryToView((double *)&v258, v207);
  }
  [(CAMFullscreenViewfinder *)self _layoutSemanticStyleMaskedBadges];
  v208 = [(CAMFullscreenViewfinder *)self panoramaView];

  if (v208) {
    [(CAMFullscreenViewfinder *)self _layoutPanoramaView];
  }
  v209 = [(CAMFullscreenViewfinder *)self spatialCaptureButton];

  if (v209)
  {
    v210 = [(CAMFullscreenViewfinder *)self spatialCaptureButton];
    objc_msgSend(v210, "setFrame:", v163, v165, v167, v169);
  }
  v211 = [(CAMFullscreenViewfinder *)self _orientationInstructionView];

  if (v211)
  {
    v212 = [(CAMFullscreenViewfinder *)self _orientationInstructionView];
    objc_msgSend(v212, "setFrame:", v257, v256, v255, v254);
  }
  uint64_t v213 = [(CAMFullscreenViewfinder *)self spatialCaptureRecordingIndicator];
  if (v213)
  {
    v214 = (void *)v213;
    BOOL v215 = [(CAMFullscreenViewfinder *)self isSpatialCaptureRecordingIndicatorVisible];

    if (v215)
    {
      v249 = v11;
      long long v268 = 0u;
      long long v269 = 0u;
      long long v266 = 0u;
      long long v267 = 0u;
      long long v264 = 0u;
      long long v265 = 0u;
      v216 = [(CAMFullscreenViewfinder *)self _layout];
      v217 = [(CAMFullscreenViewfinder *)self elapsedTimeView];
      int64_t v218 = [(CAMFullscreenViewfinder *)self orientation];
      BOOL v219 = [(CAMFullscreenViewfinder *)self isSystemOverlayVisible];
      if (v216)
      {
        objc_msgSend(v216, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", v217, v218, v219, v257, v256, v255, v254);
      }
      else
      {
        long long v268 = 0u;
        long long v269 = 0u;
        long long v266 = 0u;
        long long v267 = 0u;
        long long v264 = 0u;
        long long v265 = 0u;
      }

      int64_t v220 = [(CAMFullscreenViewfinder *)self orientation];
      long long v260 = v266;
      long long v261 = v267;
      long long v262 = v268;
      long long v263 = v269;
      long long v258 = v264;
      long long v259 = v265;
      [(CAMFullscreenViewfinder *)self _frameForSpatialRecordingIndicatorWithElapsedTimeViewGeometry:&v258 orientation:v220];
      double v222 = v221;
      double v224 = v223;
      double v226 = v225;
      double v228 = v227;
      v229 = [(CAMFullscreenViewfinder *)self spatialCaptureRecordingIndicator];
      objc_msgSend(v229, "setFrame:", v222, v224, v226, v228);

      double v11 = v249;
    }
  }
  [(CAMFullscreenViewfinder *)self _frameForFlipButton];
  CGFloat v231 = v230;
  CGFloat v233 = v232;
  CGFloat v235 = v234;
  double v237 = v236;
  v238 = [(CAMFullscreenViewfinder *)self _layout];
  [v238 alignmentRectForShutterControl];
  double v240 = v239;

  v277.origin.double x = v231;
  v277.origin.double y = v233;
  v277.size.double width = v235;
  v277.size.double height = v237;
  CGRect v278 = CGRectInset(v277, 0.0, (v237 - v240) * 0.5);
  CGRect v279 = CGRectInset(v278, (v278.size.height - v278.size.width) * -0.5, 0.0);
  double x = v279.origin.x;
  double y = v279.origin.y;
  double width = v279.size.width;
  double height = v279.size.height;
  v245 = [(CAMFullscreenViewfinder *)self photoVideoModeSwitch];
  objc_msgSend(v245, "setFrame:", x, y, width, height);

  [(CAMFullscreenViewfinder *)self _layoutSmartStylesControls];
  [(CAMFullscreenViewfinder *)self _layoutSmartStyleNameBadge];
  [(CAMFullscreenViewfinder *)self _layoutSpotlightSmartStyleStatusIndicator];
  [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:0];
  [(CAMFullscreenViewfinder *)self _updateTintColors];
}

uint64_t __41__CAMFullscreenViewfinder_layoutSubviews__block_invoke(double *a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (void)_setViewportAnimatorFrame:(CGRect)a3
{
}

- (void)_setViewportAnimatorFrame:(CGRect)a3 withDuration:(double)a4 timingCurve:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a5;
  v15.origin.double x = x;
  v15.origin.double y = y;
  v15.size.double width = width;
  v15.size.double height = height;
  if (!CGRectIsEmpty(v15))
  {
    if ([(CAMFullscreenViewfinder *)self trueVideoState] - 1 >= 2) {
      double v11 = 0.0;
    }
    else {
      double v11 = 1.0;
    }
    BOOL v12 = [(CAMFullscreenViewfinder *)self _viewportAnimator];
    [v12 setValue:@"CAMViewfinderAnimatorViewportOriginXKey" forKey:v13 duration:x timingCurve:a4];
    [v12 setValue:@"CAMViewfinderAnimatorViewportOriginYKey" forKey:v13 duration:y timingCurve:a4];
    [v12 setValue:@"CAMViewfinderAnimatorViewportWidthKey" forKey:v13 duration:width timingCurve:a4];
    [v12 setValue:@"CAMViewfinderAnimatorViewportHeightKey" forKey:v13 duration:height timingCurve:a4];
    [v12 setValue:@"CAMViewfinderAnimatorTrueVideoTransitionPercentCompleteKey" forKey:v13 duration:v11 timingCurve:a4];
  }
}

- (void)animator:(id)a3 didUpdateValuesForKeys:(id)a4
{
  id v5 = a3;
  [v5 valueForKey:@"CAMViewfinderAnimatorViewportOriginXKey"];
  UIRoundToViewScale();
  double v7 = v6;
  [v5 valueForKey:@"CAMViewfinderAnimatorViewportOriginYKey"];
  UIRoundToViewScale();
  double v9 = v8;
  [v5 valueForKey:@"CAMViewfinderAnimatorViewportWidthKey"];
  UIRoundToViewScale();
  double v11 = v10;
  [v5 valueForKey:@"CAMViewfinderAnimatorViewportHeightKey"];
  UIRoundToViewScale();
  double v13 = v12;
  [v5 valueForKey:@"CAMViewfinderAnimatorTrueVideoTransitionPercentCompleteKey"];
  uint64_t v15 = v14;

  [MEMORY[0x263F158F8] begin];
  [(CAMFullscreenViewfinder *)self _frameForPreviewView];
  -[CAMFullscreenViewfinder _layoutViewportWithFrame:previewFrame:trueVideoTransitionPercentComplete:](self, "_layoutViewportWithFrame:previewFrame:trueVideoTransitionPercentComplete:", v7, v9, v11, v13, v16, v17, v18, v19, v15);
  [(CAMFullscreenViewfinder *)self _frameForModeView];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v28 = [(CAMFullscreenViewfinder *)self modeDial];
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);

  double v29 = [(CAMFullscreenViewfinder *)self previewView];
  [v29 layoutIfNeeded];

  double v30 = (void *)MEMORY[0x263F158F8];
  [v30 commit];
}

- (BOOL)isReticleAnimating
{
  v2 = [(CAMFullscreenViewfinder *)self _viewportAnimator];
  char v3 = [v2 isAnimating];

  return v3;
}

- (void)_setNeedsLayoutAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(CAMFullscreenViewfinder *)self setNeedsLayout];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke;
  aBlock[3] = &unk_263FA0208;
  aBlock[4] = self;
  id v5 = _Block_copy(aBlock);
  double v6 = v5;
  if (v3)
  {
    [(CAMFullscreenViewfinder *)self _trueVideoAnimationDuration];
    double v10 = 0.5;
    if (v7 <= 0.0) {
      double v11 = 0.5;
    }
    else {
      double v11 = v7;
    }
    LODWORD(v7) = 1045220557;
    LODWORD(v8) = 1041865114;
    LODWORD(v9) = 1.0;
    LODWORD(v10) = 1045220557;
    double v12 = [MEMORY[0x263F15808] functionWithControlPoints:v7 :v10 :v8 :v9];
    [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
    -[CAMFullscreenViewfinder _setViewportAnimatorFrame:withDuration:timingCurve:](self, "_setViewportAnimatorFrame:withDuration:timingCurve:", v12);
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setAnimationTimingFunction:v12];
    [(CAMFullscreenViewfinder *)self set_inFlightLayoutAnimationCount:[(CAMFullscreenViewfinder *)self _inFlightLayoutAnimationCount] + 1];
    double v13 = (void *)MEMORY[0x263F82E00];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke_2;
    v20[3] = &unk_263FA0208;
    v20[4] = self;
    uint64_t v14 = MEMORY[0x263EF8330];
    uint64_t v15 = 3221225472;
    double v16 = __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke_3;
    double v17 = &unk_263FA0230;
    double v18 = self;
    id v19 = v6;
    [v13 animateWithDuration:2 delay:v20 options:&v14 animations:v11 completion:0.0];
    objc_msgSend(MEMORY[0x263F158F8], "commit", v14, v15, v16, v17, v18);
  }
  else
  {
    (*((void (**)(void *))v5 + 2))(v5);
  }
}

uint64_t __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _inFlightLayoutAnimationCount];
  if (!result)
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 _updateForLayoutCompleted];
  }
  return result;
}

uint64_t __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __51__CAMFullscreenViewfinder__setNeedsLayoutAnimated___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_inFlightLayoutAnimationCount:", objc_msgSend(*(id *)(a1 + 32), "_inFlightLayoutAnimationCount") - 1);
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (double)_trueVideoAnimationDuration
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self useSlowerTrueVideoTransitionAnimationDuration];
  unint64_t v4 = [(CAMFullscreenViewfinder *)self trueVideoState];
  if (v4 == 1)
  {
    [(CAMFullscreenViewfinder *)self _trueVideoModeSwitchToCaptureAnimationDurationOverride];
    BOOL v6 = !v3;
    double v7 = 0.7;
    double v8 = 0.966;
  }
  else
  {
    double result = 0.0;
    if (v4 != 3) {
      return result;
    }
    [(CAMFullscreenViewfinder *)self _trueVideoModeSwitchFromCaptureAnimationDurationOverride];
    BOOL v6 = !v3;
    double v7 = 0.586;
    double v8 = 1.0;
  }
  if (!v6) {
    double v7 = v8;
  }
  if (result <= 0.0) {
    return v7;
  }
  return result;
}

- (void)_updateForLayoutCompleted
{
  if (![(CAMFullscreenViewfinder *)self isControlDrawerExpanded])
  {
    id v3 = [(CAMFullscreenViewfinder *)self controlDrawer];
    [v3 collapseExpandableButtonsAnimated:0 updatePreferredDrawerControl:0];
  }
}

- (CGRect)_currentFourThreeViewportFrame
{
  id v3 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v3, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)_frameForPreviewView
{
  [(CAMFullscreenViewfinder *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(CAMFullscreenViewfinder *)self _overCapturePreviewLayer];

  if (!v11)
  {
    int64_t v12 = [(CAMFullscreenViewfinder *)self viewportAspectRatio];
    if ((unint64_t)(v12 - 2) >= 3) {
      int64_t v13 = v12;
    }
    else {
      int64_t v13 = 0;
    }
    double v14 = [(CAMFullscreenViewfinder *)self _layout];
    objc_msgSend(v14, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v13, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
    double v4 = v15;
    double v6 = v16;
    double v8 = v17;
    double v10 = v18;
  }
  double v19 = v4;
  double v20 = v6;
  double v21 = v8;
  double v22 = v10;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (CGRect)_frameForPreviewOverlaysInViewport:(CGRect)a3
{
  double height = a3.size.height;
  CGFloat width = a3.size.width;
  double y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = [(CAMFullscreenViewfinder *)self _layout];
  [v7 frameForControlStatusBar];
  v27.origin.CGFloat x = v8;
  v27.origin.double y = v9;
  v27.size.CGFloat width = v10;
  v27.size.double height = v11;
  v23.origin.CGFloat x = x;
  v23.origin.double y = y;
  v23.size.CGFloat width = width;
  v23.size.double height = height;
  CGRect v24 = CGRectIntersection(v23, v27);
  CGFloat v12 = v24.origin.x;
  CGFloat v13 = v24.origin.y;
  CGFloat v14 = v24.size.width;
  double v15 = v24.size.height;

  v25.origin.CGFloat x = v12;
  v25.origin.double y = v13;
  v25.size.CGFloat width = v14;
  v25.size.double height = v15;
  BOOL IsNull = CGRectIsNull(v25);
  double v17 = 0.0;
  if (!IsNull) {
    double v17 = v15;
  }
  double v18 = height - v17;
  double v19 = -0.0;
  if (!IsNull) {
    double v19 = v15;
  }
  double v20 = y + v19;
  double v21 = x;
  double v22 = width;
  result.size.double height = v18;
  result.size.CGFloat width = v22;
  result.origin.double y = v20;
  result.origin.CGFloat x = v21;
  return result;
}

- (void)_updatePreviewLayerForPreviewFrame:(CGRect)a3 viewportFrame:(CGRect)a4 trueVideoTransitionPercentComplete:(double)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double v7 = a3.size.height;
  double v8 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = [(CAMFullscreenViewfinder *)self _overCapturePreviewLayer];
  if (v13)
  {
    UIRectGetCenter();
    objc_msgSend(v13, "setPrimaryCaptureRectAspectRatio:centerPoint:trueVideoTransitionPercentComplete:", height / width, (v12 - y) / v7, (v11 - x) / v8, a5);
  }
}

- (BOOL)requestPreviewUpdateForSemanticStyleAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v54 = *MEMORY[0x263EF8340];
  double v5 = +[CAMCaptureCapabilities capabilities];
  char v6 = [v5 smartStylesSupported];

  if (v6) {
    return 0;
  }
  double v7 = [(CAMFullscreenViewfinder *)self delegate];
  int v8 = [v7 fullscreenViewfinderCanUpdatePreviewSemanticStyles:self];

  if (!v8) {
    return 0;
  }
  CGFloat v9 = [(CAMFullscreenViewfinder *)self _overCapturePreviewLayer];
  BOOL v10 = [(CAMFullscreenViewfinder *)self isSemanticStyleControlVisible];
  double v11 = [(CAMFullscreenViewfinder *)self delegate];
  double v12 = v11;
  if (v10)
  {
    id v13 = [v11 fullscreenViewfinderSemanticStyleList:self];

    CGFloat v14 = [(CAMFullscreenViewfinder *)self semanticStylePicker];
    uint64_t v15 = [v14 selectedStyleIndex];

    if (v15 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v15;
    }
    uint64_t v17 = v16 - 1;
    uint64_t v18 = [v13 count];
    if (v15 + 1 < (unint64_t)(v18 - 1)) {
      uint64_t v19 = v15 + 1;
    }
    else {
      uint64_t v19 = v18 - 1;
    }
    id v20 = objc_alloc_init(MEMORY[0x263EFF980]);
    if (v16 - 1 < (unint64_t)(v19 + 1))
    {
      uint64_t v21 = v16 - 2;
      do
      {
        ++v21;
        double v22 = [(CAMFullscreenViewfinder *)self semanticStylePicker];
        [v22 presentatationStyleRectAtIndex:v21];

        CGRect v23 = [(CAMFullscreenViewfinder *)self semanticStylePicker];
        [v23 bounds];
        CEKNormalizeRect();
        double v25 = v24;
        double v27 = v26;
        double v29 = v28;
        double v31 = v30;

        double v32 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:", v25, v27, v29, v31);
        [v20 addObject:v32];
      }
      while (v19 != v21);
    }
    long long v46 = v20;
    double v33 = objc_msgSend(v13, "subarrayWithRange:", v17, v19 - v17 + 1);
    if ([v9 isSemanticStyleRenderingEnabled])
    {
      id v34 = objc_alloc_init(MEMORY[0x263EFF980]);
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v35 = v33;
      uint64_t v36 = [v35 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v36)
      {
        uint64_t v37 = v36;
        uint64_t v38 = *(void *)v50;
        do
        {
          uint64_t v39 = 0;
          do
          {
            if (*(void *)v50 != v38) {
              objc_enumerationMutation(v35);
            }
            double v40 = *(void **)(*((void *)&v49 + 1) + 8 * v39);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              double v41 = [v40 avSemanticStyle];
              [v34 addObject:v41];
            }
            else
            {
              double v41 = os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
                [(CAMFullscreenViewfinder *)&buf requestPreviewUpdateForSemanticStyleAnimated:v41];
              }
            }

            ++v39;
          }
          while (v37 != v39);
          uint64_t v37 = [v35 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v37);
      }

      uint64_t v42 = [v34 count];
      if (v42 == [v46 count]) {
        [v9 setSemanticStyles:v34 semanticStylesRegions:v46];
      }
    }
  }
  else
  {
    double v44 = [v11 fullscreenViewfinderSelectedSemanticStyle:self];

    if ([v9 isSemanticStyleRenderingEnabled])
    {
      if (!v44 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        double v45 = [v44 avSemanticStyle];
        [v9 setSemanticStyle:v45 animated:v3];
      }
    }
  }
  return 1;
}

- (void)_updateReticleForViewportFrame:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  [(CAMFullscreenViewfinder *)self bounds];
  double v7 = v6 - (y + height);
  id v8 = [(CAMFullscreenViewfinder *)self _reticleView];
  [v8 setViewportTopInset:0 bottomInset:y animated:v7];
  [v8 layoutIfNeeded];
}

- (void)_updateModeDialClippingForViewportFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat rect_16 = a3.origin.y;
  CGFloat rect_24a = a3.size.width;
  CGFloat rect_8 = a3.origin.x;
  double v5 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v5, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), 0);
  CGFloat rect = v6;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  id v13 = [(CAMFullscreenViewfinder *)self _layout];
  [v13 alignmentRectForShutterControl];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v33.origin.double x = rect_8;
  v33.origin.double y = rect_16;
  v33.size.double width = rect_24a;
  v33.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v33);
  v34.origin.double x = rect;
  v34.origin.double y = v8;
  v34.size.double width = v10;
  v34.size.CGFloat height = v12;
  double v23 = fmin(MaxY, CGRectGetMaxY(v34));
  [(CAMFullscreenViewfinder *)self bounds];
  double v25 = v24;
  v35.origin.double x = v15;
  v35.origin.double y = v17;
  v35.size.double width = v19;
  v35.size.CGFloat height = v21;
  CGFloat v26 = CGRectGetMinY(v35) - v23;
  rect_24 = [(CAMFullscreenViewfinder *)self _modeClippingView];
  objc_msgSend(rect_24, "setFrame:", 0.0, v23, v25, v26);
}

- (void)_updatePreviewAlignmentGuideForViewportFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  CGFloat v8 = [(CAMFullscreenViewfinder *)self previewAlignmentGuide];
  objc_msgSend(v8, "setFrame:", x, y, width, height);

  id v9 = [(CAMFullscreenViewfinder *)self previewAlignmentGuide];
  [v9 layoutIfNeeded];
}

- (void)_updateSemanticStylePicker:(id)a3 forViewportFrame:(CGRect)a4
{
  if (a3)
  {
    double height = a4.size.height;
    double width = a4.size.width;
    double y = a4.origin.y;
    double x = a4.origin.x;
    id v15 = a3;
    objc_msgSend(v15, "setFrame:", x, y, width, height);
    int64_t v9 = [(CAMFullscreenViewfinder *)self _viewportAspectRatioForControlsOverPreview];
    CGFloat v10 = [(CAMFullscreenViewfinder *)self _layout];
    objc_msgSend(v10, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v9, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
    double v12 = v11;
    double v14 = v13;

    [v15 setContentBottomMargin:y + height - (v12 + v14)];
    [v15 layoutIfNeeded];
  }
}

- (CGRect)_frameForSpotlightControlPanel
{
  int64_t v3 = [(CAMFullscreenViewfinder *)self _viewportAspectRatioForControlsOverPreview];
  BOOL v4 = [(CAMFullscreenViewfinder *)self _isUsingCreativeCameraControls];
  BOOL v5 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  double v6 = [(CAMFullscreenViewfinder *)self _layout];
  [v6 viewportFrameForAspectRatio:v3 usingAppDrawer:v4 accessoryAreaExpanded:v5];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;

  id v15 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v15, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v30.origin.double x = v8;
  v30.origin.double y = v10;
  v30.size.double width = v12;
  v30.size.double height = v14;
  double MaxY = CGRectGetMaxY(v30);
  v31.origin.double x = v17;
  v31.origin.double y = v19;
  v31.size.double width = v21;
  v31.size.double height = v23;
  double v25 = CGRectGetMaxY(v31);
  [(CAMFullscreenViewfinder *)self bounds];
  double v27 = v25 - MaxY;
  double v28 = 0.0;
  double v29 = MaxY;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v29;
  result.origin.double x = v28;
  return result;
}

- (CGRect)_frameForReticleViewport
{
  int64_t v3 = [(CAMFullscreenViewfinder *)self viewportAspectRatio];
  BOOL v4 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v4, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v3, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_frameForContentClippingContainer
{
  int64_t v3 = [(CAMFullscreenViewfinder *)self _layout];
  [v3 frameForControlStatusBar];
  double MinY = CGRectGetMinY(v12);

  double v5 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v5, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer"));
  double MaxY = CGRectGetMaxY(v13);

  double v7 = [(CAMFullscreenViewfinder *)self externalStorageButton];

  if (v7)
  {
    [(CAMFullscreenViewfinder *)self _frameForExternalStorageButton];
    double MaxY = CGRectGetMaxY(v14);
  }
  [(CAMFullscreenViewfinder *)self bounds];
  double v10 = MaxY - MinY;
  double v11 = MinY;
  result.size.double height = v10;
  result.size.double width = v9;
  result.origin.double y = v11;
  result.origin.double x = v8;
  return result;
}

- (void)_updateDisabledModeOverlayViewportFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(CAMFullscreenViewfinder *)self disabledModeOverlayView];
  objc_msgSend(v8, "setViewportFrame:", x, y, width, height);

  [(CAMFullscreenViewfinder *)self bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  CGFloat v17 = [(CAMFullscreenViewfinder *)self disabledModeOverlayView];
  objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

  id v18 = [(CAMFullscreenViewfinder *)self disabledModeOverlayView];
  [v18 layoutIfNeeded];
}

- (void)_layoutZoomControls
{
  int64_t v3 = [(CAMFullscreenViewfinder *)self viewportAspectRatio];
  BOOL v4 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  int64_t v5 = [(CAMFullscreenViewfinder *)self _viewportAspectRatioForControlsOverPreview];
  if (v5 == v3)
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v4 = [(CAMFullscreenViewfinder *)self _showControlDrawer];
    BOOL v6 = [(CAMFullscreenViewfinder *)self isZoomControlVisible];
  }
  double v7 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v7, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v3, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), v4);
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v54 = v13;
  uint64_t v55 = v12;

  double v14 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v14, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v5, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), v4);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;

  double v53 = *MEMORY[0x263F001A8];
  [(CAMFullscreenViewfinder *)self bounds];
  double v52 = v23;
  CGFloat rect_24 = v16;
  v67.origin.double x = v16;
  CGFloat rect_8 = v18;
  v67.origin.double y = v18;
  CGFloat v61 = v22;
  CGFloat v62 = v20;
  v67.size.double width = v20;
  v67.size.double height = v22;
  double MaxY = CGRectGetMaxY(v67);
  [(CAMFullscreenViewfinder *)self bounds];
  double v63 = v25 - MaxY;
  double v26 = [(CAMFullscreenViewfinder *)self _layout];
  [v26 alignmentRectForShutterControl];
  double rect = v27;
  double v29 = v28;
  double v60 = v30;
  double rect_16 = v31;

  double v32 = v29;
  if (v4)
  {
    CGRect v33 = [(CAMFullscreenViewfinder *)self _layout];
    objc_msgSend(v33, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v5, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), 0);
    CGFloat v35 = v34;
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v64 = v40;

    v68.origin.double x = rect_24;
    v68.origin.double y = rect_8;
    v68.size.double height = v61;
    v68.size.double width = v62;
    uint64_t v41 = v9;
    double v42 = CGRectGetMaxY(v68);
    v69.origin.double x = v35;
    v69.origin.double y = v37;
    v69.size.double width = v39;
    v69.size.double height = v64;
    double v43 = v42 - CGRectGetMaxY(v69);
    uint64_t v9 = v41;
    double v32 = v29 + v43;
  }
  double v65 = [(CAMFullscreenViewfinder *)self zoomControl];
  +[CAMZoomControlUtilities layoutZoomControl:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:](CAMZoomControlUtilities, "layoutZoomControl:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:", v65, 4, v6, v53, MaxY, v52, v63, rect, v32, v60, rect_16, v9, v11, v55, v54);
  double v44 = [(CAMFullscreenViewfinder *)self zoomSlider];
  [(CAMFullscreenViewfinder *)self bounds];
  +[CAMZoomSliderUtilities layoutZoomSlider:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:viewfinderViewAlignmentRect:](CAMZoomSliderUtilities, "layoutZoomSlider:forLayoutStyle:bottomBarAlignmentRect:bottomBarTransparent:shutterButtonAlignmentRect:previewViewAlignmentRect:viewfinderViewAlignmentRect:", v44, 0, v6, v53, MaxY, v52, v63, rect, v32, v60, rect_16, v9, v11, v55, v54, v45,
    v46,
    v47,
    v48);

  [v65 frame];
  double MinY = CGRectGetMinY(v70);
  if (v6 && ![(CAMFullscreenViewfinder *)self isModeUIAllowed])
  {
    double v50 = CAMPixelWidthForView(self) + 19.0;
    v72.origin.double x = rect;
    v72.origin.double y = v29;
    v72.size.double width = v60;
    v72.size.double height = rect_16;
    double v51 = CGRectGetMinY(v72);
  }
  else
  {
    double v50 = 15.0;
    v71.origin.double x = rect_24;
    v71.origin.double y = rect_8;
    v71.size.double height = v61;
    v71.size.double width = v62;
    double v51 = CGRectGetMaxY(v71);
  }
  [v65 setZoomButtonMaxYWhenContracted:v51 - MinY - v50];
}

- (CGRect)_frameForExternalStorageButton
{
  int64_t v3 = [(CAMFullscreenViewfinder *)self externalStorageButton];
  BOOL v4 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v4, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer"));
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  [v3 intrinsicContentSize];
  v25.origin.double x = v6;
  v25.origin.double y = v8;
  v25.size.double width = v10;
  v25.size.double height = v12;
  CGRectGetMaxY(v25);
  v26.origin.double x = v6;
  v26.origin.double y = v8;
  v26.size.double width = v10;
  v26.size.double height = v12;
  CGRectGetWidth(v26);
  [(CAMFullscreenViewfinder *)self bounds];
  CGRectGetMaxY(v27);
  v28.origin.double x = v6;
  v28.origin.double y = v8;
  v28.size.double width = v10;
  v28.size.double height = v12;
  CGRectGetMaxY(v28);
  UIRectCenteredIntegralRect();
  objc_msgSend(v3, "frameForAlignmentRect:");
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

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

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBadgeTray
{
  [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
  double v6 = v5;
  double MaxY = v7;
  double v10 = v9;
  double v12 = v11;
  unint64_t v13 = [(CAMFullscreenViewfinder *)self orientation];
  double v14 = (CGFloat *)MEMORY[0x263F001A8];
  BOOL v15 = [(CAMFullscreenViewfinder *)self isElapsedTimeViewVisible];
  double v16 = [(CAMFullscreenViewfinder *)self _visibleInstructionLabelForInstructionLabelValue:[(CAMFullscreenViewfinder *)self visibleInstructionLabel]];
  double v17 = [(CAMFullscreenViewfinder *)self _visibleInstructionLabelForInstructionLabelValue:[(CAMFullscreenViewfinder *)self visibleSecondaryInstructionLabel]];
  long long v86 = 0u;
  long long v87 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  double v18 = [(CAMFullscreenViewfinder *)self _layout];
  double v19 = [(CAMFullscreenViewfinder *)self elapsedTimeView];
  int64_t v20 = [(CAMFullscreenViewfinder *)self orientation];
  BOOL v21 = [(CAMFullscreenViewfinder *)self isSystemOverlayVisible];
  if (v18)
  {
    objc_msgSend(v18, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", v19, v20, v21, v6, MaxY, v10, v12);
  }
  else
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
  }
  CGFloat v22 = *v14;
  CGFloat v23 = v14[1];
  CGFloat v25 = v14[2];
  double v24 = v14[3];

  CGFloat rect2 = v24;
  if (v15)
  {
    long long v78 = v84;
    long long v79 = v85;
    long long v80 = v86;
    long long v81 = v87;
    long long v76 = v82;
    long long v77 = v83;
    if (!v16)
    {
      double v26 = v24;
      double v27 = v25;
      double v28 = v23;
      CGFloat v29 = v22;
      if (v13 - 3 > 1) {
        goto LABEL_13;
      }
      long long v72 = v84;
      long long v73 = v85;
      long long v74 = v86;
      long long v75 = v87;
      long long v70 = v82;
      long long v71 = v83;
      double v30 = &v70;
      goto LABEL_12;
    }
  }
  else
  {
    long long v78 = xmmword_209C7B610;
    long long v79 = xmmword_209C7B620;
    long long v80 = xmmword_209C7B630;
    long long v81 = xmmword_209C7B640;
    double v26 = v24;
    double v27 = v25;
    double v28 = v23;
    long long v76 = CAMViewGeometryZero;
    long long v77 = xmmword_209C7B600;
    CGFloat v29 = v22;
    if (!v16) {
      goto LABEL_13;
    }
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v66 = xmmword_209C7B610;
  long long v67 = xmmword_209C7B620;
  long long v68 = xmmword_209C7B630;
  long long v69 = xmmword_209C7B640;
  long long v64 = CAMViewGeometryZero;
  long long v65 = xmmword_209C7B600;
  long long v60 = v78;
  long long v61 = v79;
  long long v62 = v80;
  long long v63 = v81;
  long long v58 = v76;
  long long v59 = v77;
  [(CAMFullscreenViewfinder *)self _geometryForInstructionLabel:v16 belowInstructionLabelGeometry:&v64 elapsedTimeViewGeometry:&v58];
  if (v17)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v60 = v72;
    long long v61 = v73;
    long long v62 = v74;
    long long v63 = v75;
    long long v58 = v70;
    long long v59 = v71;
    v57[2] = v78;
    v57[3] = v79;
    v57[4] = v80;
    v57[5] = v81;
    v57[0] = v76;
    v57[1] = v77;
    [(CAMFullscreenViewfinder *)self _geometryForInstructionLabel:v17 belowInstructionLabelGeometry:&v58 elapsedTimeViewGeometry:v57];
    long long v60 = v66;
    long long v61 = v67;
    long long v62 = v68;
    long long v63 = v69;
    long long v58 = v64;
    long long v59 = v65;
    double v30 = &v58;
  }
  else
  {
    long long v66 = v72;
    long long v67 = v73;
    long long v68 = v74;
    long long v69 = v75;
    long long v64 = v70;
    long long v65 = v71;
    double v30 = &v64;
  }
LABEL_12:
  CAMFrameForGeometry((uint64_t)v30);
  CGFloat v29 = v31;
LABEL_13:
  if (v13 >= 3)
  {
    if (v13 == 3)
    {
      CGFloat v44 = v29;
      v96.size.double width = v25;
      CGFloat v45 = v27;
      v96.origin.double y = v23;
      CGFloat v46 = v26;
      CGFloat recta = v28;
      v96.origin.double x = v22;
      v96.size.double height = rect2;
      double v47 = 0.0;
      if (!CGRectEqualToRect(*(CGRect *)(&v28 - 1), v96))
      {
        v92.origin.double x = v6;
        v92.origin.double y = MaxY;
        v92.size.double width = v10;
        v92.size.double height = v12;
        double MaxX = CGRectGetMaxX(v92);
        v93.origin.double x = v29;
        v93.origin.double y = recta;
        v93.size.double width = v45;
        v93.size.double height = v46;
        double v47 = MaxX - CGRectGetMinX(v93);
      }
      v94.origin.double x = v6;
      v94.origin.double y = MaxY;
      v94.size.double width = v10;
      v94.size.double height = v12;
      double v6 = CGRectGetMaxX(v94) + -40.0 - v47;
    }
    else
    {
      if (v13 != 4) {
        goto LABEL_26;
      }
      CGFloat v43 = v29;
      double v6 = CGRectGetMaxX(*(CGRect *)(&v28 - 1));
    }
    double v10 = 40.0;
    goto LABEL_26;
  }
  CGFloat rect = v28;
  double rect2a = v6;
  CGFloat v50 = v27;
  CGFloat v51 = v26;
  v88.origin.double x = v6;
  v88.origin.double y = MaxY;
  double v52 = v10;
  v88.size.double width = v10;
  v88.size.double height = v12;
  double v32 = MaxY;
  double MaxY = CGRectGetMinY(v88) + -40.0;
  CGRect v33 = [(CAMFullscreenViewfinder *)self _layout];
  [v33 frameForControlStatusBar];
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  double v40 = v12;
  CGFloat v42 = v41;

  v89.origin.double x = v35;
  v89.origin.double y = v37;
  v89.size.double width = v39;
  v89.size.double height = v42;
  if (MaxY >= CGRectGetMaxY(v89))
  {
LABEL_25:
    double v12 = 40.0;
    double v6 = rect2a;
    double v10 = v52;
    goto LABEL_26;
  }
  v90.origin.double x = v29;
  v90.origin.double y = rect;
  v90.size.double width = v50;
  v90.size.double height = v51;
  if (!CGRectIsEmpty(v90))
  {
    v95.origin.double x = v29;
    v95.origin.double y = rect;
    v95.size.double width = v50;
    v95.size.double height = v51;
    double MaxY = CGRectGetMaxY(v95);
    goto LABEL_25;
  }
  double v6 = rect2a;
  double v10 = v52;
  -[CAMFullscreenViewfinder _frameForPreviewOverlaysInViewport:](self, "_frameForPreviewOverlaysInViewport:", rect2a, v32, v52, v40);
  double MaxY = CGRectGetMinY(v91);
  double v12 = 40.0;
LABEL_26:
  CAMViewGeometryForOrientedFrame(v13, (uint64_t)retstr, v6, MaxY, v10, v12);

  return result;
}

- (CGRect)_frameForControlDrawer
{
  int64_t v3 = [(CAMFullscreenViewfinder *)self _layout];
  [v3 alignmentRectForShutterControl];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  [(CAMFullscreenViewfinder *)self _currentFourThreeViewportFrame];
  double MaxY = CGRectGetMaxY(v21);
  v22.origin.double x = v5;
  v22.origin.double y = v7;
  v22.size.double width = v9;
  v22.size.double height = v11;
  double MinY = CGRectGetMinY(v22);
  [(CAMFullscreenViewfinder *)self bounds];
  double v15 = v14;
  double v16 = MinY - MaxY;
  if ([(CAMFullscreenViewfinder *)self isControlDrawerExpanded]) {
    double v17 = MaxY;
  }
  else {
    double v17 = v7;
  }
  double v18 = 0.0;
  double v19 = v15;
  double v20 = v16;
  result.size.double height = v20;
  result.size.double width = v19;
  result.origin.double y = v17;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_frameForBottomLegibilityBackground
{
  [(CAMFullscreenViewfinder *)self bounds];
  double v4 = v3;
  double v6 = v5;
  CGFloat v7 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v7, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder _showControlDrawer](self, "_showControlDrawer"));
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v20.origin.double x = v9;
  v20.origin.double y = v11;
  v20.size.double width = v13;
  v20.size.double height = v15;
  double MaxY = CGRectGetMaxY(v20);
  double v17 = v6 - MaxY;
  double v18 = 0.0;
  double v19 = v4;
  result.size.double height = v17;
  result.size.double width = v19;
  result.origin.double y = MaxY;
  result.origin.double x = v18;
  return result;
}

- (CGRect)_frameForFlipButton
{
  double v3 = [(CAMFullscreenViewfinder *)self _layout];
  double v4 = [(CAMFullscreenViewfinder *)self flipButton];
  [v3 frameForBottomRightControl:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_frameForTransientContentView
{
  double v3 = [(CAMFullscreenViewfinder *)self _layout];
  double v4 = [(CAMFullscreenViewfinder *)self imageWell];
  [v3 frameForBottomLeftControl:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)_frameForModeView
{
  double v3 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v3, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), 0);
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = [(CAMFullscreenViewfinder *)self _layout];
  [v12 alignmentRectForShutterControl];
  double v14 = v13;

  v35.origin.double x = v5;
  v35.origin.double y = v7;
  v35.size.double width = v9;
  v35.size.double height = v11;
  double MaxY = CGRectGetMaxY(v35);
  double v16 = v14 - MaxY;
  [(CAMFullscreenViewfinder *)self bounds];
  double v18 = v17;
  if ([(CAMFullscreenViewfinder *)self _showControlDrawer])
  {
    [(CAMFullscreenViewfinder *)self _currentFourThreeViewportFrame];
    double MaxY = CGRectGetMaxY(v36) - v16;
  }
  double v19 = [(CAMFullscreenViewfinder *)self _modeClippingView];
  CGRect v20 = [v19 superview];
  CGRect v21 = [(CAMFullscreenViewfinder *)self modeDial];
  CGRect v22 = [v21 superview];
  objc_msgSend(v20, "convertRect:toView:", v22, 0.0, MaxY, v18, v16);
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.double height = v34;
  result.size.double width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForMRCButton
{
  id v34 = [(CAMFullscreenViewfinder *)self machineReadableCodeButton];
  unint64_t v5 = [(CAMFullscreenViewfinder *)self orientation];
  double v6 = [(CAMFullscreenViewfinder *)self imageAnalysisButton];
  [v6 frame];
  CGFloat x = v36.origin.x;
  CGFloat y = v36.origin.y;
  CGFloat width = v36.size.width;
  CGFloat height = v36.size.height;
  CGFloat MidY = CGRectGetMidY(v36);
  -[CAMFullscreenViewfinder _imageAnalysisButtonAlignmentRectForCenterY:](self, "_imageAnalysisButtonAlignmentRectForCenterY:");
  CGRect v38 = CGRectInset(v37, -5.0, -5.0);
  if (v5 - 3 > 1)
  {
    double v27 = v38.origin.x;
    [(CAMFullscreenViewfinder *)self bounds];
    double v26 = v28 - v27;
    double v25 = 15.0;
  }
  else
  {
    double v32 = v38.origin.y;
    int64_t v12 = [(CAMFullscreenViewfinder *)self _viewportAspectRatioForControlsOverPreview];
    double v13 = [(CAMFullscreenViewfinder *)self _layout];
    objc_msgSend(v13, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v12, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    double v33 = MidY;
    double v18 = width;
    double v19 = x;
    CGFloat v21 = v20;
    double v22 = y;
    CGFloat v24 = v23;

    v39.origin.CGFloat x = v15;
    v39.origin.CGFloat y = v17;
    v39.size.CGFloat width = v21;
    CGFloat x = v19;
    CGFloat width = v18;
    CGFloat MidY = v33;
    v39.size.CGFloat height = v24;
    CGFloat y = v22;
    double v25 = CGRectGetMaxY(v39) - v32;
    double v26 = 15.0;
  }
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tCGFloat x = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  -[CAMFullscreenViewfinder _geometryForBottomCenteredView:margins:](self, "_geometryForBottomCenteredView:margins:", v34, v26, v25);
  if (v5 >= 3)
  {
    if (v5 == 3)
    {
      double v29 = [(CAMFullscreenViewfinder *)self _previewSuggestionButton];

      if (v29)
      {
        double v30 = [(CAMFullscreenViewfinder *)self _previewSuggestionButton];
        [v30 frame];
        retstr->var1.CGFloat x = CGRectGetMidX(v41);
      }
    }
    else if (v5 == 4)
    {
      v40.origin.CGFloat x = x;
      v40.origin.CGFloat y = y;
      v40.size.CGFloat width = width;
      v40.size.CGFloat height = height;
      retstr->var1.CGFloat x = CGRectGetMidX(v40);
    }
  }
  else
  {
    retstr->var1.CGFloat y = MidY;
  }

  return result;
}

- (CGRect)_frameForLightingControl
{
  double v3 = [(CAMFullscreenViewfinder *)self lightingControl];
  int64_t v4 = [(CAMFullscreenViewfinder *)self viewportAspectRatio];
  if (v4 == 1) {
    int64_t v5 = 0;
  }
  else {
    int64_t v5 = v4;
  }
  double v6 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v6, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v5, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  double v8 = v7;
  CGFloat v10 = v9;
  double v12 = v11;
  CGFloat v14 = v13;

  [v3 contentHeightForWidth:v12];
  double v16 = v15;
  v29.origin.CGFloat x = v8;
  v29.origin.CGFloat y = v10;
  v29.size.CGFloat width = v12;
  v29.size.CGFloat height = v14;
  objc_msgSend(v3, "frameForAlignmentRect:", v8, CGRectGetMaxY(v29) - v16, v12, v16);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;

  double v25 = v18;
  double v26 = v20;
  double v27 = v22;
  double v28 = v24;
  result.size.CGFloat height = v28;
  result.size.CGFloat width = v27;
  result.origin.CGFloat y = v26;
  result.origin.CGFloat x = v25;
  return result;
}

- (double)_additionalBottomPaddingForLightingControl
{
  int64_t v3 = [(CAMFullscreenViewfinder *)self viewportAspectRatio];
  double result = 0.0;
  if (v3 == 1)
  {
    int64_t v5 = [(CAMFullscreenViewfinder *)self _layout];
    objc_msgSend(v5, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
    CGFloat v7 = v6;
    double v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;

    CGFloat v14 = [(CAMFullscreenViewfinder *)self _layout];
    objc_msgSend(v14, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
    CGFloat v16 = v15;
    double v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v24.origin.CGFloat x = v7;
    v24.origin.CGFloat y = v9;
    v24.size.CGFloat width = v11;
    v24.size.CGFloat height = v13;
    double Height = CGRectGetHeight(v24);
    v25.origin.CGFloat x = v16;
    v25.origin.CGFloat y = v18;
    v25.size.CGFloat width = v20;
    v25.size.CGFloat height = v22;
    return Height - CGRectGetHeight(v25) - (v18 - v9);
  }
  return result;
}

- (void)_updateLightingControlClipping
{
  if ([(CAMFullscreenViewfinder *)self material] == 4)
  {
    uint64_t v3 = 0;
  }
  else
  {
    unint64_t v4 = [(CAMFullscreenViewfinder *)self viewportAspectRatio];
    if (v4 <= 3) {
      uint64_t v3 = (0xDu >> (v4 & 0xF)) & 1;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  id v5 = [(CAMFullscreenViewfinder *)self lightingControl];
  [v5 setClipsToBounds:v3];
}

- (CGRect)_imageAnalysisButtonFrameForZoomControl:(id)a3 zoomSlider:(id)a4
{
  [(CAMFullscreenViewfinder *)self _centerYForZoomControl:a3 zoomSlider:a4];
  -[CAMFullscreenViewfinder _imageAnalysisButtonFrameForCenterY:](self, "_imageAnalysisButtonFrameForCenterY:");
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (CGRect)_previewSuggestionButtonFrameForZoomControl:(id)a3 zoomSlider:(id)a4
{
  [(CAMFullscreenViewfinder *)self _centerYForZoomControl:a3 zoomSlider:a4];
  -[CAMFullscreenViewfinder _previewSuggestionButtonFrameForCenterY:](self, "_previewSuggestionButtonFrameForCenterY:");
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v6;
  result.origin.CGFloat x = v5;
  return result;
}

- (double)_centerYForZoomControl:(id)a3 zoomSlider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = v7;
  if (v6)
  {
    double v9 = [(CAMFullscreenViewfinder *)self traitCollection];
    double v10 = [v9 preferredContentSizeCategory];
    +[CAMZoomButton circleDiameterForContentSize:v10];
    double v12 = v11;

    [v6 frame];
    double v14 = v13;
    [v6 zoomButtonMaxYWhenContracted];
    double MidY = v15 + v14 + v12 * -0.5;
  }
  else if (v7)
  {
    [v7 frame];
    double MidY = CGRectGetMidY(v18);
  }
  else
  {
    double MidY = 0.0;
  }

  return MidY;
}

- (CGRect)_imageAnalysisButtonAlignmentRectForCenterY:(double)a3
{
  unint64_t v4 = [(CAMFullscreenViewfinder *)self imageAnalysisButton];
  [v4 intrinsicContentSize];
  UIRoundToViewScale();
  [(CAMFullscreenViewfinder *)self _frameForFlipButton];
  UIRectCenteredXInRectScale();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)_imageAnalysisButtonFrameForCenterY:(double)a3
{
  [(CAMFullscreenViewfinder *)self _imageAnalysisButtonAlignmentRectForCenterY:a3];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(CAMFullscreenViewfinder *)self bounds];
  double MaxX = CGRectGetMaxX(v19);
  v20.origin.CGFloat x = v5;
  v20.origin.CGFloat y = v7;
  v20.size.CGFloat width = v9;
  v20.size.CGFloat height = v11;
  double v13 = -(MaxX - CGRectGetMaxX(v20));
  CGFloat v14 = v5;
  CGFloat v15 = v7;
  CGFloat v16 = v9;
  CGFloat v17 = v11;
  return CGRectInset(*(CGRect *)&v14, v13, -15.0);
}

- (CGRect)_previewSuggestionButtonFrameForCenterY:(double)a3
{
  [(CAMFullscreenViewfinder *)self _imageAnalysisButtonFrameForCenterY:a3];
  double v6 = 0.0;
  result.size.CGFloat height = v5;
  result.size.CGFloat width = v4;
  result.origin.CGFloat y = v3;
  result.origin.CGFloat x = v6;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForInstructionLabel:(SEL)a3 belowInstructionLabelGeometry:(id)a4 elapsedTimeViewGeometry:(id *)a5
{
  id v10 = a4;
  [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  int64_t v19 = [(CAMFullscreenViewfinder *)self orientation];
  unint64_t v20 = v19;
  *retstr = *($3B1716E7537CC2F16D6737AAC3CCCADB *)CAMViewGeometryZero;
  unint64_t v21 = v19 - 3;
  if ((unint64_t)(v19 - 3) >= 2) {
    double v22 = v16;
  }
  else {
    double v22 = v18;
  }
  if ((unint64_t)(v19 - 3) >= 2) {
    double v23 = v18;
  }
  else {
    double v23 = v16;
  }
  objc_msgSend(v10, "sizeThatFits:", v22 + -25.0, v23 + -25.0);
  CGFloat v25 = v24;
  double v27 = v26;

  retstr->var0.size.double width = v25;
  retstr->var0.size.double height = v27;
  double v79 = v12;
  double v80 = v14;
  UIRectGetCenter();
  double v29 = v28;
  double v31 = v30;
  double v32 = CAMPixelWidthForView(self) + 10.0;
  double v78 = v31;
  double v81 = v29;
  if (v21 <= 1)
  {
    if ([(CAMFullscreenViewfinder *)self _showSemanticStylePicker])
    {
      double v33 = [(CAMFullscreenViewfinder *)self semanticStylePicker];
    }
    else
    {
      if (![(CAMFullscreenViewfinder *)self _showSmartStylePicker]) {
        goto LABEL_13;
      }
      double v33 = [(CAMFullscreenViewfinder *)self smartStylePicker];
    }
    id v34 = v33;
    [v33 spacerWidth];
    double v32 = v32 + v35 + 10.0;
  }
LABEL_13:
  long long v36 = *(_OWORD *)&a6->var2.a;
  CGPoint var1 = a6->var1;
  long long v91 = v36;
  long long v37 = *(_OWORD *)&a6->var2.tx;
  long long v92 = *(_OWORD *)&a6->var2.c;
  long long v93 = v37;
  CGSize size = a6->var0.size;
  CGPoint origin = a6->var0.origin;
  CGSize v89 = size;
  CAMFrameForGeometry((uint64_t)&origin);
  v77.origin.CGFloat x = v39;
  v77.origin.double y = v40;
  v77.size.double width = v41;
  v77.size.double height = v42;
  long long v43 = *(_OWORD *)&a6->var2.a;
  CGPoint var1 = a6->var1;
  long long v91 = v43;
  long long v44 = *(_OWORD *)&a6->var2.tx;
  long long v92 = *(_OWORD *)&a6->var2.c;
  long long v93 = v44;
  CGSize v45 = a6->var0.size;
  CGPoint origin = a6->var0.origin;
  CGSize v89 = v45;
  long long v84 = *(_OWORD *)&CAMViewGeometryZero[32];
  long long v85 = *(_OWORD *)&CAMViewGeometryZero[48];
  long long v86 = *(_OWORD *)&CAMViewGeometryZero[64];
  long long v87 = *(_OWORD *)&CAMViewGeometryZero[80];
  long long v82 = *(_OWORD *)CAMViewGeometryZero;
  long long v83 = *(_OWORD *)&CAMViewGeometryZero[16];
  IsEqualToViewGeometrdouble y = CAMViewGeometryIsEqualToViewGeometry((uint64_t)&origin, (uint64_t)&v82);
  long long v47 = *(_OWORD *)&a5->var2.a;
  CGPoint var1 = a5->var1;
  long long v91 = v47;
  long long v48 = *(_OWORD *)&a5->var2.tx;
  long long v92 = *(_OWORD *)&a5->var2.c;
  long long v93 = v48;
  CGSize v49 = a5->var0.size;
  CGPoint origin = a5->var0.origin;
  CGSize v89 = v49;
  long long v84 = *(_OWORD *)&CAMViewGeometryZero[32];
  long long v85 = *(_OWORD *)&CAMViewGeometryZero[48];
  long long v86 = *(_OWORD *)&CAMViewGeometryZero[64];
  long long v87 = *(_OWORD *)&CAMViewGeometryZero[80];
  long long v82 = *(_OWORD *)CAMViewGeometryZero;
  long long v83 = *(_OWORD *)&CAMViewGeometryZero[16];
  BOOL v50 = CAMViewGeometryIsEqualToViewGeometry((uint64_t)&origin, (uint64_t)&v82);
  long long v51 = *(_OWORD *)&a5->var2.a;
  CGPoint var1 = a5->var1;
  long long v91 = v51;
  long long v52 = *(_OWORD *)&a5->var2.tx;
  long long v92 = *(_OWORD *)&a5->var2.c;
  long long v93 = v52;
  CGSize v53 = a5->var0.size;
  CGPoint origin = a5->var0.origin;
  CGSize v89 = v53;
  CAMFrameForGeometry((uint64_t)&origin);
  CGFloat v58 = v57;
  CGFloat v59 = y;
  CGFloat v60 = width;
  CGFloat v61 = height;
  double v62 = 0.25;
  if (v50) {
    double v62 = 0.5;
  }
  double v63 = v32 + v27 * v62;
  if (v20 < 3)
  {
    -[CAMFullscreenViewfinder _frameForPreviewOverlaysInViewport:](self, "_frameForPreviewOverlaysInViewport:", v79, v80, v16, v18);
    if (v50)
    {
      double MinY = CGRectGetMinY(*(CGRect *)&v64);
    }
    else
    {
      v95.origin.CGFloat x = v58;
      v95.origin.double y = v59;
      v95.size.double width = v60;
      v95.size.double height = v61;
      double MinY = CGRectGetMaxY(v95);
    }
    double v71 = v81;
    double v69 = v63 + MinY;
    goto LABEL_38;
  }
  if (v20 != 3)
  {
    if (v20 == 4)
    {
      if (v50)
      {
        double v69 = v78;
        if (IsEqualToViewGeometry)
        {
          v94.origin.CGFloat x = v79;
          v94.origin.double y = v80;
          v94.size.double width = v16;
          v94.size.double height = v18;
          double MinX = CGRectGetMinX(v94);
        }
        else
        {
          double MinX = CGRectGetMaxX(v77);
        }
      }
      else
      {
        CGFloat v74 = v58;
        double MinX = CGRectGetMaxX(*(CGRect *)(&y - 1));
        double v69 = v78;
      }
      double v71 = v63 + MinX;
    }
    else
    {
      double v69 = v78;
      double v71 = v81;
    }
    goto LABEL_38;
  }
  if (!v50)
  {
    CGFloat x = v58;
LABEL_34:
    double MaxX = CGRectGetMinX(*(CGRect *)(&y - 1));
    goto LABEL_35;
  }
  if (!IsEqualToViewGeometry)
  {
    CGFloat x = v77.origin.x;
    double y = v77.origin.y;
    double width = v77.size.width;
    double height = v77.size.height;
    goto LABEL_34;
  }
  v96.origin.CGFloat x = v79;
  v96.origin.double y = v80;
  v96.size.double width = v16;
  v96.size.double height = v18;
  double MaxX = CGRectGetMaxX(v96);
LABEL_35:
  double v69 = v78;
  double v71 = MaxX - v63;
  if ([(CAMFullscreenViewfinder *)self isSystemOverlayVisible]&& IsEqualToViewGeometry)
  {
    double v71 = v71 + -28.0;
  }
LABEL_38:
  retstr->var1.CGFloat x = v71;
  retstr->var1.double y = v69;
  CGRect result = ($3B1716E7537CC2F16D6737AAC3CCCADB *)CAMOrientationTransform(v20, (uint64_t)&origin);
  CGSize v76 = v89;
  *(CGPoint *)&retstr->var2.a = origin;
  *(CGSize *)&retstr->var2.c = v76;
  *(CGPoint *)&retstr->var2.tCGFloat x = var1;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForLandscapeLightingBadge
{
  double v5 = [(CAMFullscreenViewfinder *)self lightingNameBadge];
  double v6 = v5;
  retstr->var0.CGPoint origin = 0u;
  retstr->var0.CGSize size = 0u;
  retstr->CGPoint var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tCGFloat x = 0u;
  if (v5)
  {
    CAMViewGetGeometry(v5, (uint64_t)retstr);
    [v6 bounds];
    BOOL v7 = CGRectEqualToRect(v15, *MEMORY[0x263F001A8]);
  }
  else
  {
    BOOL v7 = 0;
    retstr->CGPoint var1 = *(CGPoint *)&CAMViewGeometryZero[32];
    *(_OWORD *)&retstr->var2.a = *(_OWORD *)&CAMViewGeometryZero[48];
    *(_OWORD *)&retstr->var2.c = *(_OWORD *)&CAMViewGeometryZero[64];
    *(_OWORD *)&retstr->var2.tCGFloat x = *(_OWORD *)&CAMViewGeometryZero[80];
    retstr->var0.CGPoint origin = *(CGPoint *)CAMViewGeometryZero;
    retstr->var0.CGSize size = *(CGSize *)&CAMViewGeometryZero[16];
  }
  if ([(CAMFullscreenViewfinder *)self _showLandscapeLightingBadge] || v7)
  {
    [(CAMFullscreenViewfinder *)self _geometryForBottomCenteredView:v6];
    retstr->CGPoint var1 = v11;
    *(_OWORD *)&retstr->var2.a = v12;
    *(_OWORD *)&retstr->var2.c = v13;
    *(_OWORD *)&retstr->var2.tCGFloat x = v14;
    retstr->var0.CGPoint origin = v9;
    retstr->var0.CGSize size = v10;
  }

  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3
{
  return [(CAMFullscreenViewfinder *)self _geometryForBottomCenteredView:a4 margin:15.0];
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3 margin:(id)a4
{
  return -[CAMFullscreenViewfinder _geometryForBottomCenteredView:margins:](self, "_geometryForBottomCenteredView:margins:", a4, a5, a5);
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3 margins:(id)a4
{
  double height = a5.height;
  double width = a5.width;
  id v19 = a4;
  int64_t v8 = [(CAMFullscreenViewfinder *)self _viewportAspectRatioForControlsOverPreview];
  CGPoint v9 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v9, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", v8, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  -[CAMFullscreenViewfinder _geometryForBottomCenteredView:margins:aroundFrame:](self, "_geometryForBottomCenteredView:margins:aroundFrame:", v19, width, height, v11, v13, v15, v17);

  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForBottomCenteredView:(SEL)a3 margins:(id)a4 aroundFrame:(CGSize)a5
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  CGFloat v10 = a5.height;
  CGFloat v11 = a5.width;
  id v14 = a4;
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGRect v38 = CGRectInset(v37, v11, v10);
  CGFloat v15 = v38.origin.x;
  CGFloat v16 = v38.origin.y;
  double v17 = v38.size.width;
  double v18 = v38.size.height;
  unint64_t v19 = [(CAMFullscreenViewfinder *)self orientation];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  CAMOrientationTransform(v19, (uint64_t)&v34);
  objc_msgSend(v14, "sizeThatFits:", v18 * *(double *)&v35 + *(double *)&v34 * v17, v18 * *((double *)&v35 + 1) + *((double *)&v34 + 1) * v17);
  double v21 = v20;
  double v23 = v22;

  UIRectGetCenter();
  double v32 = v24;
  double v33 = v25;
  if (v19 >= 3)
  {
    if (v19 == 3)
    {
      v41.origin.CGFloat x = v15;
      v41.origin.CGFloat y = v16;
      v41.size.CGFloat width = v17;
      v41.size.CGFloat height = v18;
      double v26 = v23 * 0.5 + CGRectGetMinX(v41);
    }
    else
    {
      if (v19 != 4) {
        goto LABEL_8;
      }
      v40.origin.CGFloat x = v15;
      v40.origin.CGFloat y = v16;
      v40.size.CGFloat width = v17;
      v40.size.CGFloat height = v18;
      double v26 = CGRectGetMaxX(v40) + v23 * -0.5;
    }
    double v32 = v26;
    goto LABEL_8;
  }
  v39.origin.CGFloat x = v15;
  v39.origin.CGFloat y = v16;
  v39.size.CGFloat width = v17;
  v39.size.CGFloat height = v18;
  double v33 = CGRectGetMaxY(v39) + v23 * -0.5;
LABEL_8:
  long long v29 = *MEMORY[0x263F00148];
  double v30 = v21;
  double v31 = v23;
  +[CAMView ceilBounds:&v29 andRoundCenter:&v32 toViewScale:self];
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tCGFloat x = 0u;
  retstr->CGPoint var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var0.CGPoint origin = 0u;
  retstr->var0.CGSize size = 0u;
  v28[0] = v34;
  v28[1] = v35;
  v28[2] = v36;
  CAMViewGeometryMake((uint64_t)v28, (uint64_t)retstr, v32, v33, *(double *)&v29, *((double *)&v29 + 1), v30, v31);
  return result;
}

- (int64_t)_viewportAspectRatioForControlsOverPreview
{
  int64_t result = [(CAMFullscreenViewfinder *)self viewportAspectRatio];
  if (((1 << result) & 0x16) != 0) {
    int64_t v3 = 0;
  }
  else {
    int64_t v3 = result;
  }
  if ((unint64_t)result <= 4) {
    return v3;
  }
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForTextInteractionInsertWithViewport:(SEL)a3
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tCGFloat x = 0u;
  retstr->CGPoint var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var0.CGPoint origin = 0u;
  retstr->var0.CGSize size = 0u;
  uint64_t v9 = [(CAMFullscreenViewfinder *)self orientation];
  CAMViewGeometryForOrientedFrame(v9, (uint64_t)retstr, x, y, width, height);
  return result;
}

- (void)_applyTextInsertContentInsets
{
  id v41 = [(CAMFullscreenViewfinder *)self textInteractionInsert];
  [v41 contentInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int64_t v11 = [(CAMFullscreenViewfinder *)self orientation];
  double v12 = [(CAMFullscreenViewfinder *)self imageAnalysisInstructionLabel];

  if (v12)
  {
    double v13 = [(CAMFullscreenViewfinder *)self imageAnalysisInstructionLabel];
    [v13 frame];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v22 = [(CAMFullscreenViewfinder *)self imageAnalysisInstructionLabel];
    double v23 = [v22 superview];
    objc_msgSend(v41, "convertRect:fromView:", v23, v15, v17, v19, v21);
    double v25 = v24;
    double v27 = v26;

    if (v11 == 2)
    {
      [v41 bounds];
      double v8 = v28 + v29 - v25 + 8.0;
      [(CAMFullscreenViewfinder *)self _frameForActionInfoView];
      double v32 = v31;
      double v33 = v41;
LABEL_5:
      double v35 = v32 + v30;
      [v33 bounds];
      double v4 = v35 - v36 + 8.0;
      goto LABEL_8;
    }
    [v41 bounds];
    double v4 = v25 + v27 - v37 + 8.0;
    [(CAMFullscreenViewfinder *)self _frameForActionInfoView];
    double v32 = v38;
    double v33 = v41;
  }
  else
  {
    [(CAMFullscreenViewfinder *)self _frameForActionInfoView];
    double v32 = v34;
    double v33 = v41;
    if (v11 == 2) {
      goto LABEL_5;
    }
  }
  [v33 bounds];
  double v8 = v39 + v40 - v32 + 8.0;
LABEL_8:
  objc_msgSend(v41, "setContentInsets:", v4, v6, v8, v10);
}

- (CGRect)_frameForActionInfoView
{
  double v3 = [(CAMFullscreenViewfinder *)self imageAnalysisButton];
  double v4 = [(CAMFullscreenViewfinder *)self textInteractionInsert];
  [v3 bounds];
  objc_msgSend(v4, "convertRect:fromView:", v3);
  CGFloat x = v39.origin.x;
  CGFloat y = v39.origin.y;
  CGFloat height = v39.size.height;
  CGFloat rect = v39.size.width;
  double Width = CGRectGetWidth(v39);
  [v3 backgroundDiameter];
  double v10 = v9;
  [v4 bounds];
  CGFloat v11 = CGRectGetWidth(v40);
  [v3 backgroundDiameter];
  CGFloat v13 = v12;
  double v14 = [v4 imageInteraction];
  [v14 actionInfoEdgeInsets];
  double v16 = v15;

  int64_t v17 = [(CAMFullscreenViewfinder *)self orientation];
  double v18 = (Width - v10) * 0.5;
  switch(v17)
  {
    case 0:
    case 1:
      CGFloat v19 = v18 - v16;
      v41.origin.CGFloat x = x;
      v41.origin.CGFloat y = y;
      v41.size.CGFloat width = rect;
      v41.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v41);
      v42.origin.CGFloat y = 0.0;
      v42.origin.CGFloat x = v19;
      v42.size.CGFloat width = v11;
      v42.size.CGFloat height = v13;
      CGFloat v21 = MidY + CGRectGetHeight(v42) * -0.5;
      v43.origin.CGFloat x = x;
      v43.origin.CGFloat y = y;
      v43.size.CGFloat width = rect;
      v43.size.CGFloat height = height;
      CGRectGetMinX(v43);
      v44.origin.CGFloat x = v19;
      v44.origin.CGFloat y = v21;
      v44.size.CGFloat width = v11;
      v44.size.CGFloat height = v13;
      CGRectGetMinX(v44);
      break;
    case 2:
    case 4:
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = y;
      v45.size.CGFloat width = rect;
      v45.size.CGFloat height = height;
      CGFloat MaxX = CGRectGetMaxX(v45);
      v46.origin.CGFloat x = x;
      v46.origin.CGFloat y = y;
      v46.size.CGFloat width = rect;
      v46.size.CGFloat height = height;
      double v23 = CGRectGetMidY(v46);
      v47.origin.CGFloat y = 0.0;
      v47.origin.CGFloat x = MaxX;
      v47.size.CGFloat width = v11;
      v47.size.CGFloat height = v13;
      CGFloat v24 = v23 + CGRectGetHeight(v47) * -0.5;
      v48.origin.CGFloat x = MaxX;
      v48.origin.CGFloat y = v24;
      v48.size.CGFloat width = v11;
      v48.size.CGFloat height = v13;
      CGRectGetWidth(v48);
      v49.origin.CGFloat x = x;
      v49.origin.CGFloat y = y;
      v49.size.CGFloat width = rect;
      v49.size.CGFloat height = height;
      CGRectGetMaxX(v49);
      break;
    case 3:
      CGFloat v25 = v18 - v16;
      [v4 bounds];
      CGRectGetMaxY(v50);
      v51.origin.CGFloat x = x;
      v51.origin.CGFloat y = y;
      v51.size.CGFloat width = rect;
      v51.size.CGFloat height = height;
      CGRectGetHeight(v51);
      v52.origin.CGFloat y = 0.0;
      v52.origin.CGFloat x = v25;
      v52.size.CGFloat width = v11;
      v52.size.CGFloat height = v13;
      CGRectGetHeight(v52);
      break;
    default:
      break;
  }
  UIRectRoundToViewScale();
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  double v34 = v27;
  double v35 = v29;
  double v36 = v31;
  double v37 = v33;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.CGFloat y = v35;
  result.origin.CGFloat x = v34;
  return result;
}

- (void)_layoutPanoramaView
{
  double v3 = [(CAMFullscreenViewfinder *)self panoramaView];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v16 = 0u;
  double v4 = [(CAMFullscreenViewfinder *)self previewView];
  double v5 = [(CAMFullscreenViewfinder *)self window];
  double v6 = [v5 screen];
  [v6 _referenceBounds];

  [v3 panoramaCaptureSize];
  +[CAMPanoramaUtilities panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:](CAMPanoramaUtilities, "panoramaViewSizeForCaptureSize:referenceBounds:layoutStyle:", 4);
  double v8 = v7;
  double v10 = v9;
  [v4 center];
  double v12 = v11;
  double v14 = v13;
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, v8, v10);
  objc_msgSend(v3, "setCenter:", v12, v14);
  v15[0] = v16;
  v15[1] = v17;
  v15[2] = v18;
  [v3 setTransform:v15];
}

- (CGRect)_frameForSpatialRecordingIndicatorWithElapsedTimeViewGeometry:(id *)a3 orientation:(int64_t)a4
{
  double width = a3->var0.size.width;
  double height = a3->var0.size.height;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CAMOrientationTransform(a4, (uint64_t)v16);
  CAMViewGeometryMake((uint64_t)v16, (uint64_t)&v17, *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8), 0.0, 0.0, height, height);
  if ((unint64_t)a4 >= 3)
  {
    double v8 = height * 0.5 + width * 0.5 + 10.0;
    if (a4 == 3)
    {
      CGFloat x = a3->var1.x;
      double v10 = v8 + a3->var1.y;
    }
    else
    {
      if (a4 != 4) {
        goto LABEL_8;
      }
      CGFloat x = a3->var1.x;
      double v10 = a3->var1.y - v8;
    }
    *(CGFloat *)&long long v19 = x;
    *((double *)&v19 + 1) = v10;
    goto LABEL_8;
  }
  long long v19 = *(_OWORD *)&CAMViewGeometryZero[32];
  long long v20 = *(_OWORD *)&CAMViewGeometryZero[48];
  long long v21 = *(_OWORD *)&CAMViewGeometryZero[64];
  long long v22 = *(_OWORD *)&CAMViewGeometryZero[80];
  long long v17 = *(_OWORD *)CAMViewGeometryZero;
  long long v18 = *(_OWORD *)&CAMViewGeometryZero[16];
LABEL_8:
  v15[2] = v19;
  _OWORD v15[3] = v20;
  v15[4] = v21;
  v15[5] = v22;
  v15[0] = v17;
  v15[1] = v18;
  CAMFrameForGeometry((uint64_t)v15);
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (void)_layoutSmartStyleNameBadge
{
  double v3 = [(CAMFullscreenViewfinder *)self smartStyleNameBadge];
  if (v3)
  {
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
    long long v5 = 0u;
    long long v6 = 0u;
    [(CAMFullscreenViewfinder *)self _geometryForSmartStyleNameBadge:v3];
    v4[2] = v7;
    v4[3] = v8;
    v4[4] = v9;
    v4[5] = v10;
    v4[0] = v5;
    v4[1] = v6;
    CAMApplyAnimationSensitiveGeometryToView((double *)v4, v3);
  }
}

- (void)_layoutSmartStylesControls
{
  double v3 = [(CAMFullscreenViewfinder *)self smartStyleSlider2D];

  if (v3)
  {
    double v4 = [(CAMFullscreenViewfinder *)self smartStyleSlider2D];
    long long v5 = [v4 view];
    [(CAMFullscreenViewfinder *)self _geometryForSmartStyleSlider2DExpanded:[(CAMFullscreenViewfinder *)self smartStyleControlsVisible]];
    CAMViewSetGeometry(v5, (uint64_t)v12);
  }
  long long v6 = [(CAMFullscreenViewfinder *)self smartStyleIntensitySlider];

  if (v6)
  {
    long long v7 = [(CAMFullscreenViewfinder *)self smartStyleIntensitySlider];
    [(CAMFullscreenViewfinder *)self _geometryForSmartStyleIntensitySliderExpanded:[(CAMFullscreenViewfinder *)self smartStyleControlsVisible]];
    CAMViewSetGeometry(v7, (uint64_t)v11);
  }
  long long v8 = [(CAMFullscreenViewfinder *)self smartStyleValuesPlatterView];

  if (v8)
  {
    long long v9 = [(CAMFullscreenViewfinder *)self smartStyleValuesPlatterView];
    [(CAMFullscreenViewfinder *)self _geometryForSmartStyleValuesPlatterView];
    CAMViewSetGeometry(v9, (uint64_t)&v10);
  }
}

- (CGSize)_smartStyleSlider2DSize
{
  double v3 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v3, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), 1);
  CGRectGetMaxY(v8);

  double v4 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v4, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 1, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), 1);
  CGRectGetMaxY(v9);

  UIFloorToViewScale();
  double v6 = v5;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleSlider2DExpanded:(SEL)a3
{
  BOOL v4 = a4;
  int64_t v6 = [(CAMFullscreenViewfinder *)self orientation];
  return [(CAMFullscreenViewfinder *)self _geometryForSmartStyleSlider2DExpanded:v4 orientation:v6];
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleSlider2DExpanded:(SEL)a3 orientation:(BOOL)a4
{
  CGRect v9 = [(CAMFullscreenViewfinder *)self _layout];
  objc_msgSend(v9, "viewportFrameForAspectRatio:usingAppDrawer:accessoryAreaExpanded:", 0, -[CAMFullscreenViewfinder _isUsingCreativeCameraControls](self, "_isUsingCreativeCameraControls"), -[CAMFullscreenViewfinder isControlDrawerExpanded](self, "isControlDrawerExpanded"));
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v41.origin.CGFloat x = v11;
  v41.origin.CGFloat y = v13;
  v41.size.double width = v15;
  v41.size.double height = v17;
  double MaxY = CGRectGetMaxY(v41);
  [(CAMFullscreenViewfinder *)self _smartStyleSlider2DSize];
  double v20 = v19;
  double v22 = v21;
  v42.origin.CGFloat x = v11;
  v42.origin.CGFloat y = v13;
  v42.size.double width = v15;
  v42.size.double height = v17;
  double MidX = CGRectGetMidX(v42);
  long long v24 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  *(_OWORD *)&v40.a = *MEMORY[0x263F000D0];
  *(_OWORD *)&v40.c = v24;
  *(_OWORD *)&v40.tCGFloat x = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  if (a4)
  {
    double MidY = MaxY + 10.0 + v22 * 0.5;
  }
  else
  {
    double v26 = [(CAMFullscreenViewfinder *)self _layout];
    double v27 = [(CAMFullscreenViewfinder *)self shutterControl];
    [v26 frameForShutterControl:v27];
    CGFloat v29 = v28;
    CGFloat v31 = v30;
    CGFloat v33 = v32;
    CGFloat v35 = v34;

    CGAffineTransformMakeScale(&v40, 0.5, 0.5);
    v43.origin.CGFloat x = v29;
    v43.origin.CGFloat y = v31;
    v43.size.double width = v33;
    v43.size.double height = v35;
    double MidY = CGRectGetMidY(v43);
  }
  CAMOrientationTransform(a5, (uint64_t)&t2);
  CGAffineTransform v37 = v40;
  CGAffineTransformConcat(&v39, &v37, &t2);
  CGAffineTransform v40 = v39;
  CAMViewGeometryMake((uint64_t)&v39, (uint64_t)retstr, MidX, MidY, 0.0, 0.0, v20, v22);
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleIntensitySliderExpanded:(SEL)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  CGPoint v13 = (CGPoint)0;
  long long v14 = 0u;
  memset(&v12, 0, sizeof(v12));
  [(CAMFullscreenViewfinder *)self _geometryForSmartStyleSlider2DExpanded:a4 orientation:[(CAMFullscreenViewfinder *)self _smartStyleIntensitySliderLayoutOrientationForOrientation:[(CAMFullscreenViewfinder *)self orientation]]];
  memset(&v11, 0, sizeof(v11));
  CGFloat Height = CGRectGetHeight(v12);
  CGAffineTransformMakeTranslation(&v11, 0.0, Height * 0.5 + 8.0 + 10.0);
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tCGFloat x = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  CGFloat v6 = v12.size.width + -21.0;
  retstr->var0.origin.CGFloat x = 0.0;
  retstr->var0.origin.CGFloat y = 0.0;
  retstr->var0.size.double width = v6;
  retstr->var0.size.double height = 20.0;
  long long v7 = v14;
  retstr->CGPoint var1 = v13;
  CGAffineTransform t1 = v11;
  *(_OWORD *)&v9.a = v7;
  *(_OWORD *)&v9.c = v15;
  *(_OWORD *)&v9.tCGFloat x = v16;
  return ($3B1716E7537CC2F16D6737AAC3CCCADB *)CGAffineTransformConcat(&retstr->var2, &t1, &v9);
}

- (int64_t)_smartStyleIntensitySliderLayoutOrientationForOrientation:(int64_t)a3
{
  if (a3 == 2) {
    return 1;
  }
  else {
    return a3;
  }
}

- (BOOL)_shouldAnimateSmartStyleIntensitySliderChangeFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  int64_t v7 = [(CAMFullscreenViewfinder *)self _smartStyleIntensitySliderLayoutOrientationForOrientation:"_smartStyleIntensitySliderLayoutOrientationForOrientation:"];
  int64_t v8 = [(CAMFullscreenViewfinder *)self _smartStyleIntensitySliderLayoutOrientationForOrientation:a4];
  BOOL v10 = v7 == a3 && v8 == a4;
  return (unint64_t)(v7 - 1) < 2 != (unint64_t)(v8 - 1) < 2 && v10;
}

- (BOOL)_shouldAnimateSmartStyleSlider2DChangeFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  return ((unint64_t)(a3 - 1) < 2) ^ ((unint64_t)(a4 - 1) < 2);
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleValuesPlatterView
{
  double v5 = [(CAMFullscreenViewfinder *)self _layout];
  [v5 frameForControlStatusBar];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  long long v14 = [(CAMFullscreenViewfinder *)self controlStatusBar];
  id v18 = [v14 smartStyleIndicator];

  [v18 intrinsicContentSize];
  CGFloat v16 = v15 + 12.0 + 12.0;
  v20.origin.CGFloat x = v7;
  v20.origin.CGFloat y = v9;
  v20.size.double width = v11;
  v20.size.double height = v13;
  CGRect v21 = CGRectInset(v20, v16, 0.0);
  CAMViewGeometryForFrame((uint64_t)retstr, v21.size.width, v21.size.height);

  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)_geometryForSmartStyleNameBadge:(SEL)a3
{
  id v14 = a4;
  if ((unint64_t)([(CAMFullscreenViewfinder *)self orientation] - 3) > 1)
  {
    [(CAMFullscreenViewfinder *)self _geometryForBottomCenteredView:v14 margin:30.0];
  }
  else
  {
    double v5 = CAMPixelWidthForView(self) + 10.0 + 10.0;
    double v6 = [(CAMFullscreenViewfinder *)self smartStylePicker];
    [v6 spacerWidth];
    double v8 = v5 + v7;

    [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
    -[CAMFullscreenViewfinder _geometryForBottomCenteredView:margins:aroundFrame:](self, "_geometryForBottomCenteredView:margins:aroundFrame:", v14, v8, v8, v9, v10, v11, v12);
  }

  return result;
}

+ (id)lightControlBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.11];
}

+ (id)darkControlBackgroundColor
{
  return (id)[MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
}

- (void)setPortraitControlsAllowed:(BOOL)a3
{
}

- (void)setPortraitControlsAllowed:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_portraitControlsAllowed != a3)
  {
    BOOL v4 = a4;
    [(CAMFullscreenViewfinder *)self _loadPortraitControlsIfNeeded];
    if (v4) {
      [(CAMFullscreenViewfinder *)self layoutIfNeeded];
    }
    self->_portraitControlsAllowed = a3;
    [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:v4];
  }
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3
{
}

- (void)setShallowDepthOfFieldStatus:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_shallowDepthOfFieldStatus != a3)
  {
    BOOL v4 = a4;
    if (a4) {
      [(CAMFullscreenViewfinder *)self layoutIfNeeded];
    }
    self->_shallowDepthOfFieldStatus = a3;
    double v7 = [(CAMFullscreenViewfinder *)self portraitInstructionLabel];
    [v7 setShallowDepthOfFieldStatus:a3];

    [(CAMFullscreenViewfinder *)self _updatePortraitControlsHighlightAnimated:v4];
    [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:v4];
  }
}

- (void)setLightingNameBadgesHidden:(BOOL)a3
{
}

- (void)setLightingNameBadgesHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_lightingNameBadgesHidden != a3)
  {
    self->_lightingNameBadgesHidden = a3;
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:a4];
  }
}

- (void)_loadPortraitControlsIfNeeded
{
  double v3 = [(CAMFullscreenViewfinder *)self lightingControl];

  if (!v3)
  {
    id v13 = [(CAMFullscreenViewfinder *)self _contentView];
    BOOL v4 = [(CAMFullscreenViewfinder *)self _contentViewBelowShutter];
    double v5 = (CEKLightingControl *)objc_alloc_init(MEMORY[0x263F306D0]);
    lightingControl = self->_lightingControl;
    self->_lightingControl = v5;

    [(CEKLightingControl *)self->_lightingControl setNameBadgeFontStyle:[(CAMFullscreenViewfinder *)self _badgeFontStyle]];
    [(CEKLightingControl *)self->_lightingControl setMaxContentWidth:1.79769313e308];
    [(CEKLightingControl *)self->_lightingControl setOrientation:[(CAMFullscreenViewfinder *)self orientation]];
    [(CEKLightingControl *)self->_lightingControl preloadEffectChangeAnimation];
    [(CEKLightingControl *)self->_lightingControl setNameBadgeHidden:(unint64_t)([(CAMFullscreenViewfinder *)self orientation] - 3) < 2];
    double v7 = [(CAMFullscreenViewfinder *)self zoomControl];

    double v8 = self->_lightingControl;
    if (v7)
    {
      double v9 = [(CAMFullscreenViewfinder *)self zoomControl];
      [v4 insertSubview:v8 belowSubview:v9];
    }
    else
    {
      [v4 addSubview:v8];
    }
    double v10 = (CEKLightingNameBadge *)objc_alloc_init(MEMORY[0x263F306E0]);
    lightingNameBadge = self->_lightingNameBadge;
    self->_lightingNameBadge = v10;

    [(CEKLightingNameBadge *)self->_lightingNameBadge setUserInteractionEnabled:0];
    [(CEKLightingNameBadge *)self->_lightingNameBadge setFontStyle:[(CAMFullscreenViewfinder *)self _badgeFontStyle]];
    [(CEKLightingNameBadge *)self->_lightingNameBadge setDelegate:self];
    [v13 addSubview:self->_lightingNameBadge];
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:0];
    [(CAMFullscreenViewfinder *)self _updatePortraitControlsHighlightAnimated:0];
    [(CAMFullscreenViewfinder *)self _updateLightingControlClipping];
    double v12 = [(CAMFullscreenViewfinder *)self delegate];
    [v12 fullscreenViewfinderDidCreatePortraitControls:self];
  }
}

- (void)_updatePortraitControlsHighlightAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = [(CAMFullscreenViewfinder *)self shallowDepthOfFieldStatus];
  uint64_t v6 = (v5 < 0xF) & (0x6202u >> v5);
  double v7 = [(CAMFullscreenViewfinder *)self lightingControl];
  [v7 setHighlighted:v6 animated:v3];

  id v8 = [(CAMFullscreenViewfinder *)self lightingNameBadge];
  [v8 setHighlighted:v6];
}

- (void)_loadFilterControlsIfNeeded
{
  if (!self->_filterNameBadge)
  {
    BOOL v3 = objc_alloc_init(CAMFilterNameBadge);
    filterNameBadge = self->_filterNameBadge;
    self->_filterNameBadge = v3;

    [(CEKBadgeView *)self->_filterNameBadge setDelegate:self];
    [(CEKBadgeTextView *)self->_filterNameBadge setFontStyle:[(CAMFullscreenViewfinder *)self _badgeFontStyle]];
    id v5 = [(CAMFullscreenViewfinder *)self _contentView];
    [v5 addSubview:self->_filterNameBadge];
  }
}

- (void)setWantsSmartStyleIntensitySlider:(BOOL)a3
{
}

- (void)setWantsSmartStyleIntensitySlider:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_wantsSmartStyleIntensitySlider != a3)
  {
    self->_wantsSmartStyleIntensitySlider = a3;
    double v4 = 0.0;
    if (a4) {
      double v4 = 0.25;
    }
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __70__CAMFullscreenViewfinder_setWantsSmartStyleIntensitySlider_animated___block_invoke;
    v5[3] = &unk_263FA0208;
    v5[4] = self;
    +[CAMView animateIfNeededWithDuration:v5 animations:v4];
  }
}

void __70__CAMFullscreenViewfinder_setWantsSmartStyleIntensitySlider_animated___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _shouldShowSmartStyleIntensitySlider]) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  id v3 = [*(id *)(a1 + 32) smartStyleIntensitySlider];
  [v3 setAlpha:v2];
}

- (void)setWantsSmartStyleResetButton:(BOOL)a3
{
}

- (void)setWantsSmartStyleResetButton:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_wantsSmartStyleResetButton != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_wantsSmartStyleResetButton = a3;
    id v7 = [(CAMFullscreenViewfinder *)self controlDrawer];
    uint64_t v6 = [v7 smartStyleButton];
    [v6 setResetButtonVisibleWhenExpanded:v5 animated:v4];
  }
}

- (void)setWantsSmartStylePicker:(BOOL)a3
{
}

- (void)setWantsSmartStylePicker:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_wantsSmartStylePicker != a3)
  {
    self->_wantsSmartStylePicker = a3;
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:a4];
  }
}

- (BOOL)isSmartStylePickerVisible
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self smartStyleControlsVisible];
  if (v3)
  {
    LOBYTE(v3) = [(CAMFullscreenViewfinder *)self wantsSmartStylePicker];
  }
  return v3;
}

- (BOOL)_shouldShowSmartStyleIntensitySlider
{
  if (![(CAMFullscreenViewfinder *)self smartStyleControlsVisible]
    || ![(CAMFullscreenViewfinder *)self wantsSmartStyleIntensitySlider])
  {
    return 0;
  }
  return [(CAMFullscreenViewfinder *)self _shouldShowControls];
}

- (BOOL)_shouldShowSmartStyleValuesPlatter
{
  if (![(CAMFullscreenViewfinder *)self smartStyleControlsVisible]) {
    return 0;
  }
  BOOL v3 = [(CAMFullscreenViewfinder *)self controlStatusBar];
  BOOL v4 = [v3 secondaryAccessoryControl];
  if (v4) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = [(CAMFullscreenViewfinder *)self _shouldShowControls];
  }

  return v5;
}

- (void)setSmartStyleControlsVisible:(BOOL)a3
{
}

- (void)setSmartStyleControlsVisible:(BOOL)a3 animated:(BOOL)a4
{
}

- (void)_setSmartStyleControlsVisible:(BOOL)a3 animated:(BOOL)a4 notifyDelegate:(BOOL)a5
{
  if (self->_smartStyleControlsVisible != a3)
  {
    BOOL v5 = a5;
    BOOL v6 = a4;
    BOOL v7 = a3;
    if (a3) {
      [(CAMFullscreenViewfinder *)self _loadSmartStyleControlsIfNeeded];
    }
    if (v6) {
      [(CAMFullscreenViewfinder *)self layoutIfNeeded];
    }
    self->_smartStyleControlsVisible = v7;
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v6];
    [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:v6];
    if (v7 && !self->__smartStylesDismissalTapGestureRecognizer)
    {
      double v9 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleSmartStylesDismissalTapGestureRecognizer_];
      smartStylesDismissalTapGestureRecognizer = self->__smartStylesDismissalTapGestureRecognizer;
      self->__smartStylesDismissalTapGestureRecognizer = v9;

      [(UITapGestureRecognizer *)self->__smartStylesDismissalTapGestureRecognizer setDelegate:self];
      [(CAMFullscreenViewfinder *)self addGestureRecognizer:self->__smartStylesDismissalTapGestureRecognizer];
    }
    [(UITapGestureRecognizer *)self->__smartStylesDismissalTapGestureRecognizer setEnabled:v7];
    if (v5)
    {
      id v11 = [(CAMFullscreenViewfinder *)self delegate];
      [v11 fullscreenViewfinder:self didChangeSmartStyleControlsVisibility:v7 animated:v6];
    }
  }
}

- (void)_loadSmartStyleControlsIfNeeded
{
  if (!self->_smartStyleSlider2D)
  {
    [(CAMFullscreenViewfinder *)self _smartStyleSlider2DSize];
    BOOL v5 = (PEPhotoStyleDPad *)objc_msgSend(objc_alloc(MEMORY[0x263F5E228]), "initWithSize:", v3, v4);
    smartStyleSlider2D = self->_smartStyleSlider2D;
    self->_smartStyleSlider2D = v5;

    BOOL v7 = [(CAMFullscreenViewfinder *)self delegate];
    id v8 = self->_smartStyleSlider2D;
    double v9 = [(CAMFullscreenViewfinder *)self _contentView];
    [v7 addChildViewController:v8 toView:v9];

    double v10 = (PEPhotoStylePaletteSlider *)[objc_alloc(MEMORY[0x263F5E230]) initWithValue:1.0];
    smartStyleIntensitySlider = self->_smartStyleIntensitySlider;
    self->_smartStyleIntensitySlider = v10;

    double v12 = [(CAMFullscreenViewfinder *)self _contentView];
    [v12 addSubview:self->_smartStyleIntensitySlider];

    id v13 = (PEPhotoStyleValuesPlatterView *)[objc_alloc(MEMORY[0x263F5E238]) initWithTone:0.0 color:0.0 palette:1.0];
    smartStyleValuesPlatterView = self->_smartStyleValuesPlatterView;
    self->_smartStyleValuesPlatterView = v13;

    double v15 = [(CAMFullscreenViewfinder *)self _contentView];
    [v15 addSubview:self->_smartStyleValuesPlatterView];

    CGFloat v16 = objc_alloc_init(CAMSmartStyleNameBadge);
    smartStyleNameBadge = self->_smartStyleNameBadge;
    self->_smartStyleNameBadge = v16;

    [(CAMSmartStyleNameBadge *)self->_smartStyleNameBadge setUserInteractionEnabled:0];
    [(CEKBadgeView *)self->_smartStyleNameBadge setDelegate:self];
    [(CEKBadgeTextView *)self->_smartStyleNameBadge setFontStyle:[(CAMFullscreenViewfinder *)self _badgeFontStyle]];
    id v18 = [(CAMFullscreenViewfinder *)self _contentView];
    [v18 addSubview:self->_smartStyleNameBadge];

    double v19 = objc_alloc_init(CAMSemanticStylePicker);
    smartStylePicker = self->_smartStylePicker;
    self->_smartStylePicker = v19;

    [(CAMSemanticStylePicker *)self->_smartStylePicker setScrollEnabled:0];
    [(CAMSemanticStylePicker *)self->_smartStylePicker setScrollViewUserInteractionEnabled:0];
    [(CAMSemanticStylePicker *)self->_smartStylePicker setDelegate:self];
    [(CAMSemanticStylePicker *)self->_smartStylePicker setExpanded:0];
    [(CAMSemanticStylePicker *)self->_smartStylePicker setMaterial:[(CAMFullscreenViewfinder *)self material]];
    CGRect v21 = [MEMORY[0x263F825C8] blackColor];
    [(CAMSemanticStylePicker *)self->_smartStylePicker setMaterialColor:v21];

    [(CAMSemanticStylePicker *)self->_smartStylePicker setPageControlMaxNumberOfDots:5];
    double v22 = self->_smartStylePicker;
    double v23 = [(CAMFullscreenViewfinder *)self _reticleView];
    [(CAMFullscreenViewfinder *)self insertSubview:v22 belowSubview:v23];

    long long v24 = [(PEPhotoStyleDPad *)self->_smartStyleSlider2D view];
    [v24 setAlpha:0.0];

    [(PEPhotoStylePaletteSlider *)self->_smartStyleIntensitySlider setAlpha:0.0];
    [(PEPhotoStyleValuesPlatterView *)self->_smartStyleValuesPlatterView setAlpha:0.0];
    [(CAMSmartStyleNameBadge *)self->_smartStyleNameBadge setAlpha:0.0];
    CGFloat v25 = [(CAMFullscreenViewfinder *)self delegate];
    [v25 fullscreenViewfinderDidCreateSmartStyleControls:self];

    double v26 = self->_smartStylePicker;
    [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
    -[CAMFullscreenViewfinder _updateSemanticStylePicker:forViewportFrame:](self, "_updateSemanticStylePicker:forViewportFrame:", v26);
    [(CAMFullscreenViewfinder *)self setNeedsLayout];
  }
}

- (void)_handleSmartStylesDismissalTapGestureRecognizer:(id)a3
{
  id v3 = [(CAMFullscreenViewfinder *)self controlDrawer];
  [v3 setExpanded:0 forControlType:11 animated:1 updatePreferredDrawerControl:1];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CAMFullscreenViewfinder *)self _smartStylesDismissalTapGestureRecognizer];

  if (v8 == v7)
  {
    double v10 = [(CAMFullscreenViewfinder *)self smartStyleSlider2D];
    id v11 = [v10 view];
    if (![(CAMFullscreenViewfinder *)self _isTouch:v6 withinView:v11 padding:30.0])
    {
      double v12 = [(CAMFullscreenViewfinder *)self smartStyleIntensitySlider];
      if (![(CAMFullscreenViewfinder *)self _isTouch:v6 withinView:v12 padding:30.0])
      {
        id v13 = [(CAMFullscreenViewfinder *)self controlDrawer];
        id v14 = [v13 smartStyleButton];
        double v15 = [v14 resetButton];
        if (![(CAMFullscreenViewfinder *)self _isTouch:v6 withinView:v15 padding:0.0])
        {
          CGFloat v25 = [(CAMFullscreenViewfinder *)self controlDrawer];
          CGFloat v17 = [v25 smartStyleButton];
          id v18 = [v17 shutterButton];
          BOOL v26 = [(CAMFullscreenViewfinder *)self _isTouch:v6 withinView:v18 padding:0.0];

          if (!v26)
          {
            [v6 locationInView:self];
            double v20 = v19;
            [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
            double MaxY = CGRectGetMaxY(v27);
            double v22 = [(CAMFullscreenViewfinder *)self smartStyleSlider2D];
            double v23 = [v22 view];
            [v23 frame];
            double v24 = CGRectGetMinY(v28) + 10.0;

            BOOL v9 = v20 > fmin(MaxY, v24);
            goto LABEL_10;
          }
          goto LABEL_9;
        }
      }
    }

LABEL_9:
    BOOL v9 = 0;
    goto LABEL_10;
  }
  BOOL v9 = 1;
LABEL_10:

  return v9;
}

- (BOOL)_isTouch:(id)a3 withinView:(id)a4 padding:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = v8;
  if (v8 && ([v8 alpha], v10 != 0.0))
  {
    [v7 locationInView:v9];
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v9 bounds];
    CGRect v19 = CGRectInset(v18, -a5, -a5);
    v17.CGFloat x = v13;
    v17.CGFloat y = v15;
    BOOL v11 = CGRectContainsPoint(v19, v17);
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(CAMFullscreenViewfinder *)self _smartStylesDismissalTapGestureRecognizer];

  if (v6 != v5) {
    return 0;
  }
  int64_t v8 = [(CAMFullscreenViewfinder *)self viewportAspectRatio];
  return v8 == 4 || v8 == 1;
}

- (void)_loadSemanticStyleControlsIfNeeded
{
  if (!self->_semanticStylePicker)
  {
    [(CAMFullscreenViewfinder *)self reloadSemanticStyleBadgesDelayIfNeeded:0];
    id v3 = objc_alloc_init(CAMSemanticStylePicker);
    semanticStylePicker = self->_semanticStylePicker;
    self->_semanticStylePicker = v3;

    [(CAMSemanticStylePicker *)self->_semanticStylePicker setDelegate:self];
    id v5 = [(CAMFullscreenViewfinder *)self delegate];
    id v11 = [v5 fullscreenViewfinderSemanticStyleList:self];

    -[CAMSemanticStylePicker setNumberOfStyles:](self->_semanticStylePicker, "setNumberOfStyles:", [v11 count]);
    [(CAMSemanticStylePicker *)self->_semanticStylePicker setExpanded:0];
    [(CAMSemanticStylePicker *)self->_semanticStylePicker setMaterial:[(CAMFullscreenViewfinder *)self material]];
    id v6 = [MEMORY[0x263F825C8] blackColor];
    [(CAMSemanticStylePicker *)self->_semanticStylePicker setMaterialColor:v6];

    id v7 = self->_semanticStylePicker;
    int64_t v8 = [(CAMFullscreenViewfinder *)self _reticleView];
    [(CAMFullscreenViewfinder *)self insertSubview:v7 belowSubview:v8];

    BOOL v9 = self->_semanticStylePicker;
    [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
    -[CAMFullscreenViewfinder _updateSemanticStylePicker:forViewportFrame:](self, "_updateSemanticStylePicker:forViewportFrame:", v9);
    double v10 = [(CAMFullscreenViewfinder *)self delegate];
    [v10 fullscreenViewfinderDidCreateSemanticStyleControls:self];
  }
}

- (void)reloadSemanticStyleBadgesDelayIfNeeded:(BOOL)a3
{
  id v5 = [(CAMFullscreenViewfinder *)self delegate];
  id v6 = [v5 fullscreenViewfinderSemanticStyleList:self];

  if (!self->__semanticStyleBadges)
  {
    id v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    semanticStyleBadges = self->__semanticStyleBadges;
    self->__semanticStyleBadges = v7;
  }
  while (1)
  {
    double v12 = [(CAMFullscreenViewfinder *)self _semanticStyleBadges];
    unint64_t v13 = [v12 count];
    unint64_t v14 = [v6 count];

    if (v13 <= v14) {
      break;
    }
    BOOL v9 = [(CAMFullscreenViewfinder *)self _semanticStyleBadges];
    double v10 = [v9 lastObject];

    [v10 removeFromSuperview];
    id v11 = [(CAMFullscreenViewfinder *)self _semanticStyleBadges];
    [v11 removeLastObject];
  }
  CGFloat v15 = [(CAMFullscreenViewfinder *)self _semanticStyleBadges];
  unint64_t v16 = [v15 count];
  unint64_t v17 = [v6 count];

  if (v16 < v17)
  {
    do
    {
      CGRect v18 = objc_alloc_init(CAMSemanticStyleMaskedBadge);
      CGRect v19 = [(CAMSemanticStyleMaskedBadge *)v18 badgeView];
      [v19 setDelegate:self];

      unint64_t v20 = [(CAMFullscreenViewfinder *)self _badgeFontStyle];
      CGRect v21 = [(CAMSemanticStyleMaskedBadge *)v18 badgeView];
      [v21 setFontStyle:v20];

      double v22 = [(CAMFullscreenViewfinder *)self _semanticStyleBadges];
      [v22 addObject:v18];

      double v23 = [(CAMFullscreenViewfinder *)self _contentView];
      [v23 addSubview:v18];

      double v24 = [(CAMFullscreenViewfinder *)self _semanticStyleBadges];
      unint64_t v25 = [v24 count];
      unint64_t v26 = [v6 count];
    }
    while (v25 < v26);
  }
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __66__CAMFullscreenViewfinder_reloadSemanticStyleBadgesDelayIfNeeded___block_invoke;
  v27[3] = &unk_263FA0258;
  v27[4] = self;
  BOOL v28 = a3;
  [v6 enumerateObjectsUsingBlock:v27];
}

void __66__CAMFullscreenViewfinder_reloadSemanticStyleBadgesDelayIfNeeded___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 _semanticStyleBadges];
  id v8 = [v7 objectAtIndexedSubscript:a3];

  [v8 setSemanticStyle:v6 delayIfNeeded:*(unsigned __int8 *)(a1 + 40)];
}

- (void)semanticStylePickerDidChangeSelectedStyle:(id)a3
{
  id v8 = a3;
  id v4 = [(CAMFullscreenViewfinder *)self semanticStylePicker];

  if (v4 == v8)
  {
    id v7 = [(CAMFullscreenViewfinder *)self delegate];
    [v7 fullscreenViewfinderDidChangeSemanticStyle:self];
  }
  else
  {
    id v5 = [(CAMFullscreenViewfinder *)self smartStylePicker];

    id v6 = v8;
    if (v5 != v8) {
      goto LABEL_6;
    }
    id v7 = [(CAMFullscreenViewfinder *)self delegate];
    [v7 fullscreenViewfinderDidChangeSelectedSmartStyle:self];
  }

  id v6 = v8;
LABEL_6:
}

- (void)semanticStylePickerDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMFullscreenViewfinder *)self semanticStylePicker];

  if (v5 == v4)
  {
    [(CAMFullscreenViewfinder *)self _layoutSemanticStyleMaskedBadges];
    [(CAMFullscreenViewfinder *)self requestPreviewUpdateForSemanticStyleAnimated:0];
  }
}

- (void)_layoutSemanticStyleMaskedBadges
{
  unint64_t v3 = [(CAMFullscreenViewfinder *)self orientation];
  if (v3 >= 3)
  {
    if (v3 - 3 >= 2)
    {
      double v7 = 0.0;
      goto LABEL_6;
    }
    id v4 = [(CAMFullscreenViewfinder *)self semanticStylePicker];
    [v4 spacerWidth];
    double v7 = 10.0 + 15.0 + v8;
  }
  else
  {
    id v4 = [(CAMFullscreenViewfinder *)self semanticStylePicker];
    id v5 = [v4 pageControl];
    [v5 frame];
    double v7 = v6 + 4.0;
  }
LABEL_6:
  BOOL v9 = [(CAMFullscreenViewfinder *)self _semanticStyleBadges];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __59__CAMFullscreenViewfinder__layoutSemanticStyleMaskedBadges__block_invoke;
  v10[3] = &unk_263FA0280;
  v10[4] = self;
  *(double *)&v10[5] = v7;
  [v9 enumerateObjectsUsingBlock:v10];
}

void __59__CAMFullscreenViewfinder__layoutSemanticStyleMaskedBadges__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v6 = *(void **)(a1 + 32);
  if (v6)
  {
    [v6 _geometryForBottomCenteredView:v5 margin:*(double *)(a1 + 40)];
    double v6 = *(void **)(a1 + 32);
  }
  double v7 = [v6 semanticStylePicker];
  [v7 presentatationStyleRectAtIndex:a3];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  unint64_t v16 = [v5 superview];
  unint64_t v17 = [*(id *)(a1 + 32) semanticStylePicker];
  objc_msgSend(v16, "convertRect:fromView:", v17, v9, v11, v13, v15);
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;

  v31[2] = v34;
  v31[3] = v35;
  v31[4] = v36;
  v31[5] = v37;
  v31[0] = v32;
  v31[1] = v33;
  CAMFrameForGeometry((uint64_t)v31);
  double x = v38.origin.x;
  v40.origin.double x = v19;
  v40.origin.double y = v21;
  v40.size.double width = v23;
  v40.size.double height = v25;
  CGRect v39 = CGRectIntersection(v38, v40);
  double v27 = v39.origin.x;
  double y = v39.origin.y;
  double width = v39.size.width;
  double height = v39.size.height;
  if (CGRectIsNull(v39))
  {
    double v27 = *MEMORY[0x263F001A8];
    double y = *(double *)(MEMORY[0x263F001A8] + 8);
    double width = *(double *)(MEMORY[0x263F001A8] + 16);
    double height = *(double *)(MEMORY[0x263F001A8] + 24);
  }
  objc_msgSend(v5, "setFrame:", v27, y, width, height);
  objc_msgSend(v5, "setOrientation:", objc_msgSend(*(id *)(a1 + 32), "orientation"));
  [v5 setBadgeLeftInset:x - v27];
}

- (void)setViewportAspectRatio:(int64_t)a3
{
}

- (void)setViewportAspectRatio:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_viewportAspectRatio != a3)
  {
    BOOL v4 = a4;
    if (a4) {
      [(CAMFullscreenViewfinder *)self layoutIfNeeded];
    }
    self->_viewportAspectRatio = a3;
    [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:v4];
    [(CAMFullscreenViewfinder *)self _updateLightingControlClipping];
  }
}

- (void)_handleDirectionIndicatorTapped
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  if (v3 || [(CAMFullscreenViewfinder *)self isControlDrawerAllowed])
  {
    [(CAMFullscreenViewfinder *)self setControlDrawerExpanded:!v3 forReason:0 animated:1];
  }
}

- (void)setControlDrawerExpanded:(BOOL)a3 forReason:(int64_t)a4
{
}

- (void)setControlDrawerExpanded:(BOOL)a3 forReason:(int64_t)a4 animated:(BOOL)a5
{
  if (self->_controlDrawerExpanded == a3) {
    return;
  }
  BOOL v5 = a5;
  BOOL v7 = a3;
  double v9 = [(CAMFullscreenViewfinder *)self controlDrawer];

  if (!v9 && v7)
  {
    double v10 = [[CAMControlDrawer alloc] initWithLayoutStyle:4];
    [(CAMFullscreenViewfinder *)self _setControlDrawer:v10];

    int64_t v11 = [(CAMFullscreenViewfinder *)self orientation];
    double v12 = [(CAMFullscreenViewfinder *)self controlDrawer];
    [v12 setOrientation:v11];

    double v13 = [(CAMFullscreenViewfinder *)self controlDrawer];
    [v13 setPresentationDelegate:self];

    double v14 = [(CAMFullscreenViewfinder *)self _contentView];
    double v15 = [(CAMFullscreenViewfinder *)self controlDrawer];
    [v14 addSubview:v15];

    unint64_t v16 = [(CAMFullscreenViewfinder *)self delegate];
    [v16 fullscreenViewfinderDidCreateControlDrawer:self];
  }
  unint64_t v17 = [(CAMFullscreenViewfinder *)self controlDrawer];
  id v38 = v17;
  if ((a4 & 0xFFFFFFFFFFFFFFFBLL) != 0 || !v7)
  {
    uint64_t v18 = -1;
  }
  else
  {
    uint64_t v18 = -1;
    if ([v17 expandedControlType] == -1)
    {
      CGFloat v19 = [(CAMFullscreenViewfinder *)self delegate];
      uint64_t v20 = [v19 expandedControlTypeForExpandingDrawerInFullscreenViewfinder:self];

      CGFloat v21 = [v38 visibleControlTypes];
      double v22 = [NSNumber numberWithInteger:v20];
      int v23 = [v21 containsObject:v22];

      if (v23) {
        uint64_t v18 = v20;
      }
      else {
        uint64_t v18 = -1;
      }
    }
  }
  if (v5) {
    [(CAMFullscreenViewfinder *)self layoutIfNeeded];
  }
  self->_controlDrawerExpanded = v7;
  double v24 = [(CAMFullscreenViewfinder *)self controlStatusBar];
  CGFloat v25 = [v24 directionIndicator];
  [v25 setDirection:v7 animated:v5];

  unint64_t v26 = [(CAMFullscreenViewfinder *)self controlStatusBar];
  double v27 = [v26 directionIndicator];
  [v27 setSelected:v7 animated:v5];

  [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v5];
  [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:v5];
  if (!v7)
  {
    [(CAMFullscreenViewfinder *)self _setControlDrawerPresentedModally:0];
LABEL_22:
    [(CAMFullscreenViewfinder *)self _setSmartStyleControlsVisible:v7 animated:v5 notifyDelegate:1];
    goto LABEL_23;
  }
  BOOL v28 = [v38 visibleControlTypes];
  uint64_t v29 = [v28 count];

  if (v29 == 1)
  {
    double v30 = [v38 visibleControlTypes];
    CGFloat v31 = [v30 firstObject];
    uint64_t v32 = [v31 integerValue];

    long long v33 = v38;
    uint64_t v34 = v32;
    BOOL v35 = 0;
  }
  else
  {
    long long v36 = v38;
    if (v18 == -1) {
      goto LABEL_21;
    }
    long long v33 = v38;
    uint64_t v34 = v18;
    BOOL v35 = v5;
  }
  [v33 expandControlForType:v34 animated:v35 updatePreferredDrawerControl:0];
  long long v36 = v38;
LABEL_21:
  if ([v36 expandedControlType] == 11) {
    goto LABEL_22;
  }
LABEL_23:
  long long v37 = [(CAMFullscreenViewfinder *)self delegate];
  [v37 fullscreenViewfinder:self didChangeControlDrawerVisibility:v7 animated:v5 forReason:a4];
}

- (void)presentControlDrawerModally:(BOOL)a3 forReason:(int64_t)a4 controlType:(int64_t)a5
{
  BOOL v7 = a3;
  BOOL v9 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  BOOL v10 = [(CAMFullscreenViewfinder *)self _isControlDrawerPresentedModally];
  if (v7 && (v10 || !v9))
  {
    int64_t v11 = [(CAMFullscreenViewfinder *)self delegate];
    [v11 fullscreenViewFinder:self willPresentControlDrawerModallyForControlType:a5 reason:a4];

    [(CAMFullscreenViewfinder *)self setControlDrawerExpanded:1 forReason:a4 animated:1];
    double v12 = [(CAMFullscreenViewfinder *)self controlDrawer];
    [v12 expandControlForType:a5 animated:v9 updatePreferredDrawerControl:a4 == 1];

    [(CAMFullscreenViewfinder *)self _setControlDrawerPresentedModally:1];
  }
  else
  {
    [(CAMFullscreenViewfinder *)self setControlDrawerExpanded:1 forReason:a4 animated:1];
    id v13 = [(CAMFullscreenViewfinder *)self controlDrawer];
    [v13 expandControlForType:a5 animated:v9 updatePreferredDrawerControl:a4 == 1];
  }
}

- (BOOL)isControlDrawerPresentedModallyWithControlType:(int64_t)a3
{
  if (![(CAMFullscreenViewfinder *)self isControlDrawerExpanded]
    || ![(CAMFullscreenViewfinder *)self _isControlDrawerPresentedModally])
  {
    return 0;
  }
  BOOL v5 = [(CAMFullscreenViewfinder *)self controlDrawer];
  char v6 = [v5 isControlExpandedForType:a3];

  return v6;
}

- (void)dismissModalControlDrawerIfNeededForReason:(int64_t)a3
{
  if ([(CAMFullscreenViewfinder *)self _isControlDrawerPresentedModally])
  {
    [(CAMFullscreenViewfinder *)self _setControlDrawerPresentedModally:0];
    BOOL v5 = [(CAMFullscreenViewfinder *)self controlDrawer];
    id v7 = [v5 expandedControl];

    if (v7)
    {
      char v6 = [(CAMFullscreenViewfinder *)self delegate];
      objc_msgSend(v6, "fullscreenViewFinder:willDismissControlDrawerModallyForControlType:reason:", self, objc_msgSend(v7, "controlType"), a3);
    }
    [(CAMFullscreenViewfinder *)self setControlDrawerExpanded:0 forReason:a3 animated:1];
  }
}

- (void)controlDrawer:(id)a3 didChangeExpanded:(BOOL)a4 forControlType:(int64_t)a5 animated:(BOOL)a6 updatePreferredDrawerControl:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v15 = a3;
  if (!v10) {
    [(CAMFullscreenViewfinder *)self _setControlDrawerPresentedModally:0];
  }
  switch(a5)
  {
    case 4:
      [(CAMFullscreenViewfinder *)self _loadFilterControlsIfNeeded];
      goto LABEL_8;
    case 11:
      [(CAMFullscreenViewfinder *)self _loadSmartStyleControlsIfNeeded];
      [(CAMFullscreenViewfinder *)self _setSmartStyleControlsVisible:v10 animated:v10 | v8 notifyDelegate:1];
      break;
    case 10:
      [(CAMFullscreenViewfinder *)self _loadSemanticStyleControlsIfNeeded];
      [(CAMFullscreenViewfinder *)self requestPreviewUpdateForSemanticStyleAnimated:0];
LABEL_8:
      [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:1];
      break;
  }
  double v12 = [(CAMFullscreenViewfinder *)self delegate];
  [v12 fullscreenViewfinder:self didChangeExpanded:v10 forDrawerControlOfType:a5 animated:v8 updatePreferredDrawerControl:v7];

  if (!v10)
  {
    id v13 = [v15 visibleControlTypes];
    uint64_t v14 = [v13 count];

    if (v14 == 1) {
      [(CAMFullscreenViewfinder *)self setControlDrawerExpanded:0 forReason:8 animated:1];
    }
  }
}

- (BOOL)isFilterScrubberVisible
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  if (v3)
  {
    BOOL v4 = [(CAMFullscreenViewfinder *)self controlDrawer];
    char v5 = [v4 isFilterScrubberExpanded];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isApertureSliderVisible
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  if (v3)
  {
    BOOL v4 = [(CAMFullscreenViewfinder *)self controlDrawer];
    char v5 = [v4 isApertureSliderExpanded];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isIntensitySliderVisible
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  if (v3)
  {
    BOOL v4 = [(CAMFullscreenViewfinder *)self controlDrawer];
    char v5 = [v4 isIntensitySliderExpanded];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isLowLightSliderVisible
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  if (v3)
  {
    BOOL v4 = [(CAMFullscreenViewfinder *)self controlDrawer];
    char v5 = [v4 isLowLightSliderExpanded];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isExposureSliderVisible
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  if (v3)
  {
    BOOL v4 = [(CAMFullscreenViewfinder *)self controlDrawer];
    char v5 = [v4 isExposureSliderExpanded];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isSemanticStyleControlVisible
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  if (v3)
  {
    BOOL v4 = [(CAMFullscreenViewfinder *)self controlDrawer];
    char v5 = [v4 isSemanticStyleControlExpanded];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)_wantsSpotlightSmartStyleStatusIndicatorForControl:(int64_t)a3
{
  char v5 = [(CAMFullscreenViewfinder *)self controlStatusBar];
  char v6 = [v5 secondaryDesiredIndicatorTypes];
  char v7 = [v6 containsObject:&unk_26BDDD8D8];

  BOOL v8 = [(CAMFullscreenViewfinder *)self isOverlayStyleControlActive];
  if (a3 == 1) {
    char v9 = v7;
  }
  else {
    char v9 = 0;
  }
  return v9 & v8;
}

- (BOOL)_wantsSpotlightControlPanelForControl:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (void)setSpotlightControl:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_spotlightControl != a3)
  {
    BOOL v4 = a4;
    char v7 = [(CAMFullscreenViewfinder *)self spotlightControlPanel];
    BOOL v8 = [(CAMFullscreenViewfinder *)self _wantsSpotlightControlPanelForControl:a3];
    BOOL v9 = v8;
    if (!v7 && v8)
    {
      char v7 = objc_alloc_init(CAMSpotlightControlPanel);
      [(CAMSpotlightControlPanel *)v7 setOrientation:[(CAMFullscreenViewfinder *)self orientation]];
      BOOL v10 = [(CAMFullscreenViewfinder *)self _contentView];
      [v10 addSubview:v7];

      [(CAMFullscreenViewfinder *)self _setSpotlightControlPanel:v7];
      int64_t v11 = [(CAMFullscreenViewfinder *)self delegate];
      [v11 fullscreenViewfinderDidCreateSpotlightControlPanel:self];
    }
    if (v9)
    {
      BOOL v12 = [(CAMFullscreenViewfinder *)self _wantsSpotlightControlPanelForControl:self->_spotlightControl];
      id v13 = [(CAMFullscreenViewfinder *)self spotlightControlPanel];
      [v13 setSpotlightControl:a3 animated:v12];
    }
    uint64_t v14 = [NSNumber numberWithInteger:a3];
    id v15 = [(CAMFullscreenViewfinder *)self _badgesForSpotlightControls];
    unint64_t v16 = [v15 objectForKeyedSubscript:v14];

    if (v16)
    {
      if (v4)
      {
LABEL_9:
        [(CAMFullscreenViewfinder *)self layoutIfNeeded];
        self->_spotlightControl = a3;
        [(CAMFullscreenViewfinder *)self setNeedsLayout];
        [(CAMFullscreenViewfinder *)self _updateQuietUIAnimated:1];
        [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:1];
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        v19[2] = __56__CAMFullscreenViewfinder_setSpotlightControl_animated___block_invoke;
        v19[3] = &unk_263FA0208;
        v19[4] = self;
        [MEMORY[0x263F82E00] animateWithDuration:2 delay:v19 usingSpringWithDamping:0 initialSpringVelocity:0.7 options:0.0 animations:0.7 completion:1.0];
LABEL_17:

        return;
      }
    }
    else
    {
      if (a3 == 2)
      {
        unint64_t v16 = objc_alloc_init(CAMFocusLockBadge);
        [(CAMFocusLockBadge *)v16 setFocusLockType:2];
      }
      else if (a3 == 3)
      {
        unint64_t v16 = objc_alloc_init(CAMShallowDepthOfFieldBadge);
        [(CAMFocusLockBadge *)v16 setShallowDepthOfFieldStatus:1];
      }
      else
      {
        unint64_t v16 = 0;
      }
      unint64_t v17 = [(CAMFullscreenViewfinder *)self _contentView];
      [v17 addSubview:v16];

      uint64_t v18 = [(CAMFullscreenViewfinder *)self _badgesForSpotlightControls];
      [v18 setObject:v16 forKeyedSubscript:v14];

      if (v4) {
        goto LABEL_9;
      }
    }
    self->_spotlightControl = a3;
    [(CAMFullscreenViewfinder *)self setNeedsLayout];
    [(CAMFullscreenViewfinder *)self _updateQuietUIAnimated:0];
    goto LABEL_17;
  }
}

uint64_t __56__CAMFullscreenViewfinder_setSpotlightControl_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)_updateQuietUIAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMFullscreenViewfinder *)self spotlightControl];
  if (v5 == 1)
  {
    char v6 = [(CAMFullscreenViewfinder *)self _contentView];
    [(CAMFullscreenViewfinder *)self _ensureBlurFilterForContentView:v6];

    char v7 = [(CAMFullscreenViewfinder *)self _contentViewBelowShutter];
    [(CAMFullscreenViewfinder *)self _ensureBlurFilterForContentView:v7];
  }
  else
  {
    BOOL v8 = [(CAMFullscreenViewfinder *)self _transientViewTimer];
    [v8 invalidate];

    [(CAMFullscreenViewfinder *)self _setTransientViewTimer:0];
  }
  BOOL v9 = [(CAMFullscreenViewfinder *)self controlStatusBar];
  BOOL v10 = [v9 secondaryDesiredIndicatorTypes];
  int v11 = [v10 containsObject:&unk_26BDDD8F0];
  if (v5 == 1) {
    int v12 = 0;
  }
  else {
    int v12 = v11;
  }

  if (v12)
  {
    [(CAMFullscreenViewfinder *)self _hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated:0];
  }
  else if (v5 == 1)
  {
    [(CAMFullscreenViewfinder *)self _showSpotlightSmartStyleStatusIndicatorIfNeededAnimated:0];
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__CAMFullscreenViewfinder__updateQuietUIAnimated___block_invoke;
  aBlock[3] = &unk_263FA02A8;
  aBlock[4] = self;
  BOOL v19 = v5 == 1;
  id v13 = (void (**)(void))_Block_copy(aBlock);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __50__CAMFullscreenViewfinder__updateQuietUIAnimated___block_invoke_2;
  _OWORD v15[3] = &unk_263FA02D0;
  BOOL v16 = v5 == 1;
  char v17 = v12;
  v15[4] = self;
  uint64_t v14 = (void (**)(void))_Block_copy(v15);
  if (v3)
  {
    [(CAMFullscreenViewfinder *)self _animateQuietUIActive:v5 == 1 animations:v13 completion:v14];
  }
  else
  {
    v13[2](v13);
    v14[2](v14);
  }
}

void __50__CAMFullscreenViewfinder__updateQuietUIAnimated___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 _contentView];
  [v2 _updateContentView:v3 forQuietUIActive:*(unsigned __int8 *)(a1 + 40)];

  BOOL v4 = *(void **)(a1 + 32);
  int64_t v5 = [v4 _contentViewBelowShutter];
  [v4 _updateContentView:v5 forQuietUIActive:*(unsigned __int8 *)(a1 + 40)];

  [*(id *)(a1 + 32) _updateSubviewsVisibilityAnimated:0];
  if (*(unsigned char *)(a1 + 40)) {
    double v6 = 0.0;
  }
  else {
    double v6 = 1.0;
  }
  id v7 = [*(id *)(a1 + 32) _transientCaptureContentView];
  [v7 setAlpha:v6];
}

uint64_t __50__CAMFullscreenViewfinder__updateQuietUIAnimated___block_invoke_2(uint64_t result)
{
  if (!*(unsigned char *)(result + 40) && !*(unsigned char *)(result + 41)) {
    return [*(id *)(result + 32) _hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated:0];
  }
  return result;
}

- (void)_animateQuietUIActive:(BOOL)a3 animations:(id)a4 completion:(id)a5
{
  id v7 = a5;
  BOOL v8 = (void *)MEMORY[0x263F82E38];
  id v9 = a4;
  if (a3)
  {
    double v10 = 0.8;
    double v11 = 1.0;
  }
  else
  {
    double v11 = 0.4;
    double v10 = 1.0;
  }
  int v12 = [v8 behaviorWithDampingRatio:v10 response:v11];
  id v13 = (void *)MEMORY[0x263F82E00];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__CAMFullscreenViewfinder__animateQuietUIActive_animations_completion___block_invoke;
  _OWORD v15[3] = &unk_263FA02F8;
  id v16 = v7;
  id v14 = v7;
  [v13 _animateUsingSpringBehavior:v12 tracking:0 animations:v9 completion:v15];
}

uint64_t __71__CAMFullscreenViewfinder__animateQuietUIActive_animations_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_ensureBlurFilterForContentView:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = [v3 subviews];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    double v6 = [v3 layer];
    id v7 = [v6 valueForKeyPath:@"filters.gaussianBlur"];
    if (!v7)
    {
      id v7 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15BC8]];
      [v7 setName:@"gaussianBlur"];
      v9[0] = v7;
      BOOL v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
      [v6 setFilters:v8];
    }
  }
}

- (void)_updateContentView:(id)a3 forQuietUIActive:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  double v6 = [v5 subviews];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    if (v4) {
      double v8 = 1.03;
    }
    else {
      double v8 = 1.0;
    }
    if (v4) {
      double v9 = 10.0;
    }
    else {
      double v9 = 0.0;
    }
    double v10 = (double)!v4;
    double v11 = [v5 layer];
    int v12 = [NSNumber numberWithDouble:v9];
    [v11 setValue:v12 forKeyPath:@"filters.gaussianBlur.inputRadius"];

    CGAffineTransformMakeScale(&v14, v8, v8);
    CGAffineTransform v13 = v14;
    [v5 setTransform:&v13];
    [v5 setAlpha:v10];
  }
}

- (void)_showSpotlightSmartStyleStatusIndicatorIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CAMFullscreenViewfinder *)self _wantsSpotlightSmartStyleStatusIndicatorForControl:[(CAMFullscreenViewfinder *)self spotlightControl]])
  {
    uint64_t v5 = [(CAMFullscreenViewfinder *)self spotlightSmartStyleStatusIndicator];
    double v6 = (CAMSmartStyleStatusIndicator *)v5;
    if (!v5)
    {
      double v6 = objc_alloc_init(CAMSmartStyleStatusIndicator);
      [(CAMControlStatusIndicator *)v6 setOrientation:[(CAMFullscreenViewfinder *)self orientation] animated:0];
      objc_storeStrong((id *)&self->_spotlightSmartStyleStatusIndicator, v6);
      uint64_t v7 = [(CAMFullscreenViewfinder *)self _modulatingContentView];
      [v7 addSubview:v6];

      [(CAMFullscreenViewfinder *)self layoutIfNeeded];
    }
    double v8 = [(CAMFullscreenViewfinder *)self controlStatusBar];
    double v9 = [v8 smartStyleIndicator];
    [v9 setHidden:1];

    double v10 = 0.0;
    if (v3) {
      double v10 = 0.25;
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __83__CAMFullscreenViewfinder__showSpotlightSmartStyleStatusIndicatorIfNeededAnimated___block_invoke;
    v12[3] = &unk_263FA0208;
    v12[4] = self;
    +[CAMView animateIfNeededWithDuration:v12 animations:v10];
    if (!v5)
    {
      double v11 = [(CAMFullscreenViewfinder *)self delegate];
      [v11 fullscreenViewfinderDidCreateSpotlightSmartStyleStatusIndicator:self];
    }
  }
}

void __83__CAMFullscreenViewfinder__showSpotlightSmartStyleStatusIndicatorIfNeededAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) spotlightSmartStyleStatusIndicator];
  [v1 setAlpha:1.0];
}

- (void)_hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(CAMFullscreenViewfinder *)self _wantsSpotlightSmartStyleStatusIndicatorForControl:[(CAMFullscreenViewfinder *)self spotlightControl]])
  {
    uint64_t v5 = [(CAMFullscreenViewfinder *)self controlStatusBar];
    double v6 = [v5 smartStyleIndicator];
    [v6 setHidden:0];

    double v7 = 0.0;
    if (v3) {
      double v7 = 0.25;
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __83__CAMFullscreenViewfinder__hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated___block_invoke;
    v8[3] = &unk_263FA0208;
    v8[4] = self;
    +[CAMView animateIfNeededWithDuration:v8 animations:v7];
  }
}

void __83__CAMFullscreenViewfinder__hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) spotlightSmartStyleStatusIndicator];
  [v1 setAlpha:0.0];
}

- (void)_layoutSpotlightSmartStyleStatusIndicator
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self controlStatusBar];
  BOOL v4 = [v3 smartStyleIndicator];

  uint64_t v5 = [(CAMFullscreenViewfinder *)self spotlightSmartStyleStatusIndicator];
  double v6 = (void *)v5;
  if (v4 && v5)
  {
    double v7 = [(CAMFullscreenViewfinder *)self controlStatusBar];
    [v7 layoutIfNeeded];

    double v8 = [v4 superview];
    [v4 center];
    double v10 = v9;
    double v12 = v11;
    CGAffineTransform v13 = [(CAMFullscreenViewfinder *)self _contentView];
    objc_msgSend(v8, "convertPoint:toView:", v13, v10, v12);
    objc_msgSend(v6, "setCenter:");

    [v4 bounds];
    objc_msgSend(v6, "setBounds:");
    [v4 transform];
    v14[0] = v14[3];
    v14[1] = v14[4];
    v14[2] = v14[5];
    [v6 setTransform:v14];
  }
}

- (void)setOverlayStyleControlActive:(BOOL)a3
{
}

- (void)setOverlayStyleControlActive:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_overlayStyleControlActive != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    BOOL v7 = [(CAMFullscreenViewfinder *)self _wantsSpotlightSmartStyleStatusIndicatorForControl:[(CAMFullscreenViewfinder *)self spotlightControl]];
    self->_overlayStyleControlActive = v5;
    if (v5)
    {
      [(CAMFullscreenViewfinder *)self _showSpotlightSmartStyleStatusIndicatorIfNeededAnimated:v4];
    }
    else if (v7)
    {
      [(CAMFullscreenViewfinder *)self _hideSpotlightSmartStyleStatusIndicatorIfNeededAnimated:v4];
    }
  }
}

- (BOOL)_shouldShowSpatialCaptureRecordingIndicator
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isSpatialCaptureRecordingIndicatorVisible];
  int64_t v4 = [(CAMFullscreenViewfinder *)self orientation];
  BOOL v5 = v4 == 3;
  BOOL result = v4 != 3 && v3;
  if (v5 && v3) {
    return ![(CAMFullscreenViewfinder *)self isSystemOverlayVisible];
  }
  return result;
}

- (void)setSpatialCaptureRecordingIndicatorVisible:(BOOL)a3
{
}

- (void)setSpatialCaptureRecordingIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_spatialCaptureRecordingIndicatorVisible != a3)
  {
    BOOL v4 = a4;
    self->_spatialCaptureRecordingIndicatorVisible = a3;
    if (a3)
    {
      double v6 = [(CAMFullscreenViewfinder *)self spatialCaptureRecordingIndicator];

      if (!v6)
      {
        BOOL v7 = objc_alloc_init(CAMSpatialCaptureRecordingIndicator);
        [(CAMSpatialCaptureRecordingIndicator *)v7 setOrientation:[(CAMFullscreenViewfinder *)self orientation]];
        double v8 = [(CAMFullscreenViewfinder *)self _modulatingContentView];
        [v8 addSubview:v7];

        if (v4) {
          [(CAMSpatialCaptureRecordingIndicator *)v7 setAlpha:0.0];
        }
        [(CAMFullscreenViewfinder *)self _setSpatialCaptureRecordingIndicator:v7];
      }
      double v9 = [(CAMFullscreenViewfinder *)self spatialCaptureRecordingIndicator];
      objc_msgSend(v9, "setOrientation:animated:", -[CAMFullscreenViewfinder orientation](self, "orientation"), 0);

      [(CAMFullscreenViewfinder *)self setNeedsLayout];
    }
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
  }
}

- (void)setOrientationInstructionVisible:(BOOL)a3
{
}

- (void)setOrientationInstructionVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_orientationInstructionVisible != a3)
  {
    BOOL v4 = a4;
    self->_orientationInstructionVisible = a3;
    if (a3)
    {
      double v6 = [(CAMFullscreenViewfinder *)self _orientationInstructionView];

      if (!v6)
      {
        BOOL v7 = objc_alloc_init(CAMOrientationInstructionView);
        [(CAMOrientationInstructionView *)v7 setOrientation:[(CAMFullscreenViewfinder *)self deviceOrientation]];
        [(CAMOrientationInstructionView *)v7 setHasBlurredBackground:[(CAMFullscreenViewfinder *)self isOrientationInstructionBackgroundBlurred] animated:0];
        [(CAMFullscreenViewfinder *)self _insertBackgroundSubview:v7];
        [(CAMFullscreenViewfinder *)self _setOrientationInstructionView:v7];
        if (v4) {
          [(CAMOrientationInstructionView *)v7 setAlpha:0.0];
        }
      }
    }
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
  }
}

- (void)setOrientationInstructionBackgroundBlurred:(BOOL)a3
{
}

- (void)setOrientationInstructionBackgroundBlurred:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_orientationInstructionBackgroundBlurred != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    self->_orientationInstructionBackgroundBlurred = a3;
    id v6 = [(CAMFullscreenViewfinder *)self _orientationInstructionView];
    [v6 setHasBlurredBackground:v5 animated:v4];
  }
}

- (void)setStereoCaptureStatus:(int64_t)a3
{
}

- (void)setStereoCaptureStatus:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_stereoCaptureStatus != a3)
  {
    BOOL v4 = a4;
    self->_stereoCaptureStatus = a3;
    BOOL v7 = [(CAMFullscreenViewfinder *)self spatialCaptureInstructionLabel];

    if (v7)
    {
      if (v4) {
        [(CAMFullscreenViewfinder *)self layoutIfNeeded];
      }
      double v8 = [(CAMFullscreenViewfinder *)self spatialCaptureInstructionLabel];
      [v8 setStereoCaptureStatus:a3];

      [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:v4];
    }
  }
}

- (void)setUseHoldStillStereoLowLightInstruction:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(CAMFullscreenViewfinder *)self stereoCaptureStatus];
  [(CAMFullscreenViewfinder *)self setStereoCaptureStatus:v5 useHoldStillStereoLowLightInstruction:v3 animated:0];
}

- (void)setStereoCaptureStatus:(int64_t)a3 useHoldStillStereoLowLightInstruction:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (self->_stereoCaptureStatus != a3 || self->_useHoldStillStereoLowLightInstruction != a4)
  {
    self->_stereoCaptureStatus = a3;
    self->_useHoldStillStereoLowLightInstruction = a4;
    double v9 = [(CAMFullscreenViewfinder *)self spatialCaptureInstructionLabel];

    if (v9)
    {
      if (v5) {
        [(CAMFullscreenViewfinder *)self layoutIfNeeded];
      }
      double v10 = [(CAMFullscreenViewfinder *)self spatialCaptureInstructionLabel];
      [v10 setStereoCaptureStatus:a3];

      double v11 = [(CAMFullscreenViewfinder *)self spatialCaptureInstructionLabel];
      [v11 setUseHoldStillLowLightInstruction:v6];

      [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:v5];
    }
  }
}

- (BOOL)_shouldShowControls
{
  return 1;
}

- (BOOL)_shouldShowSpotlightControlPanel
{
  return ([(CAMFullscreenViewfinder *)self spotlightControl] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_showControlDrawer
{
  if ([(CAMFullscreenViewfinder *)self isControlDrawerAllowed]) {
    BOOL v3 = [(CAMFullscreenViewfinder *)self isControlDrawerExpanded];
  }
  else {
    BOOL v3 = 0;
  }
  return v3 & [(CAMFullscreenViewfinder *)self _shouldShowControls];
}

- (BOOL)_showModeView
{
  if ([(CAMFullscreenViewfinder *)self isModeUIAllowed]) {
    int v3 = ![(CAMFullscreenViewfinder *)self _showControlDrawer];
  }
  else {
    LOBYTE(v3) = 0;
  }
  char v4 = v3 & ~[(CAMFullscreenViewfinder *)self smartStyleControlsVisible];
  return v4 & [(CAMFullscreenViewfinder *)self _shouldShowControls];
}

- (BOOL)_shouldShowZoomControl
{
  if ([(CAMFullscreenViewfinder *)self isZoomControlVisible])
  {
    int v3 = [(CAMFullscreenViewfinder *)self machineReadableCodeButton];
    if (v3 && (unint64_t)([(CAMFullscreenViewfinder *)self orientation] - 3) >= 2)
    {
      BOOL v5 = [(CAMFullscreenViewfinder *)self zoomControl];
      [v5 edgeMargin];
      BOOL v4 = v6 != 0.0;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  return v4 & [(CAMFullscreenViewfinder *)self _shouldShowControls];
}

- (BOOL)_showPortraitControls
{
  if ([(CAMFullscreenViewfinder *)self isPortraitControlsAllowed]
    && ![(CAMFullscreenViewfinder *)self isFilterScrubberVisible])
  {
    int v3 = ![(CAMFullscreenViewfinder *)self isSemanticStyleControlVisible];
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3 & [(CAMFullscreenViewfinder *)self _shouldShowControls];
}

- (BOOL)_showLandscapeLightingBadge
{
  if ([(CAMFullscreenViewfinder *)self _showPortraitControls]) {
    BOOL v3 = (unint64_t)([(CAMFullscreenViewfinder *)self orientation] - 3) < 2;
  }
  else {
    BOOL v3 = 0;
  }
  return v3 & [(CAMFullscreenViewfinder *)self _shouldShowControls];
}

- (BOOL)_showFilterNameBadge
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isFilterScrubberVisible];
  return v3 & [(CAMFullscreenViewfinder *)self _shouldShowControls];
}

- (BOOL)_showSmartStyleNameBadge
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self smartStyleControlsVisible];
  return v3 & [(CAMFullscreenViewfinder *)self _shouldShowControls];
}

- (BOOL)_showSemanticStylePicker
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isSemanticStyleControlVisible];
  return v3 & [(CAMFullscreenViewfinder *)self _shouldShowControls];
}

- (BOOL)_showSmartStylePicker
{
  int64_t v3 = [(CAMFullscreenViewfinder *)self spotlightControl];
  if ([(CAMFullscreenViewfinder *)self isControlDrawerExpanded])
  {
    BOOL v4 = [(CAMFullscreenViewfinder *)self isSmartStylePickerVisible];
    BOOL v5 = v3 != 1 && v4;
  }
  else
  {
    BOOL v5 = 0;
  }
  return v5 & [(CAMFullscreenViewfinder *)self _shouldShowControls];
}

- (void)_updateSubviewsVisibilityAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    double v5 = 0.3;
  }
  else {
    double v5 = 0.0;
  }
  int v6 = [(CAMFullscreenViewfinder *)self _showControlDrawer];
  int v7 = [(CAMFullscreenViewfinder *)self _showModeView];
  double v8 = [(CAMFullscreenViewfinder *)self _modeClippingView];
  double v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    id v10 = [(CAMFullscreenViewfinder *)self modeIndicator];
  }
  double v11 = v10;

  double v12 = [(CAMFullscreenViewfinder *)self controlDrawer];
  CGRect v39 = v12;
  if (v3 && v6 != v7)
  {
    if (v6) {
      CGAffineTransform v13 = v12;
    }
    else {
      CGAffineTransform v13 = v11;
    }
    if (v6) {
      CGAffineTransform v14 = v11;
    }
    else {
      CGAffineTransform v14 = v12;
    }
    id v15 = v13;
    id v16 = v14;
    char v17 = (void *)MEMORY[0x263F82E00];
    v55[0] = MEMORY[0x263EF8330];
    v55[1] = 3221225472;
    v55[2] = __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke;
    v55[3] = &unk_263FA0208;
    id v56 = v16;
    id v18 = v16;
    [v17 animateWithDuration:131074 delay:v55 options:0 animations:0.2 completion:0.0];
    BOOL v19 = (void *)MEMORY[0x263F82E00];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_2;
    v53[3] = &unk_263FA0208;
    id v54 = v15;
    id v20 = v15;
    [v19 animateWithDuration:65538 delay:v53 options:0 animations:0.25 completion:0.05];
  }
  else
  {
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_3;
    v48[3] = &unk_263FA0320;
    id v49 = v12;
    char v51 = v6;
    id v50 = v11;
    char v52 = v7;
    +[CAMView animateIfNeededWithDuration:v48 animations:v5];

    id v18 = v49;
  }

  CGFloat v21 = [(CAMFullscreenViewfinder *)self machineReadableCodeButton];

  if (v21)
  {
    BOOL v38 = (unint64_t)([(CAMFullscreenViewfinder *)self orientation] - 1) < 2;
    BOOL v22 = (unint64_t)([(CAMFullscreenViewfinder *)self orientation] - 5) < 0xFFFFFFFFFFFFFFFELL;
  }
  else
  {
    BOOL v38 = 0;
    BOOL v22 = 1;
  }
  CGRect v40 = v11;
  int v23 = [(CAMFullscreenViewfinder *)self lightingControl];
  BOOL v24 = [(CAMFullscreenViewfinder *)self _showPortraitControls];
  char v25 = [(CAMFullscreenViewfinder *)self _showLandscapeLightingBadge] && v22;
  if (v24)
  {
    BOOL v26 = (v25 & 1) != 0 || [(CAMFullscreenViewfinder *)self lightingNameBadgesHidden];
    [v23 setNameBadgeHidden:v26 animated:v3];
  }
  int64_t v27 = [(CAMFullscreenViewfinder *)self spotlightControl];
  BOOL v28 = [(CAMFullscreenViewfinder *)self _showSemanticStylePicker];
  uint64_t v29 = [(CAMFullscreenViewfinder *)self semanticStylePicker];
  [v29 setExpanded:v28 animated:v3];

  BOOL v30 = [(CAMFullscreenViewfinder *)self _showSmartStylePicker];
  CGFloat v31 = [(CAMFullscreenViewfinder *)self smartStylePicker];
  uint64_t v32 = v31;
  uint64_t v33 = v27 == 1 || v3;
  int v34 = v27 == 1 || v28 || v30;
  [v31 setExpanded:v30 animated:v33];

  BOOL v35 = [(CAMFullscreenViewfinder *)self _reticleView];
  [v35 setCornersVisible:v34 ^ 1u animated:v3];

  BOOL v36 = [(CAMFullscreenViewfinder *)self _shouldShowControls];
  v41[0] = MEMORY[0x263EF8330];
  v41[1] = 3221225472;
  v41[2] = __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_4;
  v41[3] = &unk_263FA0348;
  BOOL v43 = v36;
  char v44 = v25;
  BOOL v45 = v28;
  v41[4] = self;
  id v42 = v23;
  BOOL v46 = v24;
  BOOL v47 = v38;
  id v37 = v23;
  +[CAMView animateIfNeededWithDuration:v41 animations:v5];
}

uint64_t __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(a1 + 32) setAlpha:v2];
  if (*(unsigned char *)(a1 + 49)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  BOOL v4 = *(void **)(a1 + 40);
  return [v4 setAlpha:v3];
}

void __61__CAMFullscreenViewfinder__updateSubviewsVisibilityAnimated___block_invoke_4(uint64_t a1)
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  double v2 = 0.0;
  double v3 = 0.0;
  if ([*(id *)(a1 + 32) isShutterButtonVisible])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v3 = 1.0;
    }
    else {
      double v3 = 0.0;
    }
  }
  BOOL v4 = [*(id *)(a1 + 32) shutterControl];
  [v4 setAlpha:v3];

  if ([*(id *)(a1 + 32) isTimerIndicatorVisible])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v2 = 1.0;
    }
    else {
      double v2 = 0.0;
    }
  }
  double v5 = [*(id *)(a1 + 32) timerIndicator];
  [v5 setAlpha:v2];

  double v6 = 0.0;
  double v7 = 0.0;
  if (*(unsigned char *)(a1 + 49) && *(unsigned char *)(a1 + 48))
  {
    if ([*(id *)(a1 + 32) lightingNameBadgesHidden]) {
      double v7 = 0.0;
    }
    else {
      double v7 = 1.0;
    }
  }
  double v8 = [*(id *)(a1 + 32) lightingNameBadge];
  [v8 setAlpha:v7];

  if ([*(id *)(a1 + 32) _showFilterNameBadge])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v6 = 1.0;
    }
    else {
      double v6 = 0.0;
    }
  }
  double v9 = [*(id *)(a1 + 32) filterNameBadge];
  [v9 setAlpha:v6];

  double v10 = 0.0;
  double v11 = 0.0;
  if ([*(id *)(a1 + 32) _showSmartStyleNameBadge])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v11 = 1.0;
    }
    else {
      double v11 = 0.0;
    }
  }
  double v12 = [*(id *)(a1 + 32) smartStyleNameBadge];
  [v12 setAlpha:v11];

  if ([*(id *)(a1 + 32) smartStyleControlsVisible])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v10 = 1.0;
    }
    else {
      double v10 = 0.0;
    }
  }
  CGAffineTransform v13 = [*(id *)(a1 + 32) smartStyleSlider2D];
  CGAffineTransform v14 = [v13 view];
  [v14 setAlpha:v10];

  double v15 = 0.0;
  if ([*(id *)(a1 + 32) _shouldShowSmartStyleIntensitySlider]) {
    double v16 = 1.0;
  }
  else {
    double v16 = 0.0;
  }
  char v17 = [*(id *)(a1 + 32) smartStyleIntensitySlider];
  [v17 setAlpha:v16];

  if ([*(id *)(a1 + 32) _shouldShowSmartStyleValuesPlatter]) {
    double v18 = 1.0;
  }
  else {
    double v18 = 0.0;
  }
  BOOL v19 = [*(id *)(a1 + 32) smartStyleValuesPlatterView];
  [v19 setAlpha:v18];

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v20 = [*(id *)(a1 + 32) _semanticStyleBadges];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v89;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v89 != v23) {
          objc_enumerationMutation(v20);
        }
        if (*(unsigned char *)(a1 + 50))
        {
          if (*(unsigned char *)(a1 + 48)) {
            double v25 = 1.0;
          }
          else {
            double v25 = 0.0;
          }
        }
        else
        {
          double v25 = 0.0;
        }
        [*(id *)(*((void *)&v88 + 1) + 8 * i) setAlpha:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v88 objects:v94 count:16];
    }
    while (v22);
  }

  if ([*(id *)(a1 + 32) isFlipButtonVisible])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v15 = 1.0;
    }
    else {
      double v15 = 0.0;
    }
  }
  BOOL v26 = [*(id *)(a1 + 32) flipButton];
  [v26 setAlpha:v15];

  double v27 = 0.0;
  double v28 = 0.0;
  if ([*(id *)(a1 + 32) _shouldShowZoomControl])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v28 = 1.0;
    }
    else {
      double v28 = 0.0;
    }
  }
  uint64_t v29 = [*(id *)(a1 + 32) zoomControl];
  [v29 setAlpha:v28];

  if ([*(id *)(a1 + 32) isElapsedTimeViewVisible]) {
    double v30 = 1.0;
  }
  else {
    double v30 = 0.0;
  }
  CGFloat v31 = [*(id *)(a1 + 32) elapsedTimeView];
  [v31 setAlpha:v30];

  if ([*(id *)(a1 + 32) visibleSuggestionButtonType] == 1)
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v27 = 1.0;
    }
    else {
      double v27 = 0.0;
    }
  }
  uint64_t v32 = [*(id *)(a1 + 32) autoMacroButton];
  [v32 setAlpha:v27];

  double v33 = 0.0;
  double v34 = 0.0;
  if ([*(id *)(a1 + 32) visibleSuggestionButtonType] == 2)
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v34 = 1.0;
    }
    else {
      double v34 = 0.0;
    }
  }
  BOOL v35 = [*(id *)(a1 + 32) depthEffectSuggestionButton];
  [v35 setAlpha:v34];

  if ([*(id *)(a1 + 32) isImageAnalysisButtonVisible])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v33 = 1.0;
    }
    else {
      double v33 = 0.0;
    }
  }
  BOOL v36 = [*(id *)(a1 + 32) imageAnalysisButton];
  [v36 setAlpha:v33];

  double v37 = 0.0;
  double v38 = 0.0;
  if ([*(id *)(a1 + 32) isPreviewAlignmentGuideVisible])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v38 = 1.0;
    }
    else {
      double v38 = 0.0;
    }
  }
  CGRect v39 = [*(id *)(a1 + 32) previewAlignmentGuide];
  [v39 setAlpha:v38];

  if ([*(id *)(a1 + 32) isSharedLibraryImageWellIndicatorVisible])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v37 = 1.0;
    }
    else {
      double v37 = 0.0;
    }
  }
  CGRect v40 = [*(id *)(a1 + 32) sharedLibraryImageWellIndicatorView];
  [v40 setAlpha:v37];

  if ([*(id *)(a1 + 32) _shouldShowSpotlightControlPanel]) {
    double v41 = 1.0;
  }
  else {
    double v41 = 0.0;
  }
  id v42 = [*(id *)(a1 + 32) spotlightControlPanel];
  [v42 setAlpha:v41];

  if ([*(id *)(a1 + 32) _shouldShowControlStatusBar]) {
    double v43 = 1.0;
  }
  else {
    double v43 = 0.0;
  }
  char v44 = [*(id *)(a1 + 32) controlStatusBar];
  [v44 setAlpha:v43];

  [*(id *)(a1 + 32) _legibilityBackgroundAlpha];
  double v46 = v45;
  BOOL v47 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:v45];
  CGRect v48 = [*(id *)(a1 + 32) controlStatusBar];
  [v48 setBackgroundColor:v47];

  id v49 = [*(id *)(a1 + 32) _bottomLegibilityBackground];
  [v49 setAlpha:v46];

  id v50 = objc_msgSend(*(id *)(a1 + 32), "_visibleInstructionLabelForInstructionLabelValue:", objc_msgSend(*(id *)(a1 + 32), "visibleInstructionLabel"));
  long long v84 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  char v51 = [*(id *)(a1 + 32) _createdPrimaryInstructionLabels];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v84 objects:v93 count:16];
  if (v52)
  {
    uint64_t v53 = v52;
    uint64_t v54 = *(void *)v85;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v85 != v54) {
          objc_enumerationMutation(v51);
        }
        id v56 = *(void **)(*((void *)&v84 + 1) + 8 * j);
        double v57 = 0.0;
        if (v56 == v50)
        {
          if (*(unsigned char *)(a1 + 48)) {
            double v57 = 1.0;
          }
          else {
            double v57 = 0.0;
          }
        }
        [v56 setAlpha:v57];
      }
      uint64_t v53 = [v51 countByEnumeratingWithState:&v84 objects:v93 count:16];
    }
    while (v53);
  }

  CGFloat v58 = objc_msgSend(*(id *)(a1 + 32), "_visibleInstructionLabelForInstructionLabelValue:", objc_msgSend(*(id *)(a1 + 32), "visibleSecondaryInstructionLabel"));
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  CGFloat v59 = objc_msgSend(*(id *)(a1 + 32), "_createdSecondaryInstructionLabels", 0);
  uint64_t v60 = [v59 countByEnumeratingWithState:&v80 objects:v92 count:16];
  if (v60)
  {
    uint64_t v61 = v60;
    uint64_t v62 = *(void *)v81;
    do
    {
      for (uint64_t k = 0; k != v61; ++k)
      {
        if (*(void *)v81 != v62) {
          objc_enumerationMutation(v59);
        }
        uint64_t v64 = *(void **)(*((void *)&v80 + 1) + 8 * k);
        double v65 = 0.0;
        if (v64 == v58)
        {
          if (*(unsigned char *)(a1 + 48)) {
            double v65 = 1.0;
          }
          else {
            double v65 = 0.0;
          }
        }
        [v64 setAlpha:v65];
      }
      uint64_t v61 = [v59 countByEnumeratingWithState:&v80 objects:v92 count:16];
    }
    while (v61);
  }

  double v66 = 0.0;
  double v67 = 0.0;
  if (*(unsigned char *)(a1 + 51) && !*(unsigned char *)(a1 + 52)) {
    double v67 = 1.0;
  }
  [*(id *)(a1 + 40) setAlpha:v67];
  if ([*(id *)(a1 + 32) isExternalStorageButtonVisible]) {
    double v68 = 1.0;
  }
  else {
    double v68 = 0.0;
  }
  double v69 = [*(id *)(a1 + 32) externalStorageButton];
  [v69 setAlpha:v68];

  if ([*(id *)(a1 + 32) isOrientationInstructionVisible])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v66 = 1.0;
    }
    else {
      double v66 = 0.0;
    }
  }
  long long v70 = [*(id *)(a1 + 32) _orientationInstructionView];
  [v70 setAlpha:v66];

  double v71 = 0.0;
  double v72 = 0.0;
  if ([*(id *)(a1 + 32) visibleSuggestionButtonType] == 3)
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v72 = 1.0;
    }
    else {
      double v72 = 0.0;
    }
  }
  long long v73 = [*(id *)(a1 + 32) spatialCaptureButton];
  [v73 setAlpha:v72];

  if ([*(id *)(a1 + 32) _shouldShowSpatialCaptureRecordingIndicator])
  {
    if (*(unsigned char *)(a1 + 48)) {
      double v71 = 1.0;
    }
    else {
      double v71 = 0.0;
    }
  }
  CGFloat v74 = [*(id *)(a1 + 32) spatialCaptureRecordingIndicator];
  [v74 setAlpha:v71];

  long long v75 = [*(id *)(a1 + 32) photoVideoModeSwitch];
  int v76 = [v75 isEnabled];

  double v77 = 0.0;
  if ([*(id *)(a1 + 32) isModeSwitchVisible])
  {
    double v78 = 0.5;
    if (v76) {
      double v78 = 1.0;
    }
    if (*(unsigned char *)(a1 + 48)) {
      double v77 = v78;
    }
    else {
      double v77 = 0.0;
    }
  }
  double v79 = [*(id *)(a1 + 32) photoVideoModeSwitch];
  [v79 setAlpha:v77];
}

- (double)_legibilityBackgroundAlpha
{
  BOOL v3 = [(CAMFullscreenViewfinder *)self isLegibilityBackgroundsVisible];
  double result = 0.0;
  if (v3)
  {
    BOOL v5 = [(CAMFullscreenViewfinder *)self isSemanticStyleControlVisible];
    double result = 0.3;
    if (v5) {
      return 0.8;
    }
  }
  return result;
}

- (void)_updateTintColors
{
  [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __44__CAMFullscreenViewfinder__updateTintColors__block_invoke;
  aBlock[3] = &unk_263FA0370;
  void aBlock[5] = v3;
  aBlock[6] = v4;
  aBlock[7] = v5;
  aBlock[8] = v6;
  aBlock[4] = self;
  double v7 = (void (**)(void *, void *))_Block_copy(aBlock);
  double v8 = [(CAMFullscreenViewfinder *)self controlDrawer];
  v7[2](v7, v8);

  double v9 = [(CAMFullscreenViewfinder *)self flipButton];
  v7[2](v7, v9);

  double v10 = [(CAMFullscreenViewfinder *)self creativeCameraButton];
  v7[2](v7, v10);
}

void __44__CAMFullscreenViewfinder__updateTintColors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 frame];
  BOOL v4 = CGRectIntersectsRect(v8, *(CGRect *)(a1 + 40));
  uint64_t v5 = objc_opt_class();
  if (v4) {
    [v5 darkControlBackgroundColor];
  }
  else {
  id v6 = [v5 lightControlBackgroundColor];
  }
  [v3 setTintColor:v6];
}

- (void)setVisibleInstructionLabel:(int64_t)a3
{
}

- (void)setVisibleInstructionLabel:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v7 = [(CAMFullscreenViewfinder *)self visibleSecondaryInstructionLabel];
  [(CAMFullscreenViewfinder *)self setVisibleInstructionLabel:a3 visibleSecondaryInstructionLabel:v7 animated:v4];
}

- (void)_createViewIfNeededForInstructionLabel:(int64_t)a3 isPrimary:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v7 = [(CAMFullscreenViewfinder *)self _modulatingContentView];
  id v42 = v7;
  switch(a3)
  {
    case 1:
      CGRect v8 = [(CAMFullscreenViewfinder *)self portraitInstructionLabel];

      if (v8) {
        goto LABEL_28;
      }
      double v9 = objc_alloc_init(CAMPortraitModeInstructionLabel);
      [(CAMFullscreenViewfinder *)self _setPortraitInstructionLabel:v9];

      int64_t v10 = [(CAMFullscreenViewfinder *)self shallowDepthOfFieldStatus];
      double v11 = [(CAMFullscreenViewfinder *)self portraitInstructionLabel];
      [v11 setShallowDepthOfFieldStatus:v10];

      double v12 = [(CAMFullscreenViewfinder *)self portraitInstructionLabel];
      goto LABEL_22;
    case 2:
      CGAffineTransform v13 = [(CAMFullscreenViewfinder *)self qrCodeInstructionLabel];

      if (v13) {
        goto LABEL_28;
      }
      CGAffineTransform v14 = objc_alloc_init(CAMQRCodeInstructionLabel);
      [(CAMFullscreenViewfinder *)self _setQRCodeInstructionLabel:v14];

      double v12 = [(CAMFullscreenViewfinder *)self qrCodeInstructionLabel];
      goto LABEL_22;
    case 3:
      double v15 = [(CAMFullscreenViewfinder *)self _lowLightInstructionLabel];

      if (v15) {
        goto LABEL_28;
      }
      double v16 = objc_alloc_init(CAMLowLightInstructionLabel);
      [(CAMFullscreenViewfinder *)self _setLowLightInstructionLabel:v16];

      double v12 = [(CAMFullscreenViewfinder *)self _lowLightInstructionLabel];
      goto LABEL_22;
    case 4:
      char v17 = [(CAMFullscreenViewfinder *)self flashCompromisedInstructionLabel];

      if (v17) {
        goto LABEL_28;
      }
      double v18 = objc_alloc_init(CAMFlashCompromisedInstructionLabel);
      [(CAMFullscreenViewfinder *)self _setFlashCompromisedInstructionLabel:v18];

      double v12 = [(CAMFullscreenViewfinder *)self flashCompromisedInstructionLabel];
      goto LABEL_22;
    case 5:
      BOOL v19 = [(CAMFullscreenViewfinder *)self imageAnalysisInstructionLabel];

      if (v19) {
        goto LABEL_28;
      }
      id v20 = objc_alloc_init(CAMImageAnalysisInstructionLabel);
      [(CAMFullscreenViewfinder *)self _setImageAnalysisInstructionLabel:v20];

      uint64_t v21 = [(CAMFullscreenViewfinder *)self imageAnalysisInstructionLabel];
      uint64_t v22 = self;

      uint64_t v23 = 0;
      id v42 = v22;
      goto LABEL_23;
    case 6:
      BOOL v24 = [(CAMFullscreenViewfinder *)self maxRecordingTimeInstructionLabel];

      if (v24) {
        goto LABEL_28;
      }
      double v25 = objc_alloc_init(CAMMaxRecordingTimeInstructionLabel);
      [(CAMFullscreenViewfinder *)self _setMaxRecordingTimeInstructionLabel:v25];

      double v12 = [(CAMFullscreenViewfinder *)self maxRecordingTimeInstructionLabel];
      goto LABEL_22;
    case 7:
      BOOL v26 = [(CAMFullscreenViewfinder *)self freeResourcesInstructionLabel];

      if (v26) {
        goto LABEL_28;
      }
      double v27 = objc_alloc_init(CAMFreeResourcesInstructionLabel);
      [(CAMFullscreenViewfinder *)self _setFreeResourcesInstructionLabel:v27];

      uint64_t v21 = [(CAMFullscreenViewfinder *)self freeResourcesInstructionLabel];
      uint64_t v23 = 1;
      goto LABEL_23;
    case 8:
      double v28 = [(CAMFullscreenViewfinder *)self deviceTooHotInstructionLabel];

      if (v28) {
        goto LABEL_28;
      }
      uint64_t v29 = objc_alloc_init(CAMDeviceTooHotInstructionLabel);
      [(CAMFullscreenViewfinder *)self _setDeviceTooHotInstructionLabel:v29];

      double v12 = [(CAMFullscreenViewfinder *)self deviceTooHotInstructionLabel];
      goto LABEL_22;
    case 9:
      double v30 = [(CAMFullscreenViewfinder *)self spatialCaptureInstructionLabel];

      if (v30) {
        goto LABEL_28;
      }
      CGFloat v31 = objc_alloc_init(CAMSpatialCaptureInstructionLabel);
      [(CAMFullscreenViewfinder *)self _setSpatialCaptureInstructionLabel:v31];

      int64_t v32 = [(CAMFullscreenViewfinder *)self stereoCaptureStatus];
      double v33 = [(CAMFullscreenViewfinder *)self spatialCaptureInstructionLabel];
      [v33 setStereoCaptureStatus:v32];

      BOOL v34 = [(CAMFullscreenViewfinder *)self useHoldStillStereoLowLightInstruction];
      BOOL v35 = [(CAMFullscreenViewfinder *)self spatialCaptureInstructionLabel];
      [v35 setUseHoldStillLowLightInstruction:v34];

      double v12 = [(CAMFullscreenViewfinder *)self spatialCaptureInstructionLabel];
      goto LABEL_22;
    case 10:
      if (self->_smartStyleCategoryInstructionLabel) {
        goto LABEL_29;
      }
      BOOL v36 = objc_alloc_init(CAMSmartStyleCategoryInstructionLabel);
      smartStyleCategoryInstructionLabel = self->_smartStyleCategoryInstructionLabel;
      self->_smartStyleCategoryInstructionLabel = v36;

      double v12 = self->_smartStyleCategoryInstructionLabel;
LABEL_22:
      uint64_t v21 = v12;
      uint64_t v23 = 0;
LABEL_23:
      if (v21)
      {
        [v21 setUserInteractionEnabled:v23];
        [v21 setStyle:1];
        [v21 setDelegate:self];
        [(CAMFullscreenViewfinder *)v42 addSubview:v21];
        double v38 = [(CAMFullscreenViewfinder *)self _instructionLabelByValue];
        CGRect v39 = [NSNumber numberWithInteger:a3];
        [v38 setObject:v21 forKeyedSubscript:v39];

        if (v4) {
          [(CAMFullscreenViewfinder *)self _createdPrimaryInstructionLabels];
        }
        else {
        CGRect v40 = [(CAMFullscreenViewfinder *)self _createdSecondaryInstructionLabels];
        }
        [v40 addObject:v21];

        double v41 = [(CAMFullscreenViewfinder *)self delegate];
        [v41 fullscreenViewfinder:self didCreateInstructionLabel:a3];
      }
LABEL_28:
      int64_t v7 = v42;
LABEL_29:

      return;
    default:
      goto LABEL_29;
  }
}

- (id)_visibleInstructionLabelForInstructionLabelValue:(int64_t)a3
{
  BOOL v4 = [(CAMFullscreenViewfinder *)self _instructionLabelByValue];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  return v6;
}

- (void)setVisibleInstructionLabel:(int64_t)a3 visibleSecondaryInstructionLabel:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if (*(_OWORD *)&self->_visibleInstructionLabel != __PAIR128__(a4, a3))
  {
    [(CAMFullscreenViewfinder *)self _createViewIfNeededForInstructionLabel:a3 isPrimary:1];
    [(CAMFullscreenViewfinder *)self _createViewIfNeededForInstructionLabel:a4 isPrimary:0];
    if (v5) {
      [(CAMFullscreenViewfinder *)self layoutIfNeeded];
    }
    int64_t visibleInstructionLabel = self->_visibleInstructionLabel;
    int64_t visibleSecondaryInstructionLabel = self->_visibleSecondaryInstructionLabel;
    self->_int64_t visibleInstructionLabel = a3;
    self->_int64_t visibleSecondaryInstructionLabel = a4;
    if (a3 && !visibleInstructionLabel || a4 && !visibleSecondaryInstructionLabel) {
      [(CAMFullscreenViewfinder *)self _updateGeometryForElapsedTimeAndInstructionLabels];
    }
    [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:v5];
  }
}

- (unint64_t)_badgeFontStyle
{
  double v2 = +[CAMCaptureCapabilities capabilities];
  unint64_t v3 = [v2 sfCameraFontSupported];

  return v3;
}

- (void)_transitionView:(id)a3 fromOrientation:(int64_t)a4 toOrientation:(int64_t)a5
{
  if (a3)
  {
    BOOL v5 = ((a5 - 1) | (unint64_t)(a4 - 1)) < 2;
    id v6 = a3;
    CAMSnapshotForFadingOrientationTransition((uint64_t)v6, v5);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    int64_t v7 = [v6 superview];

    [v7 addSubview:v8];
  }
}

- (void)_transitionView:(id)a3 isFlippingInPlace:(BOOL)a4
{
  if (a3)
  {
    BOOL v4 = a4;
    id v5 = a3;
    CAMSnapshotForFadingOrientationTransition((uint64_t)v5, v4);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 superview];

    [v6 addSubview:v7];
  }
}

- (void)setControlDrawerAllowed:(BOOL)a3 modeUIAllowed:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  if (self->_controlDrawerAllowed != a3 || self->_modeUIAllowed != a4)
  {
    if (a5) {
      [(CAMFullscreenViewfinder *)self layoutIfNeeded];
    }
    BOOL v9 = [(CAMFullscreenViewfinder *)self _showControlDrawer];
    self->_controlDrawerAllowed = a3;
    self->_modeUIAllowed = a4;
    if (v9 && [(CAMFullscreenViewfinder *)self _showModeView] && v5)
    {
      [(CAMFullscreenViewfinder *)self _frameForModeView];
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v18 = [(CAMFullscreenViewfinder *)self modeDial];
      objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);
    }
    [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:v5];
  }
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  uint64_t v162 = *MEMORY[0x263EF8340];
  int64_t orientation = self->_orientation;
  if (orientation != a3)
  {
    BOOL v5 = a4;
    if (a4) {
      double v8 = 0.3;
    }
    else {
      double v8 = 0.0;
    }
    self->_int64_t orientation = a3;
    BOOL v9 = [(CAMFullscreenViewfinder *)self controlDrawer];
    [v9 setOrientation:a3 animated:v5];

    double v10 = [(CAMFullscreenViewfinder *)self controlStatusBar];
    [v10 setOrientation:a3 animated:v5];

    double v11 = [(CAMFullscreenViewfinder *)self shutterControl];
    [v11 setOrientation:a3 animated:v5];

    double v12 = [(CAMFullscreenViewfinder *)self timerIndicator];
    [v12 setOrientation:a3 animated:v5];

    double v13 = [(CAMFullscreenViewfinder *)self autoMacroButton];
    [v13 setOrientation:a3 animated:v5];

    double v14 = [(CAMFullscreenViewfinder *)self depthEffectSuggestionButton];
    [v14 setOrientation:a3 animated:v5];

    double v15 = [(CAMFullscreenViewfinder *)self spotlightControlPanel];
    [v15 setOrientation:a3 animated:v5];

    double v16 = [(CAMFullscreenViewfinder *)self spotlightSmartStyleStatusIndicator];
    [v16 setOrientation:a3 animated:v5];

    double v17 = [(CAMFullscreenViewfinder *)self spatialCaptureButton];
    [v17 setOrientation:a3 animated:v5];

    double v18 = [(CAMFullscreenViewfinder *)self lightingControl];
    [v18 setOrientation:a3];

    BOOL v19 = [(CAMFullscreenViewfinder *)self photoVideoModeSwitch];
    [v19 setOrientation:a3 animated:v5];

    BOOL v20 = [(CAMFullscreenViewfinder *)self _shouldAnimateSmartStyleSlider2DChangeFromOrientation:orientation toOrientation:a3];
    BOOL v21 = [(CAMFullscreenViewfinder *)self _shouldAnimateSmartStyleIntensitySliderChangeFromOrientation:orientation toOrientation:a3];
    long long v158 = 0u;
    long long v157 = 0u;
    long long v156 = 0u;
    long long v155 = 0u;
    long long v154 = 0u;
    long long v153 = 0u;
    [(CAMFullscreenViewfinder *)self _geometryForSmartStyleSlider2DExpanded:[(CAMFullscreenViewfinder *)self smartStyleControlsVisible]];
    long long v152 = 0u;
    long long v151 = 0u;
    long long v150 = 0u;
    long long v149 = 0u;
    long long v148 = 0u;
    long long v147 = 0u;
    [(CAMFullscreenViewfinder *)self _geometryForSmartStyleIntensitySliderExpanded:[(CAMFullscreenViewfinder *)self smartStyleControlsVisible]];
    if (v20 || v21)
    {
      v132[0] = MEMORY[0x263EF8330];
      v132[1] = 3221225472;
      long long v135 = v155;
      long long v136 = v156;
      long long v137 = v157;
      long long v138 = v158;
      long long v133 = v153;
      long long v134 = v154;
      long long v144 = v152;
      long long v141 = v149;
      long long v142 = v150;
      long long v140 = v148;
      long long v139 = v147;
      v132[2] = __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke;
      v132[3] = &unk_263FA0398;
      BOOL v145 = v20;
      v132[4] = self;
      BOOL v146 = v21;
      long long v143 = v151;
      +[CAMView animateIfNeededWithDuration:2 options:v132 animations:0 completion:v8];
    }
    uint64_t v22 = [(CAMFullscreenViewfinder *)self _descriptionOverlayViewByKey];
    v130[0] = MEMORY[0x263EF8330];
    v130[1] = 3221225472;
    v130[2] = __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke_2;
    v130[3] = &__block_descriptor_41_e55_v32__0___NSCopying__8__CAMDescriptionOverlayView_16_B24l;
    v130[4] = a3;
    BOOL v131 = v5;
    [v22 enumerateKeysAndObjectsUsingBlock:v130];

    uint64_t v23 = [(CAMFullscreenViewfinder *)self disabledModeOverlayView];
    [v23 setOrientation:a3 animated:v5];

    BOOL v24 = [(CAMFullscreenViewfinder *)self imageAnalysisButton];
    [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    v123[0] = MEMORY[0x263EF8330];
    v123[1] = 3221225472;
    v123[2] = __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke_3;
    v123[3] = &unk_263FA03E0;
    v123[4] = self;
    double v125 = v25;
    double v126 = v27;
    double v127 = v29;
    double v128 = v31;
    id v33 = v24;
    id v124 = v33;
    int64_t v129 = a3;
    +[CAMView animateIfNeededWithDuration:v123 animations:v8];
    BOOL v34 = [(CAMFullscreenViewfinder *)self badgeTray];
    BOOL v35 = [(CAMFullscreenViewfinder *)self lightingNameBadge];
    long long v75 = [(CAMFullscreenViewfinder *)self filterNameBadge];
    CGFloat v74 = [(CAMFullscreenViewfinder *)self smartStyleNameBadge];
    BOOL v36 = [(CAMFullscreenViewfinder *)self elapsedTimeView];
    int v76 = [(CAMFullscreenViewfinder *)self machineReadableCodeButton];
    double v72 = v36;
    long long v73 = v35;
    if (v5)
    {
      double v78 = v34;
      [(CAMFullscreenViewfinder *)self _transitionView:v34 fromOrientation:orientation toOrientation:a3];
      if ([(CAMFullscreenViewfinder *)self isElapsedTimeViewVisible]) {
        [(CAMFullscreenViewfinder *)self _transitionView:v36 fromOrientation:orientation toOrientation:a3];
      }
      double v37 = [(CAMFullscreenViewfinder *)self _visibleInstructionLabelForInstructionLabelValue:[(CAMFullscreenViewfinder *)self visibleInstructionLabel]];
      if (v37) {
        [(CAMFullscreenViewfinder *)self _transitionView:v37 fromOrientation:orientation toOrientation:a3];
      }
      double v38 = [(CAMFullscreenViewfinder *)self _visibleInstructionLabelForInstructionLabelValue:[(CAMFullscreenViewfinder *)self visibleSecondaryInstructionLabel]];
      if (v38) {
        [(CAMFullscreenViewfinder *)self _transitionView:v38 fromOrientation:orientation toOrientation:a3];
      }
      if ([(CAMFullscreenViewfinder *)self _showFilterNameBadge]) {
        [(CAMFullscreenViewfinder *)self _transitionView:v75 fromOrientation:orientation toOrientation:a3];
      }
      if ([(CAMFullscreenViewfinder *)self _showSmartStyleNameBadge]) {
        [(CAMFullscreenViewfinder *)self _transitionView:v74 fromOrientation:orientation toOrientation:a3];
      }
      if ([(CAMFullscreenViewfinder *)self smartStyleControlsVisible] && !v20)
      {
        CGRect v39 = [(CAMFullscreenViewfinder *)self smartStyleSlider2D];
        CGRect v40 = [v39 view];
        [(CAMFullscreenViewfinder *)self _transitionView:v40 isFlippingInPlace:1];

        double v41 = [(CAMFullscreenViewfinder *)self smartStyleSlider2D];
        id v42 = [v41 view];
        long long v119 = v155;
        long long v120 = v156;
        long long v121 = v157;
        long long v122 = v158;
        long long v117 = v153;
        long long v118 = v154;
        CAMViewSetGeometry(v42, (uint64_t)&v117);

        BOOL v35 = v73;
      }
      if ([(CAMFullscreenViewfinder *)self _shouldShowSmartStyleIntensitySlider]
        && !v21)
      {
        double v43 = [(CAMFullscreenViewfinder *)self smartStyleIntensitySlider];
        [(CAMFullscreenViewfinder *)self _transitionView:v43 fromOrientation:orientation toOrientation:a3];

        char v44 = [(CAMFullscreenViewfinder *)self smartStyleIntensitySlider];
        long long v119 = v149;
        long long v120 = v150;
        long long v121 = v151;
        long long v122 = v152;
        long long v117 = v147;
        long long v118 = v148;
        CAMViewSetGeometry(v44, (uint64_t)&v117);
      }
      if ([(CAMFullscreenViewfinder *)self _showSemanticStylePicker])
      {
        id v77 = v33;
        long long v116 = 0u;
        long long v115 = 0u;
        long long v114 = 0u;
        long long v113 = 0u;
        double v45 = [(CAMFullscreenViewfinder *)self _semanticStyleBadges];
        uint64_t v46 = [v45 countByEnumeratingWithState:&v113 objects:v161 count:16];
        if (v46)
        {
          uint64_t v47 = v46;
          uint64_t v48 = *(void *)v114;
          do
          {
            for (uint64_t i = 0; i != v47; ++i)
            {
              if (*(void *)v114 != v48) {
                objc_enumerationMutation(v45);
              }
              [(CAMFullscreenViewfinder *)self _transitionView:*(void *)(*((void *)&v113 + 1) + 8 * i) fromOrientation:orientation toOrientation:a3];
            }
            uint64_t v47 = [v45 countByEnumeratingWithState:&v113 objects:v161 count:16];
          }
          while (v47);
        }

        id v33 = v77;
        BOOL v35 = v73;
      }
      if (v76) {
        [(CAMFullscreenViewfinder *)self _transitionView:v76 fromOrientation:orientation toOrientation:a3];
      }
      BOOL v50 = [(CAMFullscreenViewfinder *)self _showLandscapeLightingBadge];
      if (((orientation - 3) | (unint64_t)(a3 - 3)) <= 1 && v50) {
        [(CAMFullscreenViewfinder *)self _transitionView:v35 fromOrientation:orientation toOrientation:a3];
      }

      BOOL v34 = v78;
      BOOL v36 = v72;
    }
    BOOL v51 = [(CAMFullscreenViewfinder *)self isElapsedTimeViewVisible];
    uint64_t v52 = [v36 layer];
    uint64_t v53 = [v52 animationForKey:@"opacity"];
    if (v53) {
      int v54 = v51;
    }
    else {
      int v54 = 1;
    }

    long long v122 = 0u;
    long long v121 = 0u;
    long long v120 = 0u;
    long long v119 = 0u;
    long long v118 = 0u;
    long long v117 = 0u;
    uint64_t v55 = [(CAMFullscreenViewfinder *)self _layout];
    BOOL v56 = [(CAMFullscreenViewfinder *)self isSystemOverlayVisible];
    if (v55)
    {
      objc_msgSend(v55, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", v36, a3, v56, v26, v28, v30, v32);
    }
    else
    {
      long long v122 = 0u;
      long long v121 = 0u;
      long long v120 = 0u;
      long long v119 = 0u;
      long long v118 = 0u;
      long long v117 = 0u;
    }

    if (v54)
    {
      long long v109 = v119;
      long long v110 = v120;
      long long v111 = v121;
      long long v112 = v122;
      long long v107 = v117;
      long long v108 = v118;
      CAMViewSetGeometry(v36, (uint64_t)&v107);
    }
    [(CAMFullscreenViewfinder *)self _geometryForBadgeTray];
    CAMViewSetGeometry(v34, (uint64_t)v106);
    [(CAMFullscreenViewfinder *)self _geometryForLandscapeLightingBadge];
    CAMViewSetGeometry(v35, (uint64_t)v105);
    [(CAMFullscreenViewfinder *)self _geometryForBottomCenteredView:v75];
    CAMViewSetGeometry(v75, (uint64_t)v104);
    [(CAMFullscreenViewfinder *)self _geometryForSmartStyleNameBadge:v74];
    CAMViewSetGeometry(v74, (uint64_t)v103);
    [(CAMFullscreenViewfinder *)self _geometryForMRCButton];
    CAMViewSetGeometry(v76, (uint64_t)v102);
    [(CAMFullscreenViewfinder *)self _layoutSemanticStyleMaskedBadges];
    if (v51)
    {
      long long v109 = v119;
      long long v110 = v120;
      long long v111 = v121;
      long long v112 = v122;
      long long v57 = v117;
      long long v58 = v118;
    }
    else
    {
      long long v109 = *(_OWORD *)&CAMViewGeometryZero[32];
      long long v110 = *(_OWORD *)&CAMViewGeometryZero[48];
      long long v111 = *(_OWORD *)&CAMViewGeometryZero[64];
      long long v112 = *(_OWORD *)&CAMViewGeometryZero[80];
      long long v57 = *(_OWORD *)CAMViewGeometryZero;
      long long v58 = *(_OWORD *)&CAMViewGeometryZero[16];
    }
    long long v107 = v57;
    long long v108 = v58;
    long long v100 = 0u;
    long long v101 = 0u;
    long long v98 = 0u;
    long long v99 = 0u;
    CGFloat v59 = [(CAMFullscreenViewfinder *)self _createdPrimaryInstructionLabels];
    uint64_t v60 = [v59 countByEnumeratingWithState:&v98 objects:v160 count:16];
    if (v60)
    {
      uint64_t v61 = v60;
      uint64_t v62 = *(void *)v99;
      do
      {
        for (uint64_t j = 0; j != v61; ++j)
        {
          if (*(void *)v99 != v62) {
            objc_enumerationMutation(v59);
          }
          uint64_t v64 = *(void **)(*((void *)&v98 + 1) + 8 * j);
          long long v93 = *(_OWORD *)&CAMViewGeometryZero[32];
          long long v94 = *(_OWORD *)&CAMViewGeometryZero[48];
          long long v95 = *(_OWORD *)&CAMViewGeometryZero[64];
          long long v96 = *(_OWORD *)&CAMViewGeometryZero[80];
          long long v91 = *(_OWORD *)CAMViewGeometryZero;
          long long v92 = *(_OWORD *)&CAMViewGeometryZero[16];
          long long v87 = v109;
          long long v88 = v110;
          long long v89 = v111;
          long long v90 = v112;
          long long v85 = v107;
          long long v86 = v108;
          [(CAMFullscreenViewfinder *)self _geometryForInstructionLabel:v64 belowInstructionLabelGeometry:&v91 elapsedTimeViewGeometry:&v85];
          CAMViewSetGeometry(v64, (uint64_t)v97);
        }
        uint64_t v61 = [v59 countByEnumeratingWithState:&v98 objects:v160 count:16];
      }
      while (v61);
    }

    double v65 = [(CAMFullscreenViewfinder *)self _visibleInstructionLabelForInstructionLabelValue:[(CAMFullscreenViewfinder *)self visibleInstructionLabel]];
    long long v95 = 0u;
    long long v96 = 0u;
    long long v93 = 0u;
    long long v94 = 0u;
    long long v91 = 0u;
    long long v92 = 0u;
    CAMViewGetGeometry(v65, (uint64_t)&v91);
    long long v83 = 0u;
    long long v84 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    double v66 = [(CAMFullscreenViewfinder *)self _createdSecondaryInstructionLabels];
    uint64_t v67 = [v66 countByEnumeratingWithState:&v81 objects:v159 count:16];
    if (v67)
    {
      uint64_t v68 = v67;
      uint64_t v69 = *(void *)v82;
      do
      {
        for (uint64_t k = 0; k != v68; ++k)
        {
          if (*(void *)v82 != v69) {
            objc_enumerationMutation(v66);
          }
          double v71 = *(void **)(*((void *)&v81 + 1) + 8 * k);
          long long v87 = v93;
          long long v88 = v94;
          long long v89 = v95;
          long long v90 = v96;
          long long v85 = v91;
          long long v86 = v92;
          v79[2] = v109;
          v79[3] = v110;
          v79[4] = v111;
          v79[5] = v112;
          v79[0] = v107;
          v79[1] = v108;
          [(CAMFullscreenViewfinder *)self _geometryForInstructionLabel:v71 belowInstructionLabelGeometry:&v85 elapsedTimeViewGeometry:v79];
          CAMViewSetGeometry(v71, (uint64_t)v80);
        }
        uint64_t v68 = [v66 countByEnumeratingWithState:&v81 objects:v159 count:16];
      }
      while (v68);
    }

    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v5];
  }
}

void __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 232))
  {
    double v2 = [*(id *)(a1 + 32) smartStyleSlider2D];
    unint64_t v3 = [v2 view];
    long long v4 = *(_OWORD *)(a1 + 88);
    long long v13 = *(_OWORD *)(a1 + 72);
    long long v14 = v4;
    long long v5 = *(_OWORD *)(a1 + 120);
    long long v15 = *(_OWORD *)(a1 + 104);
    long long v16 = v5;
    long long v6 = *(_OWORD *)(a1 + 56);
    long long v11 = *(_OWORD *)(a1 + 40);
    long long v12 = v6;
    CAMViewSetGeometry(v3, (uint64_t)&v11);
  }
  if (*(unsigned char *)(a1 + 233))
  {
    id v7 = [*(id *)(a1 + 32) smartStyleIntensitySlider];
    long long v8 = *(_OWORD *)(a1 + 184);
    long long v13 = *(_OWORD *)(a1 + 168);
    long long v14 = v8;
    long long v9 = *(_OWORD *)(a1 + 216);
    long long v15 = *(_OWORD *)(a1 + 200);
    long long v16 = v9;
    long long v10 = *(_OWORD *)(a1 + 152);
    long long v11 = *(_OWORD *)(a1 + 136);
    long long v12 = v10;
    CAMViewSetGeometry(v7, (uint64_t)&v11);
  }
}

uint64_t __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setOrientation:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 40)];
}

void __51__CAMFullscreenViewfinder_setOrientation_animated___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) textInteractionInsert];
  unint64_t v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "_geometryForTextInteractionInsertWithViewport:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  }
  else
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v7 = 0u;
    long long v8 = 0u;
  }
  CAMViewSetGeometry(v2, (uint64_t)&v7);
  [v2 layoutIfNeeded];
  uint64_t v4 = *(void *)(a1 + 80);
  switch(v4)
  {
    case 1:
      double v5 = 0.0;
      break;
    case 3:
      double v5 = 1.57079633;
      break;
    case 4:
      double v5 = -1.57079633;
      break;
    default:
      double v5 = 3.14159265;
      if (v4 != 2) {
        double v5 = 0.0;
      }
      break;
  }
  objc_msgSend(*(id *)(a1 + 40), "setGlyphRotation:", v5, v7, v8, v9, v10, v11, v12);
  long long v6 = [v2 actionInfoView];
  if (v6)
  {
    [*(id *)(a1 + 32) _frameForActionInfoView];
    objc_msgSend(v6, "setFrame:");
  }
  [*(id *)(a1 + 32) _applyTextInsertContentInsets];
}

- (void)setDeviceOrientation:(int64_t)a3
{
}

- (void)setDeviceOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_deviceOrientation != a3)
  {
    BOOL v4 = a4;
    self->_deviceOrientation = a3;
    id v8 = [(CAMFullscreenViewfinder *)self _orientationInstructionView];
    BOOL v7 = v4 && [(CAMFullscreenViewfinder *)self isOrientationInstructionVisible];
    [v8 setOrientation:a3 animated:v7];
  }
}

- (void)setShutterControlVisible:(BOOL)a3
{
}

- (void)setShutterControlVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_shutterControlVisible != a3)
  {
    self->_shutterControlVisible = a3;
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:a4];
  }
}

- (void)setFlipButtonVisible:(BOOL)a3
{
}

- (void)setFlipButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_flipButtonVisible != a3)
  {
    self->_flipButtonVisible = a3;
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:a4];
  }
}

- (void)setPhotoVideoModeSwitchVisible:(BOOL)a3
{
}

- (void)setPhotoVideoModeSwitchVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_photoVideoModeSwitchVisible != a3)
  {
    self->_photoVideoModeSwitchVisible = a3;
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:a4];
  }
}

- (void)setSystemOverlayVisible:(BOOL)a3
{
}

- (void)setSystemOverlayVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_systemOverlayVisible != a3)
  {
    self->_systemOverlayVisible = a3;
    [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:a4];
  }
}

- (void)setZoomControlVisible:(BOOL)a3
{
}

- (void)setZoomControlVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_zoomControlVisible != a3)
  {
    BOOL v4 = a4;
    if (a4) {
      [(CAMFullscreenViewfinder *)self layoutIfNeeded];
    }
    self->_zoomControlVisible = a3;
    [(CAMFullscreenViewfinder *)self _setNeedsLayoutAnimated:v4];
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
  }
}

- (void)setZoomStyle:(unint64_t)a3
{
  if (self->_zoomStyle == a3) {
    return;
  }
  self->_zoomStyle = a3;
  if (a3 == 1)
  {
    id v8 = [[CAMZoomControl alloc] initWithLayoutStyle:4];
    [(CAMFullscreenViewfinder *)self _setZoomControl:v8];

    self->_zoomControlVisible = 1;
    long long v9 = [(CAMFullscreenViewfinder *)self _contentViewBelowShutter];
    long long v10 = [(CAMFullscreenViewfinder *)self zoomControl];
    [v9 addSubview:v10];
  }
  else
  {
    if (a3 == 2)
    {
      BOOL v4 = [(CAMFullscreenViewfinder *)self zoomControl];
      [v4 removeFromSuperview];

      [(CAMFullscreenViewfinder *)self _setZoomControl:0];
      double v5 = [[CAMZoomSlider alloc] initWithLayoutStyle:0];
      [(CAMFullscreenViewfinder *)self _setZoomSlider:v5];

      id v13 = [(CAMFullscreenViewfinder *)self _contentView];
      long long v6 = [(CAMFullscreenViewfinder *)self zoomSlider];
      BOOL v7 = [(CAMFullscreenViewfinder *)self _modeClippingView];
      [v13 insertSubview:v6 belowSubview:v7];

      return;
    }
    long long v11 = [(CAMFullscreenViewfinder *)self zoomControl];
    [v11 removeFromSuperview];

    [(CAMFullscreenViewfinder *)self _setZoomControl:0];
  }
  long long v12 = [(CAMFullscreenViewfinder *)self zoomSlider];
  [v12 removeFromSuperview];

  [(CAMFullscreenViewfinder *)self _setZoomSlider:0];
}

- (void)setVisiblePreviewSuggestionButton:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_visibleSuggestionButtonType == a3) {
    return;
  }
  BOOL v4 = a4;
  self->_visibleSuggestionButtonType = a3;
  long long v9 = [(CAMFullscreenViewfinder *)self _previewSuggestionButton];
  if (!v9)
  {
    switch(a3)
    {
      case 3:
        long long v9 = objc_alloc_init(CAMSpatialCaptureButton);
        -[CAMFullscreenViewfinder _setSpatialCaptureButton:](self, "_setSpatialCaptureButton:");
        BOOL v7 = [(CAMFullscreenViewfinder *)self delegate];
        [v7 fullscreenViewfinderDidCreateSpatialCaptureButton:self];
        break;
      case 2:
        long long v9 = objc_alloc_init(CAMDepthEffectSuggestionButton);
        -[CAMFullscreenViewfinder _setDepthEffectSuggestionButton:](self, "_setDepthEffectSuggestionButton:");
        BOOL v7 = [(CAMFullscreenViewfinder *)self delegate];
        [v7 fullscreenViewfinderDidCreateDepthEffectSuggestionButton:self];
        break;
      case 1:
        long long v9 = objc_alloc_init(CAMAutoMacroButton);
        -[CAMFullscreenViewfinder _setAutoMacroButton:](self, "_setAutoMacroButton:");
        BOOL v7 = [(CAMFullscreenViewfinder *)self delegate];
        [v7 fullscreenViewfinderDidCreateAutoMacroButton:self];
        break;
      default:
        long long v9 = 0;
LABEL_11:
        [(CAMCircleButton *)v9 setOrientation:[(CAMFullscreenViewfinder *)self orientation]];
        id v8 = [(CAMFullscreenViewfinder *)self _contentView];
        [v8 addSubview:v9];

        if (v4) {
          [(CAMSpatialCaptureButton *)v9 setAlpha:0.0];
        }
        goto LABEL_13;
    }

    goto LABEL_11;
  }
LABEL_13:
  [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
}

- (CAMCircleButton)_previewSuggestionButton
{
  int64_t v3 = [(CAMFullscreenViewfinder *)self visibleSuggestionButtonType];
  switch(v3)
  {
    case 3:
      BOOL v4 = [(CAMFullscreenViewfinder *)self spatialCaptureButton];
      break;
    case 2:
      BOOL v4 = [(CAMFullscreenViewfinder *)self depthEffectSuggestionButton];
      break;
    case 1:
      BOOL v4 = [(CAMFullscreenViewfinder *)self autoMacroButton];
      break;
    default:
      BOOL v4 = 0;
      break;
  }
  return (CAMCircleButton *)v4;
}

- (void)setElapsedTimeViewVisible:(BOOL)a3
{
}

- (void)setElapsedTimeViewVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_elapsedTimeViewVisible != a3)
  {
    BOOL v4 = a4;
    if (a3)
    {
      BOOL v7 = [(CAMFullscreenViewfinder *)self elapsedTimeView];

      if (!v7)
      {
        id v8 = objc_alloc_init(CAMElapsedTimeView);
        elapsedTimeView = self->_elapsedTimeView;
        self->_elapsedTimeView = v8;

        long long v10 = [(CAMFullscreenViewfinder *)self _modulatingContentView];
        [v10 addSubview:self->_elapsedTimeView];

        if (v4) {
          [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:0];
        }
      }
      [(CAMFullscreenViewfinder *)self _frameForReticleViewport];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      BOOL v19 = [(CAMFullscreenViewfinder *)self elapsedTimeView];
      BOOL v20 = [(CAMFullscreenViewfinder *)self _layout];
      BOOL v21 = self->_elapsedTimeView;
      int64_t v22 = [(CAMFullscreenViewfinder *)self orientation];
      BOOL v23 = [(CAMFullscreenViewfinder *)self isSystemOverlayVisible];
      if (v20)
      {
        objc_msgSend(v20, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", v21, v22, v23, v12, v14, v16, v18);
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
      }
      CAMViewSetGeometry(v19, (uint64_t)&v24);
    }
    if (v4) {
      [(CAMFullscreenViewfinder *)self layoutIfNeeded];
    }
    self->_elapsedTimeViewVisible = a3;
    -[CAMFullscreenViewfinder _setNeedsLayoutAnimated:](self, "_setNeedsLayoutAnimated:", v4, v24, v25, v26, v27, v28, v29);
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
  }
}

- (void)setTimerIndicatorVisible:(BOOL)a3
{
}

- (void)setTimerIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_timerIndicatorVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    id v8 = [(CAMFullscreenViewfinder *)self timerIndicator];
    if (!v8 && v5)
    {
      id v8 = objc_alloc_init(CAMTimerIndicatorView);
      [(CAMTimerIndicatorView *)v8 setOrientation:[(CAMFullscreenViewfinder *)self orientation] animated:0];
      BOOL v7 = [(CAMFullscreenViewfinder *)self _contentView];
      [v7 addSubview:v8];

      [(CAMFullscreenViewfinder *)self _setTimerIndicator:v8];
      if (v4) {
        [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:0];
      }
    }
    self->_timerIndicatorVisible = v5;
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
  }
}

- (void)setPreviewAlignmentGuideVisible:(BOOL)a3
{
}

- (void)setPreviewAlignmentGuideVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_previewAlignmentGuideVisible != a3)
  {
    BOOL v4 = a4;
    if (a3 && !self->_previewAlignmentGuide)
    {
      BOOL v7 = objc_alloc_init(CAMPreviewAlignmentGuide);
      [(CAMFullscreenViewfinder *)self _setPreviewAlignmentGuide:v7];
      id v8 = [(CAMFullscreenViewfinder *)self _contentView];
      [v8 addSubview:v7];

      if (v4) {
        [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:0];
      }
    }
    self->_previewAlignmentGuideVisible = a3;
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
  }
}

- (void)setLegibilityBackgroundsVisible:(BOOL)a3
{
}

- (void)setLegibilityBackgroundsVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_legibilityBackgroundsVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    uint64_t v7 = [(CAMFullscreenViewfinder *)self _bottomLegibilityBackground];
    if (v5 && !v7)
    {
      id v9 = objc_alloc_init(MEMORY[0x263F82E00]);
      id v8 = [MEMORY[0x263F825C8] blackColor];
      [v9 setBackgroundColor:v8];

      [(CAMFullscreenViewfinder *)self _frameForBottomLegibilityBackground];
      objc_msgSend(v9, "setFrame:");
      [(CAMFullscreenViewfinder *)self _setBottomLegibilityBackground:v9];
      [(CAMFullscreenViewfinder *)self _insertBackgroundSubview:v9];
      if (v4) {
        [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:0];
      }
      uint64_t v7 = (uint64_t)v9;
    }
    id v10 = (id)v7;
    self->_legibilityBackgroundsVisible = v5;
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
  }
}

- (void)setSharedLibraryImageWellIndicatorVisible:(BOOL)a3
{
}

- (void)setSharedLibraryImageWellIndicatorVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_sharedLibraryImageWellIndicatorVisible != a3)
  {
    BOOL v4 = a4;
    BOOL v5 = a3;
    id v9 = [(CAMFullscreenViewfinder *)self sharedLibraryImageWellIndicatorView];
    if (!v9 && v5)
    {
      uint64_t v7 = [CAMSharedLibraryImageWellIndicatorView alloc];
      id v9 = -[CAMSharedLibraryImageWellIndicatorView initWithFrame:](v7, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      [(CAMInstructionLabel *)v9 setDelegate:self];
      id v8 = [(CAMFullscreenViewfinder *)self _contentView];
      [v8 addSubview:v9];

      [(CAMFullscreenViewfinder *)self _setSharedLibraryImageWellIndicatorView:v9];
      if (v4) {
        [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:0];
      }
    }
    self->_sharedLibraryImageWellIndicatorVisible = v5;
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
  }
}

- (void)setPreviewView:(id)a3
{
  BOOL v5 = (CAMPreviewView *)a3;
  p_previewView = &self->_previewView;
  previewView = self->_previewView;
  if (previewView != v5)
  {
    double v14 = v5;
    id v8 = [(CAMPreviewView *)previewView superview];

    if (v8 == self) {
      [(CAMPreviewView *)*p_previewView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_previewView, a3);
    unint64_t v9 = [(CAMFullscreenViewfinder *)self interfaceModulation];
    id v10 = [(CAMPreviewView *)*p_previewView indicatorContainerView];
    [v10 setInterfaceModulation:v9];

    double v11 = [(CAMPreviewView *)v14 videoPreviewLayer];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v12 = v11;
    }
    else {
      double v12 = 0;
    }
    [(CAMFullscreenViewfinder *)self _setOverCapturePreviewLayer:v12];
    double v13 = [(CAMFullscreenViewfinder *)self _previewContainerView];
    [v13 addSubview:v14];

    BOOL v5 = v14;
  }
  MEMORY[0x270F9A758](previewView, v5);
}

- (void)setPanoramaView:(id)a3
{
  BOOL v5 = (CAMPanoramaView *)a3;
  panoramaView = self->_panoramaView;
  if (panoramaView != v5)
  {
    double v12 = v5;
    uint64_t v7 = [(CAMPanoramaView *)panoramaView superview];

    if (v7 == self) {
      [(CAMPanoramaView *)self->_panoramaView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_panoramaView, a3);
    modeSelector = self->_modeSelector;
    unint64_t v9 = [(CAMFullscreenViewfinder *)self _modulatingContentView];
    id v10 = v9;
    if (modeSelector)
    {
      double v11 = [(CAMFullscreenViewfinder *)self modeSelector];
      [v10 insertSubview:v12 belowSubview:v11];
    }
    else
    {
      [v9 addSubview:v12];
    }

    BOOL v5 = v12;
  }
  MEMORY[0x270F9A758](panoramaView, v5);
}

- (void)setPanoramaCaptureSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  long long v6 = [(CAMFullscreenViewfinder *)self panoramaView];
  objc_msgSend(v6, "setPanoramaCaptureSize:", width, height);

  [(CAMFullscreenViewfinder *)self setNeedsLayout];
}

- (CGSize)panoramaCaptureSize
{
  double v2 = [(CAMFullscreenViewfinder *)self panoramaView];
  [v2 panoramaCaptureSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setTrueVideoState:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (self->_trueVideoState != a3)
  {
    self->_trueVideoState = a3;
    if (a3 > 3) {
      double v3 = 0;
    }
    else {
      double v3 = off_263FA04A0[a3];
    }
    double v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138543362;
      double v6 = v3;
      _os_log_impl(&dword_2099F8000, v4, OS_LOG_TYPE_DEFAULT, "True Video state updated to: %{public}@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)setDescriptionOverlayView:(id)a3 forKey:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  uint64_t v7 = [(CAMFullscreenViewfinder *)self _descriptionOverlayViewByKey];
  id v8 = [v7 objectForKeyedSubscript:v6];
  if (v8 != v10)
  {
    unint64_t v9 = [v8 superview];

    if (v9 == self) {
      [v8 removeFromSuperview];
    }
    [v7 setObject:v10 forKeyedSubscript:v6];
    objc_msgSend(v10, "setOrientation:", -[CAMFullscreenViewfinder orientation](self, "orientation"));
    [v10 setBlackoutFrameVisible:0];
    [(CAMFullscreenViewfinder *)self _insertBackgroundSubview:v10];
  }
}

- (id)descriptionOverlayViewForKey:(id)a3
{
  id v4 = a3;
  int v5 = [(CAMFullscreenViewfinder *)self _descriptionOverlayViewByKey];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6;
}

- (void)setDisabledModeOverlayView:(id)a3
{
  int v5 = (CAMDisabledModeOverlayView *)a3;
  p_disabledModeOverlayView = &self->_disabledModeOverlayView;
  disabledModeOverlayView = self->_disabledModeOverlayView;
  if (disabledModeOverlayView != v5)
  {
    unint64_t v9 = v5;
    id v8 = [(CAMDisabledModeOverlayView *)disabledModeOverlayView superview];

    if (v8 == self) {
      [(CAMDisabledModeOverlayView *)*p_disabledModeOverlayView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_disabledModeOverlayView, a3);
    [(CAMDisabledModeOverlayView *)*p_disabledModeOverlayView setOrientation:[(CAMFullscreenViewfinder *)self orientation]];
    disabledModeOverlayView = (CAMDisabledModeOverlayView *)[(CAMFullscreenViewfinder *)self _insertBackgroundSubview:v9];
    int v5 = v9;
  }
  MEMORY[0x270F9A758](disabledModeOverlayView, v5);
}

- (void)setMaterial:(int64_t)a3
{
}

- (void)setMaterial:(int64_t)a3 withDuration:(double)a4
{
  if (self->_material != a3)
  {
    self->_material = a3;
    uint64_t v7 = [(CAMFullscreenViewfinder *)self _reticleView];
    [v7 setMaterial:a3 withDuration:a4];

    id v8 = [(CAMFullscreenViewfinder *)self semanticStylePicker];
    [v8 setMaterial:a3 withDuration:a4];

    unint64_t v9 = [(CAMFullscreenViewfinder *)self smartStylePicker];
    [v9 setMaterial:a3 withDuration:a4];

    [(CAMFullscreenViewfinder *)self _updateLightingControlClipping];
  }
}

- (unint64_t)interfaceModulation
{
  double v2 = [(CAMFullscreenViewfinder *)self _modulatingContentView];
  unint64_t v3 = [v2 interfaceModulation];

  return v3;
}

- (void)setInterfaceModulation:(unint64_t)a3
{
}

- (void)setInterfaceModulation:(unint64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(CAMFullscreenViewfinder *)self _modulatingContentView];
  id v8 = (void *)v7;
  if (a3 - 1 <= 1 && !v7)
  {
    unint64_t v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CAMFullscreenViewfinder setInterfaceModulation:animated:]((uint64_t)self, v9);
    }
  }
  [v8 setInterfaceModulation:a3 animated:v4];
  id v10 = [(CAMFullscreenViewfinder *)self previewView];
  double v11 = [v10 indicatorContainerView];
  [v11 setInterfaceModulation:a3 animated:v4];
}

- (void)setImageAnalysisButtonVisible:(BOOL)a3
{
}

- (void)setImageAnalysisButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_imageAnalysisButtonVisible != a3)
  {
    BOOL v4 = a4;
    self->_imageAnalysisButtonVisible = a3;
    id v6 = [(CAMFullscreenViewfinder *)self imageAnalysisButton];

    if (v6)
    {
      [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
    }
  }
}

- (void)setImageAnalysisButton:(id)a3
{
  id v11 = a3;
  int v5 = self;
  p_id imageAnalysisButton = (id *)&v5->_imageAnalysisButton;
  id imageAnalysisButton = v5->_imageAnalysisButton;
  if (imageAnalysisButton == v11)
  {
    id v8 = [v11 superview];

    if (v8 == v5) {
      goto LABEL_9;
    }
    id imageAnalysisButton = *p_imageAnalysisButton;
  }
  unint64_t v9 = [imageAnalysisButton superview];
  if (v9 == v5)
  {
    id v10 = *p_imageAnalysisButton;

    if (v10 != v11) {
      [*p_imageAnalysisButton removeFromSuperview];
    }
  }
  else
  {
  }
  objc_storeStrong(p_imageAnalysisButton, a3);
  objc_msgSend(*p_imageAnalysisButton, "setCameraModeBackgroundColor:", objc_msgSend(MEMORY[0x263F825C8], "colorWithWhite:alpha:", 0.0, 0.5));
  [(CAMFullscreenViewfinder *)v5 addSubview:v11];
  [(CAMFullscreenViewfinder *)v5 _updateSubviewsVisibilityAnimated:0];
LABEL_9:
}

- (void)setExternalStorageButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_externalStorageButtonVisible != a3)
  {
    BOOL v4 = a4;
    self->_externalStorageButtonVisible = a3;
    if (a3)
    {
      id v6 = [(CAMFullscreenViewfinder *)self externalStorageButton];

      if (!v6) {
        [(CAMFullscreenViewfinder *)self _createExternalStorageButton];
      }
    }
    [(CAMFullscreenViewfinder *)self _updateSubviewsVisibilityAnimated:v4];
  }
}

- (void)setExternalStorageButtonVisible:(BOOL)a3
{
}

- (void)_createExternalStorageButton
{
  unint64_t v3 = [CAMExternalStorageButton alloc];
  BOOL v4 = -[CAMExternalStorageButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  externalStorageButton = self->_externalStorageButton;
  self->_externalStorageButton = v4;
  id v6 = v4;

  uint64_t v7 = [(CAMFullscreenViewfinder *)self _contentView];
  [v7 addSubview:v6];

  id v8 = [(CAMFullscreenViewfinder *)self delegate];
  [v8 fullscreenViewfinderDidCreateExternalStorageButton:self];
}

- (void)setTextInteractionInsert:(id)a3
{
  BOOL v4 = (VKTextLiftingView *)a3;
  textInteractionInsert = self->_textInteractionInsert;
  if (textInteractionInsert != v4)
  {
    [(VKTextLiftingView *)textInteractionInsert removeFromSuperview];
    self->_textInteractionInsert = v4;
    id v6 = self;
    uint64_t v7 = [(CAMFullscreenViewfinder *)v6 imageAnalysisButton];
    if (v4)
    {
      [(CAMFullscreenViewfinder *)v6 insertSubview:v4 belowSubview:v7];
      [(CAMFullscreenViewfinder *)v6 _frameForReticleViewport];
      -[CAMFullscreenViewfinder _geometryForTextInteractionInsertWithViewport:](v6, "_geometryForTextInteractionInsertWithViewport:");
      CAMViewSetGeometry(v4, (uint64_t)&v9);
      [v7 backgroundDiameter];
      -[VKTextLiftingView setPreferredQuickActionButtonHeight:](v4, "setPreferredQuickActionButtonHeight:");
      id v8 = [(VKTextLiftingView *)v4 actionInfoView];
      if (v8)
      {
        [(CAMFullscreenViewfinder *)v6 _frameForActionInfoView];
        objc_msgSend(v8, "setFrame:");
      }
      [(CAMFullscreenViewfinder *)v6 _applyTextInsertContentInsets];
    }
  }
}

- (void)adoptMachineReadableCodeButton:(id)a3 fromOriginalParent:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(CAMFullscreenViewfinder *)self machineReadableCodeButton];
  id v11 = (void *)v10;
  if ((id)v10 == v8)
  {
    double v13 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CAMFullscreenViewfinder adoptMachineReadableCodeButton:fromOriginalParent:animated:](v13);
    }
  }
  else
  {
    if (v10) {
      [(CAMFullscreenViewfinder *)self dismissMachineReadableCodeButtonAnimated:v5];
    }
    [(CAMFullscreenViewfinder *)self _setMachineReadableCodeButton:v8];
    if (v9) {
      BOOL v12 = v5;
    }
    else {
      BOOL v12 = 0;
    }
    double v13 = [(CAMFullscreenViewfinder *)self _modulatingContentView];
    if (v12)
    {
      [v8 center];
      objc_msgSend(v9, "convertPoint:toView:", v13);
      objc_msgSend(v8, "setCenter:");
    }
    else if (v5)
    {
      [v8 setAlpha:0.0];
    }
    [v8 setDismissable:1];
    [v8 setDelegate:self];
    [v13 addSubview:v8];
    if (v12)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __86__CAMFullscreenViewfinder_adoptMachineReadableCodeButton_fromOriginalParent_animated___block_invoke;
      v17[3] = &unk_263FA0208;
      v17[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:2 delay:v17 usingSpringWithDamping:0 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
    }
    else if (v5)
    {
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __86__CAMFullscreenViewfinder_adoptMachineReadableCodeButton_fromOriginalParent_animated___block_invoke_2;
      v14[3] = &unk_263FA0408;
      id v15 = v8;
      double v16 = self;
      +[CAMView animateIfNeededWithDuration:v14 animations:0.3];
    }
  }
}

uint64_t __86__CAMFullscreenViewfinder_adoptMachineReadableCodeButton_fromOriginalParent_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __86__CAMFullscreenViewfinder_adoptMachineReadableCodeButton_fromOriginalParent_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  double v2 = *(void **)(a1 + 40);
  return [v2 _updateSubviewsVisibilityAnimated:0];
}

- (void)dismissMachineReadableCodeButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CAMFullscreenViewfinder *)self machineReadableCodeButton];
  if (v5)
  {
    [(CAMFullscreenViewfinder *)self _setMachineReadableCodeButton:0];
    if (v3) {
      double v6 = 0.3;
    }
    else {
      double v6 = 0.0;
    }
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__CAMFullscreenViewfinder_dismissMachineReadableCodeButtonAnimated___block_invoke;
    v12[3] = &unk_263FA0208;
    id v13 = v5;
    uint64_t v7 = MEMORY[0x263EF8330];
    uint64_t v8 = 3221225472;
    id v9 = __68__CAMFullscreenViewfinder_dismissMachineReadableCodeButtonAnimated___block_invoke_2;
    uint64_t v10 = &unk_263FA0430;
    id v11 = v13;
    +[CAMView animateIfNeededWithDuration:v12 animations:&v7 completion:v6];
    -[CAMFullscreenViewfinder _updateSubviewsVisibilityAnimated:](self, "_updateSubviewsVisibilityAnimated:", v3, v7, v8, v9, v10);
  }
}

uint64_t __68__CAMFullscreenViewfinder_dismissMachineReadableCodeButtonAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __68__CAMFullscreenViewfinder_dismissMachineReadableCodeButtonAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)machineReadableCodeButtonDidTapDismiss:(id)a3
{
  id v4 = a3;
  id v5 = [(CAMFullscreenViewfinder *)self machineReadableCodeButton];

  if (v5 == v4)
  {
    double v6 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_2099F8000, v6, OS_LOG_TYPE_DEFAULT, "Tapped to dismiss MRC button", v7, 2u);
    }

    [(CAMFullscreenViewfinder *)self dismissMachineReadableCodeButtonAnimated:1];
  }
}

- (void)removeInflightBlurAnimations
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v2 = [(CAMFullscreenViewfinder *)self _previewContainerView];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = objc_msgSend(v2, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 removeInflightBlurAnimations];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)prepareForResumingUsingCrossfade
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  double v2 = [(CAMFullscreenViewfinder *)self _previewContainerView];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  BOOL v3 = objc_msgSend(v2, "subviews", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v8 prepareForResumingUsingCrossfade];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)touchingRecognizersToCancel
{
  double v2 = [(CAMFullscreenViewfinder *)self controlDrawer];
  BOOL v3 = [v2 touchingRecognizersToCancel];

  return v3;
}

- (void)_iterateViewsForHUDManager:(id)a3 withItemFoundBlock:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v6 = (void (**)(id, void *))a4;
  [a3 locationOfAccessibilityGestureInView:self];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  long long v11 = [MEMORY[0x263EFF980] array];
  long long v12 = [(CAMFullscreenViewfinder *)self controlStatusBar];
  [v11 addObject:v12];

  if ([(CAMFullscreenViewfinder *)self isFlipButtonVisible])
  {
    id v13 = [(CAMFullscreenViewfinder *)self flipButton];
    [v11 addObject:v13];
  }
  if ([(CAMFullscreenViewfinder *)self _showControlDrawer])
  {
    uint64_t v14 = [(CAMFullscreenViewfinder *)self controlDrawer];
    [v11 addObject:v14];
  }
  if ([(CAMFullscreenViewfinder *)self _showModeView])
  {
    id v15 = [(CAMFullscreenViewfinder *)self modeDial];
    [v11 addObject:v15];
  }
  double v16 = [(CAMFullscreenViewfinder *)self creativeCameraButton];

  if (v16)
  {
    double v17 = [(CAMFullscreenViewfinder *)self creativeCameraButton];
    [v11 addObject:v17];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v18 = v11;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v25 != v21) {
          objc_enumerationMutation(v18);
        }
        BOOL v23 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_msgSend(v23, "bounds", (void)v24);
        -[CAMFullscreenViewfinder convertRect:fromView:](self, "convertRect:fromView:", v23);
        v30.double x = v8;
        v30.double y = v10;
        if (CGRectContainsPoint(v31, v30))
        {
          v6[2](v6, v23);
          goto LABEL_19;
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_19:
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  id v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__CAMFullscreenViewfinder_hudItemForAccessibilityHUDManager___block_invoke;
  v8[3] = &unk_263FA0458;
  CGFloat v10 = &v11;
  id v5 = v4;
  id v9 = v5;
  [(CAMFullscreenViewfinder *)self _iterateViewsForHUDManager:v5 withItemFoundBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

uint64_t __61__CAMFullscreenViewfinder_hudItemForAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 hudItemForAccessibilityHUDManager:*(void *)(a1 + 32)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void *)(v4 + 40);
  *(void *)(v4 + 40) = v3;
  return MEMORY[0x270F9A758](v3, v5);
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __61__CAMFullscreenViewfinder_selectedByAccessibilityHUDManager___block_invoke;
  v6[3] = &unk_263FA0480;
  id v7 = v4;
  id v5 = v4;
  [(CAMFullscreenViewfinder *)self _iterateViewsForHUDManager:v5 withItemFoundBlock:v6];
}

uint64_t __61__CAMFullscreenViewfinder_selectedByAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2)
{
  return [a2 selectedByAccessibilityHUDManager:*(void *)(a1 + 32)];
}

- (BOOL)shouldAccessibilityGestureBeginForHUDManager:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__CAMFullscreenViewfinder_shouldAccessibilityGestureBeginForHUDManager___block_invoke;
  v7[3] = &unk_263FA0458;
  id v9 = &v10;
  id v5 = v4;
  id v8 = v5;
  [(CAMFullscreenViewfinder *)self _iterateViewsForHUDManager:v5 withItemFoundBlock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __72__CAMFullscreenViewfinder_shouldAccessibilityGestureBeginForHUDManager___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 != 0;
  id v4 = v3;
  if (objc_opt_respondsToSelector()) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 shouldAccessibilityGestureBeginForHUDManager:*(void *)(a1 + 32)];
  }
}

- (void)_handleTransientViewTimerFired:(id)a3
{
  int64_t v4 = [(CAMFullscreenViewfinder *)self spotlightControl];
  id v5 = [(CAMFullscreenViewfinder *)self _transientViewTimer];
  [v5 invalidate];

  [(CAMFullscreenViewfinder *)self _setTransientViewTimer:0];
  if (v4 == 1)
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __58__CAMFullscreenViewfinder__handleTransientViewTimerFired___block_invoke;
    v6[3] = &unk_263FA0208;
    void v6[4] = self;
    [(CAMFullscreenViewfinder *)self _animateQuietUIActive:0 animations:v6 completion:0];
  }
}

void __58__CAMFullscreenViewfinder__handleTransientViewTimerFired___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _transientCaptureContentView];
  [v1 setAlpha:0.0];
}

- (int)presentationStyleForAppearingThumbnailImage
{
  int64_t v3 = [(CAMFullscreenViewfinder *)self spotlightControl];
  int64_t v4 = [(CAMFullscreenViewfinder *)self _transientViewTimer];

  if (v3 == 1)
  {
    id v5 = [(CAMFullscreenViewfinder *)self _transientViewTimer];
    [v5 invalidate];

    [(CAMFullscreenViewfinder *)self _setTransientViewTimer:0];
    id v6 = [(CAMFullscreenViewfinder *)self _transientCaptureContentView];
    [v6 setAlpha:1.0];

    id v7 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel__handleTransientViewTimerFired_ selector:0 userInfo:0 repeats:2.0];
    [(CAMFullscreenViewfinder *)self _setTransientViewTimer:v7];

    id v8 = [MEMORY[0x263EFF9F0] currentRunLoop];
    id v9 = [(CAMFullscreenViewfinder *)self _transientViewTimer];
    [v8 addTimer:v9 forMode:*MEMORY[0x263EFF588]];
  }
  return !v4 && v3 == 1;
}

- (CAMFullscreenViewfinderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMFullscreenViewfinderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isControlDrawerAllowed
{
  return self->_controlDrawerAllowed;
}

- (BOOL)isModeUIAllowed
{
  return self->_modeUIAllowed;
}

- (BOOL)isControlDrawerExpanded
{
  return self->_controlDrawerExpanded;
}

- (void)setControlDrawerExpanded:(BOOL)a3
{
  self->_controlDrawerExpanded = a3;
}

- (BOOL)isShutterButtonVisible
{
  return self->_shutterControlVisible;
}

- (BOOL)isFlipButtonVisible
{
  return self->_flipButtonVisible;
}

- (BOOL)isZoomControlVisible
{
  return self->_zoomControlVisible;
}

- (unint64_t)zoomStyle
{
  return self->_zoomStyle;
}

- (BOOL)isElapsedTimeViewVisible
{
  return self->_elapsedTimeViewVisible;
}

- (BOOL)isTimerIndicatorVisible
{
  return self->_timerIndicatorVisible;
}

- (BOOL)isPreviewAlignmentGuideVisible
{
  return self->_previewAlignmentGuideVisible;
}

- (BOOL)isLegibilityBackgroundsVisible
{
  return self->_legibilityBackgroundsVisible;
}

- (BOOL)isSharedLibraryImageWellIndicatorVisible
{
  return self->_sharedLibraryImageWellIndicatorVisible;
}

- (BOOL)isModeSwitchVisible
{
  return self->_photoVideoModeSwitchVisible;
}

- (BOOL)isSystemOverlayVisible
{
  return self->_systemOverlayVisible;
}

- (int64_t)visibleInstructionLabel
{
  return self->_visibleInstructionLabel;
}

- (int64_t)visibleSecondaryInstructionLabel
{
  return self->_visibleSecondaryInstructionLabel;
}

- (void)setVisibleSecondaryInstructionLabel:(int64_t)a3
{
  self->_int64_t visibleSecondaryInstructionLabel = a3;
}

- (CAMPortraitModeInstructionLabel)portraitInstructionLabel
{
  return self->_portraitInstructionLabel;
}

- (void)_setPortraitInstructionLabel:(id)a3
{
}

- (CAMQRCodeInstructionLabel)qrCodeInstructionLabel
{
  return self->_qrCodeInstructionLabel;
}

- (void)_setQRCodeInstructionLabel:(id)a3
{
}

- (CAMFlashCompromisedInstructionLabel)flashCompromisedInstructionLabel
{
  return self->_flashCompromisedInstructionLabel;
}

- (void)_setFlashCompromisedInstructionLabel:(id)a3
{
}

- (CAMImageAnalysisInstructionLabel)imageAnalysisInstructionLabel
{
  return self->_imageAnalysisInstructionLabel;
}

- (void)_setImageAnalysisInstructionLabel:(id)a3
{
}

- (CAMMaxRecordingTimeInstructionLabel)maxRecordingTimeInstructionLabel
{
  return self->_maxRecordingTimeInstructionLabel;
}

- (void)_setMaxRecordingTimeInstructionLabel:(id)a3
{
}

- (CAMFreeResourcesInstructionLabel)freeResourcesInstructionLabel
{
  return self->_freeResourcesInstructionLabel;
}

- (void)_setFreeResourcesInstructionLabel:(id)a3
{
}

- (CAMSharedLibraryBadge)sharedLibraryInstructionLabel
{
  return self->_sharedLibraryInstructionLabel;
}

- (CAMDeviceTooHotInstructionLabel)deviceTooHotInstructionLabel
{
  return self->_deviceTooHotInstructionLabel;
}

- (void)_setDeviceTooHotInstructionLabel:(id)a3
{
}

- (CAMPreviewView)previewView
{
  return self->_previewView;
}

- (int64_t)previewViewOrientation
{
  return self->_previewViewOrientation;
}

- (void)setPreviewViewOrientation:(int64_t)a3
{
  self->_previewViewOrientation = a3;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (int64_t)deviceOrientation
{
  return self->_deviceOrientation;
}

- (int64_t)material
{
  return self->_material;
}

- (CAMPreviewAlignmentGuide)previewAlignmentGuide
{
  return self->_previewAlignmentGuide;
}

- (void)_setPreviewAlignmentGuide:(id)a3
{
}

- (CAMSemanticStylePicker)semanticStylePicker
{
  return self->_semanticStylePicker;
}

- (CAMControlDrawer)controlDrawer
{
  return self->_controlDrawer;
}

- (void)_setControlDrawer:(id)a3
{
}

- (CAMDynamicShutterControl)shutterControl
{
  return self->_shutterControl;
}

- (CAMControlStatusBar)controlStatusBar
{
  return self->_controlStatusBar;
}

- (CAMBadgeTray)badgeTray
{
  return self->_badgeTray;
}

- (CAMModeDial)modeDial
{
  return self->_modeDial;
}

- (CAMModeIndicatorView)modeIndicator
{
  return self->_modeIndicator;
}

- (CAMFullscreenModeSelector)modeSelector
{
  return self->_modeSelector;
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (CAMPhotoVideoModeSwitch)photoVideoModeSwitch
{
  return self->_photoVideoModeSwitch;
}

- (CAMImageWell)imageWell
{
  return self->_imageWell;
}

- (CAMZoomControl)zoomControl
{
  return self->_zoomControl;
}

- (void)_setZoomControl:(id)a3
{
}

- (CAMZoomSlider)zoomSlider
{
  return self->_zoomSlider;
}

- (void)_setZoomSlider:(id)a3
{
}

- (CAMElapsedTimeView)elapsedTimeView
{
  return self->_elapsedTimeView;
}

- (CAMTimerIndicatorView)timerIndicator
{
  return self->_timerIndicator;
}

- (void)_setTimerIndicator:(id)a3
{
}

- (CAMPanoramaView)panoramaView
{
  return self->_panoramaView;
}

- (CAMCreativeCameraButton)creativeCameraButton
{
  return self->_creativeCameraButton;
}

- (CAMSharedLibraryImageWellIndicatorView)sharedLibraryImageWellIndicatorView
{
  return self->_sharedLibraryImageWellIndicatorView;
}

- (void)_setSharedLibraryImageWellIndicatorView:(id)a3
{
}

- (CAMDisabledModeOverlayView)disabledModeOverlayView
{
  return self->_disabledModeOverlayView;
}

- (CAMFilterNameBadge)filterNameBadge
{
  return self->_filterNameBadge;
}

- (CAMSmartStyleNameBadge)smartStyleNameBadge
{
  return self->_smartStyleNameBadge;
}

- (PEPhotoStyleDPad)smartStyleSlider2D
{
  return self->_smartStyleSlider2D;
}

- (PEPhotoStylePaletteSlider)smartStyleIntensitySlider
{
  return self->_smartStyleIntensitySlider;
}

- (PEPhotoStyleValuesPlatterView)smartStyleValuesPlatterView
{
  return self->_smartStyleValuesPlatterView;
}

- (CAMSemanticStylePicker)smartStylePicker
{
  return self->_smartStylePicker;
}

- (BOOL)smartStyleControlsVisible
{
  return self->_smartStyleControlsVisible;
}

- (BOOL)wantsSmartStyleIntensitySlider
{
  return self->_wantsSmartStyleIntensitySlider;
}

- (BOOL)wantsSmartStyleResetButton
{
  return self->_wantsSmartStyleResetButton;
}

- (BOOL)wantsSmartStylePicker
{
  return self->_wantsSmartStylePicker;
}

- (CAMSmartStyleCategoryInstructionLabel)smartStyleCategoryInstructionLabel
{
  return self->_smartStyleCategoryInstructionLabel;
}

- (CAMSmartStyleStatusIndicator)spotlightSmartStyleStatusIndicator
{
  return self->_spotlightSmartStyleStatusIndicator;
}

- (BOOL)isOverlayStyleControlActive
{
  return self->_overlayStyleControlActive;
}

- (BOOL)isPortraitControlsAllowed
{
  return self->_portraitControlsAllowed;
}

- (int64_t)shallowDepthOfFieldStatus
{
  return self->_shallowDepthOfFieldStatus;
}

- (CEKLightingControl)lightingControl
{
  return self->_lightingControl;
}

- (CEKLightingNameBadge)lightingNameBadge
{
  return self->_lightingNameBadge;
}

- (BOOL)lightingNameBadgesHidden
{
  return self->_lightingNameBadgesHidden;
}

- (int64_t)viewportAspectRatio
{
  return self->_viewportAspectRatio;
}

- (UILongPressGestureRecognizer)modeSelectorGestureRecognizer
{
  return self->_modeSelectorGestureRecognizer;
}

- (CAMImageAnalysisButton)imageAnalysisButton
{
  return self->_imageAnalysisButton;
}

- (BOOL)isImageAnalysisButtonVisible
{
  return self->_imageAnalysisButtonVisible;
}

- (VKTextLiftingView)textInteractionInsert
{
  return self->_textInteractionInsert;
}

- (CAMMachineReadableCodeButton)machineReadableCodeButton
{
  return self->_machineReadableCodeButton;
}

- (void)_setMachineReadableCodeButton:(id)a3
{
}

- (CAMExternalStorageButton)externalStorageButton
{
  return self->_externalStorageButton;
}

- (BOOL)isExternalStorageButtonVisible
{
  return self->_externalStorageButtonVisible;
}

- (CAMAutoMacroButton)autoMacroButton
{
  return self->_autoMacroButton;
}

- (void)_setAutoMacroButton:(id)a3
{
}

- (CAMDepthEffectSuggestionButton)depthEffectSuggestionButton
{
  return self->_depthEffectSuggestionButton;
}

- (void)_setDepthEffectSuggestionButton:(id)a3
{
}

- (int64_t)visibleSuggestionButtonType
{
  return self->_visibleSuggestionButtonType;
}

- (void)setVisibleSuggestionButtonType:(int64_t)a3
{
  self->_visibleSuggestionButtonType = a3;
}

- (int64_t)spotlightControl
{
  return self->_spotlightControl;
}

- (CAMSpotlightControlPanel)spotlightControlPanel
{
  return self->_spotlightControlPanel;
}

- (void)_setSpotlightControlPanel:(id)a3
{
}

- (CAMSpatialCaptureButton)spatialCaptureButton
{
  return self->_spatialCaptureButton;
}

- (void)_setSpatialCaptureButton:(id)a3
{
}

- (BOOL)isOrientationInstructionVisible
{
  return self->_orientationInstructionVisible;
}

- (BOOL)isOrientationInstructionBackgroundBlurred
{
  return self->_orientationInstructionBackgroundBlurred;
}

- (CAMSpatialCaptureRecordingIndicator)spatialCaptureRecordingIndicator
{
  return self->_spatialCaptureRecordingIndicator;
}

- (void)_setSpatialCaptureRecordingIndicator:(id)a3
{
}

- (BOOL)isSpatialCaptureRecordingIndicatorVisible
{
  return self->_spatialCaptureRecordingIndicatorVisible;
}

- (CAMSpatialCaptureInstructionLabel)spatialCaptureInstructionLabel
{
  return self->_spatialCaptureInstructionLabel;
}

- (void)_setSpatialCaptureInstructionLabel:(id)a3
{
}

- (int64_t)stereoCaptureStatus
{
  return self->_stereoCaptureStatus;
}

- (BOOL)useHoldStillStereoLowLightInstruction
{
  return self->_useHoldStillStereoLowLightInstruction;
}

- (unint64_t)trueVideoState
{
  return self->_trueVideoState;
}

- (BOOL)useSlowerTrueVideoTransitionAnimationDuration
{
  return self->_useSlowerTrueVideoTransitionAnimationDuration;
}

- (void)setUseSlowerTrueVideoTransitionAnimationDuration:(BOOL)a3
{
  self->_useSlowerTrueVideoTransitionAnimationDuration = a3;
}

- (UIView)_previewContainerView
{
  return self->__previewContainerView;
}

- (UIView)_modeClippingView
{
  return self->__modeClippingView;
}

- (CAMViewfinderReticleView)_reticleView
{
  return self->__reticleView;
}

- (NSMutableDictionary)_badgesForSpotlightControls
{
  return self->__badgesForSpotlightControls;
}

- (UIView)_textInteractionBackground
{
  return self->__textInteractionBackground;
}

- (void)_setTextInteractionBackground:(id)a3
{
}

- (CAMLowLightInstructionLabel)_lowLightInstructionLabel
{
  return self->__lowLightInstructionLabel;
}

- (void)_setLowLightInstructionLabel:(id)a3
{
}

- (UIView)_bottomLegibilityBackground
{
  return self->__bottomLegibilityBackground;
}

- (void)_setBottomLegibilityBackground:(id)a3
{
}

- (CAMFullscreenViewfinderLayout)_layout
{
  return self->__layout;
}

- (BOOL)_isUsingCreativeCameraControls
{
  return self->__usingCreativeCameraControls;
}

- (BOOL)_isControlDrawerPresentedModally
{
  return self->__controlDrawerPresentedModally;
}

- (void)_setControlDrawerPresentedModally:(BOOL)a3
{
  self->__controlDrawerPresentedModalldouble y = a3;
}

- (AVSpatialOverCaptureVideoPreviewLayer)_overCapturePreviewLayer
{
  return self->__overCapturePreviewLayer;
}

- (void)_setOverCapturePreviewLayer:(id)a3
{
}

- (CEKAdditiveAnimator)_viewportAnimator
{
  return self->__viewportAnimator;
}

- (unint64_t)_inFlightLayoutAnimationCount
{
  return self->__inFlightLayoutAnimationCount;
}

- (void)set_inFlightLayoutAnimationCount:(unint64_t)a3
{
  self->__inFlightLayoutAnimationCount = a3;
}

- (UIView)_contentView
{
  return self->__contentView;
}

- (UIView)_contentViewBelowShutter
{
  return self->__contentViewBelowShutter;
}

- (CAMInterfaceModulationView)_modulatingContentView
{
  return self->__modulatingContentView;
}

- (UIView)_transientCaptureContentView
{
  return self->__transientCaptureContentView;
}

- (NSMutableDictionary)_descriptionOverlayViewByKey
{
  return self->__descriptionOverlayViewByKey;
}

- (UIView)_contentClippingContainer
{
  return self->__contentClippingContainer;
}

- (NSMutableArray)_semanticStyleBadges
{
  return self->__semanticStyleBadges;
}

- (NSMutableDictionary)_instructionLabelByValue
{
  return self->__instructionLabelByValue;
}

- (NSMutableArray)_createdPrimaryInstructionLabels
{
  return self->__createdPrimaryInstructionLabels;
}

- (NSMutableArray)_createdSecondaryInstructionLabels
{
  return self->__createdSecondaryInstructionLabels;
}

- (CAMOrientationInstructionView)_orientationInstructionView
{
  return self->__orientationInstructionView;
}

- (void)_setOrientationInstructionView:(id)a3
{
}

- (UITapGestureRecognizer)_smartStylesDismissalTapGestureRecognizer
{
  return self->__smartStylesDismissalTapGestureRecognizer;
}

- (void)set_smartStylesDismissalTapGestureRecognizer:(id)a3
{
}

- (NSTimer)_transientViewTimer
{
  return self->__transientViewTimer;
}

- (void)_setTransientViewTimer:(id)a3
{
}

- (double)_trueVideoModeSwitchToCaptureAnimationDurationOverride
{
  return self->__trueVideoModeSwitchToCaptureAnimationDurationOverride;
}

- (double)_trueVideoModeSwitchFromCaptureAnimationDurationOverride
{
  return self->__trueVideoModeSwitchFromCaptureAnimationDurationOverride;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__transientViewTimer, 0);
  objc_storeStrong((id *)&self->__smartStylesDismissalTapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__orientationInstructionView, 0);
  objc_storeStrong((id *)&self->__createdSecondaryInstructionLabels, 0);
  objc_storeStrong((id *)&self->__createdPrimaryInstructionLabels, 0);
  objc_storeStrong((id *)&self->__instructionLabelByValue, 0);
  objc_storeStrong((id *)&self->__semanticStyleBadges, 0);
  objc_storeStrong((id *)&self->__contentClippingContainer, 0);
  objc_storeStrong((id *)&self->__descriptionOverlayViewByKey, 0);
  objc_storeStrong((id *)&self->__transientCaptureContentView, 0);
  objc_storeStrong((id *)&self->__modulatingContentView, 0);
  objc_storeStrong((id *)&self->__contentViewBelowShutter, 0);
  objc_storeStrong((id *)&self->__contentView, 0);
  objc_storeStrong((id *)&self->__viewportAnimator, 0);
  objc_storeStrong((id *)&self->__overCapturePreviewLayer, 0);
  objc_storeStrong((id *)&self->__layout, 0);
  objc_storeStrong((id *)&self->__bottomLegibilityBackground, 0);
  objc_storeStrong((id *)&self->__lowLightInstructionLabel, 0);
  objc_storeStrong((id *)&self->__textInteractionBackground, 0);
  objc_storeStrong((id *)&self->__badgesForSpotlightControls, 0);
  objc_storeStrong((id *)&self->__reticleView, 0);
  objc_storeStrong((id *)&self->__modeClippingView, 0);
  objc_storeStrong((id *)&self->__previewContainerView, 0);
  objc_storeStrong((id *)&self->_spatialCaptureInstructionLabel, 0);
  objc_storeStrong((id *)&self->_spatialCaptureRecordingIndicator, 0);
  objc_storeStrong((id *)&self->_spatialCaptureButton, 0);
  objc_storeStrong((id *)&self->_spotlightControlPanel, 0);
  objc_storeStrong((id *)&self->_depthEffectSuggestionButton, 0);
  objc_storeStrong((id *)&self->_autoMacroButton, 0);
  objc_storeStrong((id *)&self->_externalStorageButton, 0);
  objc_storeStrong((id *)&self->_machineReadableCodeButton, 0);
  objc_storeStrong((id *)&self->_imageAnalysisButton, 0);
  objc_storeStrong((id *)&self->_modeSelectorGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lightingNameBadge, 0);
  objc_storeStrong((id *)&self->_lightingControl, 0);
  objc_storeStrong((id *)&self->_spotlightSmartStyleStatusIndicator, 0);
  objc_storeStrong((id *)&self->_smartStyleCategoryInstructionLabel, 0);
  objc_storeStrong((id *)&self->_smartStylePicker, 0);
  objc_storeStrong((id *)&self->_smartStyleValuesPlatterView, 0);
  objc_storeStrong((id *)&self->_smartStyleIntensitySlider, 0);
  objc_storeStrong((id *)&self->_smartStyleSlider2D, 0);
  objc_storeStrong((id *)&self->_smartStyleNameBadge, 0);
  objc_storeStrong((id *)&self->_filterNameBadge, 0);
  objc_storeStrong((id *)&self->_disabledModeOverlayView, 0);
  objc_storeStrong((id *)&self->_sharedLibraryImageWellIndicatorView, 0);
  objc_storeStrong((id *)&self->_creativeCameraButton, 0);
  objc_storeStrong((id *)&self->_panoramaView, 0);
  objc_storeStrong((id *)&self->_timerIndicator, 0);
  objc_storeStrong((id *)&self->_elapsedTimeView, 0);
  objc_storeStrong((id *)&self->_zoomSlider, 0);
  objc_storeStrong((id *)&self->_zoomControl, 0);
  objc_storeStrong((id *)&self->_imageWell, 0);
  objc_storeStrong((id *)&self->_photoVideoModeSwitch, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_modeSelector, 0);
  objc_storeStrong((id *)&self->_modeIndicator, 0);
  objc_storeStrong((id *)&self->_modeDial, 0);
  objc_storeStrong((id *)&self->_badgeTray, 0);
  objc_storeStrong((id *)&self->_controlStatusBar, 0);
  objc_storeStrong((id *)&self->_shutterControl, 0);
  objc_storeStrong((id *)&self->_controlDrawer, 0);
  objc_storeStrong((id *)&self->_semanticStylePicker, 0);
  objc_storeStrong((id *)&self->_previewAlignmentGuide, 0);
  objc_storeStrong((id *)&self->_previewView, 0);
  objc_storeStrong((id *)&self->_deviceTooHotInstructionLabel, 0);
  objc_storeStrong((id *)&self->_sharedLibraryInstructionLabel, 0);
  objc_storeStrong((id *)&self->_freeResourcesInstructionLabel, 0);
  objc_storeStrong((id *)&self->_maxRecordingTimeInstructionLabel, 0);
  objc_storeStrong((id *)&self->_imageAnalysisInstructionLabel, 0);
  objc_storeStrong((id *)&self->_flashCompromisedInstructionLabel, 0);
  objc_storeStrong((id *)&self->_qrCodeInstructionLabel, 0);
  objc_storeStrong((id *)&self->_portraitInstructionLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)requestPreviewUpdateForSemanticStyleAnimated:(os_log_t)log .cold.1(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "Expecting a CAMSemanticStyle", buf, 2u);
}

- (void)setInterfaceModulation:(uint64_t)a1 animated:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int64_t v3 = (objc_class *)objc_opt_class();
  int64_t v4 = NSStringFromClass(v3);
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_2099F8000, a2, OS_LOG_TYPE_ERROR, "Attempted to apply interface modulation to %{public}@ without configuring properly during initialization", (uint8_t *)&v5, 0xCu);
}

- (void)adoptMachineReadableCodeButton:(os_log_t)log fromOriginalParent:animated:.cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_2099F8000, log, OS_LOG_TYPE_ERROR, "FSVF attempted to adopt its own MRC button.", v1, 2u);
}

@end