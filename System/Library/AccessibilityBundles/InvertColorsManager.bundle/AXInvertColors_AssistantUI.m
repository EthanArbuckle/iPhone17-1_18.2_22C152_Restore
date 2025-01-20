@interface AXInvertColors_AssistantUI
+ (int64_t)helperType;
+ (void)installCategories:(id)a3;
+ (void)performValidations:(id)a3;
@end

@implementation AXInvertColors_AssistantUI

+ (void)performValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"AFUISiriView", @"setBackdropVisible:", "v", "B", 0);
  [v3 validateClass:@"AFUISiriView" hasInstanceVariable:@"_backdropView" withType:"_UIBackdropView"];
  [v3 validateClass:@"AFUISiriCompactView" hasInstanceVariable:@"_orbViewContainer" withType:"UIView"];
}

+ (void)installCategories:(id)a3
{
  id v3 = a3;
  [v3 installSafeCategory:@"AFUISiriViewInvertColorsAccessibility" canInteractWithTargetClass:1];
  [v3 installSafeCategory:@"AFUISiriCompactViewInvertColorsAccessibility" canInteractWithTargetClass:1];
}

+ (int64_t)helperType
{
  return 1;
}

@end