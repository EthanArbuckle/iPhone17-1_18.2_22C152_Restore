@interface AXPhotoLibraryFrameworkGlue
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPhotoLibraryFrameworkGlue

+ (void)accessibilityInitializeBundle
{
  if (!_Failover)
  {
    v2 = [MEMORY[0x263F21400] sharedInstance];
    [v2 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_437 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_446];

    uint64_t v3 = [objc_allocWithZone((Class)AXPhotoLibraryFrameworkGlue) init];
    v4 = (void *)_Failover;
    _Failover = v3;

    id v5 = [MEMORY[0x263F21388] sharedInstance];
    [v5 addHandler:&__block_literal_global_508 forFramework:@"MessageUI"];
  }
}

uint64_t __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"PLVideoRemaker"];
  [v2 validateClass:@"PLCropOverlayBottomBar"];
  [v2 validateClass:@"PLVideoView"];
  [v2 validateClass:@"PLExpandableImageView"];
  [v2 validateClass:@"PLProgressView"];
  [v2 validateClass:@"PLCropOverlay"];
  [v2 validateClass:@"PLUIImageViewController"];
  [v2 validateClass:@"PLManagedAsset" isKindOfClass:@"_PLManagedAsset"];
  [v2 validateClass:@"PLProgressView" isKindOfClass:@"UIView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIToolbar", @"delegate", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLCropOverlayBottomBar", @"_updatePreviewBottomBarForPlaybackState", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLProgressView", @"percentComplete", "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLProgressView", @"setPercentComplete:", "v", "f", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLVideoRemaker", @"cancel", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLVideoRemaker", @"_didEndRemakingWithTemporaryPath:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLUIImageViewController", @"cropOverlayWasOKed:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLVideoView", @"_showVideoOverlay", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLVideoView", @"_videoOverlayFadeOutDidFinish", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLVideoView", @"viewDidDisappear", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLVideoView", @"_createScrubberIfNeeded", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLVideoView", @"duration", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLExpandableImageView", @"videoView", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLExpandableImageView", @"image", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLExpandableView", @"state", "i", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLExpandableView", @"setState: withDuration:", "v", "i", "d", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLExpandableImageView", @"name", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLPhotoTileViewController", @"_configureViews", "v", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLExpandableImageView", @"setPhoto:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PLExpandableImageView", @"photo", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"UIView", @"_accessibilityViewIsVisible", "B", 0);
  [v2 validateClass:@"PLProgressView" hasInstanceVariable:@"_labelView" withType:"UILabel"];
  [v2 validateClass:@"PLVideoView" hasInstanceVariable:@"_scrubber" withType:"UIMovieScrubber"];
  [v2 validateClass:@"PLVideoView" hasInstanceVariable:@"_videoOverlayPlayButton" withType:"UIView<PLVideoOverlayButton>"];
  [v2 validateClass:@"PLVideoView" hasInstanceVariable:@"_moviePlayer" withType:"PLMoviePlayerController"];
  [v2 validateClass:@"PLExpandableImageView" hasInstanceVariable:@"_imageView" withType:"PLImageView"];
  [v2 validateClass:@"PLExpandableImageView" hasInstanceVariable:@"_photo" withType:"PLManagedAsset"];
  [v2 validateClass:@"PLCropOverlayBottomBar" hasInstanceVariable:@"_previewBottomBar" withType:"PLCropOverlayPreviewBottomBar"];
  [v2 validateClass:@"PLPhotoTileViewController" hasInstanceVariable:@"_modelPhoto" withType:"PHAsset"];

  return 1;
}

uint64_t __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Photo Library Framework AX Bundle"];
  [v2 setOverrideProcessName:@"PhotoLibrary"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UITextFieldAccessibility__PhotoLibrary__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITableViewCellAccessibility__PhotoLibrary__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIToolbarButtonAccessibility__PhotoLibrary__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLCropOverlayBottomBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLVideoViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLProgressViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLVideoRemakerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLUIImageViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLCropOverlayAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLImageScrollViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UINavigationButtonAccessibility__PhotoLibrary__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLExpandableImageViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLExpandableViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLSlalomRegionEditorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLPhotoTileViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLContactPhotoOverlayAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLHighFidelityVideoOverlayButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLFlatVideoOverlayButtonAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PLVideoEditingOverlayViewAccessibility" canInteractWithTargetClass:1];
}

uint64_t __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return MEMORY[0x270F09440](&__block_literal_global_510, 1.0);
}

void __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_5()
{
  id v0 = [MEMORY[0x263F21400] sharedInstance];
  [v0 performValidations:&__block_literal_global_512 withPreValidationHandler:&__block_literal_global_514 postValidationHandler:&__block_literal_global_520 safeCategoryInstallationHandler:&__block_literal_global_522];
}

uint64_t __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_6()
{
  return 1;
}

uint64_t __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_7(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Photo Library  - MessageUI Combo Framework AX Bundle"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __60__AXPhotoLibraryFrameworkGlue_accessibilityInitializeBundle__block_invoke_9(uint64_t a1, void *a2)
{
  [a2 installSafeCategory:@"MFComposeRecipientViewAccessibility__PhotoLibrary__MessageUI" canInteractWithTargetClass:1];
  id v2 = [MEMORY[0x263F811B8] sharedInstance];
  [v2 setNeedsLoadAccessibilityInformation];
}

@end