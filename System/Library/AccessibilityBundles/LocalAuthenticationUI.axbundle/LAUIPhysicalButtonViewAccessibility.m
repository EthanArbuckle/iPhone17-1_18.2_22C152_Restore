@interface LAUIPhysicalButtonViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_setOnScreen:(BOOL)a3;
@end

@implementation LAUIPhysicalButtonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"LAUIPhysicalButtonView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"LAUIPhysicalButtonView", @"_setOnScreen:", "v", "B", 0);
  [v3 validateClass:@"LAUIPhysicalButtonView" hasInstanceVariable:@"_instruction" withType:"NSString"];
}

- (void)_setOnScreen:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)LAUIPhysicalButtonViewAccessibility;
  -[LAUIPhysicalButtonViewAccessibility _setOnScreen:](&v9, sel__setOnScreen_);
  if (v3)
  {
    UIAccessibilityNotifications v5 = *MEMORY[0x263F1CDC8];
    v6 = accessibilityLocalizedString(@"face.id.authentication");
    v8 = [(LAUIPhysicalButtonViewAccessibility *)self safeStringForKey:@"_instruction"];
    v7 = __UIAXStringForVariables();
    UIAccessibilityPostNotification(v5, v7);
  }
}

@end