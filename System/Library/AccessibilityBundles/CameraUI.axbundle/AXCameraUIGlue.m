@interface AXCameraUIGlue
+ (id)integerFormatter;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXCameraUIGlue

+ (id)integerFormatter
{
  if (integerFormatter_onceToken != -1) {
    dispatch_once(&integerFormatter_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)integerFormatter___integerFormatter;

  return v2;
}

uint64_t __34__AXCameraUIGlue_integerFormatter__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08A30]);
  v1 = (void *)integerFormatter___integerFormatter;
  integerFormatter___integerFormatter = (uint64_t)v0;

  v2 = (void *)integerFormatter___integerFormatter;

  return [v2 setPositiveFormat:@"0"];
}

+ (void)accessibilityInitializeBundle
{
  if (accessibilityInitializeBundle_onceToken != -1) {
    dispatch_once(&accessibilityInitializeBundle_onceToken, &__block_literal_global_381);
  }
}

void __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_385 withPreValidationHandler:&__block_literal_global_421 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_430];

  v1 = [MEMORY[0x263F21388] sharedInstance];
  [v1 addHandler:&__block_literal_global_718 forFramework:@"Photos"];

  v2 = [MEMORY[0x263F21388] sharedInstance];
  [v2 addHandler:&__block_literal_global_729 forFramework:@"PhotosUICore"];

  id v3 = [MEMORY[0x263F21388] sharedInstance];
  [v3 addHandler:&__block_literal_global_739 forFramework:@"PhotosUI"];
}

uint64_t __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"CAMUserPreferences"];
  objc_msgSend(v2, "validateClass:hasClassMethod:withFullSignature:", @"CAMUserPreferences", @"preferences", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMUserPreferences", @"shouldShowGridView", "B", 0);
  [v2 validateClass:@"CAMViewfinderViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_filterTypeForItemIndex:", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMViewfinderViewController", @"_apertureSliderDidChangeApertureValue:", "v", "@", 0);
  [v2 validateClass:@"CAMSemanticStyleControl"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStyleControl", @"semanticStyle", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"CAMSemanticStyle", @"displayName", "@", 0);

  return 1;
}

uint64_t __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"CameraUI AX Bundle"];
  [v2 setOverrideProcessName:@"CameraUI"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"CAMExpandableMenuButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMImageWellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMHDRButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMZoomSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMFlipButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMFilterButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMBottomBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMModeDialAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMCaptureEngineAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMPreviewViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMFlashButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMTimerButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMBurstIndicatorViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMPanoramaArrowViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMButtonLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMCaptureControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CUShutterButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMViewfinderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMImagePickerCameraViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMViewfinderViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMTopBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMExposureBiasSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMApplicationDelegateAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMElapsedTimeViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMLivePhotoButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMCameraViewControllerContainerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMPreviewViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMPanoramaViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMCameraViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMZoomControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMMotionControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMCreativeCameraButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMMessagesPhotosButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMIntensityButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSpatialCaptureButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMControlDrawerButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMControlDrawerMenuButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDynamicShutterControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerFlashButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerLivePhotoButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerAspectRatioButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerTimerButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMControlDrawerCustomButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerFilterButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerLowLightButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMControlDrawerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerHDRButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerApertureButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerIntensityButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMFullscreenViewfinderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMControlStatusBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMFlashStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMLivePhotoStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMHDRStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMFilterStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMTimerStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMApertureStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMIntensityStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMControlStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDirectionalIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMVideoConfigurationStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMLowLightSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMLowLightStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDescriptionOverlayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerExposureButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMExposureSliderAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMExposureBiasStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMZoomButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMRAWStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerRAWButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerSemanticStyleButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSemanticStyleControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSemanticStylePickerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSemanticStyleStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSemanticStyleDetailViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMAutoMacroButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMVideoStabilizationStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerVideoStabilizationButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSharedLibraryStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerSharedLibraryButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMProResStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSharedLibraryButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMPhotoFormatStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"_CAMExpandingControlButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDepthEffectSuggestionButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMExternalStorageButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMFocalLengthLabelAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMFlashExpandableStatusIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMExpandingControlAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSystemOverlayViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSpatialCaptureRecordingIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMPhotoVideoModeSwitchAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSmartStyleSettingsViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMDrawerSmartStyleButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"CAMSmartStyleStatusIndicatorAccessibility" canInteractWithTargetClass:1];
}

uint64_t __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_5()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_6()
{
  id v0 = (void *)MEMORY[0x263F811C8];
  id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.Photos"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];
}

uint64_t __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_7()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_8()
{
  id v0 = (void *)MEMORY[0x263F811C8];
  id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PhotosUICore"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];
}

uint64_t __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_9()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __47__AXCameraUIGlue_accessibilityInitializeBundle__block_invoke_10()
{
  id v0 = (void *)MEMORY[0x263F811C8];
  id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PhotosUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0];
}

@end