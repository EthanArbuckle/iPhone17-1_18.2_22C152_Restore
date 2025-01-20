@interface AXInvertColors_PhotosUICore
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_PhotosUICore

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PXFocusableUIImageView"];
  [v3 validateClass:@"PXCMMImageView"];
  [v3 validateClass:@"PXCollageView"];
  [v3 validateClass:@"PXGMetalRenderer"];
  [v3 validateClass:@"PXPersonTableViewCell" isKindOfClass:@"UITableViewCell"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"PXPersonTableViewCell", @"layoutSubviews", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"UITableViewCell", @"imageView", "@", 0);
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"PXFocusableUIImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXVideoPlayerViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXPeopleCollectionViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXTitleSubtitleUILabelInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXCMMImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXCollageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXPersonTableViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXGMetalRendererInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXGViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXVideoViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXPhotosGlobalFooterViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"PXDisplayAssetImageContentViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end