@interface SFUnifiedBarItemAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SFUnifiedBarItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SFUnifiedBarItem";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end