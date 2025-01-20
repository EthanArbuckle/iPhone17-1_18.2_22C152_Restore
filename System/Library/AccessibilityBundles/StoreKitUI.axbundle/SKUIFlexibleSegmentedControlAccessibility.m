@interface SKUIFlexibleSegmentedControlAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
- (BOOL)isAccessibilityElement;
@end

@implementation SKUIFlexibleSegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIFlexibleSegmentedControl";
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