@interface SKUIIPhoneProductPageViewControllerAccessibility
+ (Class)safeCategoryBaseClass;
+ (id)safeCategoryTargetClassName;
@end

@implementation SKUIIPhoneProductPageViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return @"SKUIIPhoneProductPageViewController";
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

@end