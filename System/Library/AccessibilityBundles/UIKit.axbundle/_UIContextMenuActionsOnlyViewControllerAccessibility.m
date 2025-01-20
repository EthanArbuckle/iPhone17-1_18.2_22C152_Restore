@interface _UIContextMenuActionsOnlyViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (BOOL)_accessibilityPresentsAsPopup;
@end

@implementation _UIContextMenuActionsOnlyViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"_UIContextMenuActionsOnlyViewController";
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
  [location[0] validateClass:@"_UIContextMenuActionsOnlyViewController"];
  objc_storeStrong(location, 0);
}

- (BOOL)_accessibilityPresentsAsPopup
{
  return 1;
}

@end