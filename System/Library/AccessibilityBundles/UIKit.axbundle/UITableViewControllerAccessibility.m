@interface UITableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation UITableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"UITableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end