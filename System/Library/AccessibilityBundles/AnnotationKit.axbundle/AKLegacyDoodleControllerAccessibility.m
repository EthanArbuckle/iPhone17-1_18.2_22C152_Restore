@interface AKLegacyDoodleControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)inputViewWillStartDrawing:(id)a3;
@end

@implementation AKLegacyDoodleControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AKLegacyDoodleController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)inputViewWillStartDrawing:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AKLegacyDoodleControllerAccessibility;
  [(AKLegacyDoodleControllerAccessibility *)&v5 inputViewWillStartDrawing:a3];
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CDC8];
  v4 = accessibilityLocalizedString(@"sketch.drawing.began");
  UIAccessibilityPostNotification(v3, v4);
}

@end