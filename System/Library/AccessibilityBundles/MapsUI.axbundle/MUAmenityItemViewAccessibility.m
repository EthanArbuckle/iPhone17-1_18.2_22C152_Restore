@interface MUAmenityItemViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation MUAmenityItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MUAmenityItemView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"MUAmenityItemView" hasInstanceVariable:@"_titleLabel" withType:"UIView<MULabelViewProtocol>"];
  [v3 validateClass:@"MUAmenityItemView" hasInstanceVariable:@"_imageView" withType:"UIImageView"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(MUAmenityItemViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
}

@end