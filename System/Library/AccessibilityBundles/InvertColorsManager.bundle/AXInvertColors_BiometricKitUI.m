@interface AXInvertColors_BiometricKitUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_BiometricKitUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollView", @"setBackgroundColor:", "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"BKUIPearlEnrollViewController", @"forceDarkBackground:animated:", "v", "B", "B", 0);
  [v3 validateClass:@"BKUIPearlEnrollViewController" hasInstanceVariable:@"_darkBackground" withType:"B"];
  [v3 validateClass:@"BKUIPearlEnrollViewController" isKindOfClass:@"UIViewController"];
  [v3 validateClass:@"BKUIPearlCoachingController" isKindOfClass:@"UIViewController"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"BKUIPearlEnrollViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"BKUIPearlEnrollViewControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"BKUIPearlCoachingControllerInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end