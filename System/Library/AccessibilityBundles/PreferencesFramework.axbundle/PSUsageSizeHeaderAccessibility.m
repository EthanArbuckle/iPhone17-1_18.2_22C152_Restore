@interface PSUsageSizeHeaderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation PSUsageSizeHeaderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSUsageSizeHeader";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"PSUsageSizeHeader" hasInstanceVariable:@"_titleLabel" withType:"UILabel"];
  [v3 validateClass:@"PSUsageSizeHeader" hasInstanceVariable:@"_sizeLabel" withType:"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x263F1CEF8];
}

- (id)accessibilityLabel
{
  id v3 = [(PSUsageSizeHeaderAccessibility *)self safeValueForKey:@"_titleLabel"];
  v4 = [v3 accessibilityLabel];
  v5 = [(PSUsageSizeHeaderAccessibility *)self safeValueForKey:@"_sizeLabel"];
  v8 = [v5 accessibilityLabel];
  v6 = __UIAXStringForVariables();

  return v6;
}

@end