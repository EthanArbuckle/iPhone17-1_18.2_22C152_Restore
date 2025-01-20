@interface DOCPromptHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation DOCPromptHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"Files.DOCPromptHeaderView";
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
  return (id)[(DOCPromptHeaderViewAccessibility *)self safeStringForKey:@"promptText"];
}

@end