@interface AXInvertColors_PhotosUIPrivate
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_PhotosUIPrivate

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PUPhotoView"];
  [v3 validateClass:@"PUTilingView"];
  [v3 validateClass:@"PUFeedImageCell"];
  [v3 validateClass:@"PUPhotosGridCell"];
  [v3 validateClass:@"PUReviewScreenControlBar"];
  [v3 validateClass:@"PUReviewScreenTopBar"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingBackgroundTileViewController", @"_updateColorIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUBrowsingBackgroundTileViewController", @"backgroundColorOverride", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUImageTileViewController", @"_updateIfNeeded", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUImageTileViewController", @"assetDidChange", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpAssetTransitionContext", @"_setSnapshotView:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUOneUpAssetTransitionContext", @"snapshotView", "@", 0);
  [v3 validateClass:@"PUPhotoView" isKindOfClass:@"UIView"];
  [v3 validateClass:@"PUPhotoView" hasInstanceVariable:@"_contentHelper" withType:"PUPhotoViewContentHelper"];
  [v3 validateClass:@"PUPhotoViewContentHelper" hasProperty:@"overlayColor" withType:"@"];
  [v3 validateClass:@"PUBrowsingBackgroundTileViewController" isKindOfClass:@"PUTileViewController"];
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", @"UIColor", @"_systemBackgroundColor", "@", 0);
  [v3 validateClass:@"PUVideoTileViewController" hasInstanceVariable:@"_placeholderImageView" withType:"UIImageView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PUVideoTileViewController", @"loadView", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PUFeedImageCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUPhotoViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUVideoPlayerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUGridRenderedStripInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUPhotosGridCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUImageTileViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUBrowsingBackgroundTileViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUCollageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUReviewScreenControlBarInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUReviewScreenTopBarInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUOneUpAssetTransitionContextInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PUVideoTileViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end