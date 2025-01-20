@interface TLKMultilineTextAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation TLKMultilineTextAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"TLKMultilineText";
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
  return (id)[(TLKMultilineTextAccessibility *)self safeStringForKey:@"text"];
}

@end