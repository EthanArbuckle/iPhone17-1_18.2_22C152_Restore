@interface GKGameCenterViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation GKGameCenterViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"GKGameCenterViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end