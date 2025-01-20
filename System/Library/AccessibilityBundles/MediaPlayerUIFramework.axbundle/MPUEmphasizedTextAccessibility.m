@interface MPUEmphasizedTextAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityLabel;
@end

@implementation MPUEmphasizedTextAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MPUEmphasizedText";
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
  return (id)[(MPUEmphasizedTextAccessibility *)self safeValueForKey:@"string"];
}

@end