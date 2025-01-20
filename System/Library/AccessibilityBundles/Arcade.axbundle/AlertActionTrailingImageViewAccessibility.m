@interface AlertActionTrailingImageViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation AlertActionTrailingImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.AlertActionTrailingImageView";
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
  return (id)[(AlertActionTrailingImageViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityAlertActionLabel"];
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)AlertActionTrailingImageViewAccessibility;
  return *MEMORY[0x263F1CEE8] | [(AlertActionTrailingImageViewAccessibility *)&v3 accessibilityTraits];
}

@end