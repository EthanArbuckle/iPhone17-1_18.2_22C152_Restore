@interface AAUIImageControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation AAUIImageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"AAUIImageControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3 = a3;
  [v3 validateClass:@"AAUIImageControl" hasInstanceVariable:@"_label" withType:"AAUILabel"];
  [v3 validateClass:@"AAUILabel" isKindOfClass:@"UILabel"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(@"AccountImage");
}

- (id)accessibilityValue
{
  return (id)[(AAUIImageControlAccessibility *)self _accessibilityStringForLabelKeyValues:@"_label"];
}

@end