@interface PSRootControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation PSRootControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"PSRootController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end