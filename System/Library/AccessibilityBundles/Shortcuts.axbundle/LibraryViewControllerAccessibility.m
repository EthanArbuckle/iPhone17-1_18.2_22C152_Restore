@interface LibraryViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
@end

@implementation LibraryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Shortcuts.LibraryViewController";
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
  v5.super_class = (Class)LibraryViewControllerAccessibility;
  [(LibraryViewControllerAccessibility *)&v5 _accessibilityLoadAccessibilityInformation];
  v3 = [(LibraryViewControllerAccessibility *)self safeValueForKey:@"axCreateButton"];
  v4 = accessibilityLocalizedString(@"create.shortcut");
  [v3 setAccessibilityLabel:v4];
}

@end