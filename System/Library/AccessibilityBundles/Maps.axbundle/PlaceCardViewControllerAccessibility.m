@interface PlaceCardViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)updateContent;
@end

@implementation PlaceCardViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PlaceCardViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)updateContent
{
  v5.receiver = self;
  v5.super_class = (Class)PlaceCardViewControllerAccessibility;
  [(PlaceCardViewControllerAccessibility *)&v5 updateContent];
  objc_opt_class();
  v2 = __UIAccessibilityCastAsClass();
  UIAccessibilityNotifications v3 = *MEMORY[0x263F1CE68];
  v4 = [v2 _accessibilityFirstNonGrabberElement];
  UIAccessibilityPostNotification(v3, v4);
}

@end