@interface SUUIFlexibleSegmentedControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation SUUIFlexibleSegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIFlexibleSegmentedControl";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end