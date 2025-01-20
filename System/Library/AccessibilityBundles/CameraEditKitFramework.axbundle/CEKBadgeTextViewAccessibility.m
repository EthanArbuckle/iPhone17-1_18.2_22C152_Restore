@interface CEKBadgeTextViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation CEKBadgeTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CEKBadgeTextView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityLabel
{
  return (id)[(CEKBadgeTextViewAccessibility *)self _accessibilityStringForLabelKeyValues:@"_text"];
}

@end