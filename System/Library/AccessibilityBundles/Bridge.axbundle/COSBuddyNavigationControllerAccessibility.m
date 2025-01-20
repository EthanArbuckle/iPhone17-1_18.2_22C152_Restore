@interface COSBuddyNavigationControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)addInternalDashboardButton;
@end

@implementation COSBuddyNavigationControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"COSBuddyNavigationController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"COSBuddyNavigationController" hasInstanceVariable:@"_internalDashboardButton" withType:"UIButton"];
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", @"COSBuddyNavigationController", @"addInternalDashboardButton", "v", 0);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v4.receiver = self;
  v4.super_class = (Class)COSBuddyNavigationControllerAccessibility;
  [(COSBuddyNavigationControllerAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
  id v3 = [(COSBuddyNavigationControllerAccessibility *)self safeUIViewForKey:@"_internalDashboardButton"];
  [v3 setAccessibilityLabel:@"Internal Settings"];
}

- (void)addInternalDashboardButton
{
  v3.receiver = self;
  v3.super_class = (Class)COSBuddyNavigationControllerAccessibility;
  [(COSBuddyNavigationControllerAccessibility *)&v3 addInternalDashboardButton];
  [(COSBuddyNavigationControllerAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

@end