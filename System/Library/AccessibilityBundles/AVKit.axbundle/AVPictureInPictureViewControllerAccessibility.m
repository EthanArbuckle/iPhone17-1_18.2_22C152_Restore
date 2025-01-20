@interface AVPictureInPictureViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation AVPictureInPictureViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AVPictureInPictureViewController";
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
  v5.super_class = (Class)AVPictureInPictureViewControllerAccessibility;
  [(AVPictureInPictureViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(AVPictureInPictureViewControllerAccessibility *)self safeValueForKey:@"delegate"];
  v4 = __UIAccessibilitySafeClass();

  [v4 _accessibilityLoadAccessibilityInformation];
}

@end