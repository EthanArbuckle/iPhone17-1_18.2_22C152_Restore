@interface PSGCircleSegmentedControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityElements;
@end

@implementation PSGCircleSegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSGCircleSegmentedControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)accessibilityElements
{
  return (id)[(PSGCircleSegmentedControlAccessibility *)self safeArrayForKey:@"_segments"];
}

@end