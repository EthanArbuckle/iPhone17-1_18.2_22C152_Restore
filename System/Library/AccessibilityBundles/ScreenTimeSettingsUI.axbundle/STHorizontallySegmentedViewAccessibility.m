@interface STHorizontallySegmentedViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityElements;
@end

@implementation STHorizontallySegmentedViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"STHorizontallySegmentedView";
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
  return 0;
}

- (id)accessibilityElements
{
  return (id)[(STHorizontallySegmentedViewAccessibility *)self safeArrayForKey:@"segmentViews"];
}

@end