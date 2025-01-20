@interface CPSLabelWithPlaceholderAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
@end

@implementation CPSLabelWithPlaceholderAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"CPSLabelWithPlaceholder";
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
  return (id)[(CPSLabelWithPlaceholderAccessibility *)self safeStringForKey:@"_text"];
}

@end