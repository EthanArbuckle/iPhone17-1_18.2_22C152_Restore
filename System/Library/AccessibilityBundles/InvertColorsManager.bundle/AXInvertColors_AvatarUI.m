@interface AXInvertColors_AvatarUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_AvatarUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAttributeValueView", @"imageLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAttributeValueView", @"transitionImageLayer", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAttributeValueView", @"cleanupAfterTransition", "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTAttributeValueView", @"updateSelectedState:animated:", "v", "B", "B", 0);
  [v3 validateClass:@"AVTStickerRecentsOverlayView" isKindOfClass:@"UIView"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AVTStickerRecentsOverlayView", @"imageView", "@", 0);
  [v3 validateClass:@"AVTStickerRecentsStickerCollectionViewCell" isKindOfClass:@"UIView"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"AVTUIAnimatingImageViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"AVTAttributeValueViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"AVTStickerRecentsOverlayViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"AVTStickerRecentsStickerCollectionViewCellInvertColorsAccessibility" canInteractWithTargetClass:1];

  LocalCenter = CFNotificationCenterGetLocalCenter();

  CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)UIAccessibilityInvertColorsStatusDidChangeNotification, 0, 0, 1u);
}

+ (int64_t)helperType
{
  return 1;
}

@end