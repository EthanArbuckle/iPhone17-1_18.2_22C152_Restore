@interface AXInvertColors_UserNotificationsUIKit
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_UserNotificationsUIKit

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"NCNotificationShortLookView" hasInstanceVariable:@"_platterView" withType:"PLPlatterView"];
  [v3 validateClass:@"PLPlatterView" hasInstanceVariable:@"_materialRecipe" withType:"q"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationContentView", @"_lazyThumbnailImageView", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"NCNotificationShortLookView", @"_configureNotificationContentViewIfNecessary", "v", 0);
  [v3 validateClass:@"NCFullScreenPresentableViewController" isKindOfClass:@"UIViewController"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"NCNotificationContentViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NCNotificationShortLookViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"NCFullScreenPresentableViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end