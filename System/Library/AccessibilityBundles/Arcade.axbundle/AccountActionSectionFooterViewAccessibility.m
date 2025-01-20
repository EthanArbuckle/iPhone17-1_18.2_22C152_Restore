@interface AccountActionSectionFooterViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation AccountActionSectionFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Arcade.AccountActionSectionFooterView";
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
  v2 = [(AccountActionSectionFooterViewAccessibility *)self safeValueForKey:@"accessibilityTextLabel"];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 accessibilityLabel];
    BOOL v5 = [v4 length] != 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  return (id)[(AccountActionSectionFooterViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"accessibilityTextLabel"];
}

@end