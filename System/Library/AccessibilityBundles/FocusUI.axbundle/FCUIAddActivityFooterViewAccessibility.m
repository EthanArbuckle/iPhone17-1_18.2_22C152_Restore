@interface FCUIAddActivityFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation FCUIAddActivityFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"FCUIAddActivityFooterView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)[(FCUIAddActivityFooterViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_titleLabel"];
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEE8];
}

@end