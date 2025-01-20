@interface UIStatusBarNotChargingItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation UIStatusBarNotChargingItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIStatusBarNotChargingItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"status.not.charging");
}

- (unint64_t)accessibilityTraits
{
  v5 = self;
  SEL v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarNotChargingItemViewAccessibility;
  return [(UIStatusBarNotChargingItemViewAccessibility *)&v3 accessibilityTraits] | *MEMORY[0x263F813F0];
}

@end