@interface SUUIIPhoneProductPageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SUUIIPhoneProductPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SUUIIPhoneProductPageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end