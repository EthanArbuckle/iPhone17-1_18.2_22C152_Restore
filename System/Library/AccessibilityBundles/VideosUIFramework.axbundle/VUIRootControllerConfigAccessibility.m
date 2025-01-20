@interface VUIRootControllerConfigAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation VUIRootControllerConfigAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"VUIRootControllerConfig";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end