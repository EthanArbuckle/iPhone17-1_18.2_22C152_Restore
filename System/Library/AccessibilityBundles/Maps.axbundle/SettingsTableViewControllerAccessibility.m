@interface SettingsTableViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SettingsTableViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SettingsTableViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end