@interface HUAccessoryButtonTableViewHeaderViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)_accessibilitySupplementaryHeaderViews;
@end

@implementation HUAccessoryButtonTableViewHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"HUAccessoryButtonTableViewHeaderView";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (id)_accessibilitySupplementaryHeaderViews
{
  v2 = (void *)MEMORY[0x263EFF8C0];
  v3 = [(HUAccessoryButtonTableViewHeaderViewAccessibility *)self safeValueForKey:@"accessoryButton"];
  v4 = objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);

  return v4;
}

@end