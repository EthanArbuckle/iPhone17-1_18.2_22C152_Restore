@interface PMRoundProgressViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityValue;
@end

@implementation PMRoundProgressViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PMRoundProgressView";
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
  return accessibilityMemoriesLocalizedString(@"loading.progress.description");
}

- (id)accessibilityValue
{
  [(PMRoundProgressViewAccessibility *)self safeCGFloatForKey:@"progress"];

  return (id)AXFormatFloatWithPercentage();
}

@end