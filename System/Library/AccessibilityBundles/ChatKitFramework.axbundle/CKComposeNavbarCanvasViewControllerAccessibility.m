@interface CKComposeNavbarCanvasViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation CKComposeNavbarCanvasViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CKComposeNavbarCanvasViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v5.receiver = self;
  v5.super_class = (Class)CKComposeNavbarCanvasViewControllerAccessibility;
  [(CKComposeNavbarCanvasViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(CKComposeNavbarCanvasViewControllerAccessibility *)self safeValueForKey:@"cancelButton"];
  v4 = accessibilityLocalizedString(@"compose.cancel.button");
  [v3 setAccessibilityLabel:v4];
}

@end