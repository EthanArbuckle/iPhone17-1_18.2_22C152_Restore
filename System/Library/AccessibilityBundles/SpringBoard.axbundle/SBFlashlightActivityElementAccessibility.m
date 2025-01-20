@interface SBFlashlightActivityElementAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)setFlashlightOn:(BOOL)a3;
@end

@implementation SBFlashlightActivityElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBFlashlightActivityElement";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"SBFlashlightActivityElement", @"setFlashlightOn:", "v", "B", 0);
  [v3 validateClass:@"SBFlashlightActivityElement" hasInstanceVariable:@"_flashlightOn" withType:"BOOL"];
}

- (void)setFlashlightOn:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(SBFlashlightActivityElementAccessibility *)self safeBoolForKey:@"flashlightOn"] != a3)
  {
    UIAccessibilityNotifications v5 = *MEMORY[0x263F1CDC8];
    if (v3) {
      v6 = @"flashlight.on.full";
    }
    else {
      v6 = @"flashlight.off.full";
    }
    v7 = accessibilityLocalizedString(v6);
    UIAccessibilityPostNotification(v5, v7);
  }
  v8.receiver = self;
  v8.super_class = (Class)SBFlashlightActivityElementAccessibility;
  [(SBFlashlightActivityElementAccessibility *)&v8 setFlashlightOn:v3];
}

@end