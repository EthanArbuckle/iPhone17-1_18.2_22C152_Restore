@interface UberNavigationBarTitleViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (void)_accessibilityLoadAccessibilityInformation;
- (void)layoutSubviews;
@end

@implementation UberNavigationBarTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.UberNavigationBarTitleView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  v3 = [(UberNavigationBarTitleViewAccessibility *)self safeValueForKey:@"accessibilityNonStandardDismissButton"];
  [v3 _setAccessibilityLabelBlock:&__block_literal_global_4];
  v4.receiver = self;
  v4.super_class = (Class)UberNavigationBarTitleViewAccessibility;
  [(UberNavigationBarTitleViewAccessibility *)&v4 _accessibilityLoadAccessibilityInformation];
}

id __85__UberNavigationBarTitleViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return accessibilityAppStoreLocalizedString(@"back.button");
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)UberNavigationBarTitleViewAccessibility;
  [(UberNavigationBarTitleViewAccessibility *)&v3 layoutSubviews];
  [(UberNavigationBarTitleViewAccessibility *)self _accessibilityLoadAccessibilityInformation];
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end