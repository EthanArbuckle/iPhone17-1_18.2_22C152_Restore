@interface MTATableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
+ (void)_accessibilityPerformValidations:(id)a3;
- (void)_numberOfItemsDidChangeAnimated:(BOOL)a3;
@end

@implementation MTATableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"MTATableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
}

- (void)_numberOfItemsDidChangeAnimated:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTATableViewControllerAccessibility;
  [(MTATableViewControllerAccessibility *)&v7 _numberOfItemsDidChangeAnimated:a3];
  v4 = [(MTATableViewControllerAccessibility *)self safeValueForKey:@"_noItemsView"];
  if (v4)
  {
    v5 = [(MTATableViewControllerAccessibility *)self safeValueForKey:@"tableView"];
    v6 = [v4 accessibilityLabel];
    if ([v6 length])
    {
      [v4 setIsAccessibilityElement:0];
      [v5 setAccessibilityLabel:v6];
    }
  }
}

@end