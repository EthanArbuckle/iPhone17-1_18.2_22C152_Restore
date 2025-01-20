@interface UIInputSwitcherTableViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (id)accessibilityIdentifier;
@end

@implementation UIInputSwitcherTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIInputSwitcherTableView";
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
  objc_storeStrong(location, 0);
}

- (id)accessibilityIdentifier
{
  return @"InputSwitcherTable";
}

@end