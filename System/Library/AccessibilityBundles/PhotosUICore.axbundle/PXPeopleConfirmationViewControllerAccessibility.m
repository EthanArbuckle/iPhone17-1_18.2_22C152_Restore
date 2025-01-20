@interface PXPeopleConfirmationViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)suggestionDidDisplay;
@end

@implementation PXPeopleConfirmationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PXPeopleConfirmationViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)suggestionDidDisplay
{
  v2.receiver = self;
  v2.super_class = (Class)PXPeopleConfirmationViewControllerAccessibility;
  [(PXPeopleConfirmationViewControllerAccessibility *)&v2 suggestionDidDisplay];
  UIAccessibilityPostNotification(*MEMORY[0x263F1CE18], 0);
}

@end