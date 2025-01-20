@interface UIPanelWrapperViewAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityInTopLevelTabLoop;
- (int64_t)accessibilityContainerType;
@end

@implementation UIPanelWrapperViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UIPanelWrapperView";
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

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

@end