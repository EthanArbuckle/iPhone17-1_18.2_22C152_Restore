@interface _UIPreviewTransitionControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_axPostNotificationForPhase:(uint64_t)a1;
- (void)_layoutForPresentationPhase:(unint64_t)a3;
@end

@implementation _UIPreviewTransitionControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPreviewTransitionController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  id obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", @"_UIPreviewTransitionController", @"_layoutForPresentationPhase:", "v", "Q", 0);
  objc_storeStrong(v4, obj);
}

- (void)_layoutForPresentationPhase:(unint64_t)a3
{
  v6 = self;
  SEL v5 = a2;
  unint64_t v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewTransitionControllerAccessibility;
  [(_UIPreviewTransitionControllerAccessibility *)&v3 _layoutForPresentationPhase:a3];
  -[_UIPreviewTransitionControllerAccessibility _axPostNotificationForPhase:]((uint64_t)v6, v4);
}

- (void)_axPostNotificationForPhase:(uint64_t)a1
{
  uint64_t v4 = a1;
  unint64_t v3 = a2;
  if (a1)
  {
    id location = 0;
    if (v3 > 1)
    {
      if (v3 - 2 <= 1)
      {
        objc_storeStrong(&location, MEMORY[0x263EFFA88]);
      }
      else if (v3 - 4 <= 1)
      {
        objc_storeStrong(&location, MEMORY[0x263EFFA80]);
      }
    }
    if (location) {
      UIAccessibilityPostNotification(*MEMORY[0x263F812A8], location);
    }
    objc_storeStrong(&location, 0);
  }
}

@end