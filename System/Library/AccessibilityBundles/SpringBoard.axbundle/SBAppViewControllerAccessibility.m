@interface SBAppViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SBAppViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SBAppViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end