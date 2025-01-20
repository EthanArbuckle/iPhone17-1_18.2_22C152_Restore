@interface AXPhotosUIFrameworkGlue
+ (BOOL)_shouldActuallyInstallBundle;
+ (void)accessibilityInitializeBundle;
@end

@implementation AXPhotosUIFrameworkGlue

+ (BOOL)_shouldActuallyInstallBundle
{
  v2 = [MEMORY[0x263F086E0] mainBundle];
  v3 = [v2 bundleIdentifier];
  char v4 = [v3 hasPrefix:*MEMORY[0x263F21360]];

  return v4 ^ 1;
}

+ (void)accessibilityInitializeBundle
{
  if ([a1 _shouldActuallyInstallBundle])
  {
    v3 = [MEMORY[0x263F21400] sharedInstance];
    [v3 performValidations:&__block_literal_global withPreValidationHandler:&__block_literal_global_421 postValidationHandler:0 safeCategoryInstallationHandler:&__block_literal_global_430];

    id v7 = [MEMORY[0x263F21388] sharedInstance];
    [v7 addHandler:&__block_literal_global_611 forFramework:@"PhotosEditUI"];
  }
  else
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:a1];
    char v4 = [v7 bundleIdentifier];
    v5 = [MEMORY[0x263F086E0] mainBundle];
    v6 = [v5 bundleIdentifier];
    _AXLogWithFacility();
  }
}

uint64_t __56__AXPhotosUIFrameworkGlue_accessibilityInitializeBundle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 validateClass:@"PUPhotoCommentEntryView"];
  [v2 validateClass:@"PUPhotoPostCommentTextEntryCell"];
  [v2 validateClass:@"PUPhotosGridCell" hasInstanceVariable:@"_selectionBadgeVisible" withType:"BOOL"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotosGridCell", @"isSelectionBadgeVisible", "B", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotosGridViewController", @"photoCollectionAtIndex:", "@", "Q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PXFeedSectionInfo", @"assetForItemAtIndex:", "@", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PXFeedSectionInfo", @"hasMultipleAssetsForItemAtIndex:", "B", "q", 0);
  [v2 validateClass:@"PUActivityViewController" isKindOfClass:@"UIViewController"];
  [v2 validateProtocol:@"PLAssetContainer" hasMethod:@"assets" isInstanceMethod:1 isRequired:1];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingSession", @"viewModel", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAssetsDataSource", @"numberOfAssetsWithMaximum:", "q", "q", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUTilingDataSource", @"enumerateIndexPathsStartingAtIndexPath: reverseDirection: usingBlock:", "v", "@", "B", "@?", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUNavigationController", @"_extendedToolbar", "@", 0);
  [v2 validateClass:@"PUScrubberView"];
  [v2 validateProtocol:@"PXLivePhotoTrimScrubberDelegate" hasMethod:@"trimScrubber:didEndInteractivelyEditingElement:successful:" isInstanceMethod:1 isRequired:0];
  [v2 validateProtocol:@"PXLivePhotoTrimScrubberDelegate" hasMethod:@"trimScrubber:didBeginInteractivelyEditingElement:" isInstanceMethod:1 isRequired:0];
  [v2 validateClass:@"PUFilterToolController"];
  [v2 validateClass:@"PUAdjustmentsViewController"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUFilterToolController", @"_effectForIndex:", "@", "q", 0);
  [v2 validateClass:@"PUFilterToolController" hasInstanceVariable:@"_slider" withType:"CEKSlider"];
  [v2 validateClass:@"PUFilterToolController" hasInstanceVariable:@"_scrubberView" withType:"CEKWheelScrubberView"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsViewController", @"sliderWillBeginScrolling:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsViewController", @"sliderDidEndScrolling:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUAdjustmentsViewController", @"sliderValueChanged:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUFilterToolController", @"sliderWillBeginScrolling:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUFilterToolController", @"sliderDidScroll:", "v", "@", 0);
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUFilterToolController", @"sliderDidEndScrolling:", "v", "@", 0);
  [v2 validateClass:@"PUPhotoEditApertureToolbar"];
  objc_msgSend(v2, "validateClass:hasInstanceMethod:withFullSignature:", @"PUPhotoEditApertureToolbar", @"_apertureSliderDidChangeValue:", "v", "@", 0);

  return 1;
}

uint64_t __56__AXPhotosUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setValidationTargetName:@"Photos UI Framework AX Bundle"];
  [v2 setOverrideProcessName:@"PhotosUI Framework"];
  [v2 setDebugBuild:0];

  return MEMORY[0x270F09468]();
}

void __56__AXPhotosUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 installSafeCategory:@"UIButtonAccessibility__PhotosUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIImageViewAccessibility__PhotosUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UIToolbarTextButtonAccessibility__PhotosUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UITextViewAccessibility__PhotosUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUScrubberViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUOneUpViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"UICollectionViewAccessibility__PhotosUI__UIKit" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUVideoPlayerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUTileControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotosGridCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUGridRenderedStripAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotosGridViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotosSharingGridCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUActivityViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUCollectionViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUAlbumListTableViewCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUAvalancheReviewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUOneUpBarsControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUImageTileViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUUserTransformViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUSlideshowViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUSlideshowSpeedCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotosAlbumViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUTilingViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUOneUpSelectionIndicatorTileViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUAdjustmentsToolControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUFilterToolControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PHLivePhotoViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUVideoTileViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUAlbumListCellContentViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUAlbumListViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUReviewScreenControlBarAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotoCommentEntryViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotoPostCommentTextEntryCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotoEditViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUCropToolControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotoEditMediaToolControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotoEditPortraitToolControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUCropAspectViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUCropHandleViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUAdjustmentsViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotoEditBaseAdjustmentCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUCropAspectFlipperViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PURedeyeToolControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUTrimToolControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUCarouselSharingViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotoEditToolControllerViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUOutlineCellAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUOneUpDetailsBarButtonControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PULivePhotoVideoOverlayTileViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUCinematicSubjectIndicatorAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUVideoEditOverlayViewControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPickerOnboardingHeaderViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUWallpaperPosterEditorControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"AmbientPhotoFrameControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUFilmstripWrapperViewAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPhotoEditToolControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUAudioToolControllerAccessibility" canInteractWithTargetClass:1];
  [v2 installSafeCategory:@"PUPickerNavigationBarPaletteAccessibility" canInteractWithTargetClass:1];
}

uint64_t __56__AXPhotosUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_4()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

void __56__AXPhotosUIFrameworkGlue_accessibilityInitializeBundle__block_invoke_5()
{
  v0 = (void *)MEMORY[0x263F811C8];
  id v1 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.PhotosEditUI"];
  [v0 loadAccessibilityBundleForBundle:v1 didLoadCallback:0 force:1 loadAllAccessibilityInfo:1];
}

@end