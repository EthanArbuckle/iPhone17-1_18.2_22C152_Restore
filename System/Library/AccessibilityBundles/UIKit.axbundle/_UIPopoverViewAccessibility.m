@interface _UIPopoverViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)shouldGroupAccessibilityChildren;
- (int64_t)accessibilityContainerType;
- (unint64_t)_accessibilityAutomationType;
@end

@implementation _UIPopoverViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIPopoverView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [location[0] validateClass:@"_UIPopoverView" hasInstanceVariable:@"_contentView" withType:"UIView"];
  objc_storeStrong(location, 0);
}

- (unint64_t)_accessibilityAutomationType
{
  return 18;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end