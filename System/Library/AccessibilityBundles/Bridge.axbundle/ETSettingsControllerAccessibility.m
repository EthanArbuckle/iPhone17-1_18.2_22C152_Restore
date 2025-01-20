@interface ETSettingsControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation ETSettingsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"ETSettingsController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end