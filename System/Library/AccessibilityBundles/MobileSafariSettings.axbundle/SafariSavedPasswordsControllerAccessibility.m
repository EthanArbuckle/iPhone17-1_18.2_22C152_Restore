@interface SafariSavedPasswordsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation SafariSavedPasswordsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SafariSavedPasswordsController";
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
  v4.receiver = self;
  v4.super_class = (Class)SafariSavedPasswordsControllerAccessibility;
  [(SafariSavedPasswordsControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  v3 = [(SafariSavedPasswordsControllerAccessibility *)self safeValueForKey:@"_table"];
  [v3 setAccessibilityElementsHidden:1];
}

@end